import 'package:all_is_here/ui/IG/ig_message.dart';
import 'package:all_is_here/ui/animation_walk.dart';
import 'package:all_is_here/ui/chooseseat.dart';
import 'package:all_is_here/ui/eyeanimation.dart';
import 'package:all_is_here/ui/harvestmoon.dart';
import 'package:all_is_here/ui/hide_post.dart';
import 'package:all_is_here/ui/listchecked.dart';
import 'package:all_is_here/ui/pancake_sort.dart';
import 'package:all_is_here/ui/piano.dart';
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
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: GridView(
          reverse: true,
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            ElevatedButton(
              onPressed: () {
                movePage(0);
              },
              child: Text("Eye Animation"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(1);
              },
              child: Text("Choose Seat"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(2);
              },
              child: Text("Snake"),
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
            ),
            ElevatedButton(
              onPressed: () {
                movePage(8);
              },
              child: Text("List Checked"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(9);
              },
              child: Text("Hide Post"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(10);
              },
              child: Text("IG Message"),
            ),
            ElevatedButton(
              onPressed: () {
                movePage(11);
              },
              child: Text("Pancake Sort"),
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
      case 8:
        className = ListChecked();
        break;
      case 9:
        className = HidePost();
        break;
      case 10:
        className = IGMessage();
        break;
      case 11:
        className = PancakeSort();
        break;
      default:
        // do something else
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => className!),
    ).then((value) => setState(() {}));
  }
}
