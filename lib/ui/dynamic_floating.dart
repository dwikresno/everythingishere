import 'package:all_is_here/ui/tokopedia.dart';
import 'package:flutter/material.dart';

class DynamicFloating extends StatefulWidget {
  const DynamicFloating({super.key});

  @override
  State<DynamicFloating> createState() => _DynamicFloatingState();
}

class _DynamicFloatingState extends State<DynamicFloating>
    with TickerProviderStateMixin {
  double posX = 0.0;
  double posY = 0.0;
  AnimationController? _controller;
  double posXArrow = -1;
  bool isHide = false;
  bool isDrag = false;

  @override
  void initState() {
    posX =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width -
            60;
    posY =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height /
            2;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3eac44),
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            Tokopedia(),
            AnimatedPositioned(
              left: posX,
              top: posY,
              duration: Duration(milliseconds: isDrag ? 0 : 300),
              curve: Curves.linear,
              child: Draggable(
                feedback: Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            ),
                        child: Center(
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2601/2601642.png",
                          ),
                        ),
                      ),
                      AnimatedAlign(
                        alignment: Alignment(posXArrow, 0),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff3eac44),
                          ),
                          child: Center(
                            child: RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0)
                                  .animate(_controller!),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                childWhenDragging: Container(),
                onDragEnd: (dragDetails) {
                  setState(() {
                    isDrag = true;
                  });
                  double appBarHeight = AppBar().preferredSize.height;
                  double statusBarHeight =
                      MediaQuery.of(context).viewPadding.top;
                  double tempY =
                      dragDetails.offset.dy - appBarHeight - statusBarHeight;
                  double tempHeight = MediaQuery.of(context).size.height -
                      appBarHeight -
                      statusBarHeight;
                  double center = (MediaQuery.of(context).size.width / 2) - 30;
                  if (!isHide) {
                    setState(() {
                      if (dragDetails.offset.dx < center) {
                        if (posX != 0) {
                          _controller!..forward(from: 0.0);
                        }
                        posX = 0;
                        Future.delayed(Duration(milliseconds: 50), () {
                          setState(() {
                            posXArrow = 1;
                          });
                        });
                      } else {
                        if (posX != (MediaQuery.of(context).size.width - 60)) {
                          _controller!..reverse(from: 0.5);
                        }
                        posX = (MediaQuery.of(context).size.width - 60);
                        Future.delayed(Duration(milliseconds: 50), () {
                          setState(() {
                            posXArrow = -1;
                          });
                        });
                      }

                      if (tempY > 0 && tempY < (tempHeight - 65)) {
                        posY = tempY;
                      } else {
                        if (tempY < 0) {
                          posY = 0;
                        } else {
                          posY = tempHeight - 65;
                        }
                      }
                    });
                  }
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            ),
                        child: Center(
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2601/2601642.png",
                          ),
                        ),
                      ),
                      AnimatedAlign(
                        alignment: Alignment(posXArrow, 0),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDrag = false;
                            });
                            print(isHide);
                            if (isHide) {
                              setState(() {
                                if (posX < 0) {
                                  posX = 0;
                                  _controller!..forward(from: 0.0);
                                } else {
                                  posX = MediaQuery.of(context).size.width - 60;
                                  _controller!..reverse(from: 0.5);
                                }
                              });
                            } else {
                              setState(() {
                                if (posX == 0) {
                                  posX = -30;
                                  _controller!..reverse(from: 0.5);
                                } else {
                                  posX = MediaQuery.of(context).size.width - 40;
                                  _controller!..forward(from: 0.0);
                                }
                              });
                            }

                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xff3eac44),
                            ),
                            child: Center(
                              child: RotationTransition(
                                turns: Tween(begin: 0.0, end: 1.0)
                                    .animate(_controller!),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
