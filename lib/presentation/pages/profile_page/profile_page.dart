import 'package:chat_pet/presentation/pages/common_widgets/bottom_sheet_widget.dart';
import 'package:chat_pet/presentation/pages/map_page/map_page.dart';
import 'package:chat_pet/presentation/pages/profile_page/cubit/profile_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/editing_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    cubit = context.read<ProfileCubit>();
  }

  Future<void> onEditTap(DescriptionProfileUiModel descriptionModel) async {
    String? newValue;
    if (descriptionModel.contentType == UserContentType.email) return;

    if (descriptionModel.contentType == UserContentType.adders) {
      await context.push(MapPage());

      return;
    }

    await editingDialog(
      context,
      initValue: descriptionModel.description != S.of(context).NotFounded ? descriptionModel.description : null,
      onTap: (value) => newValue = value,
    );

    await cubit.updateUserName(descriptionModel.contentType, newValue ?? '');
    if (context.mounted) context.pop();
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
                Text(
                  errorMessage,
                  style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
                SpacingFoundation.verticalSpace16,
                UiKitButton.primary(
                  text: 'Повторить',
                  onTap: () {
                    cubit.initialize();
                  },
                ),
                Spacer(),
              ],
            ),
            loaded: (userModel) => CustomScrollView(
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
                          onTap: () => context.pop(),
                          child: ChatPetIcon.icon(
                            AppIcons.arrowBack,
                            color: theme?.colorScheme.surfaceBase,
                          ),
                        ),
                        Column(
                          spacing: SpacingFoundation.verticalSpacing12,
                          children: [
                            CircleAvatar(
                              radius: 41.w,
                              backgroundImage: userModel.avatarUrl != null && userModel.avatarUrl!.isNotEmpty
                                  ? NetworkImage(userModel.avatarUrl!)
                                  : AssetImage('assets/images/orig.png'),
                            ),
                            Text(
                              '${userModel.name ?? S.of(context).NotFounded} ${userModel.lastName ?? ''}',
                              style: theme?.carosTextTheme.bold.copyWith(
                                fontSize: 20.w,
                                color: theme.colorScheme.surfaceBase,
                              ),
                            ),
                            //TODO подумать на id внути прилы
                            Text(
                              '@${userModel.id}',
                              style: theme?.carosTextTheme.bold.copyWith(
                                fontSize: 12.w,
                                color: ColorsFoundation.backNeutral1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                      ],
                    ),
                    SpacingFoundation.verticalSpace20,
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children:
                          [
                            AppIcons.message,
                            AppIcons.message,
                            AppIcons.message,
                            AppIcons.message,
                          ].map((e) {
                            return Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                color: ColorsFoundation.primary5,
                                shape: .circle,
                              ),
                              child: ChatPetIcon.icon(
                                e,
                                color: theme?.colorScheme.surfaceBase,
                              ).paddingAll(EdgeInsetsFoundation.all8),
                            );
                          }).toList(),
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  ],
                ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
                SpacingFoundation.verticalSpace24.sliver,
                BottomSheetWidget(
                  crossAxisAlignment: .start,
                  children: [
                    SpacingFoundation.verticalSpace24,
                    ...[
                      DescriptionProfileUiModel(
                        title: 'Display Name',
                        contentType: .name,
                        description:
                            '${(userModel.name != null && userModel.name!.isNotEmpty) ? userModel.name : S.of(context).NotFounded} ${userModel.lastName ?? ''}',
                      ),
                      DescriptionProfileUiModel(
                        title: 'Email Address',
                        contentType: .email,
                        description: userModel.email != null && userModel.email!.isNotEmpty ? userModel.email : S.of(context).NotFounded,
                      ),
                      DescriptionProfileUiModel(
                        title: 'Address',
                        contentType: .adders,
                        description: userModel.address != null && userModel.address!.isNotEmpty ? userModel.address : S.of(context).NotFounded,
                      ),
                      DescriptionProfileUiModel(
                        title: 'Phone  Number',
                        contentType: .phone,
                        description: userModel.number != null && userModel.number!.isNotEmpty ? userModel.number : S.of(context).NotFounded,
                      ),
                    ].map(
                      (e) {
                        return GestureDetector(
                          onTap: () => onEditTap(e),
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisSize: .min,
                            children: [
                              Text(
                                e.title,
                                style: theme?.circularStdTextTheme.book.copyWith(
                                  fontSize: 14.w,
                                  color: ColorsFoundation.backNeutral1,
                                ),
                              ),
                              SpacingFoundation.verticalSpace12,
                              Text(
                                e.description ?? S.of(context).NotFounded,
                                style: theme?.carosTextTheme.medium.copyWith(
                                  fontSize: 18.w,
                                  color: theme.colorScheme.backgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          bottom: SpacingFoundation.verticalSpacing30,
                          right: SpacingFoundation.horizontalSpacing24,
                          left: SpacingFoundation.horizontalSpacing24,
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
                  ],
                ).sliver,
              ],
            ),
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
  });

  final String title;
  final UserContentType contentType;
  final String? description;
}

enum UserContentType { name, adders, email, phone }
