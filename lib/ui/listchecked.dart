import 'package:flutter/material.dart';

class ListChecked extends StatefulWidget {
  const ListChecked({super.key});

  @override
  State<ListChecked> createState() => _ListCheckedState();
}

class _ListCheckedState extends State<ListChecked> {
  List selected = [];

  Color color1 = Color(0xff128c7e);
  Color color2 = Color(0xff075e54);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: AnimatedSwitcher(
            switchInCurve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>(selected.isEmpty ? "appbar1" : "appbar2"),
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: color1,
              ),
              child: selected.isEmpty ? mainAppbar() : secondAppbar(),
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onLongPress: () {
                  setState(() {
                    if (selected.contains(index)) {
                      selected.removeWhere((element) => element == index);
                    } else {
                      selected.add(index);
                    }
                  });
                },
                onTap: () {
                  setState(() {
                    if (selected.isNotEmpty) {
                      if (selected.contains(index)) {
                        selected.removeWhere((element) => element == index);
                      } else {
                        selected.add(index);
                      }
                    }
                  });
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  // color: Colors.amber,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/100/100?random=$index',
                          scale: 1,
                        ),
                      ),
                      selected.contains(index)
                          ? Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: color1,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
                title: Text("Name $index"),
                subtitle: Text("Chat $index"),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget mainAppbar() {
    return Container(
      key: ValueKey<String>("appbar1"),
      child: Text("WHATSAPP"),
    );
  }

  Widget secondAppbar() {
    return Container(
      key: ValueKey<String>("appbar2"),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected.clear();
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              selected.length.toString(),
            ),
          ),
          Icon(
            Icons.push_pin_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.volume_off_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
