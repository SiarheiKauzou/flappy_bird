import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load('ground.png');
    parallax = Parallax(
      [
        ParallaxLayer(
          ParallaxImage(
            ground,
            fill: LayerFill.none,
          ),
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Configuration.gameSpeed;
    super.update(dt);
  }
}
