import 'package:flutter/material.dart';

class Piano extends StatefulWidget {
  Piano({Key? key}) : super(key: key);

  @override
  State<Piano> createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  List whiteColor = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  List blackColor = [
    1,
    2,
    3,
    null,
    4,
    5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                width: double.infinity,
                height: double.infinity,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                // ),
                child: Row(
                    children: whiteColor.map((e) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }).toList()),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 40,
                    right: 40,
                  ),
                  width: double.infinity,
                  height: 50,
                  // decoration: BoxDecoration(
                  //   color: Colors.orange,
                  // ),
                  child: Row(
                      children: blackColor.map((e) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }).toList()),
                ),
              ),
            ],
          ),
          // child: ,
        ),
      ),
    );
  }
}
