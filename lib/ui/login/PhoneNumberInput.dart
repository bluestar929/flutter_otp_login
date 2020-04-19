import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/Constant.dart';
import 'package:flutter_app/ui/login/VerifyPage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput>{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> verifyPhone() async{
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]){
      this.verificationId = verId;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyPage(text:verId)
        )
      );
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        timeout: const Duration(seconds: 20),
        verificationCompleted: (AuthCredential phoneAuthCredential){
          print(phoneAuthCredential);
        },
        verificationFailed: (AuthException exceptio){
          print('${exceptio.message}');
        },
        codeSent: smsOTPSent,
        codeAutoRetrievalTimeout: (String verId){
          this.verificationId = verId;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(
          right: 20.0, left: 20.0, top: 30.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    InternationalPhoneNumberInput.withCustomDecoration(
                      onInputChanged: (PhoneNumber number){
                        print(number.phoneNumber);
                        this.phoneNo = number.phoneNumber;
                      },
                      isEnabled: true,
                      autoValidate: false,
                      formatInput: false,
                      inputDecoration: null,

                    ),
                  ],
                ),
              )
            ),

            SizedBox(
              height: 20.0,
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: 150.0,
                height: 40.0,
                child: RaisedButton(
                  onPressed: (){
                    if(phoneNo.isEmpty){
                      return null;
                    }else{
                      formKey.currentState.validate();
                      //verifyPhone();
                      Navigator.of(context).pushNamed(VERIFY_SCREEN);
                    }
                  },
                  child: Text('Submit'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async{
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
    String parsableNumber = number.parseNumber();

    print(parsableNumber);
  }

}




