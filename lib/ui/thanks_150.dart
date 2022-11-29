import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Thanks150 extends StatefulWidget {
  const Thanks150({super.key});

  @override
  State<Thanks150> createState() => _Thanks150State();
}

class _Thanks150State extends State<Thanks150> {
  double valueAnimation = 0.0;
  List listBox = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loopBox();
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        setState(() {
          valueAnimation = 1.0;
        });
      },
    );
  }

  loopBox() {
    List.generate(10, (index) {
      var randomX = Random().nextDouble() * (1 - (-1)) + (-1);
      var randomY = Random().nextDouble() * (1 - (-1)) + (-1);
      setState(() {
        listBox.add(
            {"x": randomX, "y": randomY, "size": index.isOdd ? 20.0 : 10.0});
      });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black, // navigation bar color
          statusBarIconBrightness: valueAnimation == 1
              ? Brightness.light
              : Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icons' color
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: MediaQuery.of(context).size.width * valueAnimation,
              height: MediaQuery.of(context).size.width / 5,
              color: Color(0xFF029607),
              onEnd: () {
                Future.delayed(
                  Duration(milliseconds: 500),
                  () {
                    setState(() {
                      valueAnimation = valueAnimation == 0 ? 1 : 0;
                    });
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: MediaQuery.of(context).size.width * valueAnimation,
              height: MediaQuery.of(context).size.width / 5,
              color: Color(0xFF09BE0F),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, -0.5),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 100 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.5),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 20 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment(-1.2, -0.35),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: MediaQuery.of(context).size.width / 1.6 * valueAnimation,
              height: 3,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.5),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 100 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment(0.8, 0.5),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 20 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment(1.2, 0.7),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: MediaQuery.of(context).size.width / 1.6 * valueAnimation,
              height: 3,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.2),
            child: AnimatedOpacity(
              opacity: valueAnimation,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                  "https://cdn.buymeacoffee.com/uploads/profile_pictures/2022/10/7R7M4hlaZqAeKb1h.png@300w_0e.webp",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: MediaQuery.of(context).size.width * valueAnimation,
              child: Center(
                child: Text(
                  "THANK YOU",
                  style: TextStyle(
                    // color: Colors.amber,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.0),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 100 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment(1, 0.0),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: 100 * valueAnimation,
              height: 3,
              color: Colors.black,
            ),
          ),
          for (var tempWidget in listBox)
            Align(
              alignment: Alignment(tempWidget['x'], tempWidget['y']),
              child: AnimatedOpacity(
                opacity: valueAnimation,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: AnimatedRotation(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  turns: valueAnimation,
                  child: Container(
                    width: tempWidget['size'],
                    height: tempWidget['size'],
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment(0, 0.20),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: 200 * valueAnimation,
              child: Center(
                child: Text(
                  "150+",
                  style: TextStyle(
                    // color: Colors.amber,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.40),
            child: AnimatedOpacity(
              opacity: valueAnimation,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Center(
                  child: Text(
                    "NEW FOLLOWERS",
                    style: TextStyle(
                      // color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
