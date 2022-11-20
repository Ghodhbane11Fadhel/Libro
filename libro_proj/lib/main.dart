import 'package:flutter/material.dart';
import 'package:libro_proj/views/loginscreen.dart';
import 'package:libro_proj/views/home.dart';
import 'package:libro_proj/views/profile.dart';
import 'package:libro_proj/views/signup.dart';

main() => runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute : LoginScreen.id,
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        Home.id: (context)=>Home(context),
        create_account.id: (context)=>create_account()
      },
      
    );
  }
}
  
