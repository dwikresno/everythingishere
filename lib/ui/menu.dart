import 'package:all_is_here/ui/animation_walk.dart';
import 'package:all_is_here/ui/chooseseat.dart';
import 'package:all_is_here/ui/eyeanimation.dart';
import 'package:all_is_here/ui/harvestmoon.dart';
import 'package:all_is_here/ui/piano/piano.dart';
import 'package:all_is_here/ui/pokemon.dart';
import 'package:all_is_here/ui/snake.dart';
import 'package:all_is_here/ui/zelda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
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
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                movePage(2);
              },
              child: Text("Snake"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                movePage(3);
              },
              child: Text("Pokemon"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(4);
              },
              child: Text("Piano"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(5);
              },
              child: Text("Zelda"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(6);
              },
              child: Text("HarvestMoon Walk"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(7);
              },
              child: Text("Animation Walk"),
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
      case 2:
        className = Snake();
        break;
      case 3:
        className = Pokemon();
        break;
      case 4:
        className = Piano();
        break;
      case 5:
        className = ZeldaPage();
        break;
      case 6:
        className = HarvestMoon();
        break;
      case 7:
        className = AnimationWalk();
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
