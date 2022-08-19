import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medetail/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {

  String username="";
 HomeScreen({required this.username});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TimeOfDay now = TimeOfDay.now();
   greeting() {
    String greeting ;
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'Good Morning';
      return greeting;
    }
    else if(hour<6 && hour>1){
      greeting = "Hello ! Night Owl";
      return greeting;
    }
    else if (hour < 17) {
      greeting = 'Good Afternoon';
      return greeting;
    }
    else {
      greeting = 'Good Evening';
      return greeting;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Medetails"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,10 ,20,10),
              child: Column(
                children: [
                  SizedBox(height:20 ,),
                  Text("${greeting()} ${widget.username} !!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Bold",
                    ),),
              SizedBox(height: 50,),
              Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.medical_information,
                                size: 30,
                                color: Colors.green,),
                              SizedBox(width: 10,),
                              Text("Aspirin",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Dose:",
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                              Text("5mg",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Strength:",
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                              Text("500 mg",
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                  Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.medical_information,
                          size: 30,
                          color: Colors.green,),
                          SizedBox(width: 10,),
                          Text("SomethingElse",
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Dose:",
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                          Text("3mg",
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Strength:",
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                          Text("500 mg",
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
                  SizedBox(height: 60,),

                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut().then((value){
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false).onError((error, stackTrace){
                            Fluttertoast.showToast(msg: "Error${error.toString()}");
                          });
                        });                            },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: Text("Logout",
                        style: TextStyle(
                          fontSize: 18,
                        ),),

                    ),
                  ),
                ],
              ),
            ),
      )      ,

    );
  }
}
