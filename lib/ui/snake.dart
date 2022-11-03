import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Snake extends StatefulWidget {
  Snake({Key? key}) : super(key: key);

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  final FocusNode _focusNode = FocusNode();
  var keyClick = "A";
  double? posX;
  double? posY;
  double? maxWallX;
  double? maxWallY;
  Timer? timer;
  double? posXFood;
  double? posYFood;
  var isBegining = true;
  var listBodySnake = [0]; //init for head

  var direction = "l"; //l left, r right,d down, u up

  void _handleASDWKeyEvent(RawKeyEvent event) {
    if (isWClicked(event.logicalKey.debugName)!) {
      setState(() {
        if (direction != "d") keyClick = "W";
      });
    }

    if (isSClicked(event.logicalKey.debugName)!) {
      setState(() {
        if (direction != "u") keyClick = "S";
      });
    }

    if (isAClicked(event.logicalKey.debugName)!) {
      setState(() {
        if (direction != "r") keyClick = "A";
      });
    }

    if (isDClicked(event.logicalKey.debugName)!) {
      setState(() {
        if (direction != "l") keyClick = "D";
      });
    }
    print(keyClick);
  }

  @override
  void initState() {
    setFirstPosition();
    setPositionFood();
    _focusNode.requestFocus();
    setTimer();
    super.initState();
  }

  setTimer() {
    timer = Timer.periodic(Duration(microseconds: 1000), (Timer t) {
      if (keyClick == "A" && (direction != "r")) {
        setState(() {
          posX = posX;
          posY = double.parse((posY! + 2).toStringAsFixed(0));
          direction = "l";
          isBegining = false;
        });
      } //go left

      if (keyClick == "W" && direction != "d") {
        setState(() {
          posY = posY;
          posX = double.parse((posX! - 2).toStringAsFixed(0));
          direction = "u";
        });
      } //go topflutte

      if (keyClick == "S" && direction != "u") {
        setState(() {
          posY = posY;
          posX = double.parse((posX! + 2).toStringAsFixed(0));
          direction = "d";
        });
      } //go down

      if (keyClick == "D" && direction != "l") {
        setState(() {
          posX = posX;
          posY = double.parse((posY! - 2).toStringAsFixed(0));
          direction = "r";
        });
      } //go right

      if (posY! > maxWallX!) {
        setState(() {
          posY = 0;
        });
      }

      if (posY! < 0) {
        setState(() {
          posY = maxWallX;
        });
      }

      if (posX! > maxWallY!) {
        setState(() {
          posX = 0;
        });
      }

      if (posX! < 0) {
        setState(() {
          posX = maxWallY;
        });
      }

      if ((posXFood! - posX!).abs() < 8 && (posYFood! - posY!).abs() < 8) {
        setPositionFood();
        setState(() {
          listBodySnake.add(listBodySnake.last + 20);
        });
        print(listBodySnake);
        // timer!.cancel();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  setFirstPosition() {
    setState(() {
      posX = double.parse(
          (WidgetsBinding.instance.window.physicalSize.width / 2)
              .toStringAsFixed(0));
      posY = double.parse(
          (WidgetsBinding.instance.window.physicalSize.height / 2)
              .toStringAsFixed(0));
      maxWallX = double.parse(
          (WidgetsBinding.instance.window.physicalSize.width - 20)
              .toStringAsFixed(0));
      maxWallY = double.parse(
          (WidgetsBinding.instance.window.physicalSize.height - 80)
              .toStringAsFixed(0));
    });
  }

  setPositionFood() {
    setState(() {
      posXFood = Random().nextInt(maxWallX!.toInt()).toDouble();
      posYFood = Random().nextInt(maxWallY!.toInt()).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "position head ${posX},${posY}",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Column(
            children: [
              Text(
                "position food ${posXFood},${posYFood}",
              ),
              Text(
                "Max Wall ${maxWallX},${maxWallY}",
              ),
            ],
          ),
        ],
      ),
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleASDWKeyEvent,
        child: AnimatedBuilder(
          animation: _focusNode,
          builder: (BuildContext context, Widget? child) {
            return Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: listBodySnake.map((item) {
                        return Positioned(
                          top: (direction == "u"
                              ? posX! + item
                              : direction == "d"
                                  ? posX! - item
                                  : posX! + 0),
                          right: (direction == "l"
                              ? posY! - item
                              : direction == "r"
                                  ? posY! + item
                                  : posY! + 0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: listBodySnake
                                      .indexWhere((element) => element == item)
                                      .isEven
                                  ? Colors.black
                                  : Colors.amber,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  widgetFood(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget widgetFood() {
    return Positioned(
      top: posXFood,
      right: posYFood,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }

  bool? isWClicked(key) {
    return key == 'Key W';
  }

  bool? isAClicked(key) {
    return key == 'Key A';
  }

  bool? isSClicked(key) {
    return key == 'Key S';
  }

  bool? isDClicked(key) {
    return key == 'Key D';
  }
}
