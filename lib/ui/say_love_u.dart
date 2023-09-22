import 'dart:math';

import 'package:flutter/material.dart';

class SayLoveU extends StatefulWidget {
  const SayLoveU({super.key});

  @override
  State<SayLoveU> createState() => _SayLoveUState();
}

class _SayLoveUState extends State<SayLoveU> {
  int x = 0;
  int y = 0;

  changePos() {
    setState(() {
      x = Random().nextInt(2);
      y = Random().nextInt(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/blue-romantic-background-with-wave-line_588409-240.jpg?w=1380",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Text(
                            "Do you wanna be my girlfriend?",
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 200,
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content: Image.network(
                                              "https://i.pinimg.com/originals/88/9c/86/889c8687696d2336b4cf8db50943c80c.gif"),
                                        ),
                                      );
                                    },
                                    child: Text("Yes"),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 200,
                                child: Align(
                                  alignment:
                                      Alignment(x.toDouble(), y.toDouble()),
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      print("hover");
                                      changePos();
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("No"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              child: Image.asset(
                "assets/build_w_flutter.png",
                width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
