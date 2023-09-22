import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HarvestMoon extends StatefulWidget {
  const HarvestMoon();

  @override
  State<HarvestMoon> createState() => _HarvestMoonState();
}

class _HarvestMoonState extends State<HarvestMoon> {
  int indicatorCharacter = 1;
  Timer? timer;
  bool isLast = false;
  double playerX = 0;
  double playerY = 0;

  @override
  void initState() {
    walk();
    super.initState();
  }

  walk() {
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (isLast) {
        setState(() {
          indicatorCharacter--;
        });
      } else {
        setState(() {
          indicatorCharacter++;
        });
      }

      if (indicatorCharacter == 3) {
        setState(() {
          isLast = true;
        });
      }

      if (indicatorCharacter == 1) {
        setState(() {
          isLast = false;
        });
      }

      if (playerX > 0) {
        setState(() {
          playerX -= 0.1;
        });
      } else {
        setState(() {
          playerX = 0;
          // indicatorCharacter = 2;
          // timer.cancel();
        });
      }
      print("player x: ${playerX}");
      print("Indicator Character : ${indicatorCharacter}");
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
          Container(
            width: height,
            height: height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(playerX, playerY),
                  child: Container(
                    width: 25,
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/harvestmoon/run-${indicatorCharacter}.png",
                      // height: 50,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
