import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medetail/screens/home_screen.dart';
import 'package:medetail/screens/login_screen.dart';
import 'package:medetail/screens/otp_screen.dart';


class MobileLoginScreen extends StatefulWidget {
  
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  TextEditingController mobileTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 60, 50, 2),
                    child: Image.asset("images/logo.png",
                      height: 250,
                      width: 250,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text("Welcome back !!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontFamily: "Brand Bold",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            controller: mobileTextEditingController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Mobile",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                              prefixIcon: Icon(Icons.phone,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: 330,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>OtpScreen(mobileTextEditingController.text)));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Get Otp",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  SizedBox(width: 175,),
                                  Icon(Icons.arrow_forward_ios_sharp),
                                ]
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Want to Sign In with Email ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: Text("Sign in",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )
                ],

              )),
        ),
      ),

    );
  }
}