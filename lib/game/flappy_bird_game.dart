import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    addAll(
      [
        Background(),
        Ground(),
      ],
    );
  }
}
