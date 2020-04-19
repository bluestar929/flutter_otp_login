import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/MainPage.dart';
import 'package:flutter_app/ui/login/VerifyPage.dart';
import 'package:flutter_app/ui/login/LoginPage.dart';
import 'package:flutter_app/Constant/Constant.dart';

void main() => runApp(

    new MaterialApp(

        debugShowCheckedModeBanner: false,

        home: new LoginPage(),

        routes: <String, WidgetBuilder>{
          LOGIN_SCREEN: (BuildContext context) => new LoginPage(),
          VERIFY_SCREEN: (BuildContext context) => new VerifyPage(text: null,),
          MAIN_SCREEN: (BuildContext context) => new MainPage(),
        },

));