import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  List<Widget> listPage = [
    Container(
      color: Colors.amber,
      child: Center(
        child: Text("Home"),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text("Search"),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text("Chat"),
      ),
    ),
    Container(
      color: Colors.yellow,
      child: Center(
        child: Text("Profile"),
      ),
    ),
  ];
  PageController pageController = PageController();
  final PageStorageBucket bucket = PageStorageBucket();
  bool isNavbarClosed = false;

  onPageChanged(index) {
    setState(() {
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isNavbarClosed = true;
                });
              },
              child: PageStorage(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  children: listPage,
                  controller: pageController,
                  onPageChanged: onPageChanged,
                ),
                bucket: bucket,
              ),
            ),
            AnimatedPositioned(
              right: !isNavbarClosed ? -50 : 0,
              bottom: 150,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isNavbarClosed = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              right: isNavbarClosed ? -52 : 0,
              bottom: 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onPageChanged(0);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.home,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(1);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.search,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(2);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.chat,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onPageChanged(3);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.person,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
