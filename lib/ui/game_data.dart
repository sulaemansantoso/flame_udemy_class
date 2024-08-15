class GameData {
  late int _scores;
  late int _lives;

  GameData(this._scores, this._lives);

  int get scores => _scores;
  int get lives => _lives;

  void addScore(int score) {
    _scores += score;
  }

  void addLives(int lives) {
    _lives += lives;
  }

  void loseLife() {
    _lives--;
  }
}
