import 'dart:io';
import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GuessPerson extends StatefulWidget {
  const GuessPerson({super.key});

  @override
  State<GuessPerson> createState() => _GuessPersonState();
}

class _GuessPersonState extends State<GuessPerson> {
  List<TextEditingController> listController = [];
  List<FocusNode> listFocusNode = [];
  List<int> listCard = [];
  List<int> listCardAlreadyOpened = [];
  List<FlipCardController> listrFlipController = [];
  final ImagePicker _picker = ImagePicker();
  TextEditingController words = TextEditingController();
  int maxScore = 10;
  XFile? image;
  String answerString = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initWord(6);
    for (int i = 0; i < 9; i++) {
      listrFlipController.add(FlipCardController());
      listCard.add(i);
    }
    Future.delayed(Duration(milliseconds: 200), () {
      startNew();
    });
  }

  initWord(length) {
    setState(() {
      listController.clear();
      listFocusNode.clear();
      for (int i = 0; i < length; i++) {
        listController.add(TextEditingController());
        listFocusNode.add(FocusNode());
      }
    });
  }

  openRandom() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        var temp = listCard
            .where((element) => !listCardAlreadyOpened.contains(element));
        if (temp.length > 0) {
          var randomIndex = Random().nextInt(temp.length);
          listrFlipController
              .elementAt(temp.elementAt(randomIndex))
              .toggleCard();
          listCardAlreadyOpened.add(temp.elementAt(randomIndex));
        }
      });
    });
  }

  startNew() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Basic dialog title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  image = await _picker.pickImage(source: ImageSource.gallery);
                },
                child: Text("Insert Image"),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.characters,
                controller: words,
                maxLength: 10,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.all(5),
                  fillColor: Colors.grey,
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Start'),
              onPressed: () {
                if (image != null) {
                  listCardAlreadyOpened.clear();
                  initWord(words.text.length);
                  for (int i = 0; i < 9; i++) {
                    if (!listrFlipController.elementAt(i).state!.isFront) {
                      listrFlipController.elementAt(i).toggleCard();
                    }
                  }

                  maxScore = 10;
                  answerString = "";
                  Navigator.of(context).pop();
                  openRandom();
                }
              },
            ),
          ],
        );
      },
    );
  }

  checkAllWord() {
    var answer = [];
    for (int i = 0; i < listController.length; i++) {
      answer.add(listController[i].text.isEmpty ? " " : listController[i].text);
    }
    print(answer.join(""));
    print(words.text);
    print(answer.join("") == words.text);
    if (answer.join("") == words.text) {
      answerString = "correct";
      var temp =
          listCard.where((element) => !listCardAlreadyOpened.contains(element));

      if (temp.length > 0) {
        temp.forEach((element) {
          listrFlipController.elementAt(element).toggleCard();
          listCardAlreadyOpened.add(element);
        });
      }
    } else {
      answerString = "wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          words.clear();
                        });
                        startNew();
                      },
                      child: Text("Start New"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          maxScore--;
                        });
                        openRandom();
                      },
                      child: Text("Help"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Max Score : ${maxScore}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 40,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.file(
                        image == null ? File("") : File(image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                          ),
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return FlipCard(
                              controller: listrFlipController[index],
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              front: Container(
                                color: Colors.blue,
                              ),
                              back: Container(
                                color: Colors.transparent,
                              ),
                              flipOnTouch: false,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: answerString != "",
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    answerString == "wrong" ? "Try Again" : "Perfect",
                    style: TextStyle(
                      fontSize: 30,
                      color:
                          answerString == "wrong" ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Form(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(words.text.length, (index) {
                      return Container(
                        width: (MediaQuery.of(context).size.width /
                                listController.length) -
                            10,
                        margin: EdgeInsets.only(right: 5),
                        child: words.text[index] == " "
                            ? Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              )
                            : TextFormField(
                                textCapitalization:
                                    TextCapitalization.characters,
                                controller: listController[index],
                                focusNode: listFocusNode[index],
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                  fillColor: Colors.grey,
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index == listController.length - 1) {
                                      setState(() {
                                        listFocusNode[index].unfocus();
                                      });
                                      checkAllWord();
                                    } else {
                                      setState(() {
                                        listFocusNode[index].nextFocus();
                                      });
                                    }
                                  } else {
                                    listFocusNode[index].previousFocus();
                                  }
                                },
                              ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
