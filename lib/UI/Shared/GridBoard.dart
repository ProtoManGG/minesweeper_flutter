import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';
import 'package:minesweeper/CORE/ProviderModels/MSCNotifier.dart';
import 'package:minesweeper/UI/Shared/GameTile.dart';
import 'package:provider/provider.dart';

class GridBoard extends StatefulWidget {
  @override
  _GridBoardState createState() => _GridBoardState();
}

class _GridBoardState extends State<GridBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gameModel = Provider.of<MSProvider>(context);
    int numRows = gameModel.levelSelectionModel.rowCount;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width:
            calculateOuterScrollWidth(numRows, gameModel.currentGameStatus),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: numRows,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateHorizontalItems(index, numRows),
                  );
                }),
          ),
        ),
      ),
    );
  }

  double calculateOuterScrollWidth(int num, GameStatus gameStatus) {
    return 50.0 * num;
  }

  List<Widget> generateHorizontalItems(int index, int rows) {
    List<Widget> items = [];
    for (int i = 0; i < rows; i++) {
      items.add(GameTile(x: i, y: index));
    }
    return items;
  }
}
