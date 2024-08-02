import 'package:flutter/material.dart';
import 'Creation_Complete.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CreateGroup(),
      ),
    );
  }
}

class CreateGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // 상단 여유 공간 조정
              Text(
                '• 그룹명',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Sen',
                  letterSpacing: -0.33,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 62,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey), // 테두리 추가
                ),
                child: Row(
                  children: [
                    Icon(Icons.group, color: Color(0xFF676767)),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '그룹명을 입력하세요!',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 14,
                            fontFamily: 'Sen',
                            letterSpacing: -0.33,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150), // 입력 필드 간 여유 공간 조정
              Text(
                '• 그룹 태그',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Sen',
                  letterSpacing: -0.33,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 62,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey), // 테두리 추가
                ),
                child: Row(
                  children: [
                    Icon(Icons.tag, color: Color(0xFF676767)),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '그룹 태그를 입력하세요!',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 14,
                            fontFamily: 'Sen',
                            letterSpacing: -0.33,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200), // 하단 여유 공간 조정
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '이전',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => Creation_Complete(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
