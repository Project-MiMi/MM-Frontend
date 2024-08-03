import 'package:flutter/material.dart';
import 'log_in_empty.dart'; // Import the LogInEmpty page

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Description3(),
        ),
      ),
    );
  }
}

class Description3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: screenHeight * 0.14), // 위쪽 간격 (14% 높이)
          Container(
            width: screenWidth * 0.6, // 화면 너비의 60%
            height: screenHeight * 0.3, // 화면 높이의 30%
            decoration: BoxDecoration(
              color: Color(0xFF98A8B8),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: screenHeight * 0.1), // 이미지와 텍스트 사이의 간격 (10% 높이)
          Text(
            '맛집 추천을 받아보세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF31343D),
              fontSize: 24,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 16),
          Text(
            '검색량이 많은 추천 맛집을 볼 수 있어요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF646982),
              fontSize: 16,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: screenHeight * 0.04), // 점과 텍스트 사이의 간격 (4% 높이)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0CD), // 왼쪽 점에 색상 적용
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
                  color: Color(0xFFFF6B6B),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04), // 버튼과 점 사이의 간격 (4% 높이)
          ElevatedButton(
            onPressed: () {
              // 다음 페이지로 이동하는 코드
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInEmpty()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF6B6B), // 배경 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(screenWidth * 0.9, screenHeight * 0.08), // 버튼 크기
            ),
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
          SizedBox(height: 20), // 아래쪽 간격
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInEmpty()),
              );
            },
            child: Text(
              'Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF646982),
                fontSize: 16,
                fontFamily: 'Sen',
              ),
            ),
          ),
          SizedBox(height: 20), // 아래쪽 간격
        ],
      ),
    );
  }
}
