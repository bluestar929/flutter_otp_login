import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/login/PhoneNumberInput.dart';
import 'BackgroundName.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,

        ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

      appBar: new AppBar(
        backgroundColor:Color(0xFFD5D5D5) ,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: new MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget{

  @override
  _MyLoginPageState createState()=> _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage>{

@override
  Widget build(BuildContext context) {

    final backgroundTitle = Container(

      margin: EdgeInsets.only(top: 40, left: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hello, nice to meet you!",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                  color: Color(0xFF707070),
                ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Get moving with ride abc",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.bold
                ),)
            ],
          ),
        ],
      ),
    );


    final termAlert = Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("By creating an account, you agree to our",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w100,
                  fontSize: 10,
                  color: Color(0xFF707070),
                ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Terms of service",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.bold
                    ),),
                  Text(" and ",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.w100
                    ),),
                  Text("Privacy Policy",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.bold
                    ),)
                ],
              )
            ],
          ),
        ],
      ),
    );

    final Space = Container(
      height: 30,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child:  SingleChildScrollView(

          child: Column(
            children: <Widget>[
              BackgroundName(),
              backgroundTitle,
              PhoneNumberInput(),
              termAlert,
              Space,
//              Padding(
//                padding: EdgeInsets.only(
//                    bottom: MediaQuery.of(context).viewInsets.bottom
//                ),
//              )
            ],
          ),
        ),

      ),
    );
  }
}




