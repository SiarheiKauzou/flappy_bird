import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/gen/fonts.gen.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  final _interval = Timer(
    Configuration.pipeInterval,
    repeat: true,
  );

  late final Bird bird;
  late TextComponent score;

  bool isHit = false;

  @override
  FutureOr<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
        bird = Bird(),
        score = buildScore(),
      ],
    );

    _interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    bird.fly();

    super.onTap();
  }

  @override
  void update(double dt) {
    _interval.update(dt);
    score.text = 'Score: ${bird.score}';

    super.update(dt);
  }

  TextComponent buildScore() => TextComponent(
        text: 'Score: 0',
        position: Vector2(
          size.x / 2,
          size.y / 2 * 0.2,
        ),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontFamily: FontFamily.game,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
