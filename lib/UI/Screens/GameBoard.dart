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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () {
                        gameModel.resetAll();
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
                ? Container()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          gameModel.resetAll();
                          startNewGame(context);
                        },
                        borderRadius: BorderRadius.circular(25),
                        highlightColor: Theme.of(context).primaryColor,
                        child: AnimatedContainer(
                            duration: Constants.DURATION_400,
                            width: size.width / 4,
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
                      AnimatedOpacity(
                        duration: Constants.DURATION_400,
                        opacity: gameModel.isResumeAvailable ? 1.0 : 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: OutlineButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              highlightedBorderColor:
                                  Theme.of(context).primaryColor,
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 4),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              highlightColor: Theme.of(context).primaryColor,
                              child: Center(
                                child: Text("Select Difficulty"),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }

  void startNewGame(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return GameBoard();
    }));
  }
}
