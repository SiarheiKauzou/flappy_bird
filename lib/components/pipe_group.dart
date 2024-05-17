import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    addAll(
      [
        Pipe(
          height: 100,
          pipePosition: PipePosition.top,
        ),
        Pipe(
          height: 100,
          pipePosition: PipePosition.bottom,
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    position.x -= Configuration.gameSpeed * dt;
    super.update(dt);
  }
}
