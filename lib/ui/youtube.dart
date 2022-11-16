import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  double posNavbar = 0;
  double heightNavbar = 60;
  bool isShowPanel = false;
  double heightVideoFrame = 220;
  double minusWidth = 0;
  PanelController panelController = PanelController();
  String? selectedImage = "https://picsum.photos/800/800?random=1";
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        backdropOpacity: 0,
        defaultPanelState: PanelState.OPEN,
        maxHeight: isShowPanel ? MediaQuery.of(context).size.height : 0,
        minHeight: isShowPanel ? 70 : 0,
        parallaxOffset: 0.1,
        parallaxEnabled: false,
        controller: panelController,
        body: Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return itemList(index);
            },
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: heightVideoFrame,
                width: double.infinity,
                child: Image.network(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: opacity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  "YOUR VIDEO TITLE IS HERE",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  "7.7M views 2y ago",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      "D'Code",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "4M",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      "Subscribe",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return itemList(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        collapsed: GestureDetector(
          onTap: () {
            panelController.open();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: heightVideoFrame,
                  width: MediaQuery.of(context).size.width - minusWidth,
                  child: Image.network(
                    selectedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Title",
                            maxLines: 1,
                          ),
                          Text(
                            "SubTitle",
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowPanel = false;
                      });
                    },
                    child: Center(
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onPanelSlide: (position) {
          setState(() {
            heightNavbar = 60 - (position * 60);
            posNavbar = -(position * 60);
            opacity = position;
            minusWidth =
                (250 - (position * 2000)) < 0 ? 0 : 250 - (position * 2000);
            if (position * 220 > 70) {
              heightVideoFrame = position * 220;
            } else {
              heightVideoFrame = 70;
            }
          });
        },
      ),
      bottomNavigationBar: Container(
        height: heightNavbar,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: posNavbar,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  // currentIndex: _selectedIndex,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  // onTap: _onItemTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowPanel = true;
          selectedImage = "https://picsum.photos/800/800?random=$index";
        });
        panelController.open();
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.green,
              child: Image.network(
                "https://picsum.photos/800/800?random=$index",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://dwi-kresno.firebaseapp.com/images/dwik1.jpg"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "YOUR VIDEO TITLE IS HERE",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Text(
                              "D'Code",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Text(
                              "4M views",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
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
