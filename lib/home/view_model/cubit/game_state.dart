sealed class GameState {}

final class GameInitial extends GameState {}

final class GamePlay extends GameState {}

final class GameWin extends GameState {
  final String charactWin;

  GameWin({required this.charactWin});
}

final class GameDraw extends GameState {}
