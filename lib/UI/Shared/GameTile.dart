import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';
import 'package:minesweeper/CORE/ProviderModels/MSCNotifier.dart';
import 'package:provider/provider.dart';

class GameTile extends StatelessWidget {
  final int x;
  final int y;

  const GameTile({Key key, this.x, this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<MSProvider>(context);
    TileState tileState = gameModel.allTilesStatus[y][x];
    Widget getChild() {
      if (tileState == TileState.Covered) {
        return SizedBox();
      } else if (tileState == TileState.Open) {
        if (gameModel.countSurroundingMines(x, y) == 0) {
          return SizedBox();
        } else
          return Center(
              child: Text(gameModel.countSurroundingMines(x, y).toString()));
      } else if (tileState == TileState.Flagged) {
        return Center(child: Icon(Icons.flag));
      } else
        return Center(child: Icon(Icons.restaurant_menu));
    }

    return InkWell(
      onTap: () {
        gameModel.handleTapOfGameTile(x, y);
      },
      onLongPress: () {
        gameModel.flagPosition(x, y);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(
            gameModel.currentGameStatus == GameStatus.Lost ||
                    gameModel.currentGameStatus == GameStatus.Won
                ? 10
                : 1.0),
        duration: const Duration(milliseconds: 400),
        width: 50,
        height: 50,
        child: AnimatedContainer(
          width: 30,
          height: 30,
          duration: const Duration(milliseconds: 400),
          child: getChild(),
          color: tileState == TileState.Blasted
              ? Colors.redAccent
              : tileState == TileState.Open
              ? Theme
              .of(context)
              .accentColor
              .withOpacity(0.2)
                  : tileState == TileState.Flagged
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
