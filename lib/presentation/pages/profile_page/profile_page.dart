import 'package:chat_pet/presentation/pages/common_widgets/bottom_sheet_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme?.colorScheme.darkNeutral,
        body: CustomScrollView(
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
                          backgroundImage: AssetImage('assets/images/orig.png'),
                        ),
                        Text(
                          'Jhon Abraham',
                          style: theme?.carosTextTheme.bold.copyWith(
                            fontSize: 20.w,
                            color: theme.colorScheme.surfaceBase,
                          ),
                        ),
                        Text(
                          '@jhonabraham',
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
                    description: 'Jhon Abraham',
                  ),
                  DescriptionProfileUiModel(
                    title: 'Email Address',
                    description: 'jhonabraham20@gmail.com',
                  ),
                  DescriptionProfileUiModel(
                    title: 'Address',
                    description: '33 street west subidbazar,sylhet',
                  ),
                  DescriptionProfileUiModel(
                    title: 'Phone  Number',
                    description: '(320) 555-0104',
                  ),
                ].map(
                  (e) {
                    return GestureDetector(
                      onTap: () {},
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
                            e.description ?? 'Пусто',
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
    );
  }
}

class DescriptionProfileUiModel {
  DescriptionProfileUiModel({
    required this.title,
    this.description,
  });

  final String title;
  final String? description;
}
