import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medetail/screens/login_screen.dart';
import 'package:medetail/screens/mobile_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medetail/screens/register_screen.dart';
import 'package:http/http.dart'as http;
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Medetails",
      initialRoute: '/',
   routes: {
     '/':(context)=> RegisterScreen(),

   },
    );
  }
}

