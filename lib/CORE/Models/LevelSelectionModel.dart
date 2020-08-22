import 'package:minesweeper/CORE/Helpers/emuns.dart';

class LevelSelectionModel{
  final String level;
  final GameLevel gameLevel;
  final int minesCount;
  final int rowCount;

  LevelSelectionModel(this.level, this.gameLevel, this.minesCount, this.rowCount);
}
