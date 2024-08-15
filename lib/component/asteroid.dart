import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_udemy_class/component/blast_particle.dart';
import 'package:flame_udemy_class/component/bullet.dart';
import 'package:flame_udemy_class/pages/my_flame_game.dart';

class Asteroid extends SpriteComponent
    with HasGameRef<MyFlameGame>, CollisionCallbacks {
  double ukuran = 0.5;
  late Vector2 arah;
  late double speed;

  Asteroid({required this.ukuran}) {
    scale = Vector2(ukuran, ukuran);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // super.onCollision(intersectionPoints, other);
    if (other is bullet) {
      game.add(BlastParticle(position, ukuran));
      game.addScore(10);
      removeFromParent();
    }
    print("terjadi tubrukan");
    super.onCollision(intersectionPoints, other);
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('meteor/spaceMeteors_001.png');
    add(RectangleHitbox(collisionType: CollisionType.passive));

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
