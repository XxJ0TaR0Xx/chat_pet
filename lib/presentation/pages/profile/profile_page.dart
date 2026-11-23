import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/editing_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = getIt<ProfileCubit>();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  Future<void> onImagePick() async {
    final image = await _getImage();
    if (!mounted) return;
    if (image != null) {
      await cubit.updateUserImage(image);
    } else {
      CustomSnackBar(context, text: 'Не удалось получить изображение').showErrorMessage();
    }
  }

  Future<XFile?> _getImage() async {
    final ImagePicker picker = ImagePicker();
    return picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      backgroundColor: theme?.colorScheme.darkNeutral,
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          bloc: cubit,
          listenWhen: (previous, current) => previous is ProfileLoaded && current is ProfileError,
          listener: (context, state) {
            if (state is ProfileError) {
              CustomSnackBar(context, text: state.errorMessage).showErrorMessage();
            }
          },
          buildWhen: (previous, current) => !(previous is ProfileLoaded && current is ProfileError),
          builder: (context, state) {
            return state.when(
              loading: () => CustomScrollView(
                slivers: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      SpacingFoundation.verticalSpace30,
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pop(),
                        child: ChatPetIcon.icon(
                          AppIcons.arrowBack,
                          color: theme?.colorScheme.surfaceBase,
                        ),
                      ),
                    ],
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
                  SpacingFoundation.verticalSpace24.sliver,
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: BottomSheetWidget(
                      children: [
                        Expanded(child: LoadingWidget()),
                      ],
                    ),
                  ),
                ],
              ),
              error: (_) => const SizedBox.shrink(),
              loaded: (originalUser, draftUser, isSaving) {
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
                                      onTap: onImagePick,
                                      child: AvatarWidget(
                                        size: 82.w,
                                        url: originalUser.avatarUrl,
                                      ),
                                    ),
                                    Text(
                                      '${originalUser.name ?? S.of(context).NotFounded} ${originalUser.lastName ?? ''}',
                                      style: theme?.carosTextTheme.bold.copyWith(
                                        fontSize: 20.w,
                                        color: theme.colorScheme.surfaceBase,
                                      ),
                                    ),
                                    SelectableText(
                                      originalUser.userTag,
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
                                title: S.of(context).DisplayName,
                                contentType: UserContentType.name,
                                description:
                                    '${(draftUser.name != null && draftUser.name!.isNotEmpty) ? draftUser.name : S.of(context).NotFounded} ${draftUser.lastName ?? ''}',
                                onTap: () async {
                                  await editingDialog(
                                    context,
                                    initValue: draftUser.name != S.of(context).NotFounded ? draftUser.name : null,
                                    onTap: (value) {
                                      if (value.isEmpty) return;
                                      cubit.updateUserName(value);
                                      GoRouter.of(context).pop();
                                    },
                                  );
                                },
                              ),
                              DescriptionProfileUiModel(
                                title: S.of(context).EmailAddress,
                                contentType: UserContentType.email,
                                description: draftUser.email != null && draftUser.email!.isNotEmpty ? draftUser.email : S.of(context).NotFounded,
                              ),
                              DescriptionProfileUiModel(
                                title: S.of(context).Address,
                                contentType: UserContentType.adders,
                                description: draftUser.address != null && draftUser.address!.isNotEmpty
                                    ? draftUser.address
                                    : S.of(context).NotFounded,
                                onTap: () async {
                                  final newAddress =
                                      await GoRouter.of(context).push(
                                            AppRoutes.settingsProfileMap,
                                            extra: draftUser.address,
                                          )
                                          as String?;
                                  if (newAddress != null && newAddress.isNotEmpty) cubit.updateUserAddress(newAddress);
                                },
                              ),
                              DescriptionProfileUiModel(
                                title: S.of(context).PhoneNumber,
                                contentType: UserContentType.phone,
                                description: draftUser.number != null && draftUser.number!.isNotEmpty ? draftUser.number : S.of(context).NotFounded,
                                onTap: () async {
                                  await editingDialog(
                                    context,
                                    initValue: draftUser.number != S.of(context).NotFounded ? draftUser.number : null,
                                    isNumber: true,
                                    onTap: (value) {
                                      if (value.isEmpty) return;
                                      cubit.updateUserNumber(value);
                                      GoRouter.of(context).pop();
                                    },
                                  );
                                },
                              ),
                              DescriptionProfileUiModel(
                                title: S.of(context).CreatedAt,
                                contentType: UserContentType.createAt,
                                description: draftUser.createdAt != null
                                    ? DateFormat('dd.MM.yyyy').format(draftUser.createdAt!)
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
                                  S.of(context).MediaShared,
                                  style: theme?.circularStdTextTheme.book.copyWith(
                                    fontSize: 14.w,
                                    color: ColorsFoundation.backNeutral1,
                                  ),
                                ),
                                Text(
                                  S.of(context).ViewAll,
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
                            if (originalUser != draftUser) SizedBox(height: SpacingFoundation.verticalSpacing32),
                          ],
                        ).sliver,
                      ],
                    ),
                    if (originalUser != draftUser)
                      Align(
                        alignment: AlignmentGeometry.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(EdgeInsetsFoundation.all16),
                                child: UiKitButton.primary(
                                  text: S.of(context).Save,
                                  onTap: () => cubit.updateMe(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (isSaving)
                      Positioned.fill(
                        child: AbsorbPointer(
                          child: ColoredBox(
                            color: (theme?.colorScheme.darkNeutral ?? Colors.black).withValues(alpha: 0.5),
                            child: const LoadingWidget(),
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
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
