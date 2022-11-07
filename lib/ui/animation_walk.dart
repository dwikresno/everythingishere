import 'dart:async';

import 'package:flutter/material.dart';

class AnimationWalk extends StatefulWidget {
  const AnimationWalk();

  @override
  State<AnimationWalk> createState() => _AnimationWalkState();
}

class _AnimationWalkState extends State<AnimationWalk> {
  int indicator = 1;
  Timer? timer;
  double bush1 = -200;
  double bush2 = -200;
  double bush3 = -200;
  double bush4 = -200;
  double tree = -600;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (indicator == 9) {
        indicator = 1;
      }
      setState(() {
        indicator++;
      });
      print("indicator : $indicator");
      setState(() {
        tree += 20;
        if (timer.tick > 1) {
          bush1 += 20;
        }

        if (timer.tick > 10) {
          bush2 += 20;
        }

        if (timer.tick > 20) {
          bush3 += 20;
        }

        if (timer.tick > 30) {
          bush4 += 20;
        }
        if (bush1 > 600) {
          bush1 = -200;
        }
        if (bush2 > 600) {
          bush2 = -200;
        }
        if (bush3 > 600) {
          bush3 = -200;
        }
        if (bush4 > 600) {
          bush4 = -200;
        }

        if (tree > 600) {
          tree = -600;
        }
      });
      print("bush : $tree");
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: tree,
              bottom: 120,
              child: Image.asset(
                "assets/animation/tree.png",
                width: 700,
              ),
            ),
            Positioned(
              left: bush1,
              bottom: 120,
              child: Image.asset(
                "assets/animation/bush.png",
                width: 200,
              ),
            ),
            Positioned(
              left: bush2,
              bottom: 100,
              child: Image.asset(
                "assets/animation/bush.png",
                width: 200,
              ),
            ),
            Positioned(
              left: bush3,
              bottom: 120,
              child: Image.asset(
                "assets/animation/bush.png",
                width: 200,
              ),
            ),
            Positioned(
              left: bush4,
              bottom: 100,
              child: Image.asset(
                "assets/animation/bush.png",
                width: 200,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/animation/walk-${indicator}.png"),
                  Text(
                    indicator.toString(),
                    style: TextStyle(color: Colors.amber),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
