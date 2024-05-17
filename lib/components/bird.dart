import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
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

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    position.y += Configuration.birdVelocity * dt;
    super.update(dt);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(
          0,
          Configuration.gravity,
        ),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    current = BirdMovement.up;
  }

  void gameOver() => gameRef
    ..overlays.add(GameOverScreen.id)
    ..pauseEngine()
    ..isHit = true;

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
  }
}
