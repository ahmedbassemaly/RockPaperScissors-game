import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    ///ColourTween///
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = ColorTween(begin: Color(0xFFFF3333), end: Colors.lightBlueAccent,).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    ///End of ColourTween///
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ColorizeAnimatedTextKit(
              text: [
                'R.P.S',
              ],
              colors: colorizeColors,
              textStyle: nameStyle,
            ),
            SizedBox(
              height: 100.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, 'ChoosingScreen');
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Hero(
              tag: 'picture',
              child: Image(
                image: AssetImage('images/picture.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
