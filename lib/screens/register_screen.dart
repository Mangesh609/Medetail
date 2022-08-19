import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medetail/screens/login_screen.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DatabaseReference userRef =FirebaseDatabase.instance.ref().child("users");
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                      padding: EdgeInsets.fromLTRB(50, 60, 50, 10),
                      child: Image.asset("images/logo.png",
                        height: 220,
                        width: 220,
                      ),
                    ),
                    Text("Register Here !!",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontFamily: "Brand Bold",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          SizedBox(
                            width: 330,
                            height: 45,
                            child: TextField(
                              controller: nameTextEditingController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                prefixIcon: Icon(Icons.perm_identity,
                                  color: Colors.grey,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 330,
                            height: 45,
                            child: TextField(
                              controller: emailTextEditingController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                prefixIcon: Icon(Icons.email,
                                  color: Colors.grey,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 330,
                            height: 45,
                            child: TextField(
                              controller: phoneTextEditingController,
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
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 330,
                            height: 45,
                            child: TextField(
                              controller: passwordTextEditingController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                prefixIcon: Icon(Icons.vpn_key_sharp,
                                  color: Colors.grey,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!emailTextEditingController.text.contains(
                                    "@")) {
                                  Fluttertoast.showToast(msg: " Invaild Email ");
                                }
                                else
                                if (passwordTextEditingController.text.length <
                                    5) {
                                  Fluttertoast.showToast(
                                      msg: "Password must be atleast 5 characters");
                                }
                                else
                                if (emailTextEditingController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Email can't be empty");
                                }
                                else if (nameTextEditingController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Name can't be empty");
                                }
                                else
                                if (passwordTextEditingController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Password can't be empty");
                                }
                                else
                                if (phoneTextEditingController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Phone number can't be empty");
                                }
                                else {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                      email: emailTextEditingController.text,
                                      password: passwordTextEditingController
                                          .text).then((value){
                                    Fluttertoast.showToast(msg: "Created account successfully");
                                    DatabaseReference userRef = FirebaseDatabase.instance.ref() ;
                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomeScreen(username: nameTextEditingController.text,)), (route) => false);
                                  }).onError((error, stackTrace){
                                    print("Error ${error.toString()}");
                                  });
                                }
                              },
                              child: Text("Register",
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Have an account ?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                          LoginScreen()), (route) => false);
                                },
                                child: Text("Login",
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