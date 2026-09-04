// import 'package:avatar_plus/avatar_plus.dart';
// import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class HistoryRow extends StatelessWidget {
//   const HistoryRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = context.uiKitTheme?.colorScheme;

//     return ListView.separated(
//       itemCount: 12,
//       separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace24,
//       scrollDirection: Axis.horizontal,
//       physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
//       itemBuilder: (context, index) {
//         return DecoratedBox(
//           decoration: BoxDecoration(
//             border: Border.all(color: colorScheme?.surface1 ?? Colors.white, width: 0.9.w),
//             color: Colors.transparent,
//             shape: BoxShape.circle,
//           ),
//           child: Container(
//             width: 52.w,
//             height: 52.w,
//             decoration: BoxDecoration(
//               color: colorScheme?.surface1 ?? Colors.white,
//               shape: BoxShape.circle,
//             ),
//             child: SvgPicture.string(
//               AvatarPlusGen.instance.generate('asd'),
//             ),
//           ).paddingAll(EdgeInsetsFoundation.all4),
//         ).paddingOnly(
//           left: index == 0 ? SpacingFoundation.horizontalSpacing24 : 0,
//           right: index == 12 ? SpacingFoundation.horizontalSpacing24 : 0,
//         );
//       },
//     );
//   }
// }
