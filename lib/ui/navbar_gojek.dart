import 'package:flutter/material.dart';

class NavbarGojek extends StatefulWidget {
  const NavbarGojek({super.key});

  @override
  State<NavbarGojek> createState() => _NavbarGojekState();
}

class _NavbarGojekState extends State<NavbarGojek> {
  int selectedIndex = 0;
  double? posX = -1;
  int minusWidth = 0;
  bool isShow = true;
  int countIndex = 4;

  movePage(index) {
    if (selectedIndex != index) {
      print(index);
      setState(() {
        isShow = false;
        minusWidth = 0;
        selectedIndex = index;
        posX = (-1 + (index * (2 / (countIndex - 1)))).toDouble();
        // posX = -0.5;
      });
      print(posX);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          "https://picsum.photos/1920/1920?random=${selectedIndex}",
          fit: BoxFit.cover,
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDBDBDB),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              alignment: Alignment(posX!, -1),
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
              child: Column(
                children: [
                  AnimatedContainer(
                    width: MediaQuery.of(context).size.width / countIndex -
                        minusWidth,
                    alignment: Alignment(posX!, -1),
                    duration: Duration(milliseconds: 200),
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      color: Color(0xff00880d),
                    ),
                  ),
                  Visibility(
                    visible: isShow,
                    child: Container(
                      width: MediaQuery.of(context).size.width / countIndex -
                          minusWidth,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff00880d).withOpacity(0.1),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onEnd: () {
                Future.delayed(Duration(milliseconds: 200), () {
                  setState(() {
                    isShow = true;
                    minusWidth = 10;
                  });
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      movePage(0);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.home,
                        color: selectedIndex == 0 ? Color(0xff00880d) : null,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      movePage(1);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.explore,
                        color: selectedIndex == 1 ? Color(0xff00880d) : null,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      movePage(2);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.message,
                        color: selectedIndex == 2 ? Color(0xff00880d) : null,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      movePage(3);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.email,
                        color: selectedIndex == 3 ? Color(0xff00880d) : null,
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: GestureDetector(
                //     onTap: () {
                //       movePage(4);
                //     },
                //     child: Container(
                //       color: Colors.transparent,
                //       child: Icon(
                //         Icons.email,
                //         color: selectedIndex == 4 ? Color(0xff00880d) : null,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
