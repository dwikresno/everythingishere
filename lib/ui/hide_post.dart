import 'package:flutter/material.dart';

class HidePost extends StatefulWidget {
  const HidePost({super.key});

  @override
  State<HidePost> createState() => _HidePostState();
}

class _HidePostState extends State<HidePost> {
  List listHidden = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return itemWidget(index);
        },
      ),
    );
  }

  Widget itemWidget(index) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      // height: width,
      // width: width,
      decoration: BoxDecoration(),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: listHidden.contains(index)
            ? afterHide(index)
            : Container(
                key: ValueKey<String>("before"),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                "https://picsum.photos/100/100?random=$index",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                "Name $index",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModal(index);
                            },
                            child: Icon(
                              Icons.more_vert,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      child: Image.network(
                        "https://picsum.photos/100/100?random=$index",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget afterHide(index) {
    return Container(
      key: ValueKey<String>("after"),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Icon(
            Icons.check_circle,
            size: 30,
            color: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Post already hide",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              setState(() {
                listHidden.removeWhere((element) => element == index);
              });
            },
          ),
        ],
      ),
    );
  }

  showModal(index) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Hide Post'),
                  onPressed: () {
                    setState(() {
                      listHidden.add(index);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
