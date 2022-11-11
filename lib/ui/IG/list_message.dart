import 'dart:ui';

import 'package:all_is_here/ui/IG/room_message.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ListMessage extends StatefulWidget {
  final String? your_username;
  final String? your_nickname;
  const ListMessage({required this.your_username, required this.your_nickname});

  @override
  State<ListMessage> createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  var listVerifiedUser = [
    {
      "pp":
          "https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/278931269_360124899498969_9006978846103417088_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=-quMid8tBbkAX_36HPS&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfCw3DZHoIxExag6s7ZH6CQkzWfTx-ebOQ8jGAsARa4BlQ&oe=637238CE&_nc_sid=6136e7",
      "username": "cristiano",
      "fullname": "Cristiano Ronaldo",
      "active": "5m ago"
    },
    {
      "pp":
          "https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/11850309_1674349799447611_206178162_a.jpg?_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=4b88yHx8jmIAX88Wokp&tn=eX0W6qLFRm6vA8Fr&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfBD16M7P4eheHr-hDQhaW_b4m12TCCa-GZsB_7-83ew1g&oe=63719D04&_nc_sid=6136e7",
      "username": "therock",
      "fullname": "Dwayne Johnson",
      "active": "1h ago"
    },
    {
      "pp":
          "https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/14515783_1158525867560668_3834942711954145280_a.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=pI4zdxpGJkYAX_GQz2P&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfAXSNH-jAIgzcQpolIqJumbndE2kTbs7qG3whNbjd23wA&oe=6370EC90&_nc_sid=6136e7",
      "username": "kevinhart4real",
      "fullname": "Kevin Hart",
      "active": "30m ago"
    },
    {
      "pp":
          "https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/43818140_2116018831763532_3803033961098117120_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=tkDauOvIQvAAX_OqQnB&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfC-QzrxZ6xXYknFacQ3JZkGHX0QISG_BjsYA7Zc1KkujQ&oe=6371CE72&_nc_sid=6136e7",
      "username": "leomessi",
      "fullname": "Leo Messi",
      "active": "30m ago"
    },
    {
      "pp":
          "https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/309389000_622280552701486_6245892394891926482_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=ncAfqTCB3cYAX8fLqNO&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfCZ-sc_Sc9KGm7XABYlaAuZLeosFDEPhtAplllj3mym6A&oe=63712B0F&_nc_sid=6136e7",
      "username": "kendalljenner",
      "fullname": "Kendall",
      "active": "30m ago"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              widget.your_username!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            UniconsLine.edit,
            size: 24,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffefefef),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Color(0xff9c9c9c),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff9c9c9c),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Primary",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "General",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFbebebe),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Requests",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFbebebe),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listVerifiedUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomMessage(
                              username:
                                  listVerifiedUser.elementAt(index)['username'],
                              pp: listVerifiedUser.elementAt(index)['pp'],
                              your_name: widget.your_nickname,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xfff1cf6f),
                                    Color(0xffed781c),
                                    Color(0xffcb2770),
                                    Color(0xff8e2db5),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    listVerifiedUser.elementAt(index)['pp']!,
                                  ),
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  listVerifiedUser
                                      .elementAt(index)['fullname']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.network(
                                  "https://static.xx.fbcdn.net/assets/?revision=4055886111304140&name=ig-verifiedbadge-shared&density=1",
                                  width: 16,
                                )
                              ],
                            ),
                            subtitle: Text(
                              "Active " +
                                  listVerifiedUser.elementAt(index)['active']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF797878),
                              ),
                            ),
                            trailing: Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF797878),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
