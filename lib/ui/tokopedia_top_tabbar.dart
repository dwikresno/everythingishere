import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TokopediaTopTabbar extends StatefulWidget {
  const TokopediaTopTabbar({super.key});

  @override
  State<TokopediaTopTabbar> createState() => _TokopediaTopTabbarState();
}

class _TokopediaTopTabbarState extends State<TokopediaTopTabbar> {
  CarouselController carouselController = CarouselController();
  double posList1 = 0.0;
  double opacity1 = 1.0;
  double posList2 = 0.0;
  double opacity2 = 1.0;
  final ScrollController _scrollController = ScrollController();
  var tabbarCount = 8;
  String direction = "up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff3eac44),
      //   elevation: 0,
      // ),
      body: DefaultTabController(
        length: tabbarCount,
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (_scrollController.position.userScrollDirection ==
                ScrollDirection.reverse) {
              direction = "up";
            } else if (_scrollController.position.userScrollDirection ==
                ScrollDirection.forward) {
              direction = "down";
            }
            print(direction);
            setState(() {});
            return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text("search"),
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: direction == "up"
                    ? null
                    : PreferredSize(
                        preferredSize: Size.fromHeight(40.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Dikirim ke rumah kamu",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    tabs: List<Widget>.generate(tabbarCount, (index) {
                      return Tab(
                        height: direction == "up" ? 50 : 80,
                        icon: Container(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              Image.network(
                                "https://cdn-icons-png.flaticon.com/512/3465/3465876.png",
                                width: 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: direction == "up" ? 10 : 0),
                                child: Text("Menu 1"),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget1(),
                      SizedBox(height: 20),
                      widget2(),
                      SizedBox(height: 20),
                      widget1(),
                      SizedBox(height: 20),
                      widget2(),
                      SizedBox(height: 20),
                      widget1(),
                      SizedBox(height: 20),
                      widget2(),
                    ],
                  ),
                ),
              ),
            ],

            // body: NotificationListener<ScrollNotification>(
            //   onNotification: (scrollNotification) {
            //     if (_scrollController.position.userScrollDirection ==
            //         ScrollDirection.reverse) {
            //       direction = "up";
            //     } else if (_scrollController.position.userScrollDirection ==
            //         ScrollDirection.forward) {
            //       direction = "down";
            //     }
            //     print(direction);
            //     return true;
            //   },
            //   child: SingleChildScrollView(
            //     controller: _scrollController,
            //     child: ,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  Widget widget1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kejar Diskon Spesial",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  // color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Berakhir dalam",
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w900,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 340,
          color: Color(0xff1c994e),
          child: Stack(
            children: [
              Positioned(
                left: posList1,
                bottom: 0,
                child: Opacity(
                  opacity: opacity1,
                  child: Container(
                    child: Image.network(
                      "https://images.tokopedia.net/img/cache/240/PYbRbC/2022/11/15/6a8a4d22-289b-42ab-8cbc-b1107c6608c1.png.webp?ect=4g",
                      scale: 1.8,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 15,
                  options: CarouselOptions(
                    height: 340,
                    // aspectRatio: 0.2,
                    viewportFraction: 0.35,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    onScrolled: (value) {
                      setState(() {
                        if (value! < 1.2) {
                          posList1 = -value * 50;
                        }
                        if (value < 0.5) {
                          opacity1 = -value + 1;
                        }
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                "https://dummyjson.com/image/i/products/${itemIndex + 1}/1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff63d88a),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Kejar Diskon Spesial",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rp 16.600",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    // color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        "23%",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Rp 20.600",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget widget2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Belanja YuK!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  // color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Spesial untuk kamu!",
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w900,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 340,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff8aa3ee),
                Color(0xff1bc4c2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: posList2,
                bottom: 0,
                child: Opacity(
                  opacity: opacity2,
                  child: Container(
                    child: Image.network(
                      "https://images.tokopedia.net/img/cache/240/PYbRbC/2022/11/12/ed78a748-316d-46a3-bbfd-6208e8b16cb3.png.webp?ect=4g",
                      scale: 1.8,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 15,
                  options: CarouselOptions(
                    height: 340,
                    // aspectRatio: 0.2,
                    viewportFraction: 0.35,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                    onScrolled: (value) {
                      setState(() {
                        if (value! < 1.2) {
                          posList2 = -value * 50;
                        }

                        if (value < 0.5) {
                          opacity2 = -value + 1;
                        }
                      });
                    },
                  ),
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                "https://dummyjson.com/image/i/products/${itemIndex + 1}/1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff63d88a),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Kejar Diskon Spesial",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rp 16.600",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    // color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        "23%",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Rp 20.600",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
