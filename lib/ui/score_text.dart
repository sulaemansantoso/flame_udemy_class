import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_udemy_class/ui/game_data.dart';
import 'package:flutter/material.dart';

class ScoreText extends PositionComponent with HasGameRef {
  late TextComponent scoreText;
  GameData data;

  ScoreText(this.data);

  @override
  FutureOr<void> onLoad() {
    scoreText = TextComponent(
        position: Vector2(game.size.x - 100, 10),
        text: 'Score: ${data.scores}',
        textRenderer: TextPaint(
            style: const TextStyle(
                fontFamily: "Arial", fontSize: 24, color: Colors.white)));

    game.camera.viewport.add(scoreText);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    scoreText.text = 'Score: ${data.scores}';
    super.update(dt);
  }
}
