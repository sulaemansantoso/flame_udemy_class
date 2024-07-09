import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_udemy_class/component/ship.dart';
import 'package:flutter/painting.dart';

class Skyparallax extends ParallaxComponent with HasGameRef {
  final _parallelImage = [
    ParallaxImageData('parallax/bkgd_0.png'),
    ParallaxImageData('parallax/bkgd_1.png'),
    ParallaxImageData('parallax/bkgd_2.png'),
    ParallaxImageData('parallax/bkgd_3.png'),
    ParallaxImageData('parallax/bkgd_4.png'),
    ParallaxImageData('parallax/bkgd_5.png'),
    ParallaxImageData('parallax/bkgd_6.png'),
  ];

  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      _parallelImage,
      baseVelocity: Vector2(-5, -5),
      velocityMultiplierDelta: Vector2(1.5, 1.5),
      repeat: ImageRepeat.repeat,
    );
    return super.onLoad();
  }

  void ubahKecepatan(Ship player) {
    if (parallax != null) {
      if (player.arah.length > 0) {
        parallax!.baseVelocity = player.arah * 5;
      }
    }
  }
}
