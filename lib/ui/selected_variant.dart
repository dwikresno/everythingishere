import 'package:flutter/material.dart';

class SelectedVariant extends StatefulWidget {
  const SelectedVariant({super.key});

  @override
  State<SelectedVariant> createState() => _SelectedVariantState();
}

class _SelectedVariantState extends State<SelectedVariant> {
  VariantModel variantModel = VariantModel();
  int selectedVariant1 = 0; //id variant 1
  int selectedVariant2 = 0; //id variant 2
  bool isBottomSheetOpened = false;

  @override
  void initState() {
    variantModel = VariantModel.fromJson(dataJson);
    print(variantModel.variant1Name);
    selectedVariant1 = variantModel.variant1!.first.idVariant1!;
    selectedVariant2 = variantModel.variant1!.first.variant2!
        .firstWhere((element) => element.stok != 0)
        .idVariant2!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 100,
              child: Image.network(
                "https://dummyjson.com/image/i/products/1/1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp 8.000.000",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "iPhone 9 Garansi Resmi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Terjual 1.600",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 4,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih Varian",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Wrap(
                      children: variantModel.variant1!.map((item) {
                        return widgetButtonVariannt(
                          id: item.idVariant1,
                          lable: item.namaVariant1!,
                          selected: selectedVariant1 == item.idVariant1!,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: bottonBottom(),
    );
  }

  Widget widgetButtonVariannt(
      {required id,
      StateSetter? setStateTemp,
      lable,
      selected = false,
      disable = false,
      variant = 1}) {
    return GestureDetector(
      onTap: () {
        if (isBottomSheetOpened) {
          setStateTemp!(() {
            if (variant == 1) {
              selectedVariant1 = id;
            } else {
              selectedVariant2 = id;
            }
          });
          setState(() {});
        } else {
          showModal();
          setState(() {
            isBottomSheetOpened = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected
                ? Color(0xff20CE7D)
                : disable
                    ? Color(0xffF0F3F7)
                    : Color(0xffBFC9D9),
          ),
          borderRadius: BorderRadius.circular(12),
          color: selected
              ? Color(0xff00AA5B).withOpacity(0.2)
              : disable
                  ? Color(0xffF0F3F7)
                  : Colors.transparent,
        ),
        child: Text(
          lable,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: selected ? Color(0xff00AA5B) : Color(0xff6D7588),
          ),
        ),
      ),
    );
  }

  Widget bottonBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff9FA6B0),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.chat_outlined,
                  color: Color(0xff9FA6B0),
                ),
              ),
              Expanded(
                child: variantModel.variant1!
                            .firstWhere((element) =>
                                element.idVariant1 == selectedVariant1)
                            .variant2!
                            .firstWhere((element) =>
                                element.idVariant2 == selectedVariant2)
                            .stok ==
                        0
                    ? Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff00AA5B),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Ingatkan Saya",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00AA5B),
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff00AA5B),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Beli Langsung",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff00AA5B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff00AA5B),
                              ),
                              child: Center(
                                child: Text(
                                  "+ Keranjang",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateTemp) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          "https://dummyjson.com/image/i/products/1/1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xffE4EBF5),
                                  ),
                                  child: Text(
                                    variantModel.variant1!
                                        .firstWhere((element) =>
                                            element.idVariant1 ==
                                            selectedVariant1)
                                        .namaVariant1!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7588),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xffE4EBF5),
                                  ),
                                  child: Text(
                                    variantModel.variant1!
                                        .firstWhere((element) =>
                                            element.idVariant1 ==
                                            selectedVariant1)
                                        .variant2!
                                        .firstWhere((element) =>
                                            element.idVariant2 ==
                                            selectedVariant2)
                                        .namaVariant2!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7588),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rp 8.000.000",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Stok : ${variantModel.variant1!.firstWhere((element) => element.idVariant1 == selectedVariant1).variant2!.firstWhere((element) => element.idVariant2 == selectedVariant2).stok!}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    height: 4,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        variantModel.variant1Name!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Wrap(
                          children: variantModel.variant1!.map((item) {
                            return widgetButtonVariannt(
                              id: item.idVariant1,
                              setStateTemp: setStateTemp,
                              lable: item.namaVariant1!,
                              selected: selectedVariant1 == item.idVariant1!,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        variantModel.variant2Name!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Wrap(
                          children: variantModel.variant1!
                              .firstWhere((element) =>
                                  element.idVariant1 == selectedVariant1)
                              .variant2!
                              .map((item) {
                            return widgetButtonVariannt(
                              id: item.idVariant2,
                              setStateTemp: setStateTemp,
                              lable: item.namaVariant2!,
                              selected: selectedVariant2 == item.idVariant2!,
                              variant: 2,
                              disable: item.stok == 0,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: variantModel.variant1!
                          .firstWhere((element) =>
                              element.idVariant1 == selectedVariant1)
                          .variant2!
                          .firstWhere((element) =>
                              element.idVariant2 == selectedVariant2)
                          .stok ==
                      0,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Stok Habis. Klik Ingatkan Saya untuk aktifkan pengingat ketika barang kembali tersedia.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                bottonBottom()
              ],
            ),
          );
        });
      },
    ).then((value) {
      setState(() {
        isBottomSheetOpened = false;
      });
    });
  }
}

