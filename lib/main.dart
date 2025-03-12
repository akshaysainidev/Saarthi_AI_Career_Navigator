
import 'package:career_guidance_project/dashBoard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'myFont',primaryColor: Colors.black),
        home: DashBoardPage(),
      )
    );
    
  }
}

