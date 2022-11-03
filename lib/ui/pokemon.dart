import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:just_audio/just_audio.dart';

class Pokemon extends StatefulWidget {
  Pokemon({Key? key}) : super(key: key);

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  final player = AudioPlayer();
  List listForbiden = [];
  double posX = 0.0;
  double posY = 0.0;
  double maxXBoy = 380;
  double maxYBoy = 400;
  double boyX = 0.0;
  double boyY = 0.0;
  double step = 37;
  double maxXMap = 7;
  double maxYMap = 38;
  List<List<double>> forbidenArea = [
    [394, 210],
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    resetPositionMap();
    resetPositionBoy();
    playMusic();
    super.initState();
  }

  playMusic() async {
    await player.setAsset("assets/pokemon/audio/sound_back.wav");
    await player.setLoopMode(LoopMode.all);
    await player.play();
  }

  @override
  void dispose() {
    player.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  bool checkCanPass(direction) {
    double stepX = 0.0;
    double stepY = 0.0;
    if (direction == "up") {
      stepX = 0;
      stepY += step;
    }

    if (direction == "down") {
      stepX = 0;
      stepY -= step;
    }

    if (direction == "left") {
      stepX -= step;
      stepY = 0;
    }

    if (direction == "right") {
      stepX += step;
      stepY = 0;
    }

    for (var f in forbidenArea) {
      if (cleanNumber(f[0]) == cleanNumber(posX + stepX) &&
          cleanNumber(f[1]) == cleanNumber(posY + stepY)) {
        return false;
      }
    }
    return true;
  }

  resetPositionMap() {
    setState(() {
      posX = -412;
      posY = -204;
    });
  }

  resetPositionBoy() {
    setState(() {
      boyX = maxXBoy / 2;
      boyY = maxYBoy / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetPositionMap();
                    },
                    child: Text("reset position"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      resetPositionBoy();
                    },
                    child: Text("reset position boy"),
                  ),
                  Spacer(),
                  widgetButtonArrow(),
                ],
              ),
            ),
          ),
          Container(
            width: 400,
            // height: 500,
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  top: posY,
                  right: posX,
                  child: Container(
                    color: Colors.amber,
                    child: Image.asset(
                      "assets/pokemon/image/littleroot_town.jpg",
                      width: 900,
                      height: 900,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: boyY,
                  right: boyX,
                  child: widgetBoy(),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setForbidenArea();
                    },
                    child: Text("add to forbiden area"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      resetForbidenArea();
                    },
                    child: Text("reset forbiden area"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  moveTop() {
    print("top");
    setState(() {
      posY = posY - 1;
    });
  }

  moveDown() {
    print("down");
    setState(() {
      posY = posY + 1;
    });
  }

  Widget widgetBoy() {
    return Container(
      width: 35,
      height: 35,
      color: Colors.amber,
    );
  }

  Widget widgetButtonArrow() {
    return Joystick(
      mode: JoystickMode.horizontalAndVertical,
      // stickOffsetCalculator: const RectangleStickOffsetCalculator(),
      listener: (details) {
        moveDirection(details.x, details.y);
      },
    );
  }

  moveDirection(x, y) {
    // print(checkCanPass());
    setState(() {
      if (x == 0 && y < 0 && checkCanPass("up")) {
        //move up
        posY += step;
      }

      if (x == 0 && y > 0 && checkCanPass("down")) {
        //move down
        posY -= step;
      }

      if (x < 0 && y == 0 && checkCanPass("left")) {
        //move left
        posX -= step;
      }

      if (x > 0 && y == 0 && checkCanPass("right")) {
        //move right
        posX += step;
      }
    });

    print("X : ${cleanNumber(posX)}, Y ${cleanNumber(posY)}");
    // ;
  }

  int cleanNumber(double number) {
    return number.abs().floor();
  }

  setForbidenArea() {
    List<double> data = [];
    data.add(cleanNumber(posX).toDouble());
    data.add(cleanNumber(posY).toDouble());
    if (forbidenArea.where((element) {
          return element[0] == cleanNumber(posX).toDouble() &&
              element[1] == cleanNumber(posY).toDouble();
        }).length ==
        0) {
      forbidenArea.add(data);
    }
    print(forbidenArea);
  }

  resetForbidenArea() {
    forbidenArea.clear();
  }
}
