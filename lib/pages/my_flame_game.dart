import 'dart:async';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_udemy_class/component/ship.dart';
import 'package:flame_udemy_class/component/skyparallax.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Skyparallax pBg;

  @override
  Color backgroundColor() => const Color(0xFF000055);

  @override
  FutureOr<void> onLoad() async {
    s = Ship();

    pBg = Skyparallax();
    add(pBg);
    add(s);

    //add(SpriteComponent());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.onPanUpdate(info);
    pBg.ubahKecepatan(s);
    // s.position = info.eventPosition.global;
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   log("TapDownEvent ${event.localPosition}");
  //   s.position.add(Vector2(10, 0));
  // }
}
