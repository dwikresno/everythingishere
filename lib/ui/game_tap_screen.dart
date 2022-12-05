import 'package:flutter/material.dart';

class GameTapScreen extends StatefulWidget {
  const GameTapScreen({super.key});

  @override
  State<GameTapScreen> createState() => _GameTapScreenState();
}

class _GameTapScreenState extends State<GameTapScreen> {
  double blue = 0.0;
  double red = 0.0;
  String? winner = "";
  var halfScreen =
      (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height -
              MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .viewPadding
                  .top) /
          2;
  bool isBegan = false;

  @override
  void initState() {
    super.initState();
    reset();
  }

  reset() {
    setState(() {
      blue = halfScreen;
      red = halfScreen;
      winner = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      blue += 10;
                      if (red - 10 > 0) {
                        red -= 10;
                      } else {
                        red = 0;
                        blue = halfScreen * 2;
                        winner = "blue";
                      }
                    });
                  },
                  child: Container(
                    height: blue,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      red += 10;
                      if (blue - 10 > 0) {
                        blue -= 10;
                      } else {
                        blue = 0;
                        red = halfScreen * 2;
                        winner = "red";
                      }
                    });
                    print(halfScreen * 2);
                    print(red);
                  },
                  child: Container(
                    height: red,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: winner != "",
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Winner",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          winner!.toUpperCase(),
                          style: TextStyle(
                            color: winner == "blue" ? Colors.blue : Colors.red,
                            fontSize: 40,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            reset();
                          },
                          child: Text(
                            "RESET",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isBegan,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "FINGER",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "BATTLE",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isBegan = true;
                            });
                          },
                          child: Text(
                            "START",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
