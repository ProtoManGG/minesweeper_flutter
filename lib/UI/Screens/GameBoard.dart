import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/Constants.dart';
import 'package:minesweeper/CORE/Helpers/emuns.dart';
import 'package:minesweeper/CORE/ProviderModels/MSCNotifier.dart';
import 'package:minesweeper/UI/Shared/GridBoard.dart';
import 'package:minesweeper/UI/Shared/ThemeSelectorWidget.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  void initState() {
    Provider.of<MSProvider>(context, listen: false).resetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gameModel = Provider.of<MSProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          child: Icon(Icons.arrow_back),
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.timelapse),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ThemeSelectorWidget(),
                  )
                ],
              ),
            ),
            Expanded(
              child: IgnorePointer(
                ignoring: gameModel.currentGameStatus == GameStatus.Lost ||
                    gameModel.currentGameStatus == GameStatus.Won,
                child: GridBoard(),
              ),
            ),
            Container(
              height: 100,
              width: size.width,
              child: gameModel.currentGameStatus == GameStatus.GoingOn ||
                      gameModel.currentGameStatus == GameStatus.Starting
                  ? Center(
                      child: Text((gameModel.totalMines - gameModel.flagsSet)
                          .toString()),
                    )
                  : Center(
                      child: InkWell(
                        onTap: () {
                          startNewGame(context);
                        },
                        borderRadius: BorderRadius.circular(25),
                        highlightColor: Theme.of(context).primaryColor,
                        child: AnimatedContainer(
                            duration: Constants.DURATION_400,
                            width: size.width / 2,
                            height: 50,
                            child: Center(
                              child: Text("New Game"),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor),
                            )),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  void startNewGame(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return GameBoard();
    }));
  }
}
