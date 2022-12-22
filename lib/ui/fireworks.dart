import 'dart:ui';

import 'package:flutter/material.dart';

class Firework extends StatefulWidget {
  const Firework({super.key});

  @override
  State<Firework> createState() => _FireworkState();
}

class _FireworkState extends State<Firework> {
  double posY = -1200;
  double posX = 20;
  double height = 1000;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        posY = 500;
        posX = 200;
      });
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        height = 5;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/1080/1920?random=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xFF686868).withOpacity(0.1),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            bottom: posY,
            left: posX,
            child: Transform.rotate(
              angle: 0.2,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.linear,
                height: height,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff74acdf).withOpacity(0.1),
                      Color(0xffffffff).withOpacity(0.4),
                      Color(0xfff5b40c).withOpacity(0.8),
                      Color(0xffffffff),
                      Color(0xff74acdf),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
