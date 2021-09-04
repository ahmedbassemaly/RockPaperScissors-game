import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/entering_names_screen/multiplayer.dart';
import 'package:rock_paper_scissor/entering_names_screen/singleplayer.dart';
import 'package:rock_paper_scissor/gaming_screen/singleplayer_game.dart';

import 'multiplayer_game.dart';

class restartGame extends StatelessWidget {
  int checkWhoWins;
  restartGame(this.checkWhoWins);

  @override
  Widget build(BuildContext context) {
    return Container(
    child: checkWhoWins==3?
    GestureDetector(
      onTap: () {
      //Goes to the screen name:ChoosingScreen to choose and play again
      Navigator.pushNamed(context, 'ChoosingScreen');

      ///SinglePlayer Screen
      userResult.clear();
      computerResult.clear();
      checkUserScore=0;
      checkComputerScore=0;
      PlayerName='User';

      ///MultiPlayer Screen
      player1Icons.clear();
      player2Icons.clear();
      checkPlayer1Score=0;
      checkPlayer2Score=0;
      generateHandPlayer1=1;
      generateHandPlayer2=1;
      playerName1='User1';
      playerName2='User2';

    },
      child: Text(
        'PLAY AGAIN',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w900,
          color: Colors.lightGreenAccent,
         ),
        ),
      ) :Text(''),
    );
  }
}