import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/rendering.dart';
import 'package:flame_udemy_class/component/bullet.dart';
import 'package:flame_udemy_class/component/explosion.dart';
import 'package:flame_udemy_class/pages/my_flame_game.dart';

class Ship extends SpriteComponent
    with HasGameRef<MyFlameGame>, CollisionCallbacks {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 3.0;
  bool isShooting = false;
  bool isBeingHit = false;
  double hitTimer = 0;
  double hitCooldown = 10;
  double shootCooldown = 20;
  double shootTimer = 0;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if ((isBeingHit == false) && (other is! bullet)) {
      isBeingHit = true;
      decorator
          .addLast(PaintDecorator.tint(const Color.fromARGB(255, 255, 0, 0)));
      decorator.addLast(PaintDecorator.blur(10));
      game.loseLife();
      game.add(Explosion(intersectionPoints.first, Vector2(1, 1)));
    }

    super.onCollision(intersectionPoints, other);
  }

  Ship() {
    arah = Vector2(0, 0);
    tujuan = position;
    priority = 2;
  }

  void shoot(TapDownInfo info) {
    if (isShooting == false) {
      bullet bBaru = bullet(position, info);
      game.add(bBaru);
      isShooting = true;
    }
    lookAt(info.eventPosition.global);
    angle += pi;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global;
    lookAt(tujuan);
    angle += pi;

    arah = tujuan - position;
    arah = arah.normalized();
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(150, 150);
    angle = -pi / 2;
    anchor = Anchor.center;
    add(CircleHitbox(
        radius: sprite!.image.width / 2, collisionType: CollisionType.active));
  }

  @override
  void update(double dt) {
    if (isShooting == true) {
      shootTimer++;
      if (shootTimer > shootCooldown) {
        shootTimer = 0;
        isShooting = false;
      }
    }
    if (isBeingHit) {
      hitTimer++;
      if (hitTimer > hitCooldown) {
        hitTimer = 0;
        isBeingHit = false;
        decorator.removeLast();
        decorator.removeLast();
      }
    }
    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }
}
