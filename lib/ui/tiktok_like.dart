import 'dart:async';

import 'package:flutter/material.dart';

class TiktokLike extends StatefulWidget {
  const TiktokLike({super.key});

  @override
  State<TiktokLike> createState() => _TiktokLikeState();
}

class _TiktokLikeState extends State<TiktokLike> {
  Timer? timer;
  double plusPosition = 0.0;
  double opacity = 1.0;
  int index = 0;
  List listUser = List.generate(
    10,
    (index) => {
      "pos": 20.0,
      "opacity": 1.0,
    },
  ).toList();
  List listAnimation = [];

  @override
  void initState() {
    runAnimation();
    super.initState();
  }

  runAnimation() {
    timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {
        plusPosition += 1;
      });

      if (plusPosition > 200) {
        if (opacity - 0.1 > 0.0) {
          setState(() {
            opacity -= 0.1;
          });
        } else {
          setState(() {
            opacity = 0.0;
          });
        }
      }

      if (plusPosition % 50 == 0) {
        if (listUser.length != listAnimation.length) {
          setState(() {
            print("element list user : ${listUser.elementAt(index)}");
            listAnimation.add(listUser.elementAt(index));
            index++;
          });
        }
      }

      for (int i = 0; i < listAnimation.length; i++) {
        print("element list animation : ${listAnimation.elementAt(i)}");
        setState(() {
          listAnimation.elementAt(i)['pos']++;
        });
        if (listAnimation.elementAt(i)['pos'] > 200) {
          if (listAnimation.elementAt(i)['opacity'] - 0.1 > 0.0) {
            setState(() {
              listAnimation.elementAt(i)['opacity'] -= 0.1;
            });
          } else {
            setState(() {
              listAnimation.elementAt(i)['opacity'] = 0.0;
            });
            if (i == (listUser.length - 1)) {
              reset();
            }
          }
        }
      }
    });
  }

  reset() {
    timer!.cancel();
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        plusPosition = 0.0;
        opacity = 1.0;
        index = 0;
        listUser = List.generate(
          10,
          (index) => {
            "pos": 20.0,
            "opacity": 1.0,
          },
        ).toList();
        listAnimation.clear();
      });
      runAnimation();
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      "https://picsum.photos/1080/1920?random=1",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20.0 + plusPosition,
                    // duration: Duration(seconds: 5),
                    // curve: Curves.linear,
                    child: Opacity(
                      opacity: opacity,
                      // duration: Duration(seconds: 1),
                      // curve: Curves.linear,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "D'CODE • 1m ago",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFB6B6B6),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Text(
                                    "Put your video caption here",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < listAnimation.length; i++)
                    Positioned(
                      left: 20,
                      bottom: listAnimation.elementAt(i)['pos'],
                      // duration: Duration(seconds: 5),
                      // curve: Curves.linear,
                      child: Opacity(
                        opacity: listAnimation.elementAt(i)['opacity'],
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://picsum.photos/400/400?random=$i",
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 10,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 14,
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
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(
                              "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        child: Container(
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(
                              "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        child: Container(
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(
                              "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "100 views",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF414141),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Privacy Setting",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
