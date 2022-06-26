import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class EyeAnimation extends StatefulWidget {
  EyeAnimation({Key? key}) : super(key: key);

  @override
  State<EyeAnimation> createState() => _EyeAnimationState();
}

class _EyeAnimationState extends State<EyeAnimation> {
  var isClosedEye = false;
  var timeClose;
  var posX = 70 / 2;
  var posY = 90 / 2;
  Timer? _timer;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  startAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      print(t.tick);
      if ((t.tick % 10) == 0) {
        setState(() {
          isClosedEye = true;
          timeClose = t.tick + 2;
        });
      } //open eyes

      if (timeClose == t.tick) {
        setState(() {
          isClosedEye = false;
        });
      } //close eye

      if ((t.tick % 8) == 0) {
        setState(() {
          posX = Random().nextInt(70).toDouble();
          posY = Random().nextInt(90).toDouble();
        });
      } //move eyeball
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 90,
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  bottom: posX,
                                  right: posY,
                                  child: Container(
                                    width: 70,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(80, 130),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  top: 23,
                                  right: 55,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                            height: MediaQuery.of(context).size.height /
                                (isClosedEye ? 3 : 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff8D5524),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                              // border: Border(
                              //   bottom: BorderSide(
                              //     color: Colors.indigo,
                              //     width: 7,
                              //   ),
                              // ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 90,
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  bottom: posX,
                                  right: posY,
                                  child: Container(
                                    width: 70,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(80, 130),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                  top: 23,
                                  right: 55,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                            height: MediaQuery.of(context).size.height /
                                (isClosedEye ? 3 : 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff8D5524),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
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
            Flexible(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
