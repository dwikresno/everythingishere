import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeDecember extends StatefulWidget {
  const WelcomeDecember({super.key});

  @override
  State<WelcomeDecember> createState() => _WelcomeDecemberState();
}

class _WelcomeDecemberState extends State<WelcomeDecember> {
  int index = 1;
  bool isShowFirst = true;
  bool isShowSecond = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1607790145636-e61c1773fcbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1080&q=120"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: isShowFirst ? 1 : 0,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 20.0, height: 100.0),
                    const Text(
                      'NEW ',
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                              'MONTH',
                            ),
                            RotateAnimatedText(
                              'DAY',
                            ),
                            RotateAnimatedText(
                              'DATE',
                            ),
                            RotateAnimatedText(
                              'CHAPTER',
                            ),
                            RotateAnimatedText(
                              'WISHES',
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 500),
                          onFinished: () {
                            setState(() {
                              isShowFirst = false;
                            });
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                isShowSecond = true;
                              });
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: isShowSecond ? 1 : 0,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText(
                          'WELCOME',
                          textStyle: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          speed: const Duration(milliseconds: 2000),
                        ),
                      ],
                      pause: Duration(milliseconds: 4000),
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText(
                          'DECEMBER',
                          textStyle: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          speed: const Duration(milliseconds: 2000),
                        ),
                      ],
                      pause: Duration(milliseconds: 6000),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
