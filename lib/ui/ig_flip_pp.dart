import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
