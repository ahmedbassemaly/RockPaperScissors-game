import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

late String playerName1='User1';
late String playerName2='User2';

class MultiPlayer extends StatefulWidget {

  @override
  _MultiPlayerState createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        body: Container(
          padding: EdgeInsets.only(top: 150.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[

              Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: TextField(
            onChanged:(value){
              playerName1=value;
            },
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter 1st player name',
            ),
          ),
        ),

              SizedBox(height: 30.0,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  onChanged:(value){
                    playerName2=value;
                  },
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter 2nd player name',
                  ),
                ),
              ),

              SizedBox(
                height: 150.0,
              ),

              FlatButton(
                onPressed: () {
                  //Goes to the screen  name:MultiPlayerGame
                  Navigator.pushNamed(context, 'MultiPlayerGame');
                },
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.lightGreenAccent,
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

