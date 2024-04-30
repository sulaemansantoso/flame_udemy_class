import 'dart:async';
import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(SpriteComponent(
        sprite: await loadSprite("meteor/spaceMeteors_001.png")));
  }
}
