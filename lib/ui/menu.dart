import 'package:eye/ui/chooseseat.dart';
import 'package:eye/ui/eyeanimation.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                movePage(0);
              },
              child: Text("Eye Animation"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                movePage(1);
              },
              child: Text("Choose Seat"),
            )
          ],
        ),
      ),
    );
  }

  movePage(param) {
    Widget? className;
    switch (param) {
      case 0:
        className = EyeAnimation();
        break;
      case 1:
        className = ChooseSeat();
        break;
      default:
        // do something else
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => className!),
    );
  }
}
