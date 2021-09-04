import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/entering_names_screen/multiplayer.dart';
import 'package:rock_paper_scissor/gaming_screen/restart_game.dart';

List<Icon> player1Icons=[];
List<Icon> player2Icons=[];
int checkPlayer1Score=0;
int checkPlayer2Score=0;
int generateHandPlayer1=1;
int generateHandPlayer2=1;
bool isButtonDisabled=false;

class MultiPlayerGame extends StatefulWidget {

  @override
  _MultiPlayerGameState createState() => _MultiPlayerGameState();
}

int paper=1;
int rock=2;
int scissors=3;
void changeHandByComputerPlayer1() {
  generateHandPlayer1 = Random().nextInt(3) + 1;
}
void changeHandByComputerPlayer2() {
  generateHandPlayer2 = Random().nextInt(3) + 1;
}

void compare2Players(){
  if(generateHandPlayer1==paper && generateHandPlayer2==rock){
    print('Player 1 Wins');
    player1Icons.add(Icon(Icons.check,color: Colors.green,));
    checkPlayer1Score++;
  }
  else if(generateHandPlayer1==rock && generateHandPlayer2==scissors){
    print('Player 1 Wins');
    player1Icons.add(Icon(Icons.check,color: Colors.green,));
    checkPlayer1Score++;
  }
  else if(generateHandPlayer1==scissors && generateHandPlayer2==paper){
    print('Player 1 Wins');
    player1Icons.add(Icon(Icons.check,color: Colors.green,));
    checkPlayer1Score++;
  }

  else if(generateHandPlayer2==paper && generateHandPlayer1==rock){
    print('Player 2 Wins');
    player2Icons.add(Icon(Icons.check,color: Colors.red,));
    checkPlayer2Score++;
  }
  else if(generateHandPlayer2==rock && generateHandPlayer1==scissors){
    print('Player 2 Wins');
    player2Icons.add(Icon(Icons.check,color: Colors.red,));
    checkPlayer2Score++;
  }
  else if(generateHandPlayer2==scissors && generateHandPlayer1==paper){
    print('Player 2 Wins');
    player2Icons.add(Icon(Icons.check,color: Colors.red,));
    checkPlayer2Score++;
  }
}

class _MultiPlayerGameState extends State<MultiPlayerGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.blue[800] ,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            //padding: EdgeInsets.only(top: 150),
             children:<Widget> [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:<Widget> [
                   Expanded(
                     child: PlayerGame(
                         'Player 1',
                         '$playerName1',
                         AssetImage('images/RPS$generateHandPlayer1.png'),
                         player1Icons,
                         checkPlayer1Score
                     ),
                   ),

                   Expanded(
                     child: PlayerGame(
                         'Player 2',
                         '$playerName2',
                         AssetImage('images/RPS$generateHandPlayer2.png'),
                         player2Icons,
                         checkPlayer2Score
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 30.0,),
               Column(
                 children:<Widget> [
                   FlatButton(
                       onPressed:(){
                         setState(() {
                           changeHandByComputerPlayer1();
                           changeHandByComputerPlayer2();
                           compare2Players();
                         });
                       },
                       child: Text('GENERATE',
                         style: TextStyle(fontSize: 27,color: Colors.green,fontWeight: FontWeight.bold),
                       )
                   ),
                 ],
               ),
             ],
          ),
        ),
    );
  }
}

class PlayerGame extends StatelessWidget {
  String playerNames;
  String text;
  final image;
  final icon;
  int checkWhoWins;
  PlayerGame(this.text,this.playerNames,this.image,this.icon,this.checkWhoWins);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Text(text,style: TextStyle(fontSize: 15.0),),
        SizedBox(height: 25.0,),
        Image(
          image: AssetImage('images/faceIcon.png'),
          color: Colors.teal[100],
          height: 60.0,
        ),
        SizedBox(height: 25.0,),
        Text(playerNames,style: TextStyle(fontSize: 15.0,color: Colors.white),),
        SizedBox(height: 30.0,),
        Image( image: image,width: 50.0,),
        SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icon,
        ),
        SizedBox(height: 10.0,),
        Container(child: checkWhoWins==3? Text('YOU WIN',style: TextStyle(fontSize: 15.0),) :Text(''),
        ),
        Container(child: checkWhoWins==3?restartGame(checkWhoWins):Text('') ),
      ],
    );
  }
}
