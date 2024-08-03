import 'package:flutter/material.dart';
import 'package:mm/Group_Action.dart';

class SignUp extends StatelessWidget {
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
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '이메일',
                          hintText: 'example@gmail.com',
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '아이디',
                          hintText: 'decamilo',
                        ),
                        SizedBox(height: 1),
                        _buildInputField(
                          context,
                          label: '비밀번호',
                          hintText: '**********',
                          obscureText: true,
                        ),
                        SizedBox(height: screenHeight * 0.04), // 버튼 위 여백 증가
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // 'Group Action' 페이지로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectCreateGroup(),
                                ),
                              );
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
