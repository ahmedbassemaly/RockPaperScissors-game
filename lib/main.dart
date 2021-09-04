import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/choosing_screen.dart';
import 'package:rock_paper_scissor/entering_names_screen/multiplayer.dart';
import 'package:rock_paper_scissor/entering_names_screen/singleplayer.dart';
import 'gaming_screen/multiplayer_game.dart';
import 'gaming_screen/singleplayer_game.dart';
import 'welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'WelcomeScreen',
      routes: {
        'WelcomeScreen': (context) => WelcomeScreen(),
        'ChoosingScreen': (context) => ChoosingScreen(),
        'SinglePlayer': (context) => Single_player(),
        'SinglePlayerGame':(context)=>SinglePlayerGame(),
        'MultiPlayer':(context)=>MultiPlayer(),
        'MultiPlayerGame':(context)=>MultiPlayerGame(),
      },
    );
  }
}
