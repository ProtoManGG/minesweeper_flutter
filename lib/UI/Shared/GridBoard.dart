import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../CORE/Helpers/emuns.dart';
import '../../CORE/ProviderModels/MSCNotifier.dart';
import 'GameTile.dart';

class GridBoard extends StatefulWidget {
  @override
  _GridBoardState createState() => _GridBoardState();
}

class _GridBoardState extends State<GridBoard> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final gameModel = Provider.of<MSProvider>(context);
    final int numRows = gameModel.levelSelectionModel.rowCount;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width:
              calculateOuterScrollWidth(numRows, gameModel.currentGameStatus),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: numRows,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generateHorizontalItems(index, numRows),
                );
              }),
        ),
      ),
    );
  }

  double calculateOuterScrollWidth(int num, GameStatus gameStatus) {
    return 50.0 * num;
  }

  List<Widget> generateHorizontalItems(int index, int rows) {
    final List<Widget> items = [];
    for (int i = 0; i < rows; i++) {
      items.add(GameTile(x: i, y: index));
    }
    return items;
  }
}
