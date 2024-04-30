import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 150);
    angle = -pi / 2;
    scale = Vector2(2.5, 1);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
