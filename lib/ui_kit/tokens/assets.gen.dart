/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Caros.otf
  String get caros => 'packages/chat_pet/assets/fonts/Caros.otf';

  /// File path: assets/fonts/CircularStd-Black.otf
  String get circularStdBlack => 'packages/chat_pet/assets/fonts/CircularStd-Black.otf';

  /// File path: assets/fonts/chat_pet_icons.otf
  String get chatPetIcons => 'packages/chat_pet/assets/fonts/chat_pet_icons.otf';

  /// List of all assets
  List<String> get values => [caros, circularStdBlack, chatPetIcons];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/Subtract.svg
  SvgGenImage get subtract => const SvgGenImage('assets/images/svg/Subtract.svg');

  /// File path: assets/images/svg/apple_logo.svg
  SvgGenImage get appleLogo => const SvgGenImage('assets/images/svg/apple_logo.svg');

  /// File path: assets/images/svg/facebook_logo.svg
  SvgGenImage get facebookLogo => const SvgGenImage('assets/images/svg/facebook_logo.svg');

  /// File path: assets/images/svg/googleLogo.svg
  SvgGenImage get googleLogo => const SvgGenImage('assets/images/svg/googleLogo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [subtract, appleLogo, facebookLogo, googleLogo];
}

class Assets {
  const Assets._();

  static const String package = 'chat_pet';

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'chat_pet';

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/chat_pet/$_assetName';
}
