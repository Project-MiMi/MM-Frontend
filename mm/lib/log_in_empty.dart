import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mm/Forgot_Password.dart'; // ForgotPasswordPage 클래스를 import 합니다.
import 'package:mm/Sign_up.dart'; // SignUp 페이지를 import 합니다.
import 'package:mm/Group_Action.dart';
import 'package:mm/main.dart';

class LogInEmpty extends StatefulWidget {
  @override
  _LogInEmptyState createState() => _LogInEmptyState();
}

class _LogInEmptyState extends State<LogInEmpty> {
  bool _isAutoLoginChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('https://mimap.vercel.app/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'pw': _passwordController.text,
      }),
    );
    
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final userId = responseData['userId'];
      UserSession().userId = userId;
      // 로그인 성공
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectCreateGroup()),
      );
    } else {
      // 로그인 실패
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패. 다시 시도해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -screenWidth * 0.22,
                  top: -screenHeight * 0.11,
                  child: Container(
                    width: screenWidth * 1.48,
                    height: screenHeight * 0.55,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: screenWidth * 0.47,
                            height: screenWidth * 0.47,
                            decoration: ShapeDecoration(
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: screenWidth * 0.25,
                                  color: Color(0xFF1E1E2E),
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
                  left: screenWidth * 0.17,
                  top: screenHeight * 0.77,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '계정이 없으신가요?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF646982),
                            fontSize: screenWidth * 0.042,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(
                            '회원가입',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFF6B6B),
                              fontSize: screenWidth * 0.042,
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
                  left: screenWidth * 0.17,
                  top: screenHeight * 0.82,
                  child: Container(
                    width: screenWidth * 0.66,
                    height: screenHeight * 0.13,
                    child: Stack(
                      children: [
                        Positioned(
                          left: screenWidth * 0.31,
                          top: 0,
                          child: Text(
                            'Or',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF646982),
                              fontSize: screenWidth * 0.042,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.48,
                          top: screenHeight * 0.052,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenWidth * 0.16,
                            child: Stack(),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.24,
                          top: screenHeight * 0.051,
                          child: Container(
                            width: screenWidth * 0.18,
                            height: screenWidth * 0.16,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: screenWidth * 0.18,
                                    height: screenWidth * 0.16,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFEE500),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: screenWidth * 0.04,
                                  top: screenHeight * 0.018,
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    height: screenHeight * 0.04,
                                    child: Stack(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: screenHeight * 0.052,
                          child: Container(
                            width: screenWidth * 0.16,
                            height: screenWidth * 0.16,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://via.placeholder.com/62x62"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.06,
                  top: screenHeight * 0.65,
                  child: GestureDetector(
                    onTap: _login,
                    child: Container(
                      width: screenWidth * 0.87,
                      height: screenHeight * 0.08,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF6B6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'LOG IN',
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
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.53,
                  top: screenHeight * 0.57,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      '비밀번호를 잊어버렸어요',
                      style: TextStyle(
                        color: Color(0xFFFF6B6B),
                        fontSize: screenWidth * 0.037,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.02,
                  top: screenHeight * 0.55,
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isAutoLoginChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isAutoLoginChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        '자동 로그인',
                        style: TextStyle(
                          color: Color(0xFF7E8A97),
                          fontSize: screenWidth * 0.035,
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.06,
                  top: screenHeight * 0.45,
                  child: Container(
                    width: screenWidth * 0.87,
                    height: screenHeight * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Color(0xFF31343D),
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFCBD1D9)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015,
                                horizontal: screenWidth * 0.03,
                              ),
                              hintText: '**********',
                              hintStyle: TextStyle(
                                color: Color(0xFFA0A5BA),
                                fontSize: screenWidth * 0.037,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: 6.72,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.06,
                  top: screenHeight * 0.34,
                  child: Container(
                    width: screenWidth * 0.87,
                    height: screenHeight * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이메일',
                          style: TextStyle(
                            color: Color(0xFF31343D),
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFCBD1D9)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015,
                                horizontal: screenWidth * 0.03,
                              ),
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(
                                color: Color(0xFFA0A5BA),
                                fontSize: screenWidth * 0.037,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.37,
                  top: screenHeight * 0.15,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
