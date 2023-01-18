import 'dart:math';

import 'package:flutter/material.dart';

class DailyReward extends StatefulWidget {
  const DailyReward({super.key});

  @override
  State<DailyReward> createState() => _DailyRewardState();
}

class _DailyRewardState extends State<DailyReward> {
  int gold = 0;
  int diamond = 0;
  List listGiftType = [GiftType.diamond, GiftType.gold];
  List<List<GiftModel>> dailyGrid = [];
  bool isLoading = false;
  int lastOpened = 0;
  int totalDay = 0;

  @override
  void initState() {
    super.initState();
    reset();
  }

  reset() {
    setState(() {
      dailyGrid = [
        [
          GiftModel.fromJson({
            "number_of_day": 1,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(20) + 5,
            "claimed": false,
          }),
          GiftModel.fromJson({
            "number_of_day": 2,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(25) + 10,
            "claimed": false,
          }),
          GiftModel.fromJson({
            "number_of_day": 3,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(30) + 15,
            "claimed": false,
          }),
        ],
        [
          GiftModel.fromJson({
            "number_of_day": 4,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(35) + 20,
            "claimed": false,
          }),
          GiftModel.fromJson({
            "number_of_day": 5,
            "gift": GiftType.diamond,
            "count": Random().nextInt(40) + 25,
            "claimed": false,
          }),
          GiftModel.fromJson({
            "number_of_day": 6,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(45) + 30,
            "claimed": false,
          }),
        ],
        [
          GiftModel.fromJson({
            "number_of_day": 7,
            "gift": listGiftType.elementAt(Random().nextInt(2)),
            "count": Random().nextInt(100 + totalDay) + (50 + totalDay),
            "claimed": false,
          }),
        ]
      ];
      lastOpened = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          "assets/gift/gold.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        gold.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(width: 100),
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          "assets/gift/diamond.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        diamond.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Daily Rewards",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey,
                                ),
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Text(
                                      totalDay.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${totalDay > 1 ? "Days" : "Day"}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: LinearProgressIndicator(
                                          value: (totalDay > 10 &&
                                                      (totalDay % 10) != 0
                                                  ? (totalDay % 10)
                                                  : totalDay) /
                                              10,
                                          color: Colors.green,
                                          backgroundColor: Colors.grey,
                                          minHeight: 30,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: List.generate(5, (index) {
                                            return Expanded(
                                              child: Container(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.network(
                                                        'https://cdn-icons-png.flaticon.com/512/1355/1355876.png',
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        (((index + 1) * 2) +
                                                                (totalDay ~/
                                                                        10) *
                                                                    10)
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    dailyGrid.length,
                    (indexColumn) {
                      return Row(
                        children: List.generate(
                          dailyGrid.elementAt(indexColumn).length,
                          (indexRow) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  claimReward(dailyGrid
                                      .elementAt(indexColumn)
                                      .elementAt(indexRow));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: dailyGrid
                                            .elementAt(indexColumn)
                                            .elementAt(indexRow)
                                            .claimed!
                                        ? Color(0xFF2EE234)
                                        : Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Day ${dailyGrid.elementAt(indexColumn).elementAt(indexRow).numberOfDay!}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 32,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA8A8A8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              padding: EdgeInsets.all(dailyGrid
                                                          .elementAt(
                                                              indexColumn)
                                                          .elementAt(indexRow)
                                                          .gift ==
                                                      GiftType.gold
                                                  ? 15
                                                  : 0),
                                              child: Image.asset(
                                                dailyGrid
                                                            .elementAt(
                                                                indexColumn)
                                                            .elementAt(indexRow)
                                                            .gift ==
                                                        GiftType.gold
                                                    ? "assets/gift/gold.png"
                                                    : "assets/gift/diamond.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(0, 1),
                                              child: Text(
                                                "X ${dailyGrid.elementAt(indexColumn).elementAt(indexRow).count!}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }

  claimReward(GiftModel giftModel) {
    if (!giftModel.claimed! && (giftModel.numberOfDay! - lastOpened) == 1) {
      setState(() {
        if (giftModel.gift == GiftType.gold) {
          gold = gold + giftModel.count!;
        } else {
          diamond = diamond + giftModel.count!;
        }
        giftModel.claimed = true;
        lastOpened = giftModel.numberOfDay!;
        totalDay = totalDay + 1;
        if (giftModel.numberOfDay == 7) {
          isLoading = true;
          Future.delayed(Duration(seconds: 1), () {
            reset();
            isLoading = false;
          });
        }
      });
    }
  }
}

class GiftModel {
  int? numberOfDay;
  GiftType? gift;
  int? count;
  bool? claimed;

  GiftModel({this.numberOfDay, this.gift, this.count, this.claimed});

  GiftModel.fromJson(Map<String, dynamic> json) {
    numberOfDay = json['number_of_day'];
    gift = json['gift'];
    count = json['count'];
    claimed = json['claimed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_of_day'] = this.numberOfDay;
    data['gift'] = this.gift;
    data['count'] = this.count;
    data['claimed'] = this.claimed;
    return data;
  }
}

enum GiftType {
  gold,
  diamond,
}
