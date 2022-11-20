import 'package:flutter/material.dart';

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  ScrollController _scrollController = ScrollController();
  double opacity = 0.0;
  double plusSizeWidth = 0.0;
  double plusSizeHeight = 0.0;
  double radius = 0.0;
  double plusY = 0.0;
  double plusX = 0.0;
  double minusSize = 0.0;
  double plusPosAdd = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "FACEBOOK",
          style: TextStyle(
            color: Color(0xff1771e6),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFC5C5C5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                          "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFB1AFAF),
                        ),
                      ),
                      child: Text(
                        "Apa yang anda pikirkan?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.image,
                    color: Color(0xFF58CE5C),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 190,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  NotificationListener(
                    onNotification: (t) {
                      // print(_scrollController.position.pixels);
                      double tempValue =
                          (_scrollController.position.pixels.round() - 45) / 20;
                      if (_scrollController.position.pixels > 45) {
                        setState(() {
                          if (tempValue < 1) {
                            opacity = tempValue;
                          } else {
                            opacity = 1;
                          }
                          if (_scrollController.position.pixels < 77) {
                            plusSizeHeight = tempValue * 18;
                            plusSizeWidth = tempValue * 20;
                            radius = tempValue * 20;
                            minusSize = tempValue * 12;
                            if (_scrollController.position.pixels > 70) {
                              if (tempValue * 2 < 4) {
                                plusPosAdd = tempValue * 4;
                              }
                            }
                          } else {
                            radius = 50;
                          }
                          if (tempValue / 10 < 0.25) {
                            plusY = tempValue / 10;
                          }
                          if (tempValue / 100 < 0.022) {
                            plusX = tempValue / 100;
                          }

                          print(_scrollController.position.pixels);
                          print(tempValue * 2);
                        });
                      } else {
                        setState(() {
                          if (tempValue > 0) {
                            opacity = tempValue;
                          } else {
                            opacity = 0;
                          }
                        });
                      }
                      // print(opacity);
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF7F4F4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 110,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Buat Cerita",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 52,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.add_circle_outlined,
                                      size: 35,
                                      color: Color(0xff1771e6),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 110,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7F4F4),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            "https://picsum.photos/110/180?random=${index + 10}",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Color(0xFF085FD1),
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    "Friend's Name",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.98 - plusX, 0.32 - plusY),
                    child: Opacity(
                      opacity: opacity,
                      child: Container(
                        padding: EdgeInsets.only(right: 3, top: 3, bottom: 3),
                        width: 32 + plusSizeWidth,
                        height: 32 + plusSizeHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50 - radius),
                            topLeft: Radius.circular(50 - radius),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(
                                    "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                              ),
                            ),
                            Positioned(
                              bottom: 0 + plusPosAdd,
                              right: 0 + plusPosAdd,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.add_circle_outlined,
                                  size: 35 - minusSize,
                                  color: Color(0xff1771e6),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                                "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "D'Code",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Image.network(
                      "https://picsum.photos/1080/1080?random=2",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
