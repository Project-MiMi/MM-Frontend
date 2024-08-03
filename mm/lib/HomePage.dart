import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedTag = 'All';
  bool showGroups = false;
  String selectedGroup = '한양대#KR1';
  List<String> groups = [
    '한양대#KR1',
    '서울대#KR1',
    '고려대#KR1',
    '연세대#KR1',
    '성균관대#KR1'
  ];

  @override
  Widget build(BuildContext context) {
    // 화면의 너비와 높이 가져오기
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 24,
                        top: screenHeight * 0.08,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  selectedGroup,
                                  style: TextStyle(
                                    color: Color(0xFFFF8F8F),
                                    fontSize: 15,
                                    fontFamily: 'Sen',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    showGroups ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                    color: Color(0xFFFF8F8F),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showGroups = !showGroups;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: screenHeight * 0.18,
                        child: Text(
                          'Hey Decamilo, 밥 뭇나',
                          style: TextStyle(
                            color: Color(0xFF1E1D1D),
                            fontSize: 16,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: screenHeight * 0.23,
                        child: Container(
                          width: screenWidth - 48,
                          height: 62,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '식당 검색',
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Color(0xFFF0F0F0), // 연한 회색
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: screenHeight * 0.32,
                        child: Container(
                          width: screenWidth - 48,
                          height: 104,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Tags',
                                style: TextStyle(
                                  color: Color(0xFF31343D),
                                  fontSize: 20,
                                  fontFamily: 'Sen',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildTagButton('All', Color(0xFFFFD27C)),
                                    _buildTagButton('한식', Colors.white),
                                    _buildTagButton('중식', Colors.white),
                                    _buildTagButton('Pizza', Colors.white),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: screenHeight * 0.45,
                        child: Container(
                          width: screenWidth - 48,
                          height: screenHeight * 0.45, // Adjusted height to allow scrolling
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _buildRestaurantButton('기연각', '용답동에 위치한 레전드 중식집', '4.7', 'Free', '20 min'),
                                _buildRestaurantButton('도네누', 'Burger - Chicken - Riche - Wings', '4.7', 'Free', '20 min'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showGroups)
              Positioned(
                left: 24,
                top: screenHeight * 0.12,
                child: Container(
                  width: screenWidth - 48,
                  color: Color(0xFFF0F0F0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groups
                        .where((group) => group != selectedGroup)
                        .map((group) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGroup = group;
                                  showGroups = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                child: Text(
                                  group,
                                  style: TextStyle(
                                    color: Color(0xFF676767),
                                    fontSize: 15,
                                    fontFamily: 'Sen',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagButton(String label, Color backgroundColor) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          selectedTag = label;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(right: 10, top: selectedTag == label ? 1 : 0),
        width: 120,
        height: 50,
        decoration: ShapeDecoration(
          color: selectedTag == label ? Color(0xFFFFD27C) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x2696969A),
              blurRadius: 30,
              offset: Offset(12, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 8),
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: Color(0xFFFF6B6B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Color(0xFF32343E),
                fontSize: 14,
                fontFamily: 'Sen',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantButton(String name, String description, String rating, String delivery, String time) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          selectedTag = name;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(bottom: 10, top: selectedTag == name ? 1 : 0),
        width: double.infinity,
        height: 225,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x2696969A),
              blurRadius: 30,
              offset: Offset(12, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 137,
              decoration: ShapeDecoration(
                color: Color(0xFFC4C4C4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 20,
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: TextStyle(
                  color: Color(0xFFA0A5BA),
                  fontSize: 14,
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: StarBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFFF7621),
                        ),
                        points: 5,
                        innerRadiusRatio: 0.38,
                        pointRounding: 0.20,
                        valleyRounding: 0,
                        rotation: 0,
                        squash: 0,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    rating,
                    style: TextStyle(
                      color: Color(0xFF181C2E),
                      fontSize: 16,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      delivery,
                      style: TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 14,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Color(0xFF181C2E),
                        fontSize: 14,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
