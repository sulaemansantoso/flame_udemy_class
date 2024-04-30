import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(0, 0);
    anchor = Anchor.center;
  }
}
