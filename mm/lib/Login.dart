import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ValueListenableBuilder<bool>(
            valueListenable: _dark,
            builder: (context, color, child) {
              return ValueListenableBuilder<double>(
                valueListenable: _widthFactor,
                builder: (context, factor, child) {
                  return Scaffold(
                      backgroundColor:
                          _dark.value ? Colors.black : Colors.white,
                      appBar: AppBar(
                        actions: [
                          Switch(
                            value: _dark.value,
                            onChanged: (value) {
                              _dark.value = value;
                            },
                          ),
                          DropdownButton<double>(
                            value: _widthFactor.value,
                            onChanged: (value) {
                              _widthFactor.value = value!;
                            },
                            items: [
                              DropdownMenuItem<double>(
                                value: 0.5,
                                child: Text('Size: 50%'),
                              ),
                              DropdownMenuItem<double>(
                                value: 0.75,
                                child: Text('Size: 75%'),
                              ),
                              DropdownMenuItem<double>(
                                value: 1.0,
                                child: Text('Size: 100%'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      body: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width *
                            _widthFactor.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LogInEmpty(),
                          ],
                        ),
                      )));
                },
              );
            }));
  }
}

class LogInEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFE97451),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -83,
                top: -94,
                child: Container(
                  width: 556,
                  height: 449,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 177,
                          height: 177,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 94,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF1E1E2E),
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
                left: 0,
                top: 236,
                child: Container(
                  width: 375,
                  height: 579,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 245,
                top: 630,
                child: Text(
                  '회원가입',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF6B6B),
                    fontSize: 14,
                    fontFamily: 'Sen',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 105,
                top: 626,
                child: Text(
                  '계정이 없으신가요?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF646982),
                    fontSize: 16,
                    fontFamily: 'Sen',
                    height: 0.09,
                  ),
                ),
              ),
              Positioned(
                left: 154,
                top: 669,
                child: Container(
                  width: 157,
                  height: 104,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 24,
                        top: 0,
                        child: Text(
                          'Or',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF646982),
                            fontSize: 16,
                            fontFamily: 'Sen',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 95,
                        top: 42,
                        child: Container(
                          width: 62,
                          height: 62,
                          child: Stack(children: [
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 41,
                        child: Container(
                          width: 66.77,
                          height: 62,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 66.77,
                                  height: 62,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFEE500),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 14.72,
                                top: 14.96,
                                child: Container(
                                  width: 37.55,
                                  height: 32.23,
                                  child: Stack(children: [
                                  
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 526,
                child: Container(
                  width: 327,
                  height: 62,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 327,
                          height: 62,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF6B6B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 137,
                        top: 22,
                        child: Text(
                          'LOG IN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Sen',
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 479,
                child: Text(
                  '비밀번호를 잊어버렸어요',
                  style: TextStyle(
                    color: Color(0xFFFF6B6B),
                    fontSize: 14,
                    fontFamily: 'Sen',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 477,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      top: 2,
                      child: Text(
                        '자동 로그인',
                        style: TextStyle(
                          color: Color(0xFF7E8A97),
                          fontSize: 13,
                          fontFamily: 'Sen',
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 24,
                top: 367,
                child: Container(
                  width: 327,
                  height: 86,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 24,
                        child: Container(
                          width: 327,
                          height: 62,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 19,
                                top: 24,
                                child: SizedBox(
                                  width: 142,
                                  height: 14,
                                  child: Text(
                                    '**********',
                                    style: TextStyle(
                                      color: Color(0xFFA0A5BA),
                                      fontSize: 14,
                                      fontFamily: 'Sen',
                                      height: 0,
                                      letterSpacing: 6.72,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Color(0xFF31343D),
                            fontSize: 13,
                            fontFamily: 'Sen',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 288,
                        top: 48,
                        child: Container(
                          width: 19,
                          height: 14,
                          child: Stack(children: [
                          
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 257,
                child: Container(
                  width: 327,
                  height: 86,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 24,
                        child: Container(
                          width: 327,
                          height: 62,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 19,
                                top: 23,
                                child: Text(
                                  'example@gmail.com',
                                  style: TextStyle(
                                    color: Color(0xFFA0A5BA),
                                    fontSize: 14,
                                    fontFamily: 'Sen',
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 3,
                        top: 0,
                        child: Text(
                          '이메일',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF31343D),
                            fontSize: 13,
                            fontFamily: 'Sen',
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 138,
                top: 118,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Sen',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 711,
                child: Container(
                  width: 62,
                  height: 62,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/62/62"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}