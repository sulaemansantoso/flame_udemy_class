import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_udemy_class/component/asteroid.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;

  @override
  FutureOr<void> onLoad() {
    math.Random r = math.Random();
    spawner = SpawnComponent(
        factory: (idx) {
          Asteroid s = Asteroid(ukuran: r.nextDouble() * 0.3 + 0.1);
          game.add(s);
          return s;
        },
        period: 0.5,
        autoStart: true,
        area: Rectangle.fromLTWH(0, 0, game.size.x, game.size.y),
        within: true);

    game.add(spawner);
    return super.onLoad();
  }
}
