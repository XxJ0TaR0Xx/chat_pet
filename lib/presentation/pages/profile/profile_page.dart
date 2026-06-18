import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/users/update_avatar_use_case.dart';
import 'package:chat_pet/domain/usecases/users/update_me_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/editing_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit cubit;
  late UserModel? editingUserModel;

  @override
  void initState() {
    super.initState();

    cubit = ProfileCubit(
      getIt.get<UpdateMeUseCase>(),
      getIt.get<UpdateAvatarUseCase>(),
      userCubit: context.read<UserCubit>(),
    );

    editingUserModel = cubit.user;
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      backgroundColor: theme?.colorScheme.darkNeutral,
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: cubit,
          builder: (context, state) => state.when(
            initial: SizedBox.shrink,
            loading: () => Center(
              child: SizedBox(
                height: 24.h,
                width: 24.h,
                child: CircularProgressIndicator(
                  color: context.uiKitTheme?.colorScheme.inverseSurface,
                ),
              ),
            ),
            error: (errorMessage) => Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Произошла ошибка: $errorMessage',
                        style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
                    ),
                  ],
                ),
                SpacingFoundation.verticalSpace16,
                UiKitButton.primary(
                  text: 'Повторить',
                  onTap: () => cubit.initialize(),
                ),
                Spacer(),
              ],
            ),
            loaded: (userModel) {
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          SpacingFoundation.verticalSpace30,
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            crossAxisAlignment: .start,
                            children: [
                              GestureDetector(
                                onTap: () => GoRouter.of(context).pop(),
                                child: ChatPetIcon.icon(
                                  AppIcons.arrowBack,
                                  color: theme?.colorScheme.surfaceBase,
                                ),
                              ),
                              Column(
                                spacing: SpacingFoundation.verticalSpacing12,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(41.w),
                                    onTap: () async {
                                      if (await cubit.updateUserImage()) {
                                        editingUserModel = cubit.user;
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 41.w,
                                      backgroundImage: userModel.avatarUrl != null && userModel.avatarUrl!.isNotEmpty
                                          ? NetworkImage(userModel.avatarUrl!)
                                          : const AssetImage('assets/images/orig.png'),
                                    ),
                                  ),
                                  Text(
                                    '${userModel.name ?? S.of(context).NotFounded} ${userModel.lastName ?? ''}',
                                    style: theme?.carosTextTheme.bold.copyWith(
                                      fontSize: 20.w,
                                      color: theme.colorScheme.surfaceBase,
                                    ),
                                  ),
                                  SelectableText(
                                    userModel.userTag,
                                    style: theme?.carosTextTheme.bold.copyWith(
                                      fontSize: 12.w,
                                      color: ColorsFoundation.backNeutral1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 24),
                            ],
                          ),
                        ],
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
                      SpacingFoundation.verticalSpace24.sliver,
                      BottomSheetWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpacingFoundation.verticalSpace24,
                          ...[
                            DescriptionProfileUiModel(
                              title: 'Display name',
                              contentType: UserContentType.name,
                              description:
                                  '${(editingUserModel?.name != null && editingUserModel!.name!.isNotEmpty) ? editingUserModel?.name : S.of(context).NotFounded} ${editingUserModel?.lastName ?? ''}',
                              onTap: () async {
                                await editingDialog(
                                  context,
                                  initValue: editingUserModel?.name != S.of(context).NotFounded ? editingUserModel?.name : null,
                                  onTap: (value) {
                                    if (value.isEmpty) return;
                                    editingUserModel = editingUserModel?.copyWith(name: value);
                                    setState(() {});

                                    GoRouter.of(context).pop();
                                  },
                                );
                              },
                            ),
                            DescriptionProfileUiModel(
                              title: 'Email Address',
                              contentType: UserContentType.email,
                              description: editingUserModel?.email != null && editingUserModel!.email!.isNotEmpty
                                  ? editingUserModel?.email
                                  : S.of(context).NotFounded,
                            ),
                            DescriptionProfileUiModel(
                              title: 'Address',
                              contentType: UserContentType.adders,
                              description: editingUserModel?.address != null && editingUserModel!.address!.isNotEmpty
                                  ? editingUserModel?.address
                                  : S.of(context).NotFounded,
                              onTap: () async {
                                final newAddress =
                                    await GoRouter.of(context).push(
                                          AppRoutes.settingsProfileMap,
                                          extra: editingUserModel?.address,
                                        )
                                        as String;
                                editingUserModel = editingUserModel?.copyWith(address: newAddress);
                                setState(() {});
                              },
                            ),
                            DescriptionProfileUiModel(
                              title: 'Phone  Number',
                              contentType: UserContentType.phone,
                              description: editingUserModel?.number != null && editingUserModel!.number!.isNotEmpty
                                  ? editingUserModel?.number
                                  : S.of(context).NotFounded,
                              onTap: () async {
                                await editingDialog(
                                  context,
                                  initValue: editingUserModel?.number != S.of(context).NotFounded ? editingUserModel?.number : null,
                                  isNumber: true,
                                  onTap: (value) {
                                    if (value.isEmpty) return;
                                    editingUserModel = editingUserModel?.copyWith(number: value);
                                    setState(() {});

                                    GoRouter.of(context).pop();
                                  },
                                );
                              },
                            ),
                            DescriptionProfileUiModel(
                              title: 'Create at',
                              contentType: UserContentType.createAt,
                              description: editingUserModel?.createdAt != null
                                  ? DateFormat('dd.MM.yyyy').format(editingUserModel!.createdAt!)
                                  : S.of(context).NotFounded,
                            ),
                          ].map(
                            (e) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: e.onTap,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  e.title,
                                                  style: theme?.circularStdTextTheme.book.copyWith(
                                                    fontSize: 14.w,
                                                    color: ColorsFoundation.backNeutral1,
                                                  ),
                                                ),
                                                SpacingFoundation.verticalSpace12,
                                                Flexible(
                                                  child: Text(
                                                    e.description ?? S.of(context).NotFounded,
                                                    style: theme?.carosTextTheme.medium.copyWith(
                                                      fontSize: 18.w,
                                                      color: theme.colorScheme.backgroundColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ).paddingOnly(
                                              bottom: SpacingFoundation.verticalSpacing30,
                                              right: SpacingFoundation.horizontalSpacing24,
                                              left: SpacingFoundation.horizontalSpacing24,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Media Shared',
                                style: theme?.circularStdTextTheme.book.copyWith(
                                  fontSize: 14.w,
                                  color: ColorsFoundation.backNeutral1,
                                ),
                              ),
                              Text(
                                'View All',
                                style: theme?.carosTextTheme.bold.copyWith(
                                  fontSize: 16.w,
                                  color: ColorsFoundation.primary,
                                ),
                              ),
                            ],
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace20,
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children:
                                [
                                  'assets/images/6dbb69af64c9532bbdea5e23bff28553.jpg',
                                  'assets/images/7dbed90655c6d7de0f4d01eb01b9cbe1.jpg',
                                  'assets/images/maxresdefault.jpg',
                                ].map((e) {
                                  return SizedBox(
                                    width: 92.w,
                                    height: 92.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        e,
                                        fit: .cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SizedBox(height: 65.h),
                          if (userModel != editingUserModel) SizedBox(height: SpacingFoundation.verticalSpacing32),
                        ],
                      ).sliver,
                    ],
                  ),
                  if (userModel != editingUserModel && editingUserModel != null)
                    Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(EdgeInsetsFoundation.all16),
                              child: UiKitButton.primary(
                                text: S.of(context).Save,
                                onTap: () => cubit.updateMe(editingUserModel!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class DescriptionProfileUiModel {
  const DescriptionProfileUiModel({
    required this.title,
    required this.contentType,
    this.description,
    this.onTap,
  });

  final String title;
  final UserContentType contentType;
  final String? description;
  final VoidCallback? onTap;
}

enum UserContentType { name, adders, email, phone, createAt }
