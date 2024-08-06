import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_udemy_class/component/asteroid.dart';
import 'package:flame_udemy_class/component/asteroid_spawner.dart';
import 'package:flame_udemy_class/component/bgParallaxComponent.dart';
import 'package:flame_udemy_class/component/ship.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

class MyFlameGame extends FlameGame with PanDetector, TapDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);

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
