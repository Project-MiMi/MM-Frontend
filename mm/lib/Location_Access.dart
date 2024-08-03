import 'package:flutter/material.dart';
import 'Description1.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: Scaffold(
        body: Center(
          child: LocationAccess(),
        ),
      ),
    );
  }
}

class LocationAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5), // Adjust this value to move the background up
              child: Container(
                width: 206,
                height: 250,
                decoration: ShapeDecoration(
                  color: Color(0xFFFF8F8F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.4), // Adjust this value to move the image up
              child: Container(
                width: 130,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/location.png'), // 로컬 이미지 사용
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 480,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Description1()),
                  );
                },
                child: Container(
                  width: 327,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF8F8F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '위치 정보를 허용하시겠습니까?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ],
                    ),
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

