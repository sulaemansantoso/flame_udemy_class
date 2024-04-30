import 'dart:async';
import 'dart:developer';

import 'package:flame/game.dart';

class MyFlameGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    log("on loading application");
  }

  @override
  void update(double dt) {
    log("updating application");
  }
}
