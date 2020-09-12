import '../Helpers/emuns.dart';
import '../Models/LevelSelectionModel.dart';

class GameLevelsData {
  static LevelSelectionModel beginner =
      LevelSelectionModel("Beginner", GameLevel.Beginner, 5, 10);
  static LevelSelectionModel easy =
      LevelSelectionModel("Easy", GameLevel.Easy, 10, 10);
  static LevelSelectionModel medium =
      LevelSelectionModel("Medium", GameLevel.Medium, 50, 12);
  static LevelSelectionModel hard =
      LevelSelectionModel("Hard", GameLevel.Hard, 70, 17);
  static LevelSelectionModel extreme =
      LevelSelectionModel("Extreme", GameLevel.Extreme, 100, 20);

  static List<LevelSelectionModel> getGameLevelsData() {
    return [beginner, easy, medium, hard, extreme];
  }

  static LevelSelectionModel getLevelSelectionModelFromType(GameLevel type) {
    switch (type) {
      case GameLevel.Beginner:
        return beginner;
        break;
      case GameLevel.Easy:
        return easy;
        break;
      case GameLevel.Medium:
        return medium;
        break;
      case GameLevel.Hard:
        return hard;
        break;
      case GameLevel.Extreme:
        return extreme;
        break;
      default:
        return null;
        break;
    }
  }
}
