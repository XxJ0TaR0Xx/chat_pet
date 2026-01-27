// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

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

  /// File path: assets/images/6dbb69af64c9532bbdea5e23bff28553.jpg
  AssetGenImage get a6dbb69af64c9532bbdea5e23bff28553 =>
      const AssetGenImage('assets/images/6dbb69af64c9532bbdea5e23bff28553.jpg');

  /// File path: assets/images/7dbed90655c6d7de0f4d01eb01b9cbe1.jpg
  AssetGenImage get a7dbed90655c6d7de0f4d01eb01b9cbe1 =>
      const AssetGenImage('assets/images/7dbed90655c6d7de0f4d01eb01b9cbe1.jpg');

  /// File path: assets/images/maxresdefault.jpg
  AssetGenImage get maxresdefault => const AssetGenImage('assets/images/maxresdefault.jpg');

  /// File path: assets/images/orig.png
  AssetGenImage get orig => const AssetGenImage('assets/images/orig.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    a6dbb69af64c9532bbdea5e23bff28553,
    a7dbed90655c6d7de0f4d01eb01b9cbe1,
    maxresdefault,
    orig,
  ];
}

class Assets {
  const Assets._();

  static const String package = 'chat_pet';

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String generalConfigs = 'packages/chat_pet/general_configs.env';

  /// List of all assets
  static List<String> get values => [generalConfigs];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  static const String package = 'chat_pet';

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/chat_pet/$_assetName';
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
