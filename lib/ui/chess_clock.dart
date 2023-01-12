import 'dart:async';

import 'package:flutter/material.dart';

class ChessClock extends StatefulWidget {
  const ChessClock({super.key});

  @override
  State<ChessClock> createState() => _ChessClockState();
}

class _ChessClockState extends State<ChessClock> {
  int duration = 10; //in minutes
  int player1 = 0;
  int player2 = 0;
  int playerMove1 = 0;
  int playerMove2 = 0;
  Timer? timer1;
  Timer? timer2;
  int? playerTurn; // binary 0 or 1

  @override
  void initState() {
    reset();
    super.initState();
  }

  reset() {
    setState(() {
      if (timer1 != null) {
        timer1!.cancel();
      }
      if (timer2 != null) {
        timer2!.cancel();
      }
      timer1 = null;
      timer2 = null;
      playerMove1 = 0;
      playerMove2 = 0;
      player1 = duration * 60;
      player2 = duration * 60;
      playerTurn = null;
    });
  }

  runTimer1() {
    if (timer2 != null) {
      setState(() {
        timer2!.cancel();
        playerMove2++;
      });
    }
    setState(() {
      playerTurn = 0;
    });

    timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (player1 > 0) {
          player1--;
        } else {
          timer1!.cancel();
        }
      });
    });
  }

  runTimer2() {
    if (timer1 != null) {
      setState(() {
        timer1!.cancel();
        playerMove1++;
      });
    }
    setState(() {
      playerTurn = 1;
    });
    timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (player2 > 0) {
          player2--;
        } else {
          timer2!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    if (timer1 != null) {
      timer1!.cancel();
    }
    if (timer2 != null) {
      timer2!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w900,
          ),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (player1 > 0 && player2 > 0) {
                      if (timer2 != null && timer2!.isActive) {
                        setState(() {
                          timer2!.cancel();
                        });
                      } else {
                        runTimer2();
                      }
                    }
                  },
                  child: Container(
                    color: playerTurn == 0 ? Colors.red : Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                "${player1 ~/ 60} : ${player1 % 60 < 10 ? "0" : ""}${player1 % 60}",
                                style: TextStyle(
                                  color: playerTurn == 0
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 2,
                          child: Text(
                            "Moves : $playerMove1",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        reset();
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (player1 > 0 && player2 > 0) {
                      if (timer1 != null && timer1!.isActive) {
                        setState(() {
                          timer1!.cancel();
                        });
                      } else {
                        runTimer1();
                      }
                    }
                  },
                  child: Container(
                    color: playerTurn == 1 ? Colors.red : Colors.white,
                    child: Column(
                      children: [
                        Text(
                          "Moves : $playerMove2",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "${player2 ~/ 60} : ${player2 % 60 < 10 ? "0" : ""}${player2 % 60}",
                              style: TextStyle(
                                color: playerTurn == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
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
    );
  }
}
