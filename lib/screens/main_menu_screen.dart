import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({
    required this.game,
    super.key,
  });

  final FlappyBirdGame game;
  static const id = 'mainMenu';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () => game
          ..overlays.remove(MainMenuScreen.id)
          ..resumeEngine(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.menu.provider(),
              fit: BoxFit.cover,
            ),
          ),
          child: Assets.images.message.image(),
        ),
      ),
    );
  }
}
