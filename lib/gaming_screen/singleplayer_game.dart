
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rock_paper_scissor/entering_names_screen/singleplayer.dart';
import 'package:rock_paper_scissor/gaming_screen/restart_game.dart';


final fieldText = TextEditingController();
void clearText(){//to clear the name in the TextField
  fieldText.clear();
}

List<Icon>userResult=[];////result.add(Icon(Icons.check,color: Colors.green,));
List<Icon>computerResult=[];////computerResult.add(Icon(Icons.check,color: Colors.blue,));
int checkUserScore=0;
int checkComputerScore=0;
String choose='choose';

class SinglePlayerGame extends StatefulWidget {

  @override
  _SinglePlayerGameState createState() => _SinglePlayerGameState();
}

int generateHand=1;
int paper=1;
int rock=2;
int scissors=3;
void changeHandByComputer() {
  generateHand = Random().nextInt(3) + 1;
}

var userSelect;
late List<Map> userOptions=[
  {
    'id':0,
    'image':'images/RPS1.png',
    'name': 'Paper',
  },
  {
    'id':1,
    'image':'images/RPS2.png',
    'name': 'Rock',
  },
  {
    'id':2,
    'image':'images/RPS3.png',
    'name': 'Scissors',
  },
];

void compareGame(){
    if (userSelect == userOptions[0]['name'] && generateHand == rock) {
      print('you win');
      userResult.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      checkUserScore++;
    }
    else if (userSelect == userOptions[1]['name'] &&
        generateHand == scissors) {
      print('you win');
      userResult.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      checkUserScore++;
    }
    else if (userSelect == userOptions[2]['name'] && generateHand == paper) {
      print('you win');
      userResult.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      checkUserScore++;
    }

    else if (userSelect == userOptions[1]['name'] && generateHand == paper) {
      print('Computer Wins');
      computerResult.add(Icon(
        Icons.check,
        color: Colors.red,
      ));
      checkComputerScore++;
    }
    else if (userSelect == userOptions[2]['name'] && generateHand == rock) {
      print('Computer Wins');
      computerResult.add(Icon(
        Icons.check,
        color: Colors.red,
      ));
      checkComputerScore++;
    }
    else if (userSelect == userOptions[0]['name'] &&
        generateHand == scissors) {
      print('Computer Wins');
      computerResult.add(Icon(
        Icons.check,
        color: Colors.red,
      ));
      checkComputerScore++;
    }
}

class _SinglePlayerGameState extends State<SinglePlayerGame> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[800] ,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [

                 Expanded(
                   child: Column(
                     children:<Widget> [
                       Hero(
                         tag: 'faceIcon',
                         child: Image(
                           image: AssetImage('images/faceIcon.png'),
                           color: Colors.teal[100], //teal[100]
                           height: 50.0,
                         ),
                       ),
                       SizedBox(height: 25.0,),
                       Text('$PlayerName',style: TextStyle(fontSize: 15.0,color: Colors.white),),
                       SizedBox(height: 60.0,),
                       Container(
                         child: DropdownButtonHideUnderline(
                           child: DropdownButton(
                             hint: Text(choose),
                             value: userSelect,
                             onChanged:(newValue){
                               setState(() {
                                 userSelect=newValue;
                                 changeHandByComputer();
                                 compareGame();
                               });
                             },
                             items:userOptions.map((Map map) {
                               return new DropdownMenuItem<String>(
                                 value: map['name'].toString(),
                                 child: Row(
                                   children: <Widget>[
                                     Image.asset(
                                       map['image'],
                                       width: 50.0,
                                     ),
                                   ],
                                 ),
                               );
                             }).toList(),
                           ),
                         ),
                       ),
                       SizedBox(height: 100.0,),
                       Row(
                         //crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: userResult,
                       ),
                       SizedBox(height: 30.0,),
                       Container(
                         child: checkUserScore==3? Text('YOU WIN',style: TextStyle(fontSize: 15.0),) :Text(''),
                       ),
                       restartGame(checkUserScore),
                     ],
                   ),
                 ),

                 Expanded(
                   child: Column(
                      children:<Widget> [
                        Icon(
                          Icons.computer,
                          color: Colors.teal[100],
                          size: 60.0,
                        ),
                        SizedBox(height: 20.0,),
                        Text('Computer',style: TextStyle(fontSize: 15.0,color: Colors.white),),
                        SizedBox(height: 60.0,),
                        Container(
                            child:
                            Image.asset('images/RPS$generateHand.png',
                              width: 50.0,
                            ),
                        ),
                        SizedBox(height: 100.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: computerResult,
                        ),
                        SizedBox(height: 30.0,),
                        Container(
                          child: checkComputerScore==3?Text('COMPUTER WINS',style: TextStyle(fontSize:15.0),):Text(''),
                        ),
                        restartGame(checkComputerScore),
                      ],
                    ),
                 ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