var dataJson = {
  "variant1_name": "Ukuran",
  "variant2_name": "Warna",
  "variant1": [
    {
      "idVariant1": 1,
      "namaVariant1": "128BG",
      "variant2": [
        {"idVariant2": 1, "namaVariant2": "Biru", "stok": 10},
        {"idVariant2": 2, "namaVariant2": "Midnight", "stok": 0},
        {"idVariant2": 3, "namaVariant2": "Pink", "stok": 0}
      ]
    },
    {
      "idVariant1": 2,
      "namaVariant1": "258BG",
      "variant2": [
        {"idVariant2": 1, "namaVariant2": "Biru", "stok": 0},
        {"idVariant2": 2, "namaVariant2": "Midnight", "stok": 10},
        {"idVariant2": 3, "namaVariant2": "Pink", "stok": 0}
      ]
    },
    {
      "idVariant1": 3,
      "namaVariant1": "512BG",
      "variant2": [
        {"idVariant2": 1, "namaVariant2": "Biru", "stok": 10},
        {"idVariant2": 2, "namaVariant2": "Midnight", "stok": 10},
        {"idVariant2": 3, "namaVariant2": "Pink", "stok": 10}
      ]
    }
  ]
};

class VariantModel {
  String? variant1Name;
  String? variant2Name;
  List<Variant1>? variant1;

  VariantModel({this.variant1Name, this.variant2Name, this.variant1});

  VariantModel.fromJson(Map<String, dynamic> json) {
    variant1Name = json['variant1_name'];
    variant2Name = json['variant2_name'];
    if (json['variant1'] != null) {
      variant1 = <Variant1>[];
      json['variant1'].forEach((v) {
        variant1!.add(new Variant1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant1_name'] = this.variant1Name;
    data['variant2_name'] = this.variant2Name;
    if (this.variant1 != null) {
      data['variant1'] = this.variant1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variant1 {
  int? idVariant1;
  String? namaVariant1;
  List<Variant2>? variant2;

  Variant1({this.idVariant1, this.namaVariant1, this.variant2});

  Variant1.fromJson(Map<String, dynamic> json) {
    idVariant1 = json['idVariant1'];
    namaVariant1 = json['namaVariant1'];
    if (json['variant2'] != null) {
      variant2 = <Variant2>[];
      json['variant2'].forEach((v) {
        variant2!.add(new Variant2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idVariant1'] = this.idVariant1;
    data['namaVariant1'] = this.namaVariant1;
    if (this.variant2 != null) {
      data['variant2'] = this.variant2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variant2 {
  int? idVariant2;
  String? namaVariant2;
  int? stok;

  Variant2({this.idVariant2, this.namaVariant2, this.stok});

  Variant2.fromJson(Map<String, dynamic> json) {
    idVariant2 = json['idVariant2'];
    namaVariant2 = json['namaVariant2'];
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idVariant2'] = this.idVariant2;
    data['namaVariant2'] = this.namaVariant2;
    data['stok'] = this.stok;
    return data;
  }
}
