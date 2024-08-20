import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_udemy_class/ui/game_data.dart';
import 'package:flame_udemy_class/ui/lives_ui_component.dart';

class LivesUI extends PositionComponent with HasGameRef {
  @override
  late GameData gameData;

  List<LivesUiComponent> lives = [];

  LivesUI(this.gameData);

  FutureOr<void> onLoad() {
    for (int i = 0; i < gameData.lives; i++) {
      lives.add(LivesUiComponent());
      lives[i].position =
          Vector2(game.size.x - (i * (lives[i].width + 50) + 50), 30);
      game.camera.viewport.add(lives[i]);
    }
    return super.onLoad();
  }

  void loseLife() {
    if (lives.isNotEmpty) {
      lives[lives.length - 1].removeFromParent();
      lives.removeLast();
    }
  }
}
