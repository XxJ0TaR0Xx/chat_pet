import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class IncomingRequestsSection extends StatelessWidget {
  const IncomingRequestsSection({
    required this.requests,
    required this.onAcceptTap,
    required this.onRejectTap,
    super.key,
  });

  final List<ContactRequest> requests;
  final ValueChanged<String> onAcceptTap;
  final ValueChanged<String> onRejectTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return DecoratedBox(
      decoration: BoxDecoration(color: theme?.colorScheme.surfaceBase),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).IncomingRequests,
            style: theme?.carosTextTheme.medium,
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing24,
            vertical: SpacingFoundation.verticalSpacing8,
          ),
          Divider(
            color: theme?.colorScheme.inversePrimary,
            thickness: 2.0,
          ),
          SpacingFoundation.verticalSpace12,
          ListView.separated(
            itemCount: requests.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => SpacingFoundation.verticalSpace8,
            itemBuilder: (_, i) {
              final request = requests[i];

              return _RequestItem(
                request: request,
                onAcceptTap: () => onAcceptTap.call(request.id),
                onRejectTap: () => onRejectTap.call(request.id),
              ).paddingHorizontal(SpacingFoundation.horizontalSpacing24);
            },
          ),
          SpacingFoundation.verticalSpace12,
          Divider(
            color: theme?.colorScheme.inversePrimary,
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}

class _RequestItem extends StatelessWidget {
  const _RequestItem({
    required this.request,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final ContactRequest request;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return Row(
      children: [
        AvatarWidget(
          codeForGen: request.sender.id,
          size: 52.w,
          url: request.sender.avatarUrl,
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: SpacingFoundation.verticalSpacing8,
            children: [
              Text(
                request.sender.nameAndLast,
                style: theme?.carosTextTheme.mediumBold,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                request.sender.userTag,
                style: theme?.circularStdTextTheme.bookSmall.copyWith(color: ColorsFoundation.backNeutral1),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingVertical(SpacingFoundation.horizontalSpacing8),
        ),
        InkWell(
          onTap: onAcceptTap,
          child: Icon(Icons.check_circle_outline, color: ColorsFoundation.green),
        ),
        SpacingFoundation.horizontalSpace8,
        InkWell(
          onTap: onRejectTap,
          child: Icon(Icons.cancel_outlined, color: ColorsFoundation.error.withValues(alpha: 0.7)),
        ),
      ],
    );
  }
}
