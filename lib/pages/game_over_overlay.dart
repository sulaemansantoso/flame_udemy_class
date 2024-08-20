import 'package:flame_udemy_class/pages/my_flame_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverOverlay extends StatelessWidget {
  MyFlameGame game;
  GameOverOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: game.size.x * 0.3,
      height: game.size.y * 0.3,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromARGB(150, 55, 55, 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Game Over",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  "Play Again",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    ));
  }

  void onPressed() {
    game.reset();
  }
}
