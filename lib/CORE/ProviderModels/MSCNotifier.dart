import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:minesweeper/CORE/Data/GameLevelsData.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';
import 'package:minesweeper/CORE/Models/LevelSelectionModel.dart';

class MSProvider extends ChangeNotifier {
  GameLevel currentGameLevel = GameLevel.Beginner;
  LevelSelectionModel levelSelectionModel = GameLevelsData.beginner;
  GameStatus currentGameStatus = GameStatus.Starting;

  bool isResumeAvailable = false;

  int startAnimationDuration = 1;
  int emptyRevealDuration = 1;
  int explodesRevealDuration = 1;

  List<List<TileState>> allTilesStatus;
  List<List<bool>> allTilesMineStatus;

  MSProvider() {
    checkResumeAvailable(currentGameLevel);
    resetAll();
  }

  void handleOnLevelChange(GameLevel gameLevel) {
    currentGameLevel = gameLevel;
    levelSelectionModel =
        GameLevelsData.getLevelSelectionModelFromType(gameLevel);
    checkResumeAvailable(gameLevel);
    notifyListeners();
  }

  void checkResumeAvailable(GameLevel gameLevel) {
    isResumeAvailable = false;
    notifyListeners();
  }

  void resetAll() {
    allTilesStatus =
        List<List<TileState>>.generate(levelSelectionModel.rowCount, (row) {
      return List<TileState>.filled(
          levelSelectionModel.rowCount, TileState.Covered);
    });

    allTilesMineStatus =
        List<List<bool>>.generate(levelSelectionModel.rowCount, (row) {
      return List<bool>.filled(levelSelectionModel.rowCount, false);
    });

    Random random = Random();
    int remainingNumOfMines = levelSelectionModel.minesCount;

    while (remainingNumOfMines > 0) {
      int positionOfMine = random
          .nextInt(levelSelectionModel.rowCount * levelSelectionModel.rowCount);
      int rowIndexOfMine = positionOfMine ~/ levelSelectionModel.rowCount;
      int columnIndexOfMine = positionOfMine % levelSelectionModel.rowCount;

      //check if new position doesn't have a mine already
      if (!allTilesMineStatus[rowIndexOfMine][columnIndexOfMine]) {
        allTilesMineStatus[rowIndexOfMine][columnIndexOfMine] = true;
        remainingNumOfMines--;
      }
    }

    startAnimationDuration = levelSelectionModel.rowCount * 2;
    emptyRevealDuration = 0;
    explodesRevealDuration = (levelSelectionModel.rowCount - 20).abs();

    currentGameStatus = GameStatus.Starting;
  }

  void startGame() {
    currentGameStatus = GameStatus.GoingOn;
    notifyListeners();
  }

  int countSurroundingMines(int x, int y) {
    int count = 0;

    //check left column
    count += isAMine(x - 1, y - 1);
    count += isAMine(x - 1, y);
    count += isAMine(x - 1, y + 1);

    //check same column
    count += isAMine(x, y - 1);
    count += isAMine(x, y + 1);

    //check right column
    count += isAMine(x + 1, y - 1);
    count += isAMine(x + 1, y);
    count += isAMine(x + 1, y + 1);

    return count;
  }

  int isAMine(int x, int y) {
    return isInBoard(x, y) && allTilesMineStatus[y][x] ? 1 : 0;
  }

  bool isInBoard(int x, int y) {
    return x >= 0 &&
        x < levelSelectionModel.rowCount &&
        y >= 0 &&
        y < levelSelectionModel.rowCount;
  }

  void handleTapOfGameTile(int x, int y) {
    TileState tileState = allTilesStatus[y][x];
    int nearByMineCount = countSurroundingMines(x, y);
    if (tileState == TileState.Open) return;

    if (tileState == TileState.Flagged) {
      tileState = TileState.Covered;
    } else if (tileState == TileState.Covered) {
      tileState = TileState.Open;
    }

    if (isAMine(x, y) == 1) {
      tileState = TileState.Blasted;
      foundMinePerformActions();
    } else if (countSurroundingMines(x, y) == 0) {
      floodReveal(x, y);
    }

    allTilesStatus[y][x] = tileState;
    notifyListeners();
  }

  void foundMinePerformActions() {
    for (int x = 0; x < levelSelectionModel.rowCount; x++) {
      for (int y = 0; y < levelSelectionModel.rowCount; y++) {
        Future.delayed(Duration(milliseconds: explodesRevealDuration), () {
          if (allTilesMineStatus[x][y]) {
            allTilesStatus[x][y] = TileState.Blasted;
          }
          notifyListeners();
        });
      }
    }
    currentGameStatus = GameStatus.Lost;
    notifyListeners();
  }

  void flagPosition(int x, int y) {
    TileState tileState = allTilesStatus[y][x];
    if (tileState == TileState.Open) return;

    if (tileState == TileState.Flagged) {
      tileState = TileState.Covered;
    } else if (tileState == TileState.Covered) {
      tileState = TileState.Flagged;
    }

    allTilesStatus[y][x] = tileState;
    notifyListeners();
  }

  void floodReveal(int x, int y) {
    TileState tileState = allTilesStatus[y][x];
    if (isAMine(x, y) == 1 || countSurroundingMines(x, y) != 0) {
      return;
    }
    if (tileState == TileState.Open || tileState == TileState.Flagged) return;

    if (tileState == TileState.Covered) {
      allTilesStatus[y][x] = TileState.Open;
      notifyListeners();
    }
    Timer(Duration(milliseconds: 0), () {
      if (x < levelSelectionModel.rowCount - 1) floodReveal(x + 1, y);
      if (x > 0) floodReveal(x - 1, y);
      if (y < levelSelectionModel.rowCount - 1) floodReveal(x, y + 1);
      if (y > 0) floodReveal(x, y - 1);
    });
  }
}
