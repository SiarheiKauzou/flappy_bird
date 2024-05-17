import 'package:flappy_bird/gen/assets.gen.dart';

extension AssetGenImageX on AssetGenImage {
  String get name => path.replaceAll(RegExp(r'.*/'), '');
}
