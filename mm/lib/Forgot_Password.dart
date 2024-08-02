import 'package:flutter/material.dart';

<<<<<<< HEAD
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면의 너비와 높이를 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFE97451),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: screenHeight * 0.29,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.71,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.064,
                  top: screenHeight * 0.887,
                  child: Container(
                    width: screenWidth * 0.872,
                    height: screenHeight * 0.076,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: screenWidth * 0.872,
                            height: screenHeight * 0.076,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFF6B6B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.38,
                          top: screenHeight * 0.0277,
                          child: Text(
                            'NEXT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.037,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.064,
                  top: screenHeight * 0.316,
                  child: Container(
                    width: screenWidth * 0.872,
                    height: screenHeight * 0.106,
                    child: Stack(
                      children: [
                        // 배경색 설정
                        Positioned(
                          left: 0,
                          top: screenHeight * 0.0295,
                          child: Container(
                            width: screenWidth * 0.872,
                            height: screenHeight * 0.076,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0), // 연한 회색
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.048,
                                  vertical: screenHeight * 0.018),
                              child: Text(
                                'example@gmail.com',
                                style: TextStyle(
                                  color: Color(0xFF32343E),
                                  fontSize: screenWidth * 0.037,
                                  fontFamily: 'Sen',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.008,
                          top: 0,
                          child: Text(
                            '이메일',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF31343D),
                              fontSize: screenWidth * 0.035,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.175,
                  top: screenHeight * 0.145,
                  child: Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ),
                Positioned(
                  left: -screenWidth * 0.22,
                  top: -screenHeight * 0.115,
                  child: Container(
                    width: screenWidth * 1.472,
                    height: screenHeight * 0.553,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Opacity(
                            opacity: 0.05,
                            child: Container(
                              width: screenWidth * 0.472,
                              height: screenWidth * 0.472,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: screenWidth * 0.25,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.064,
                  top: screenHeight * 0.062,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                         Icons.arrow_back,
                          color: Color(0xFFE97451),
                      ),
                      width: screenWidth * 0.12,
                      height: screenWidth * 0.12,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
              ],
=======
void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ForgotPassword(),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE97451),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 630,
            child: Container(
              width: 327,
              height: 62,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 327,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6B6B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 144,
                    top: 22.50,
                    child: Text(
                      'NEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Sen',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 230,
            child: Container(
              width: 327,
              height: 62,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 120,
            top: 70,
            child: Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Sen',
              ),
            ),
          ),
          Positioned(
            left: -83,
            top: -94,
            child: Container(
              width: 552,
              height: 449,
              child: Opacity(
                opacity: 0.05,
                child: Container(
                  width: 177,
                  height: 177,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 94,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 45,
              ),
>>>>>>> 386f31e1dc575a47501739395385d7dd8b596bb1
            ),
          ),
        ],
      ),
    );
  }
}