import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class bullet extends SpriteComponent with HasGameRef {
  TapDownInfo info;
  late Vector2 arah;
  double speed = 15;
  double ttl = 100;

  bullet(position, this.info) : super(position: position) {
    arah = info.eventPosition.global - position;
    arah = arah.normalized();
    priority = 1;
    lookAt(info.eventPosition.global);
  }

  @override
  void update(double dt) {
    ttl--;
    if (ttl < 0) {
      removeFromParent();
    }
    position.add(arah * speed);
    super.update(dt);
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("bullets/spaceMissiles_015.png");
    return super.onLoad();
  }
}
