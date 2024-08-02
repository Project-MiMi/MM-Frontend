import 'package:flutter/material.dart';

class SelectGroup extends StatefulWidget {
  @override
  _SelectGroupState createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> groups = [
    {'title': '한양대 JMT #KR1', 'tags': ['#일식', '#한식'], 'members': '210명'},
    {'title': '고려대 맛집 #KR2', 'tags': ['#양식', '#중식'], 'members': '150명'},
    {'title': '서울대 밥집 #KR3', 'tags': ['#한식', '#분식'], 'members': '300명'},
  ];
  late List<Map<String, dynamic>> filteredGroups;

  @override
  void initState() {
    super.initState();
    filteredGroups = groups;
    _searchController.addListener(_filterGroups);
  }

  void _filterGroups() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      filteredGroups = groups.where((group) {
        return group['title'].contains(query) ||
            group['tags'].any((tag) => tag.contains(query));
      }).toList();
    } else {
      filteredGroups = groups;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                      controller: _searchController,
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
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: filteredGroups
                    .map((group) => Column(
                          children: [
                            buildGroupItem(
                                group['title'], group['tags'], group['members']),
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
