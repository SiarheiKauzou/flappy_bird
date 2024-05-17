import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/extension.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/gen/assets.gen.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(Assets.images.ground.name);

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

    add(
      RectangleHitbox(
        position: Vector2(
          0,
          gameRef.size.y - Configuration.groundHeight,
        ),
        size: Vector2(
          gameRef.size.x,
          Configuration.groundHeight,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Configuration.gameSpeed;

    super.update(dt);
  }
}
