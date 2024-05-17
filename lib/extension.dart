import 'package:flappy_bird/gen/assets.gen.dart';

extension StringX on String {
  String get lastPart => replaceAll(RegExp(r'.*/'), '');
}

extension AssetGenImageX on AssetGenImage {
  String get name => path.replaceAll(RegExp(r'.*/'), '');
}
