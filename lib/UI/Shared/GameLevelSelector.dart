import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/CORE/Data/GameLevelsData.dart';
import 'package:minesweeper/CORE/Helpers/Constants.dart';
import 'package:minesweeper/CORE/Models/LevelSelectionModel.dart';
import 'package:minesweeper/CORE/ProviderModels/MSCNotifier.dart';
import 'package:provider/provider.dart';

class GameLevelSelector extends StatefulWidget {
  @override
  _GameLevelSelectorState createState() => _GameLevelSelectorState();
}

class _GameLevelSelectorState extends State<GameLevelSelector> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gameModel = Provider.of<MSProvider>(context);
    List<LevelSelectionModel> levels = GameLevelsData.getGameLevelsData();
    return Container(
      height: 70,
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
              onTap: () {
                pageController.previousPage(
                    duration: Constants.DURATION_400, curve: Curves.decelerate);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              )),
          Container(
            width: size.width / 2,
            child: PageView(
              controller: pageController,
              onPageChanged: (page) {
                gameModel.handleOnLevelChange(levels[page].gameLevel);
              },
              scrollDirection: Axis.horizontal,
              children: List.generate(levels.length,
                  (index) => Center(child: Text(levels[index].level))),
            ),
          ),
          GestureDetector(
              onTap: () {
                pageController.nextPage(
                    duration: Constants.DURATION_400, curve: Curves.decelerate);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
              )),
        ],
      ),
    );
  }
}
