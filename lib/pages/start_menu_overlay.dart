import 'package:flame_udemy_class/pages/my_flame_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartMenuOverlay extends StatelessWidget {
  MyFlameGame game;
  StartMenuOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: game.size.x * 0.5,
      height: game.size.y * 0.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromARGB(249, 49, 61, 232),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Space Shooter",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            const Image(
                image: AssetImage("assets/images/ships/spaceShips_001.png")),
            ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  "Play Game",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    ));
  }

  void onPressed() {
    game.resumeEngine();
    game.overlays.remove("StartMenu");
  }
}
