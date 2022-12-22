import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class IGModalShareReels extends StatefulWidget {
  const IGModalShareReels({super.key});

  @override
  State<IGModalShareReels> createState() => _IGModalShareReelsState();
}

class _IGModalShareReelsState extends State<IGModalShareReels> {
  VideoPlayerController? videoPlayerController;
  var isMuted = false;
  var visibleMute = false;
  var selected1 = true;
  var selected2 = false;
  bool initialized = false;
  bool isLongPress = false;
  double posX = 0.0;
  double posY = 0.0;
  int currentIndex = -1;
  List listPerson = ['My Love', "Crush", "Lovely", "Waifu"];

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        "https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4")
      ..initialize().then((_) {
        setState(() {
          videoPlayerController!.setLooping(true);
          initialized = true;
        });
      });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (mounted)
        setState(() {
          selected1 = !selected1;
          selected2 = !selected2;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    videoPlayerController!.play();
    return Scaffold(
      body: AnimatedContainer(
        duration: new Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            videoPlayerController!.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: videoPlayerController!.value.size.width,
                      height: videoPlayerController!.value.size.height,
                      child: AspectRatio(
                        aspectRatio: videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController!),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  visibleMute = true;
                });
                if (isMuted) {
                  print("pause");
                  videoPlayerController?.setVolume(1.0);
                  setState(() {
                    isMuted = false;
                  });
                } else {
                  print("unpause");
                  videoPlayerController?.setVolume(0.0);
                  setState(() {
                    isMuted = true;
                  });
                }
                Timer(Duration(seconds: 1), () {
                  print("Yeah, this line is printed after 3 seconds");
                  setState(() {
                    visibleMute = false;
                  });
                });
                //
              },
              child: Container(
                color: Colors.transparent,
                child: AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: visibleMute ? 1.0 : 0.0,
                  duration: Duration(milliseconds: visibleMute ? 100 : 500),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        isMuted ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Container(
                  // height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ExtendedImage.network(
                              'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                              cache: true,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              //cancelToken: cancellationToken,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              "Zeus",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Text(
                          "Traveling with my son... more",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        height: 15,
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    width: 2,
                                    height: selected1 ? 12.0 : 6.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                  AnimatedContainer(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    width: 2,
                                    height: selected2 ? 12.0 : 6.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                  AnimatedContainer(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    width: 2,
                                    height: selected1 ? 12.0 : 6.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                "My Life Be Like",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                "Original Sound",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                color: Colors.transparent,
                width: 350,
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Positioned(
                      right: 45,
                      bottom: 60,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                        height: isLongPress ? 140 : 0,
                        width: isLongPress ? 300 : 0,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 300,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: (75.0 * currentIndex) +
                                  (currentIndex < 3 ? 8 : 5),
                              child: Text(
                                currentIndex < 0
                                    ? ""
                                    : listPerson.elementAt(currentIndex),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: currentIndex >= 0 ? 70 : 55,
                              width: 300,
                              child: Stack(
                                alignment: Alignment.center,
                                children: List.generate(
                                    4,
                                    (index) => Positioned(
                                          left: (70.0 * index) +
                                              (currentIndex == index ? 0 : 10),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.linear,
                                            child: Container(
                                              height: currentIndex == index
                                                  ? 70
                                                  : 50,
                                              width: currentIndex == index
                                                  ? 70
                                                  : 50,
                                              margin: EdgeInsets.only(right: 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  "https://picsum.photos/1080/1080?random=${index + 10}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/reel/like.svg",
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "12.2K",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/reel/comment.svg",
                                      width: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "1k",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("klik");
                            },
                            onLongPressUp: () {
                              setState(() {
                                currentIndex = -1;
                                isLongPress = false;
                              });
                            },
                            onLongPressStart: (LongPressDownDetails) {
                              setState(() {
                                isLongPress = true;
                              });
                            },
                            onLongPressMoveUpdate: (details) {
                              getCurrentFocus(
                                  x: details.localPosition.dx,
                                  y: details.localPosition.dy);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 18,
                              ),
                              child: SvgPicture.asset(
                                "assets/reel/share.svg",
                                width: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ExtendedImage.network(
                                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                                cache: true,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                //cancelToken: cancellationToken,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  getCurrentFocus({required double x, required double y}) {
    print("X : $x");
    print("Y : $y");

    if (y < 55 && y > -20) {
      double tempX = x.abs();
      print("X : $tempX");
      print("Y : $y");

      if (tempX > 30 && tempX < 75) {
        setState(() {
          currentIndex = 3;
        });
      } else if (tempX > 105 && tempX < 145) {
        setState(() {
          currentIndex = 2;
        });
      } else if (tempX > 160 && tempX < 200) {
        setState(() {
          currentIndex = 1;
        });
      } else if (tempX > 240 && tempX < 280) {
        setState(() {
          currentIndex = 0;
        });
      } else {
        setState(() {
          currentIndex = -1;
        });
      }
      print(currentIndex);
    } else {
      setState(() {
        currentIndex = -1;
      });
    }
  }
}
