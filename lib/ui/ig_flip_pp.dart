import 'dart:async';

import 'package:flutter/material.dart';

class IGFlip extends StatefulWidget {
  const IGFlip({super.key});

  @override
  State<IGFlip> createState() => _IGFlipState();
}

class _IGFlipState extends State<IGFlip> {
  bool isFront = true;
  double widthContainer = 100;
  double x = 0.0;
  double xTap = 0.0;
  bool lastPosFront = true;
  double sizeInit = 100;
  Timer? timer;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        sizeInit = 0;
      });
    });
    super.initState();
  }

  runFlipAuto() {
    timer = Timer.periodic(Duration(milliseconds: 2), (timer) {
      setState(() {
        x = timer.tick.toDouble();
        if (widthContainer - x < 0) {
          isFront = false;
        } else {
          isFront = true;
        }

        if (timer.tick > 200) {
          lastPosFront = isFront;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      xTap = details.globalPosition.dx;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      x = (xTap - details.globalPosition.dx).abs();
                      if (widthContainer - x < 0) {
                        isFront = lastPosFront ? false : true;
                      } else {
                        isFront = lastPosFront ? true : false;
                      }
                      if ((widthContainer - x).abs() > 100) {
                        x = 0;
                        widthContainer = 100;
                      }
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      x = 0;
                      widthContainer = 100;
                      lastPosFront = isFront;
                    });
                  },
                  child: Container(
                    width: widthContainer - x < 0
                        ? x - widthContainer
                        : widthContainer - x,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                      width: widthContainer - x < 0
                          ? x - widthContainer
                          : widthContainer - x,
                      height: 100,
                      isFront
                          ? "https://cdn.buymeacoffee.com/uploads/profile_pictures/2022/10/7R7M4hlaZqAeKb1h.png@300w_0e.webp"
                          : "https://cdn-icons-png.flaticon.com/128/2202/2202112.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                  width: sizeInit,
                  height: sizeInit,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/2202/2202112.png",
                    fit: BoxFit.fill,
                  ),
                  onEnd: (() {
                    runFlipAuto();
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Change Avatar",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
