import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mm/main.dart';


class SelectGroup extends StatefulWidget {
  @override
  _SelectGroupState createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  List<Map<String, dynamic>> groups = [];
  late List<Map<String, dynamic>> filteredGroups;

  @override
  void initState() {
    super.initState();
    _fetchGroups(); // Fetch groups from the API
  }

  Future<void> _fetchGroups() async {
    try {
      final response = await http.get(
        Uri.parse('https://mimap.vercel.app/api/group'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('Request URL: https://mimap.vercel.app/api/group');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        print('Decoded JSON: $data');

        setState(() {
          groups = data.map<Map<String, dynamic>>((item) {
            return {
              'group_id': item['group_id'],
              'title': item['name'],
              'tags': List<String>.from(item['tags']),
              'members': '${item['population']}명',
            };
          }).toList();
          filteredGroups = groups;
        });
      } else {
        throw Exception('Failed to load groups');
      }
    } catch (e) {
      print('Error fetching groups: $e');
    }
  }

  Future<void> _joinGroup(int groupId) async {
    try {
      final response = await http.post(
        Uri.parse('https://mimap.vercel.app/api/group/enter'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'group_id': groupId,
          'user_id': UserSession().userId,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Creation_Complete()),
        );
      } else {
        throw Exception('Failed to join group');
      }
    } catch (e) {
      print('Error joining group: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('그룹 가입에 실패했습니다. 다시 시도해주세요.')),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 62,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF676767)),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '그룹 이름을 검색하세요!',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 14,
                          fontFamily: 'Sen',
                          letterSpacing: -0.33,
                        ),
                      ),
                      enabled: false, // 검색 기능 비활성화
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: groups
                    .map((group) => Column(
                          children: [
                            GestureDetector(
                              onTap: () => _joinGroup(group['group_id']),
                              child: buildGroupItem(
                                group['title'], 
                                group['tags'], 
                                group['members']
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
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
    );
  }

  Widget buildGroupItem(String title, List<String> tags, String members) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Sen',
                    letterSpacing: -0.33,
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: tags
                      .map((tag) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Sen',
                                letterSpacing: -0.33,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Text(
            members,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Sen',
              letterSpacing: -0.33,
            ),
          ),
        ],
      ),
    );
  }
}

class Creation_Complete extends StatelessWidget {
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
                        Navigator.pop(context);
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
