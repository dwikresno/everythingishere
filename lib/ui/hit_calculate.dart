import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class HitCalculate extends StatefulWidget {
  const HitCalculate({super.key});

  @override
  State<HitCalculate> createState() => _HitCalculateState();
}

class _HitCalculateState extends State<HitCalculate> {
  int lengthSkill = 4;
  int maxHealth = 10000;
  int currentHealth = 10000;
  int level = 1;
  VideoPlayerController? videoPlayerController;
  double? damage = 70;
  List listHit = [];
  double? criticalChancePercent = 1;
  bool criticalHit = false;

  List<String> listSkill = [
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/9/97/Waveform_icon.png/revision/latest?cb=20121015185523",
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/e/ed/Adaptive_Strike_%28Agility%29_icon.png/revision/latest?cb=20120926231559",
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/7/78/Adaptive_Strike_%28Strength%29_icon.png/revision/latest?cb=20171104105856",
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/a/a0/Attribute_Shift_%28Agility_Gain%29_icon.png/revision/latest?cb=20120926231600",
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/2/27/Attribute_Shift_%28Strength_Gain%29_icon.png/revision/latest?cb=20120926231603",
    "https://static.wikia.nocookie.net/dota2_gamepedia/images/8/8f/Morph_icon.png/revision/latest?cb=20120926231605",
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    videoPlayerController = VideoPlayerController.network(
        "https://cdn.cloudflare.steamstatic.com/apps/dota2/videos/dota_react/heroes/renders/morphling.webm")
      ..initialize().then((_) {
        setState(() {
          videoPlayerController!.setLooping(true);
        });
      });
    criticalHit = Random().nextDouble() < criticalChancePercent!;
    videoPlayerController!.play();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://cdn.cloudflare.steamstatic.com/apps/dota2/videos/dota_react/abilities/morphling/morphling_morph_agi.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.white.withOpacity(0.6),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Damage"),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  damage = damage! - 1;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Center(
                                child: Text(
                                  damage.toString(),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  damage = damage! + 1;
                                });
                              },
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Crit. Chance"),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (criticalChancePercent! - 0.1 > 0)
                                    criticalChancePercent =
                                        criticalChancePercent! - 0.1;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Center(
                                child: Text(
                                  "${(criticalChancePercent! * 100).toInt().toString()}%",
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (criticalChancePercent! < 1)
                                    criticalChancePercent =
                                        criticalChancePercent! + 0.1;
                                });
                              },
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(listHit.length, (index) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    left: (Random().nextInt(30) +
                            (MediaQuery.of(context).size.width / 2.1))
                        .toDouble(),
                    top: listHit.elementAt(index)["pos"],
                    child: Row(
                      children: [
                        Text(
                          !listHit.elementAt(index)["isCrit"]
                              ? damage.toString()
                              : (damage! * 2).toString(),
                          style: TextStyle(
                            color: !listHit.elementAt(index)["isCrit"]
                                ? Color(0xFFD400FF)
                                : Color(0xFFFF0000),
                            fontSize:
                                !listHit.elementAt(index)["isCrit"] ? 18 : 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Visibility(
                          visible: listHit.elementAt(index)["isCrit"],
                          child: Icon(
                            Icons.flash_on_sharp,
                            color: Color(0xFFFF0000),
                          ),
                        )
                      ],
                    ),
                    onEnd: () {
                      listHit.forEach((element) {
                        Future.delayed(Duration(milliseconds: 100), () {
                          setState(() {
                            listHit.remove(element);
                          });
                        });
                      });
                    },
                  );
                }),
              ),
            ),
            Positioned(
              right: 40,
              bottom: 50,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    criticalHit =
                        Random().nextDouble() < criticalChancePercent!;
                    listHit.add({
                      "pos": 120.0,
                      "isCrit": criticalHit,
                    });
                    currentHealth = currentHealth -
                        (criticalHit ? damage : (damage! * 2))!.toInt();
                  });
                  Future.delayed(Duration(milliseconds: 100), () {
                    setState(() {
                      listHit.forEach((element) {
                        element["pos"] = (Random().nextInt(30) + 60).toDouble();
                      });
                    });
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(5),
                height: 100,
                color: Color(0xFF353535),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: 80,
                            height: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: SizedBox(
                                width: videoPlayerController!.value.size.width,
                                height: videoPlayerController!.value.size.width,
                                child: AspectRatio(
                                  aspectRatio: 1.8,
                                  child: VideoPlayer(videoPlayerController!),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Color(0xFFD88200),
                                  width: 2,
                                ),
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  "$level",
                                  style: TextStyle(
                                    color: Color(0xFFD88200),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Row(
                          children: List.generate(listSkill.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right:
                                      index == (listSkill.length - 1) ? 0 : 5),
                              color: Color(0xFFD1D1D1),
                              width: 40,
                              height: 40,
                              child: Image.network(
                                listSkill.elementAt(index),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 15,
                          width: ((40 + 5) * listSkill.length).toDouble(),
                          child: Stack(
                            children: [
                              LinearProgressIndicator(
                                value: currentHealth / maxHealth,
                                minHeight: 15,
                                color: Colors.green,
                                backgroundColor: Color(0xFF757575),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "$currentHealth / $maxHealth",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 15,
                          width: ((40 + 5) * listSkill.length).toDouble(),
                          child: LinearProgressIndicator(
                            value: 50,
                            minHeight: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 120,
                      height: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.4,
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Color(0xFF4D4D4D),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
