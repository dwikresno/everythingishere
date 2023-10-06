import 'dart:math';

import 'package:flutter/material.dart';

class MathGame extends StatefulWidget {
  const MathGame({super.key});

  @override
  State<MathGame> createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> {
  int? firstValue;
  int? secondValue;
  String? operator;
  int? correctAnswer;
  List<int> choice = [];
  bool isAnswered = false;
  bool isCorrect = false;
  Player? currentPlayerAnswer;

  int scoreP1 = 0;
  int scoreP2 = 0;
  int totalRound = 0;
  int currentRound = 0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalRound();
    });
    restartGame();
    super.initState();
  }

  restartGame() {
    getRandomValue();
    operator = getRandomOperator();
    correctAnswer = calculateAnswer(firstValue!, secondValue!, operator!);
    choice.clear();
    choice.add(correctAnswer!);
    choice.add(Random().nextInt(100));
    choice.add(Random().nextInt(100));
    choice.shuffle();
  }

  getRandomValue() {
    setState(() {
      firstValue = Random().nextInt(50) + 5;
      secondValue = Random().nextInt(firstValue!);
    });
  }

  String getRandomOperator() {
    List<String> operators = [
      '+',
      '-',
      // '*',
      // '/',
    ];
    return operators[Random().nextInt(operators.length)];
  }

  int calculateAnswer(int num1, int num2, String operator) {
    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      // case '*':
      //   return num1 * num2;
      // case '/':
      //   return num1 ~/ num2;
      default:
        throw ArgumentError('Invalid operator');
    }
  }

  answer({Player? player, index}) {
    if (!isAnswered) {
      setState(() {
        isAnswered = true;
        currentPlayerAnswer = player;
        if (choice.elementAt(index) == correctAnswer) {
          isCorrect = true;
          if (currentPlayerAnswer == Player.p1) {
            scoreP1 = scoreP1 + 10;
          } else {
            scoreP2 = scoreP2 + 10;
          }
        } else {
          isCorrect = false;
        }
      });

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isAnswered = false;
        });
      }).whenComplete(() {
        currentRound = currentRound + 1;
        restartGame();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Round ${currentRound}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "${firstValue} ${operator} ${secondValue}",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 80)
                                ],
                              ),
                              Spacer(),
                              Text(
                                "Score",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                scoreP2.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:
                                      List.generate(choice.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        answer(player: Player.p2, index: index);
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            choice.elementAt(index).toString(),
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                          Visibility(
                            visible: isAnswered,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                              ),
                              child: currentPlayerAnswer != Player.p2
                                  ? SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          isCorrect
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                  size: 100,
                                                )
                                              : Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                  size: 100,
                                                ),
                                          Text(
                                            isCorrect ? "Correct" : "Wrong",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Round ${currentRound}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        "${firstValue} ${operator} ${secondValue}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 80)
                              ],
                            ),
                            Spacer(),
                            Text(
                              "Score",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              scoreP1.toString(),
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(choice.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      answer(player: Player.p1, index: index);
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          choice.elementAt(index).toString(),
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Visibility(
                          visible: isAnswered,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            child: currentPlayerAnswer != Player.p1
                                ? SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        isCorrect
                                            ? Icon(
                                                Icons.check,
                                                color: Colors.green,
                                                size: 100,
                                              )
                                            : Icon(
                                                Icons.close,
                                                color: Colors.red,
                                                size: 100,
                                              ),
                                        Text(
                                          isCorrect ? "Correct" : "Wrong",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: totalRound + 1 == currentRound,
              child: Container(
                color: Colors.grey.withOpacity(0.9),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        scoreP1 == scoreP2
                            ? "DRAW"
                            : scoreP1 > scoreP2
                                ? "PLAYER 1\nWON"
                                : "PLAYER 2\nWON",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentRound = 0;
                            scoreP1 = 0;
                            scoreP2 = 0;
                          });
                          restartGame();
                        },
                        child: Text("Restart"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showModalRound() {
    final totalRoundController = TextEditingController();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Total Round'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Total Round',
                      ),
                      controller: totalRoundController,
                    ),
                  ],
                ),
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  child: Text("Start"),
                  onPressed: () {
                    setState(() {
                      totalRound = int.parse(totalRoundController.text);
                      currentRound = 1;
                    });
                    Navigator.pop(context);
                  })
            ],
          );
        }).then((value) {
      if (totalRoundController.text.isEmpty) {
        Navigator.pop(context);
      }
    });
  }
}

enum Player { p1, p2 }
