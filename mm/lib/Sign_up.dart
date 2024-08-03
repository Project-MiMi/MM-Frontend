import 'package:flutter/material.dart';
import 'package:mm/Group_Action.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final String url = 'https://mimap.vercel.app/api/user/register'; // API 엔드포인트

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'pw': password,
        'nickname': username,
      }),
    );

    if (response.statusCode == 200) {
      // 서버로부터 성공적인 응답을 받았을 때
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectCreateGroup()),
      );
    } else {
      // 오류 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up Failed: ${response.reasonPhrase}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
              top: screenHeight * 0.287,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.713,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02), // 화면 상단 여백 조정
                        _buildInputField(
                          context,
                          label: '이름',
                          hintText: '김민재',
                          controller: _nameController,
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '이메일',
                          hintText: 'example@gmail.com',
                          controller: _emailController,
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '아이디',
                          hintText: 'decamilo',
                          controller: _usernameController,
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '비밀번호',
                          hintText: '**********',
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: screenHeight * 0.04), // 버튼 위 여백 증가
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _signUp(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF6B6B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              minimumSize: Size(screenWidth * 0.872, 0),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: screenWidth * 0.037,
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.08), // 버튼 아래 추가 여백
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.11,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFE97451),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * -0.221,
              top: screenHeight * -0.116,
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
                          height: screenHeight * 0.217,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 94,
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
              top: screenHeight * 0.061,
              child: Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40, // 위쪽 여백 조정
              left: 10, // 왼쪽 여백 조정
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // 이전 페이지로 돌아가기
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required String hintText,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF31343D),
            fontSize: screenWidth * 0.035,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8), // 라벨과 입력 필드 사이의 간격
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey, // 힌트 텍스트를 흰색 반투명으로 설정
            ),
            filled: true,
            fillColor: Color(0xFFF0F0F0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        SizedBox(height: 25), // 입력 필드와 다음 항목 사이의 간격
      ],
    );
  }
}
