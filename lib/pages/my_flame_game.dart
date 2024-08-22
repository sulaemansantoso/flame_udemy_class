import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_udemy_class/component/asteroid.dart';
import 'package:flame_udemy_class/component/asteroid_spawner.dart';
import 'package:flame_udemy_class/component/bgParallaxComponent.dart';
import 'package:flame_udemy_class/component/ship.dart';
import 'package:flame_udemy_class/ui/game_data.dart';
import 'package:flame_udemy_class/ui/lives_ui.dart';
import 'package:flame_udemy_class/ui/score_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

class MyFlameGame extends FlameGame
    with PanDetector, TapDetector, HasCollisionDetection {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;
  late GameData data;
  late ScoreText scoreText;
  late LivesUI liveUI;

  void reset() {
    resumeEngine();
    overlays.remove("GameOver");
    data = GameData(0, 3);
    liveUI.reset(data);
    scoreText.reset(data);
    FlameAudio.bgm.play("Looping Ascent - Joel Cummins.mp3");
  }

  void addScore(int score) {
    data.addScore(score);
  }

  void loseLife() {
    data.loseLife();
    liveUI.loseLife();
    if (data.lives <= 0) {
      FlameAudio.bgm.stop();
      pauseEngine();
      overlays.add("GameOver");
      // gameover
    }
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  FutureOr<void> onLoad() async {
    data = GameData(0, 3);
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);

    scoreText = ScoreText(data);
    add(scoreText);

    liveUI = LivesUI(data);
    add(liveUI);

    pauseEngine();
    //add(SpriteComponent());
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
    // s.position = info.eventPosition.global;
  }

  @override
  void onTapDown(TapDownInfo info) {
    s.shoot(info);
    super.onTapDown(info);
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   log("TapDownEvent ${event.localPosition}");
  //   s.position.add(Vector2(10, 0));
  // }
}
