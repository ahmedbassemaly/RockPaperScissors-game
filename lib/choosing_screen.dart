import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/entering_names_screen/singleplayer.dart';

class ChoosingScreen extends StatefulWidget {
  @override
  _ChoosingScreenState createState() => _ChoosingScreenState();
}

class _ChoosingScreenState extends State<ChoosingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF230639),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: 'picture',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 190.0),
                    child: Image(
                      image: AssetImage('images/picture.png'),
                      height: 60.0,
                    ),
                  ),
                ),

                ChoosingButton(
                  icon: Icons.person,
                  text: 'Single player',
                  onPressed: () {
                    //Entering first player name
                    setState(() {
                      Navigator.pushNamed(context, 'SinglePlayer');
                    });
                  },
                ),

                SizedBox(
                  height: 30.0,
                ),

                ChoosingButton(
                  icon: Icons.people_alt,
                  text: 'Multiplayer',
                  onPressed: () {
                    //Entering the 2 player's name
                    setState(() {
                      Navigator.pushNamed(context, 'MultiPlayer');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChoosingButton extends StatelessWidget {
  ChoosingButton(
      {required this.icon, required this.text, required this.onPressed});

  final icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100.0),
      color: Color(0xFF189AB4),
      child: FlatButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 80.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
