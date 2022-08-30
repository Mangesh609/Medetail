import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medetail/screens/login_screen.dart';
import 'package:medetail/screens/video_screen.dart';

import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  String username="";
   ProfileScreen({required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            child: InkWell(child: Icon(Icons.logout_outlined),
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>LoginScreen()), (route) => false);
            },
            ),
          ),
        ],
        backgroundColor: Colors.green,
        title: Text("Medetails"),
        centerTitle: true,
      ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(135, 30, 40, 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.webp",),
              radius:70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
            child: Divider(
              thickness: 2,color: Colors.grey,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(FontAwesomeIcons.user,
                      color: Colors.white54,),
                      SizedBox(width: 20,),
                      Text("Mangesh",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 22,
                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.mail_outlined,
                        color: Colors.yellow,),
                      SizedBox(width: 20,),
                      Text("rohithmangesh@gmail.com",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 22,
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.phone,
                        color: Colors.green,),
                      SizedBox(width: 20,),
                      Text("+91-8309751446",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 22,
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.location_on,
                        color: Colors.red,),
                      SizedBox(width: 20,),
                      Text("Kottayam,Kerala",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 22,
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(FontAwesomeIcons.bookMedical,
                        color: Colors.white,),
                      SizedBox(width: 20,),
                      Text("Asthma",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 22,
                        ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
