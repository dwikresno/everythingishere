import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class IGNote extends StatefulWidget {
  const IGNote({super.key});

  @override
  State<IGNote> createState() => _IGNoteState();
}

class _IGNoteState extends State<IGNote> {
  var listVerifiedUser = [
    {
      "pp": "https://picsum.photos/200/200?random=1",
      "username": "cristiano",
      "fullname": "Cristiano Ronaldo",
      "active": "5m ago",
      "note": "yamete",
    },
    {
      "pp": "https://picsum.photos/200/200?random=2",
      "username": "therock",
      "fullname": "Dwayne Johnson",
      "active": "1h ago",
      "note": "Woi",
    },
    {
      "pp": "https://picsum.photos/200/200?random=3",
      "username": "kevinhart4real",
      "fullname": "Kevin Hart",
      "active": "30m ago",
      "note": "Coeggg",
    },
    {
      "pp": "https://picsum.photos/200/200?random=4",
      "username": "leomessi",
      "fullname": "Leo Messi",
      "active": "30m ago",
      "note": "GOAT",
    },
    {
      "pp": "https://picsum.photos/200/200?random=5",
      "username": "kendalljenner",
      "fullname": "Kendall",
      "active": "30m ago",
      "note": "ara ara",
    },
  ];

  String myNote = "";
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              "dwikresno11",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            UniconsLine.edit,
            size: 24,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffefefef),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Color(0xff9c9c9c),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff9c9c9c),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    shrinkWrap: true,
                    itemCount: listVerifiedUser.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Visibility(
                            visible: index == 0,
                            child: Container(
                              margin: EdgeInsets.only(right: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 92,
                                    width: 92,
                                    // color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg",
                                            ),
                                          ),
                                        ),
                                        myNote.isEmpty
                                            ? Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    modalSetNote();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(2),
                                                    // width: 50,
                                                    height: 45,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xFFD6D5D5),
                                                                blurRadius: 1.0,
                                                                spreadRadius:
                                                                    1.0,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 8,
                                                          left: 9,
                                                          child: Container(
                                                            width: 10,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 4,
                                                          left: 6,
                                                          child: Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  height: 58,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xFFE9E7E7),
                                                                blurRadius: 1.0,
                                                                spreadRadius:
                                                                    1.0,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Text(
                                                            myNote,
                                                            maxLines: 3,
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 20,
                                                        right: 12,
                                                        child: Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 16,
                                                        right: 20,
                                                        child: Container(
                                                          width: 5,
                                                          height: 5,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Your Note",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 92,
                                  width: 92,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            listVerifiedUser
                                                .elementAt(index)['pp']!,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            modalSetNote();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            // width: 50,
                                            height: 45,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0xFFE9E7E7),
                                                        blurRadius: 1.0,
                                                        spreadRadius: 1.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Text(
                                                    listVerifiedUser.elementAt(
                                                        index)['note']!,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 16,
                                                  right: 10,
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 10,
                                                  right: 18,
                                                  child: Container(
                                                    width: 5,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Colors.white,
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
                                  height: 5,
                                ),
                                Text(
                                  listVerifiedUser
                                      .elementAt(index)['username']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Primary",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "General",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFbebebe),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Requests",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFbebebe),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listVerifiedUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xfff1cf6f),
                                    Color(0xffed781c),
                                    Color(0xffcb2770),
                                    Color(0xff8e2db5),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    listVerifiedUser.elementAt(index)['pp']!,
                                  ),
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  listVerifiedUser
                                      .elementAt(index)['fullname']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
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
                            subtitle: Text(
                              "Active " +
                                  listVerifiedUser.elementAt(index)['active']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF797878),
                              ),
                            ),
                            trailing: Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF797878),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  modalSetNote() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Basic dialog title'),
          actionsAlignment: MainAxisAlignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Your Note'),
              TextFormField(
                controller: noteController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.all(5),
                  fillColor: Colors.grey,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  myNote = noteController.text;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
