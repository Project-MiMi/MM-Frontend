import 'package:flutter/material.dart';
import 'package:mm/Show_Group.dart';  // ShowGroup 클래스를 import 합니다.
import 'package:mm/log_in_empty.dart';

class SelectionComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250, // 이미지 크기 조정
                      height: 250, // 이미지 크기 조정
                      child: Image.asset('images/starwithcheck.png'),
                    ),
                    SizedBox(height: 20), // 간격 조정
                    Text(
                      '그룹 가입이 완료되었습니다!',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 22,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 20), // 간격 조정
                    ElevatedButton(
                      onPressed: () {
                        print('pushed');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ShowGroup()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        '확인',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Sen',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
