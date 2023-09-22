import 'package:flutter/material.dart';

class PancakeSort extends StatefulWidget {
  const PancakeSort({super.key});

  @override
  State<PancakeSort> createState() => _PancakeSortState();
}

class _PancakeSortState extends State<PancakeSort> {
  List listArray = [5, 6, 3, 2, 4, 7, 8, 1];

  runSort() {
    for (var i = listArray.length - 1; i >= 1; i--) {
      var max_idx = 0;
      var max = listArray[0];
      for (var j = 1; j <= i; j++) {
        if (listArray[j] > max) {
          max = listArray[j];
          max_idx = j;
        }
      }
      var new_slice;
      if (max_idx > 0) {
        new_slice = listArray.sublist(0, max_idx + 1).reversed.toList();
        for (int j = 0; j <= max_idx; j++) {
          setState(() {
            listArray[j] = new_slice[j];
          });
        }
      }
      print("slice 1 : $listArray");
      new_slice = listArray.sublist(0, i + 1).reversed.toList();
      for (int j = 0; j <= i; j++) {
        setState(() {
          listArray[j] = new_slice[j];
        });
      }
      print("slice : $listArray");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var list in listArray)
              Container(
                height: 40,
                width: list * 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFCEA862),
                ),
                child: Center(
                  child: Text(
                    list.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                runSort();
              },
              child: Text(
                "Sort",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
