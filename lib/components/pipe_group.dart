import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Configuration.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll(
      [
        Pipe(
          height: centerY - spacing / 2,
          pipePosition: PipePosition.top,
        ),
        Pipe(
          height: heightMinusGround - (centerY + spacing / 2),
          pipePosition: PipePosition.bottom,
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    position.x -= Configuration.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
    }

    super.update(dt);
  }
}
