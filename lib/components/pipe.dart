import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.height,
    required this.pipePosition,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load('pipe.png');
    final pipeRotated = await Flame.images.load('pipe_rotated.png');

    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Configuration.groundHeight;
        sprite = Sprite(pipe);
    }
  }
}
