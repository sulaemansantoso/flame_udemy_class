import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_udemy_class/component/ship.dart';

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
    s.onPanUpdate(info);
    // s.position = info.eventPosition.global;
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   log("TapDownEvent ${event.localPosition}");
  //   s.position.add(Vector2(10, 0));
  // }
}
