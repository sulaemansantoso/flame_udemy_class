import 'dart:async';
import 'dart:developer';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_udemy_class/component/ship.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;

  @override
  FutureOr<void> onLoad() async {
    s = Ship();
    add(s);

    //add(SpriteComponent());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.position = info.eventPosition.global;
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   log("TapDownEvent ${event.localPosition}");
  //   s.position.add(Vector2(10, 0));
  // }
}
