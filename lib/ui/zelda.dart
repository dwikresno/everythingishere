// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZeldaPage extends StatefulWidget {
  ZeldaPage({Key? key}) : super(key: key);

  @override
  State<ZeldaPage> createState() => _ZeldaPageState();
}

class _ZeldaPageState extends State<ZeldaPage> {
  double sizeArrow = 40;
  double zeldaX = 0;
  double zeldaY = 0;
  Timer? timer;
  int map = 1;
  bool isChangeMap = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              top: 0,
              right: map == 1 ? 0 : MediaQuery.of(context).size.width,
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
              onEnd: () {
                setState(() {
                  isChangeMap = false;
                });
              },
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              top: 0,
              right: map == 2 ? 0 : -(MediaQuery.of(context).size.width),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
              onEnd: () {
                setState(() {
                  isChangeMap = false;
                });
              },
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: isChangeMap ? 2000 : 200),
              curve: Curves.fastOutSlowIn,
              alignment: Alignment(zeldaX, zeldaY),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
              ),
              onEnd: () {
                setState(() {
                  isChangeMap = false;
                });
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                child: Row(
                  children: [
                    Listener(
                      onPointerDown: (details) {
                        actionMove("left");
                      },
                      onPointerUp: (details) {
                        setState(() {
                          timer!.cancel();
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_left,
                          size: sizeArrow,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Listener(
                            onPointerDown: (details) {
                              actionMove("up");
                            },
                            onPointerUp: (details) {
                              setState(() {
                                timer!.cancel();
                              });
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: sizeArrow,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeArrow,
                          ),
                          Listener(
                            onPointerDown: (details) {
                              actionMove("down");
                            },
                            onPointerUp: (details) {
                              setState(() {
                                timer!.cancel();
                              });
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: sizeArrow,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Listener(
                      onPointerDown: (details) {
                        actionMove("right");
                      },
                      onPointerUp: (details) {
                        setState(() {
                          timer!.cancel();
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_right,
                          size: sizeArrow,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  actionMove(action) {
    if (!isChangeMap) {
      print(action);
      timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        print(action + " " + timer.tick.toString());
        switch (action) {
          case "up":
            if (zeldaY > -1)
              setState(() {
                zeldaY = zeldaY - 0.04;
              });
            break;
          case "down":
            if (zeldaY < 1)
              setState(() {
                zeldaY = zeldaY + 0.04;
              });
            break;
          case "left":
            if (zeldaX > -1) {
              setState(() {
                zeldaX = zeldaX - 0.02;
              });
            } else {
              setState(() {
                isChangeMap = true;
                zeldaX = 1;
                map = 1;
                timer.cancel();
              });
            }
            break;
          case "right":
            if (zeldaX < 1) {
              setState(() {
                zeldaX = zeldaX + 0.02;
              });
            } else {
              setState(() {
                isChangeMap = true;
                zeldaX = -1;
                map = 2;
                timer.cancel();
              });
            }
            break;
          default:
            print("other");
            break;
        }
      });
    } else {
      setState(() {
        timer!.cancel();
      });
    }
  }
}
