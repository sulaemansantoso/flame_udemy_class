import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';

class BlastParticle extends ParticleSystemComponent {
  Vector2 particlePosition;
  double speed = 100;
  double ukuran;

  BlastParticle(this.particlePosition, this.ukuran);

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    Random r = new Random();

    particle = Particle.generate(
        count: 50,
        generator: (idx) {
          Vector2 arahAcak =
              Vector2(r.nextDouble() * 2 - 1, r.nextDouble() * 2 - 1) *
                  r.nextDouble() *
                  speed;

          return MovingParticle(
              child: CircleParticle(
                  lifespan: 4,
                  radius: ukuran * 50,
                  paint: Paint()
                    ..color = Color.fromARGB(
                        r.nextInt(100) + 155, 255, r.nextInt(155) + 100, 0)),
              from: particlePosition,
              to: particlePosition + arahAcak);
        });

    return super.onLoad();
  }
}
