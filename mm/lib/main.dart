import 'package:flutter/material.dart';
import 'package:mm/Description1.dart';
<<<<<<< HEAD
import 'package:mm/Forgot_Password.dart';
import 'package:mm/Sign_up.dart';
import 'package:mm/log_in_empty.dart';
import 'Description1.dart';
=======
>>>>>>> 386f31e1dc575a47501739395385d7dd8b596bb1

void main() {
  runApp(FlutterApp());
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
<<<<<<< HEAD
        MaterialPageRoute(builder: (context) => LogInEmpty()),
=======
        MaterialPageRoute(builder: (context) => Description1()),
>>>>>>> 386f31e1dc575a47501739395385d7dd8b596bb1
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

