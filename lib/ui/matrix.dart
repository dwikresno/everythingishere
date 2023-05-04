import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Matrix extends StatefulWidget {
  const Matrix({super.key});

  @override
  State<Matrix> createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> {
  List<MatrixModel> listMatrix = [];
  Timer? timer;
  String letter = "マトリックス";
  int randomIndex1 = 0;
  int randomIndex2 = 0;
  int randomIndex3 = 0;
  int randomIndex4 = 0;
  int randomIndex5 = 0;

  @override
  void initState() {
    // // TODO: implement initState
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      var data = MatrixModel(
        size: (Random().nextInt(16) + 4).toDouble(),
        top: -100,
        left: Random().nextDouble() * MediaQuery.of(context).size.width * 0.95,
        duration: Random().nextInt(4) + 2,
      );
      setState(() {
        listMatrix.add(data);
      });
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          listMatrix.last.top = MediaQuery.of(context).size.height;
        });
      });
      var max = letter.length;
      var min = letter.length - 6;
      randomIndex1 = Random().nextInt(max) + min;
      randomIndex2 = Random().nextInt(max) + min;
      randomIndex3 = Random().nextInt(max) + min;
      randomIndex4 = Random().nextInt(max) + min;
      randomIndex5 = Random().nextInt(max) + min;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(
          //         "https://picsum.photos/1080/1920?random=1",
          //       ),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child: ClipRRect(
          //     // make sure we apply clip it properly
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          //       child: Container(
          //         alignment: Alignment.center,
          //         color: Color(0xFF686868).withOpacity(0.1),
          //       ),
          //     ),
          //   ),
          // ),
          Stack(
            children: listMatrix.map((element) {
              return AnimatedPositioned(
                top: element.top,
                left: element.left,
                duration: Duration(seconds: element.duration!),
                curve: Curves.linear,
                child: Column(
                  children: [
                    Text(
                      letter[randomIndex1],
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 54, 2),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      letter[randomIndex2],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 1, 78, 4),
                      ),
                    ),
                    Text(
                      letter[randomIndex3],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 2, 128, 6),
                      ),
                    ),
                    Text(
                      letter[randomIndex1],
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 141, 7),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      letter[randomIndex2],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 1, 160, 6),
                      ),
                    ),
                    Text(
                      letter[randomIndex3],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF01B407),
                      ),
                    ),
                    Text(
                      letter[randomIndex4],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF01B407),
                      ),
                    ),
                    Text(
                      letter[randomIndex5],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class MatrixModel {
  double? size;
  double? top;
  double? left;
  int? duration;

  MatrixModel({this.size, this.top, this.left, this.duration});

  MatrixModel.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    top = json['top'];
    left = json['left'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['top'] = this.top;
    data['left'] = this.left;
    data['duration'] = this.duration;
    return data;
  }
}
