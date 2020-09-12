import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../CORE/Helpers/Constants.dart';
import '../../CORE/Helpers/emuns.dart';
import '../../CORE/Models/ThemeSelectionModel.dart';
import '../../CORE/ProviderModels/ThemeNotifier.dart';

class ThemeSelectorWidget extends StatefulWidget {
  @override
  _ThemeSelectorWidgetState createState() => _ThemeSelectorWidgetState();
}

class _ThemeSelectorWidgetState extends State<ThemeSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themModel = Provider.of<ThemeNotifier>(context);
    final sameDur = Constants.DURATION_400;
    final bool isExpended =
        themModel.currentExpansionState == ThemeSelectorState.Expanded;
    final List<ThemeSelectionModel> themeData = themModel.getAllThemesData();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: sameDur,
          height: 80,
          width: isExpended ? size.width : 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: sameDur,
                height: 50,
                width: isExpended ? size.width - 130 : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: isExpended ? 2 : 0,
                      color: isExpended
                          ? Theme.of(context).accentColor
                          : Colors.transparent),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: themeData.length,
                  itemBuilder: (context, item) {
                    final bool isSelected = themeData[item].isSelected;
                    return Container(
                      width: 50,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          themModel.setCurrentTheme(themeData[item].appTheme);
                        },
                        child: Center(
                          child: AnimatedContainer(
                            duration: sameDur,
                            height: isSelected ? 40 : 30,
                            width: isSelected ? 40 : 30,
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? themeData[item].primary
                                    : themeData[item].background,
                                shape: BoxShape.circle),
                            child: Center(
                              child: AnimatedContainer(
                                duration: sameDur,
                                height: isSelected ? 30 : 20,
                                width: isSelected ? 30 : 20,
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? themeData[item].background
                                        : themeData[item].primary,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  themModel.toggleSelectorExpansionState();
                },
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: AnimatedContainer(
                  duration: sameDur,
                  width: isExpended ? 50 : 30,
                  height: isExpended ? 50 : 30,
                  child: Image.asset(
                    "assets/images/themeIcon.png",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
