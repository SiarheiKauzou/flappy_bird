import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load('background.png');
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
