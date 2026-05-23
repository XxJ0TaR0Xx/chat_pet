import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
part 'icon_enums.dart';

class ChatPetIcon {
  //TODO add width
  static Widget icon(
    AppIcons icon, {
    double size = 24,
    Color? color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.string(
          _iconsMap[icon]!,
          colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }

  static Widget socialIcon(
    AppIcons icon, {
    double size = 42,
    Color color = Colors.black,
    bool isWhiteBackground = true,
  }) {
    return SvgPicture.string(
      _iconsMap[icon]!,
      width: size,
      height: size,
      colorFilter: icon == AppIcons.apple && isWhiteBackground ? ColorFilter.mode(Colors.black, BlendMode.srcIn) : null,
      fit: BoxFit.fill,
    );
  }
}
