import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/extension.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';
import 'package:flappy_bird/gen/assets.gen.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  final random = Random();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Configuration.groundHeight;
    final spacing = 100 + random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + random.nextDouble() * (heightMinusGround - spacing);

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
      updateScore();
    }

    if (game.isHit) {
      removeFromParent();
      game.isHit = false;
    }

    super.update(dt);
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.audio.point.lastPart);
  }
}
