import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Firework extends StatefulWidget {
  const Firework({super.key});

  @override
  State<Firework> createState() => _FireworkState();
}

class _FireworkState extends State<Firework> {
  double posY = -10;
  double posX = 200;
  List listRandomChild = [];
  bool visible = true;
  bool visibleChild = false;
  List<Color> listColor = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.amber,
    Colors.purple
  ];
  int countChild = 200;
  var selectedColor;

  @override
  void initState() {
    selectedColor = listColor.elementAt(Random().nextInt(listColor.length));
    start();
    super.initState();
  }

  start() {
    setState(() {
      listRandomChild.clear();
      List.generate(countChild, (index) {
        listRandomChild.add(
          {
            "x": 200.toDouble(),
            "y": 500.toDouble(),
            "speed": Random().nextInt(8) + 4,
            "color": listColor.elementAt(Random().nextInt(listColor.length)),
          },
        );
      });
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        posY = 500;
        posX = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              curve: Curves.linear,
              bottom: posY,
              left: posX,
              child: Visibility(
                visible: visible,
                child: Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selectedColor,
                  ),
                ),
              ),
              onEnd: () {
                setState(() {
                  visible = false;
                  visibleChild = true;
                  List.generate(countChild, (index) {
                    listRandomChild[index]['x'] =
                        (Random().nextInt(posX.toInt() + 300) - 20).toDouble();
                    listRandomChild[index]['y'] =
                        (Random().nextInt(posY.toInt() + 300) - 20).toDouble();
                    listRandomChild[index]['color'] = selectedColor;
                  });
                  Future.delayed(Duration(milliseconds: 1500), () {
                    if (mounted)
                      setState(() {
                        posY = -10;
                        posX = (Random().nextInt(200)).toDouble();
                        visibleChild = false;
                        selectedColor = listColor
                            .elementAt(Random().nextInt(listColor.length));
                      });
                  });

                  Future.delayed(Duration(milliseconds: 2500), () {
                    if (mounted)
                      setState(() {
                        visible = true;
                      });
                  });
                });
              },
            ),
            Stack(
              children: List.generate(listRandomChild.length, (index) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.linear,
                  left: listRandomChild.elementAt(index)['x'],
                  bottom: listRandomChild.elementAt(index)['y'],
                  child: AnimatedOpacity(
                    opacity: visibleChild ? 1.0 : 0.0,
                    duration: Duration(milliseconds: visibleChild ? 100 : 500),
                    child: Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: listRandomChild.elementAt(index)['color'],
                      ),
                    ),
                  ),
                  onEnd: () {
                    start();
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class BezierTween extends Tween<Offset> {
  final Offset begin;
  final Offset end;
  final Offset control;

  BezierTween({required this.begin, required this.end, required this.control})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    final t1 = 1 - t;
    return begin * t1 * t1 + control * 2 * t1 * t + end * t * t;
  }
}
