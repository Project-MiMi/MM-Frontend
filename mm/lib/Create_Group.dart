import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Creation_Complete.dart';
import 'package:mm/main.dart';

class CreateGroup extends StatelessWidget {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupTagController = TextEditingController();

  Future<void> _createGroup(BuildContext context) async {
    String groupName = _groupNameController.text;
    String groupTag = _groupTagController.text;
    String userId = UserSession().userId ?? '';
    String group = groupName+"#"+groupTag;

    final response = await http.post(
      Uri.parse('https://mimap.vercel.app/api/group/establish'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': userId,
        'group_name': group,
        'tags': [],
      }),
    );

    if (response.statusCode == 200) {
      // 그룹 생성 성공 시 다음 페이지로 이동
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
    } else {
      // 그룹 생성 실패 시 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('그룹 생성 실패. 다시 시도해주세요.')),
      );
    }
  }

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
                        controller: _groupNameController,
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
                        controller: _groupTagController,
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
                  _createGroup(context);
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
