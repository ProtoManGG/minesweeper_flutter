import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../CORE/Data/GameLevelsData.dart';
import '../../CORE/Helpers/Constants.dart';
import '../../CORE/Models/LevelSelectionModel.dart';
import '../../CORE/ProviderModels/MSCNotifier.dart';

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
    final List<LevelSelectionModel> levels = GameLevelsData.getGameLevelsData();
    return Container(
      height: 70,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                pageController.previousPage(
                    duration: Constants.DURATION_400, curve: Curves.decelerate);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
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
              children: List.generate(levels.length,
                  (index) => Center(child: Text(levels[index].level))),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageController.nextPage(
                  duration: Constants.DURATION_400, curve: Curves.decelerate);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
