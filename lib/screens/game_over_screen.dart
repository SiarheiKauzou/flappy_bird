import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({
    required this.game,
    super.key,
  });

  final FlappyBirdGame game;
  static const id = 'gameOver';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.gameover.image(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onRestart,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onRestart() => game
    ..bird.reset()
    ..overlays.remove(GameOverScreen.id)
    ..resumeEngine();
}
