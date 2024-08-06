import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  double ukuran = 0.5;
  late Vector2 arah;
  late double speed;

  Asteroid({required this.ukuran}) {
    scale = Vector2(ukuran, ukuran);
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('meteor/spaceMeteors_001.png');

    anchor = Anchor.center;
    Random r = new Random();

    double x = r.nextDouble() * 2 - 1; //bil random dari -1 s/d 1
    double y = r.nextDouble() * 2 - 1;
    arah = Vector2(x, y);
    speed = r.nextDouble() * 200 + 50;

    // scale = Vector2(0.5, 0.5);
    // position = Vector2(game.size.x / 2, game.size.y / 2);
  }

  @override
  void update(double dt) {
    position.add(arah * speed * dt);

    if (position.x < 0 ||
        position.x > game.size.x ||
        position.y < 0 ||
        position.y > game.size.y) {
      removeFromParent();
    }

    super.update(dt);
  }
}
