import 'package:flutter/material.dart';

class BackgroundName extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 340,
      decoration:  new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png", ),
          fit: BoxFit.fill
        )
      ),
      child: Container(
        margin: EdgeInsets.only(top: 190),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Name goes here",
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.w100,
                      fontSize: 28,
                      decoration: TextDecoration.none
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