import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medetail/screens/home_screen.dart';
import 'package:pinput/pinput.dart';




class OtpScreen extends StatefulWidget {
  String phone;
  OtpScreen(this.phone);


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String verificationIdRecieved = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 40, 50, 2),
                    child: Image.asset("images/logo.png",
                      height: 250,
                      width: 250,
                    ),
                  ),
                  Text("Enter the OTP",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 15,),
                  Text("We have sent an OTP to +91-${widget.phone}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(padding: EdgeInsets.all(20),
                  child:Pinput(
                    length: 6,
                    onSubmitted: (pin) async{
                      try{
                        await FirebaseAuth.instance.signInWithCredential(
                            PhoneAuthProvider.credential(verificationId: verificationIdRecieved, smsCode: pin)
                        ).then((value) async {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(username: "${widget.phone}",)));
                        });
                      }
                      catch (e){
                        Fluttertoast.showToast(msg:"Invalid Otp");
                      }
                    },
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  void verifyphone(){
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.phone}",
        verificationCompleted:(PhoneAuthCredential credential) async{
          await auth.signInWithCredential(credential).then((value) =>{
            print("Logged in")
          } );
        },
        codeSent: (String verificationId ,int? resendToken){
          setState((){
            verificationIdRecieved = verificationId ;
          });

        },
        codeAutoRetrievalTimeout: (verificationId){
          setState(() {
            verificationIdRecieved = verificationId ;
          });
        },
        verificationFailed: (FirebaseAuthException error) {  
        print(error.message);
        }
    );

  }


}

