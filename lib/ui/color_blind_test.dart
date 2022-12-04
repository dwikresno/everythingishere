import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColorBlindTest extends StatefulWidget {
  const ColorBlindTest({super.key});

  @override
  State<ColorBlindTest> createState() => _ColorBlindTestState();
}

class _ColorBlindTestState extends State<ColorBlindTest> {
  Color mainColor = Colors.amber;
  int correctIndex = 0;
  Color diffColor = Colors.amber;
  int score = 0;
  // int live = 10;
  int timerCount = 30;
  Timer? timer;
  int highScore = 0;
  String statusAnswer = "";
  int indexBG = 1;

  @override
  void initState() {
    refreshColor();
    setTimer();
    super.initState();
  }

  setTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timerCount--;
      });
      if (timerCount == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  refreshColor() {
    setState(() {
      mainColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      correctIndex = Random().nextInt(16);
      diffColor = [
        mainColor.withRed(score * 10 > 255 ? 255 : score),
        mainColor.withBlue(score * 10 > 255 ? 255 : score),
        mainColor.withGreen(score * 10 > 255 ? 255 : score)
      ].elementAt(Random().nextInt(3));
    });
  }

  answer(index) {
    setState(() {
      if (timerCount > 0) {
        if (index == correctIndex) {
          if (statusAnswer == "wrong") {
            statusAnswer = "";
          } else {
            indexBG++;
            score++;
            timerCount += 10;
            statusAnswer = "correct";
          }
          refreshColor();
        } else {
          statusAnswer = "wrong";
          if (timerCount - 5 > 0) {
            timerCount -= 5;
          } else {
            timerCount = 0;
            timer!.cancel();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/1080/1920?random=${indexBG + 10}",
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
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // Container(
              //   margin: EdgeInsets.all(20),
              //   child: Row(
              //     children: List.generate(live, (index) {
              //       return Container(
              //         child: Icon(
              //           Icons.favorite,
              //           color: Colors.red,
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "SCORE : ${score.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "HIGH SCORE : ${highScore.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(20),
                child: Text(
                  "${(timerCount ~/ 60).round()}:${(timerCount % 60) < 10 ? '0' : ''}${timerCount % 60}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: statusAnswer != "" ? Colors.white : Colors.transparent,
                ),
                margin: EdgeInsets.all(20),
                child: Text(
                  statusAnswer.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: statusAnswer == "wrong" ? Colors.red : Colors.green,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: 16,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          answer(index);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: correctIndex == index
                                    ? diffColor
                                    : mainColor,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Visibility(
                                visible: index == correctIndex &&
                                    statusAnswer == "wrong",
                                child: Container(
                                  child: Text(
                                    "Correct",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: timerCount == 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.withOpacity(0.5),
                ),
                height: 200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "GAME OVER",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          timerCount = 30;
                          highScore = score;
                          score = 0;
                        });
                        refreshColor();
                        setTimer();
                      },
                      child: Text(
                        "RESTART",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
