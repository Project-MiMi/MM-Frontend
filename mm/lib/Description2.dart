import 'package:flutter/material.dart';
import 'Description3.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Description2(),
        ),
      ),
    );
  }
}

class Description2 extends StatelessWidget {
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
            '나만의 맛집을 소개해보세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF31343D),
              fontSize: 24,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 16),
          Text(
            '그룹에서 나의 맛집을 공유할 수 있고, 나만의 맛집 지도도 만들 수 있어요!',
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
                  color: Color(0xFFFFE0CD),  // 왼쪽 점에 색상 적용
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Description3()),
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
