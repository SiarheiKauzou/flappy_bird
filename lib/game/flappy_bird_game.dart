import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  final _interval = Timer(
    Configuration.pipeInterval,
    repeat: true,
  );
  late final Bird _bird;

  @override
  FutureOr<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
        _bird = Bird(),
      ],
    );
    _interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    _bird.fly();
    super.onTap();
  }

  @override
  void update(double dt) {
    _interval.update(dt);
    super.update(dt);
  }
}
