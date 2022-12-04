import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({super.key});

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("back");
        if (!isExpand) {
          setState(() {
            isExpand = true;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    child: Container(
                      height: isExpand ? null : 0,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://cdn.buymeacoffee.com/uploads/profile_pictures/2022/10/7R7M4hlaZqAeKb1h.png@300w_0e.webp",
                                  ),
                                  radius: 14,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "4",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.more_vert,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: Text(
                              "Google",
                              style: GoogleFonts.openSans(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: isExpand ? 20 : 10, vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        // controller: searchCtrl,
                        keyboardType: TextInputType.text,
                        onTap: () {
                          setState(() {
                            isExpand = false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search or type web address',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          prefixStyle: TextStyle(fontSize: 12),
                          prefixIcon: isExpand
                              ? null
                              : Container(
                                  padding: EdgeInsets.all(12),
                                  width: 18,
                                  height: 18,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/300/300221.png",
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.mic,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  isExpand ? historyExpand() : historyCollaps()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget historyExpand() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF3F0F0),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://cdn.buymeacoffee.com/uploads/profile_pictures/2022/10/7R7M4hlaZqAeKb1h.png@300w_0e.webp",
              ),
            ),
          );
        },
      ),
    );
  }

  historyCollaps() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              children: [
                Icon(
                  Icons.history,
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Text(
                      "Google",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: -0.9,
                  child: Icon(
                    Icons.arrow_upward,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
