import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medetail/screens/home_screen.dart';
import 'package:medetail/screens/mobile_login.dart';
import 'package:medetail/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool ishidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SafeArea(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 60, 50,2),
                    child: Image.asset("images/logo.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Text("Welcome back!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontFamily:"Brand Bold" ,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(30,5,30,10),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        SizedBox(
                          width: 350,
                          height: 55,
                          child: TextField(
                            controller: emailTextEditingController,
                            keyboardType:TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize:17.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: 350,
                          height: 55,
                          child: TextField(
                            controller: passwordTextEditingController,
                            obscureText: ishidden,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                              suffixIcon: InkWell(
                                onTap: unhidetext,
                                child: Icon(Icons.visibility),
                              ),
                              prefixIcon: Icon(Icons.vpn_key_sharp,
                                color: Colors.grey,
                              ),

                            ),
                            style: TextStyle(
                              fontSize:17.0,
                            ),

                          ),
                        ),
                        SizedBox(height: 25,),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: (){
                              FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).then((value){
                                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> HomeScreen(username: emailTextEditingController.text,)), (route) => false).onError((error, stackTrace){
                                  Fluttertoast.showToast(msg: "Error${error.toString()}");
                                });
                              });                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Text("Login",
                              style: TextStyle(
                                fontSize: 18,
                              ),),

                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:16 ,
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>RegisterScreen()));
                              } ,
                              child:Text("Register",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),),
                            ),
                          ],
                        ),
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                  )
                              ),
                            SizedBox(width: 10,),
                              Text("Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),),
                              SizedBox(width: 10,),
                              Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                  )
                              ),
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign In with Mobile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:16 ,
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MobileLoginScreen()));

                              } ,
                              child:Text("Sign in",
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
  void unhidetext() {

    setState(() {
      ishidden=!ishidden;
    });
  }
}
