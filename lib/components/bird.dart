import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  FutureOr<void> onLoad() async {
    final birdUpFlap = await gameRef.loadSprite('bird_upflap.png');
    final birdMidFlap = await gameRef.loadSprite('bird_midflap.png');
    final birdDownFlap = await gameRef.loadSprite('bird_downflap.png');

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.up: birdUpFlap,
      BirdMovement.middle: birdMidFlap,
      BirdMovement.down: birdDownFlap,
    };
  }
}
