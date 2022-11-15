import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Gojek extends StatefulWidget {
  const Gojek({super.key});

  @override
  State<Gojek> createState() => _GojekState();
}

class _GojekState extends State<Gojek> {
  int index = 0;
  double focusPos = -1;
  List<Widget> lisWidget = [
    Column(
      children: [
        Image.asset("assets/gopay_section.png"),
        SizedBox(
          height: 20,
        ),
        Image.asset("assets/menus.png")
      ],
    ),
    Container(),
    Container(),
    Container()
  ];

  setFocusIndicator() {
    switch (index) {
      case 0:
        setState(() {
          focusPos = -1;
        });
        break;
      case 1:
        setState(() {
          focusPos = -0.33;
        });
        break;
      case 2:
        setState(() {
          focusPos = 0.33;
        });
        break;
      case 3:
        setState(() {
          focusPos = 1;
        });
        break;
      default:
        break;
    }
  }

  changePage(indexParam) {
    setState(() {
      index = indexParam;
      setFocusIndicator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://mir-s3-cdn-cf.behance.net/project_modules/fs/f41d6f133343913.6231a718e491d.gif",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xff00880d),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      alignment: Alignment(focusPos, 0),
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 4) - 15,
                        margin: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xff086713),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              changePage(0);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              changePage(1);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Promo",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              changePage(2);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Pesan",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              changePage(3);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Chat",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: 4,
                  onPageChanged: (value) {
                    changePage(value);
                  },
                  itemBuilder: (buildContext, index) {
                    return SlidingUpPanel(
                      defaultPanelState: PanelState.OPEN,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      maxHeight: MediaQuery.of(context).size.height - 80,
                      panel: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: lisWidget.elementAt(index),
                            ),
                          ],
                        ),
                      ),
                      collapsed: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: Image.asset("assets/menu_up.png"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
