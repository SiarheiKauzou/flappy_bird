import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/extension.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/gen/assets.gen.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.images.background.name);

    size = gameRef.size;
    sprite = Sprite(background);
  }
}
