import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';

class FlappyBirdGame extends FlameGame {
  late final Bird _bird;

  @override
  FutureOr<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
        _bird = Bird(),
        PipeGroup(),
      ],
    );
  }
}
