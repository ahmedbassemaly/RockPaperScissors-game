import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/constants.dart';


late String PlayerName='User';

final fieldText = TextEditingController();
void clearText(){//to clear the name in the TextField
  fieldText.clear();
}

class Single_player extends StatefulWidget {
  @override
  _single_playerState createState() => _single_playerState();
}

class _single_playerState extends State<Single_player> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        body: Container(
          padding: EdgeInsets.only(top: 150.0),
          child: ListView(
           // mainAxisAlignment: MainAxisAlignment.center,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Hero(
                tag: 'faceIcon',
                child: Image(
                  image: AssetImage('images/faceIcon.png'),
                  color: Colors.teal[100], //teal[100]
                  height: 100.0,
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  onChanged: (value){
                    PlayerName=value;
                  },
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your name',
                  ),
                  controller: fieldText,
                ),
              ),

              SizedBox(
                height: 150.0,
              ),

              FlatButton(
                onPressed: () {
                  //Goes to the screen  name:SinglePlayerGame
                  Navigator.pushNamed(context, 'SinglePlayerGame');
                  clearText();
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
