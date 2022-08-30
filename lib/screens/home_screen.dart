import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medetail/screens/login_screen.dart';
import 'package:medetail/screens/profile_screen.dart';
import 'package:medetail/screens/video_screen.dart';

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
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 10, 15, 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,70,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.home,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,70,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>VideoScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.video_collection_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,40,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.person,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Medetails"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,10 ,20,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:15,),
                  Text("${greeting()} ${widget.username} !!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Bold",
                    ),),
                   SizedBox(height: 17,),
                   Card(
                elevation: 3,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.medical_services_outlined,
                                size: 30,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Fever",
                                style: TextStyle(
                                  fontSize: 22,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.syringe,
                                size: 23,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Dolo 650",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.fileMedical,
                                size: 22,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("This has to be taken with warm water",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  Text("Can be used 4 times a day if the temp",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  Text(" is not stabilized",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),)
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                   SizedBox(height: 10,),
                    Card(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.medical_services_outlined,
                                size: 30,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Nausea/Vomtings",
                                style: TextStyle(
                                  fontSize: 22,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.syringe,
                                size: 23,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Vomikind",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.fileMedical,
                                size: 22,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("This has to be taken with warm water",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  Text("Can be used 2 times a day",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.medical_services_outlined,
                                size: 30,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Bodypains",
                                style: TextStyle(
                                  fontSize: 22,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.syringe,
                                size: 23,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Zerodol-p",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.fileMedical,
                                size: 22,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pain relieving medicine",
                              style: TextStyle(
                                fontSize: 18,
                              ),),
                              Text("Can be used 3 times a day",
                              style: TextStyle(
                                fontSize: 18,
                              ),),
                            ],
                          )
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.medical_services_outlined,
                                size: 30,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Headache",
                                style: TextStyle(
                                  fontSize: 22,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.syringe,
                                size: 23,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("Saridon",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.fileMedical,
                                size: 22,
                                color: Colors.red,),
                              SizedBox(width: 10,),
                              Text("This is Dolo 650",
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      )      ,

    );
  }
}
