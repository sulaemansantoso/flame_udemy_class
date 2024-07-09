import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  late Vector2 target;
  late Vector2 arah;

  double kecepatan = 20;

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(150, 150);
    angle = -pi / 2;
    anchor = Anchor.center;
    target = position;
  }

  void onPanUpdate(DragUpdateInfo info) {
    target = info.eventPosition.global;
    lookAt(target);
    angle += pi;
  }

  @override
  void update(double dt) {
    arah = target - position;
    if (arah.length < kecepatan) {
      position = target;
    } else {
      arah = arah.normalized();
      position.add(arah * kecepatan);
    }

    super.update(dt);
  }
}
