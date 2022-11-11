import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomMessage extends StatefulWidget {
  final String? username;
  final String? pp;
  final String? your_name;
  const RoomMessage(
      {required this.username, required this.pp, required this.your_name});

  @override
  State<RoomMessage> createState() => _RoomMessageState();
}

class _RoomMessageState extends State<RoomMessage> {
  TextEditingController message = TextEditingController();
  List<Chat> listChat = [];
  final ScrollController listScrollController = ScrollController();
  bool isInfoHide = false;
  double heightImage = 0;
  double widthText = 0;

  sendMessage() {
    setState(() {
      isInfoHide = true;
      listChat.add(
        Chat(
          content: message.text,
          isMine: true,
        ),
      );
      message.clear();
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        heightImage = 40;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(widget.pp!),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.username!,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      "https://static.xx.fbcdn.net/assets/?revision=4055886111304140&name=ig-verifiedbadge-shared&density=1",
                      width: 16,
                    )
                  ],
                ),
                Text(
                  "Business Chat",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF797878),
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          Image.network(
            "https://static.xx.fbcdn.net/assets/?revision=4055886111304140&name=ig-videochat-shared&density=1",
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(widget.pp!),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.username!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.network(
                        "https://static.xx.fbcdn.net/assets/?revision=4055886111304140&name=ig-verifiedbadge-shared&density=1",
                        width: 16,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Instagram",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFF3F3F3F),
                    ),
                  ),
                  Text(
                    "371M followers. 937 posts \nYou've followed this Instagram account since 2017 \nYou both follow 3gerardpique and 1 other",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFFA1A1A1),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "View Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Visibility(
              visible: listChat.isNotEmpty,
              child: Text(
                "Today ${DateFormat('hh:mm a').format(DateTime.now())}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFFB1B0B0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var list in listChat)
              Row(
                children: [
                  list.isMine!
                      ? Expanded(
                          child: SizedBox(),
                        )
                      : SizedBox.shrink(),
                  Visibility(
                    visible: !list.isMine!,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          widget.pp!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    alignment: list.isMine!
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:
                          list.isMine! ? Color(0xff197ae5) : Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      list.content!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: list.isMine! ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  !list.isMine!
                      ? Expanded(
                          child: SizedBox(),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: 10, top: 10),
                height: heightImage,
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          widget.pp!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      height: 40,
                      width: widthText,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: Text(
                        "Typing...",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFFB1B0B0),
                        ),
                        maxLines: 1,
                      ),
                      onEnd: () {
                        Timer(Duration(milliseconds: 500), () {
                          setState(() {
                            heightImage = 0;
                          });
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              listChat.add(
                                Chat(
                                  content: "hola ${widget.your_name}",
                                  isMine: false,
                                ),
                              );
                            });
                          });
                        });
                      },
                    ),
                  ],
                ),
                onEnd: () {
                  setState(() {
                    widthText = 80;
                  });
                },
              ),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: !isInfoHide,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFECECEC),
                  ),
                )),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isInfoHide = true;
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Color(0xFF979797),
                        ),
                      ),
                    ),
                    Text(
                      "Help keep Instagram a supportive place",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Remember to follow our ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFFA1A1A1),
                            height: 1.2,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Community Guidelines',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                },
                            ),
                            TextSpan(
                              text: ' and be respectful when messaging others.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFFA1A1A1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Color(0xFF067FE2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: message,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Message",
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                          )),
                    ),
                  ),
                  message.text != ""
                      ? GestureDetector(
                          onTap: () {
                            sendMessage();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF067FE2),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.mic,
                              size: 28,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.image_outlined,
                              size: 28,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.add_circle_outline_sharp,
                              size: 28,
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chat {
  String? content;
  bool? isMine;

  Chat({this.content, this.isMine});
}
