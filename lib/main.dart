import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CORE/ProviderModels/MSCNotifier.dart';
import 'CORE/ProviderModels/ThemeNotifier.dart';
import 'UI/Screens/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MSProvider>(create: (_) => MSProvider()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
      ],
      child: MSMaterialApp(),
    );
  }
}

class MSMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: model.currentThemeData,
      home: MainScreen(),
    );
  }
}
