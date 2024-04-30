import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame_udemy_class/component/ship.dart';

class MyFlameGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    Ship s = Ship();
    add(s);

    //add(SpriteComponent());
  }
}
