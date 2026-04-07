import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class MessageAppBarWidget extends PreferredSize {
  const MessageAppBarWidget({
    required super.preferredSize,
    this.isActive = true,
    super.child = const SizedBox(),
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme?.colorScheme.surface1,
      ),
      child:
          Row(
            children: [
              InkWell(
                onTap: context.pop,
                child: ChatPetIcon.icon(AppIcons.arrowBack),
              ),
              SpacingFoundation.horizontalSpace12,
              AvatarWidget(
                isOnline: isActive,
                codeForGen: 'date.millisecondsSinceEpoch.toString()',
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SpacingFoundation.verticalSpacing6,
                  children: [
                    Text(
                      'Jhon Abraham',
                      style: theme?.carosTextTheme.mediumBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      isActive ? S.of(context).ActiveNow : S.of(context).ActiveNotNow,
                      style: theme?.circularStdTextTheme.bookSmall.copyWith(
                        color: theme.colorScheme.mutedColor,
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.horizontalSpace8,
              ChatPetIcon.icon(AppIcons.call),
              SpacingFoundation.horizontalSpace16,
              ChatPetIcon.icon(AppIcons.video),
            ],
          ).paddingSymmetric(
            vertical: SpacingFoundation.verticalSpacing16,
            horizontal: SpacingFoundation.horizontalSpacing24,
          ),
    );
  }
}
