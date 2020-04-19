import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Constant/Constant.dart';
import 'package:flutter_app/ui/login/MainPage.dart';

import 'BackgroundName.dart';


class VerifyPage extends StatelessWidget{

  final String text;

  const VerifyPage({Key key,@required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Widget back(){
      return new Container(

        margin: EdgeInsets.only(top: 50.0, right: 260),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            new Padding(
                padding: new EdgeInsets.symmetric(
                    horizontal: 10.0
                )
            ),
            new FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed:(){
                Navigator.of(context).pop();
              },
              child: new IconTheme(
                  data: new IconThemeData(
                    color:Color(0xFF707070),
                  ),
                  child: new Icon(Icons.arrow_back)),
            )
          ],
        ),
      );
    }

    return Scaffold(

      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD5D5D5),
      extendBodyBehindAppBar: true,

      floatingActionButton: back(),
      appBar: new AppBar(
        backgroundColor:Color(0xFFD5D5D5) ,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: MyVerifyPage(text),
    );
  }

}

class MyVerifyPage extends StatefulWidget{

  final String verificationId;
  MyVerifyPage(this.verificationId);

  @override
  _MyVerifyPageState createState()=> _MyVerifyPageState(verificationId);
}

class _MyVerifyPageState extends State<MyVerifyPage>{

  String smsOTP;
  String errorMessage = '';

  String verificationId;

  _MyVerifyPageState(String verificationId){
    this.verificationId = verificationId;
  }


  Future<FirebaseUser> getUserFromCodePhone(String code, String verificationId) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP);

    try{
      AuthResult result = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      if(currentUser != null && result.user.uid == currentUser.uid){
        //Navigator.of(context).pushNamed(MAIN_SCREEN);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(currentUserId: currentUser.uid)));
      }else{
        return null;
      }

    }catch(e){

    }
  }

  final VerificationTitle = Container(
    color: Colors.white,
    margin: EdgeInsets.only(top: 50, left: 20),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Phone Verification",
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
            Text("Enter your OTP code below",
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

  Widget _VerifyField(){
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Flexible(
                    flex: 4,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "∙∙∙∙ ∙∙∙∙ ∙∙∙∙ ∙∙∙∙ ∙∙∙ ∙∙∙∙",
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        this.smsOTP = value;
                      },
                    ),
                  ),

                  new Flexible(
                    flex: 1,
                    child: new RawMaterialButton(
                        onPressed: (){
                          getUserFromCodePhone(smsOTP, verificationId);
                          //Navigator.of(context).pushNamed(MAIN_SCREEN);
                        },
                        child: new Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Color(0xFF707070),
                        padding: EdgeInsets.all(10.0)
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  final termAlert = Container(

    margin: EdgeInsets.only(top: 30, left: 20,),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Resend Code in ",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.w200
                  ),),

                Text("10 seconds",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(

          child:  SingleChildScrollView(

            child: Column(
              children: <Widget>[
                BackgroundName(),
                VerificationTitle,
                _VerifyField(),
                termAlert,
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
      ) ,
    );
  }
}

