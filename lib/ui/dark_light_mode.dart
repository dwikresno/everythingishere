import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkLightMode extends StatefulWidget {
  const DarkLightMode({super.key});

  @override
  State<DarkLightMode> createState() => _DarkLightModeState();
}

class _DarkLightModeState extends State<DarkLightMode> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              top: isDarkMode ? -1000 : 80,
              right: isDarkMode ? -1000 : 50,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  width:
                      isDarkMode ? (MediaQuery.of(context).size.height * 3) : 0,
                  height:
                      isDarkMode ? (MediaQuery.of(context).size.height * 3) : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
                child: AnimatedSwitcher(
                  switchInCurve: Curves.linear,
                  duration: const Duration(milliseconds: 500),
                  child: Icon(
                    key: Key(isDarkMode ? "dark" : "light"),
                    isDarkMode
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: Color(0xff039be5),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Image.network(
                'https://img.icons8.com/color/512/telegram-app.png',
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
