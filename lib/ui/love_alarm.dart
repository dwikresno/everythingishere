// ignore_for_file: must_call_super

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LoveAlarm extends StatefulWidget {
  const LoveAlarm({super.key});

  @override
  State<LoveAlarm> createState() => _LoveAlarmState();
}

class _LoveAlarmState extends State<LoveAlarm> with TickerProviderStateMixin {
  AnimationController? _controller;
  int found = 0;
  List listFound = [];
  final random = new Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();

    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (timer.tick % 10 == 0) {
        setState(() {
          var tempData = {
            "x": random.nextDouble(),
            "y": random.nextDouble(),
          };
          listFound.add(tempData);
        });
      }
      print(listFound.length);
      if (listFound.length == 3) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff01d2e5),
                  Color(0xffdeaab3),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(
                //   child: Container(),
                // ),
                Container(
                  child: Text(
                    "LoveAlarm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.width - 50,
                  child: AnimatedBuilder(
                    animation: CurvedAnimation(
                        parent: _controller!, curve: Curves.linear),
                    builder: (context, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _buildContainer(
                                MediaQuery.of(context).size.width - 50, true),
                            _buildContainer(300 * _controller!.value, false),
                            _buildContainer(400 * _controller!.value, false),
                            _buildContainer(500 * _controller!.value, false),
                            _buildContainer(600 * _controller!.value, false),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 100,
                            ),
                            for (var temp in listFound)
                              Align(
                                alignment: Alignment(temp['x'], temp['y']),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  // color: Colors.amber,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      _buildContainer2(
                                          40 * _controller!.value, false),
                                      _buildContainer2(
                                          50 * _controller!.value, false),
                                      _buildContainer2(
                                          60 * _controller!.value, false),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    listFound.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Heart ID : 123412312321",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 150,
                  // color: Colors.amber,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildContainer2(50 * 0.7, false),
                      _buildContainer2(60 * 0.7, false),
                      _buildContainer2(70 * 0.7, false),
                      _buildContainer2(80 * 0.7, false),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer(double radius, bool isBg) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 15,
          color: Colors.white.withOpacity(
            1 - _controller!.value + (isBg ? 0.05 : 0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer2(double radius, bool isBg) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Colors.white.withOpacity(1),
        ),
      ),
    );
  }
}
