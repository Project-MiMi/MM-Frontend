import 'package:flutter/material.dart';
import 'package:mm/Description1.dart';
import 'package:mm/Forgot_Password.dart';
import 'package:mm/HomePage.dart';
import 'package:mm/Location_Access.dart';
import 'package:mm/Sign_up.dart';
import 'package:mm/log_in_empty.dart';
import 'Description1.dart';

void main() {
  runApp(FlutterApp());
}

class UserSession {
  static final UserSession _singleton = UserSession._internal();

  String? userId;

  factory UserSession() {
    return _singleton;
  }

  UserSession._internal();
}


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
} 

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LocationAccess()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'MAP',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 96,  // 텍스트 크기 조정
                fontFamily: 'Sen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


