import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Helpers/Constants.dart';
import 'package:minesweeper/CORE/ProviderModels/MSCNotifier.dart';
import 'package:minesweeper/CORE/ProviderModels/ThemeNotifier.dart';
import 'package:minesweeper/UI/Screens/GameBoard.dart';
import 'package:minesweeper/UI/Shared/GameLevelSelector.dart';
import 'package:minesweeper/UI/Shared/ThemeSelectorWidget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeNotifier>(context);
    final gameModel = Provider.of<MSProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "/images/mineIcon.png",
                        fit: BoxFit.cover,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: GameLevelSelector(),
                    ),
                    InkWell(
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
                    AnimatedOpacity(
                      duration: Constants.DURATION_400,
                      opacity: gameModel.isResumeAvailable ? 1.0 : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          height: 50,
                          width: size.width / 2,
                          child: OutlineButton(
                            onPressed: () {},
                            highlightedBorderColor:
                                Theme.of(context).primaryColor,
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 4),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0)),
                            highlightColor: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text("Resume Game"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.list),
                    Icon(Icons.list),
                    Icon(Icons.list),
                    Icon(Icons.list)
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ThemeSelectorWidget(),
          ),
        ],
      ),
    );
  }

  void startNewGame(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return GameBoard();
    }));
  }
}
