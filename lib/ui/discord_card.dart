import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscordCard extends StatefulWidget {
  const DiscordCard({super.key});

  @override
  State<DiscordCard> createState() => _DiscordCardState();
}

class _DiscordCardState extends State<DiscordCard> {
  bool isMoved = false;
  double? max;
  double? position = 0.0;
  bool isFinish = true;

  @override
  void initState() {
    // TODO: implement initState
    max = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width -
        40;
    position = max;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GestureDetector(
      onPanUpdate: (details) {
        print(details.delta.dx);
        setState(() {
          isMoved = true;
          isFinish = false;
          if (details.delta.dx < 0) {
            position = position! - 1.5;
          } else {
            if (position! < max!) position = position! + 1.5;
          }
        });
      },
      onPanEnd: (details) {
        print("end");
        setState(() {
          isMoved = false;
          if (position! < (max! / 2)) {
            position = 0.0;
          } else {
            position = max;
          }
        });
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFF5F4F4),
                          ),
                          child: Text("OS"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Group Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.more_horiz)
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xFF6D6D6D),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_add_alt_1,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Container(
                                  child: Text(
                                    "Invite",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF8A8A8A),
                                  ),
                                  Container(
                                    child: Text(
                                      "TEXT CHANNELS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color(0xFF8A8A8A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: List.generate(
                                  2,
                                  (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          "#",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                            color: Color(0xFF8A8A8A),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          child: Text(
                                            "general",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: Color(0xFF8A8A8A),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF8A8A8A),
                                  ),
                                  Container(
                                    child: Text(
                                      "VOICE CHANNELS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color(0xFF8A8A8A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: List.generate(
                                  2,
                                  (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.volume_up,
                                          color: Color(0xFF8A8A8A),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          child: Text(
                                            "General",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: Color(0xFF8A8A8A),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
              top: 0,
              left: position,
              child: widgetChat(),
              onEnd: () {
                setState(() {
                  isFinish = true;
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: Offstage(
          offstage: isMoved || position == 0,
          child: BottomNavigationBar(
            unselectedItemColor: Color(0xFF8A8A8A),
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
            ],
            onTap: (int index) {},
            currentIndex: 0,
          ),
        ),
      ),
    );
  }

  Widget widgetChat() {
    return Opacity(
      opacity: isMoved || position == 0
          ? 1
          : (isFinish && position == max)
              ? 0.6
              : 1,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: isMoved ? 80 : 50),
        margin: EdgeInsets.only(top: isMoved ? 0 : 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isMoved ? 0 : 8),
          color: Colors.white,
          boxShadow: isMoved
              ? [
                  BoxShadow(
                    color: Color(0xFF5C5C5C).withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: List.generate(10, (index) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://picsum.photos/1080/1920?random=${index + 10}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text(
                    "message",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF5E5E5E),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
