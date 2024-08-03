import 'package:flutter/material.dart';
import 'package:mm/Create_Group.dart';
import 'package:mm/Select_Group.dart';

class SelectCreateGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Column 크기를 콘텐츠에 맞춤
              children: [
                SizedBox(height: screenHeight * 0.35), // 상단 여백, 버튼을 페이지 중앙에 위치하도록 조정
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(context, '그룹 가입', Icons.search, SelectGroup()),
                    buildButton(context, '그룹 생성', Icons.add, CreateGroup()),
                  ],
                ),
                SizedBox(height: screenHeight * 0.3), // 버튼 사이 여백
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '지금은 안할래요!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 하단 여백
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, IconData icon, Widget targetPage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: screenWidth * 0.4, // 화면 너비의 40%
        height: screenHeight * 0.2, // 화면 높이의 20%
        decoration: ShapeDecoration(
          color: Color(0xFFFF6B6B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Sen',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
