import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../CORE/Helpers/Constants.dart';
import '../../CORE/ProviderModels/MSCNotifier.dart';
// import '../../CORE/ProviderModels/ThemeNotifier.dart';
import '../Shared/GameLevelSelector.dart';
import '../Shared/ThemeSelectorWidget.dart';
import 'GameBoard.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeModel = Provider.of<ThemeNotifier>(context);
    final gameModel = Provider.of<MSProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/mineIcon.png",
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: const Center(
                            child: Text("New Game"),
                          ),
                        ),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              highlightColor: Theme.of(context).primaryColor,
                              child: const Center(
                                child: Text("Resume Game"),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
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
      ),
    );
  }

  void startNewGame(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return GameBoard();
        },
      ),
    );
  }
}
