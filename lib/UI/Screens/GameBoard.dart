import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../CORE/Helpers/Constants.dart';
import '../../CORE/Helpers/emuns.dart';
import '../../CORE/ProviderModels/MSCNotifier.dart';
import '../Shared/GridBoard.dart';
import '../Shared/ThemeSelectorWidget.dart';

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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          child: Icon(Icons.arrow_back),
                        )),
                  ),
                  const Align(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            gameModel.flagsSet.toString(),
                            style: GoogleFonts.b612(
                              fontSize: size.width * 0.09,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const FaIcon(FontAwesomeIcons.flag),
                        ],
                      ),
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
