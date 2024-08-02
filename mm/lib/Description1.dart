import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Description1(),
        ),
      ),
    );
  }
}

class Description1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면의 전체 높이와 너비를 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.14),  // 위쪽 간격 (14% 높이)
          Container(
            width: screenWidth * 0.6,  // 화면 너비의 60%
            height: screenHeight * 0.3,  // 화면 높이의 30%
            decoration: BoxDecoration(
              color: Color(0xFF98A8B8),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),  // 이미지와 텍스트 사이의 간격 (10% 높이)
          Text(
            '맛집 그룹에 참여해보세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF31343D),
              fontSize: 24,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 16),
          Text(
            '다른 사람들이 좋아하는 맛집도 찾아가보세요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF646982),
              fontSize: 16,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: screenHeight * 0.04),  // 점과 텍스트 사이의 간격 (4% 높이)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6B6B),  // 왼쪽 점에 색상 적용
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0CD),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0CD),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04),  // 버튼과 점 사이의 간격 (4% 높이)
          GestureDetector(
            onTap: () {
              // 다음 페이지로 이동하는 코드
            },
            child: Container(
              width: screenWidth * 0.9,  // 화면 너비의 90%
              height: screenHeight * 0.08,  // 화면 높이의 8%
              decoration: BoxDecoration(
                color: Color(0xFFFF6B6B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '다음',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Sen',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),  // 아래쪽 간격
          Text(
            'Skip',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF646982),
              fontSize: 16,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 20),  // 아래쪽 간격
        ],
      ),
    );
  }
}
