/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/collision.wav
  String get collision => 'assets/audio/collision.wav';

  /// File path: assets/audio/fly.wav
  String get fly => 'assets/audio/fly.wav';

  /// File path: assets/audio/point.wav
  String get point => 'assets/audio/point.wav';

  /// List of all assets
  List<String> get values => [collision, fly, point];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Game.ttf
  String get game => 'assets/fonts/Game.ttf';

  /// List of all assets
  List<String> get values => [game];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/bird_downflap.png
  AssetGenImage get birdDownflap =>
      const AssetGenImage('assets/images/bird_downflap.png');

  /// File path: assets/images/bird_midflap.png
  AssetGenImage get birdMidflap =>
      const AssetGenImage('assets/images/bird_midflap.png');

  /// File path: assets/images/bird_upflap.png
  AssetGenImage get birdUpflap =>
      const AssetGenImage('assets/images/bird_upflap.png');

  /// File path: assets/images/clouds.png
  AssetGenImage get clouds => const AssetGenImage('assets/images/clouds.png');

  /// File path: assets/images/gameover.png
  AssetGenImage get gameover =>
      const AssetGenImage('assets/images/gameover.png');

  /// File path: assets/images/ground.png
  AssetGenImage get ground => const AssetGenImage('assets/images/ground.png');

  /// File path: assets/images/menu.jpg
  AssetGenImage get menu => const AssetGenImage('assets/images/menu.jpg');

  /// File path: assets/images/message.png
  AssetGenImage get message => const AssetGenImage('assets/images/message.png');

  /// File path: assets/images/pipe.png
  AssetGenImage get pipe => const AssetGenImage('assets/images/pipe.png');

  /// File path: assets/images/pipe_rotated.png
  AssetGenImage get pipeRotated =>
      const AssetGenImage('assets/images/pipe_rotated.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        background,
        birdDownflap,
        birdMidflap,
        birdUpflap,
        clouds,
        gameover,
        ground,
        menu,
        message,
        pipe,
        pipeRotated
      ];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
