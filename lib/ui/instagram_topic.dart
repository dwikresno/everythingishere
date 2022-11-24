import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class InstagramTopic extends StatefulWidget {
  const InstagramTopic({super.key});

  @override
  State<InstagramTopic> createState() => _InstagramTopicState();
}

class _InstagramTopicState extends State<InstagramTopic>
    with TickerProviderStateMixin {
  var parser = EmojiParser();
  List<String> listSelected = [];
  List<int> listCollapse = [];
  List<AnimationController> _controllerAnimation = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Add topics",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (BuildContext context, int indexParent) {
            _controllerAnimation.add(AnimationController(
              vsync: this,
              duration: Duration(milliseconds: 300),
              upperBound: 0.5,
            ));
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "${parser.get("dancer").code} Topic ${indexParent + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Visibility(
                                visible: listSelected
                                        .where((element) =>
                                            element[0] ==
                                            (indexParent + 1).toString())
                                        .length >
                                    0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      listSelected
                                          .where((element) =>
                                              element[0] ==
                                              (indexParent + 1).toString())
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (listCollapse.contains(indexParent)) {
                                listCollapse.removeWhere(
                                    (element) => element == indexParent);
                                _controllerAnimation[indexParent]
                                  ..reverse(from: 0.5);
                              } else {
                                listCollapse.add(indexParent);
                                _controllerAnimation[indexParent]
                                  ..forward(from: 0.0);
                              }
                            });
                          },
                          child: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(_controllerAnimation[indexParent]),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: listCollapse.contains(indexParent)
                        ? SizedBox.shrink()
                        : Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            runSpacing: 10,
                            spacing: 10,
                            children: List.generate(10, (indexChild) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (listSelected.contains(
                                        "${indexParent + 1}${indexChild + 1}")) {
                                      listSelected.removeWhere((element) =>
                                          element ==
                                          "${indexParent + 1}${indexChild + 1}");
                                    } else {
                                      listSelected.add(
                                          "${indexParent + 1}${indexChild + 1}");
                                    }
                                  });
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: 10, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: listSelected.contains(
                                            "${indexParent + 1}${indexChild + 1}")
                                        ? Colors.green
                                        : Color(0xFFDBDBDB),
                                  ),
                                  child: Text(
                                    "Sub Topic ${indexParent + 1}${indexChild + 1}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: listSelected.contains(
                                                "${indexParent + 1}${indexChild + 1}")
                                            ? Colors.white
                                            : null),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
