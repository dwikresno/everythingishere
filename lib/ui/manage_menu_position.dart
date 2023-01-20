import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

class ManageMenuPosition extends StatefulWidget {
  const ManageMenuPosition({super.key});

  @override
  State<ManageMenuPosition> createState() => _ManageMenuPositionState();
}

class _ManageMenuPositionState extends State<ManageMenuPosition> {
  List<MenuModel> selectedMenu = [
    MenuModel(
      id: 1,
      icon: Icons.notifications,
    ),
    MenuModel(
      id: 2,
      icon: Icons.volume_up,
    ),
    MenuModel(
      id: 3,
      icon: Icons.video_camera_back_rounded,
    ),
    MenuModel(
      id: 4,
      icon: Icons.lock,
    ),
    MenuModel(
      id: 5,
      icon: Icons.wifi,
    ),
    MenuModel(
      id: 6,
      icon: Icons.flash_on,
    ),
    MenuModel(
      id: 7,
      icon: Icons.battery_charging_full_outlined,
    ),
    MenuModel(
      id: 8,
      icon: Icons.nfc_rounded,
    )
  ];

  List<MenuModel> availableMenu = [
    MenuModel(
      id: 9,
      icon: Icons.light_mode_rounded,
    ),
    MenuModel(
      id: 10,
      icon: Icons.dark_mode_outlined,
    ),
    MenuModel(
      id: 11,
      icon: Icons.cast,
    ),
    MenuModel(
      id: 12,
      icon: Icons.remove_red_eye_outlined,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/1080/1920?random=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xFF686868).withOpacity(0.7),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: DraggableGridViewBuilder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    children: List.generate(selectedMenu.length, (index) {
                      return DraggableGridItem(
                        isDraggable: true,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(selectedMenu.elementAt(index).icon),
                            ),
                            Align(
                              alignment: Alignment(1, -1),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    availableMenu
                                        .add(selectedMenu.elementAt(index));
                                    selectedMenu.removeWhere((element) =>
                                        element.id ==
                                        selectedMenu.elementAt(index).id);
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    // isOnlyLongPress: false,
                    dragCompletion: (List<DraggableGridItem> list,
                        int beforeIndex, int afterIndex) {
                      print('onDragAccept: $beforeIndex -> $afterIndex');
                    },
                    dragFeedback: (List<DraggableGridItem> list, int index) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(selectedMenu.elementAt(index).icon),
                      );
                    },
                    dragPlaceHolder: (List<DraggableGridItem> list, int index) {
                      return PlaceHolderWidget(
                        child: Container(
                          color: Colors.transparent,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: availableMenu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(availableMenu.elementAt(index).icon),
                          ),
                          Align(
                            alignment: Alignment(1, -1),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMenu
                                      .add(availableMenu.elementAt(index));
                                  availableMenu.removeWhere((element) =>
                                      element.id ==
                                      availableMenu.elementAt(index).id);
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuModel {
  int? id;
  IconData? icon;

  MenuModel({this.id, this.icon});
}
