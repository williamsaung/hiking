import 'package:flutter/material.dart';

import '../../configs/export_config.dart';
import '../../models/export_models.dart';
import 'my_campsite_ctrl.dart';

class MyCampsitePage extends StatelessWidget {
  final MyCampsitePageController controller =
      Get.put(MyCampsitePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Campsite Page'),
      ),
      body: ListView(
        children: [
          for (var campsite in controller.campsiteList)
            GestureDetector(
              onTap: () {
                if (campsite.status == 1) {
                  print("campsite tapped ${campsite.name}");
                  controller.addCardInfo();
                }
              },
              child: LimitedBox(
                maxHeight: 150,
                child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(campsite.thumbnail_image),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.high),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        campsite.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller
                                            .getStatusName(campsite.status),
                                        style: TextStyle(
                                          color: campsite.status == 2 ||
                                                  campsite.status == 0
                                              ? Colors.red
                                              : Colors
                                                  .green, // Change color as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    campsite.address,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])),
              ),
            ),
          Container(
            height: 150,
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: new InkWell(
                onTap: () {
                  print("tapped");
                  controller.addMyCampsite();
                },
                child: Center(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                            width: 8), // Add some spacing between icon and text
                        Text('Add My Campsite'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     LimitedBox(
      //       child: Column(mainAxisSize: MainAxisSize.min, children: [
      //         Flexible(
      //             child: ListView.builder(
      //           physics: const NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //           itemBuilder: (BuildContext context, int index) {
      //             Campsite campsite = controller.campsiteList[index];
      //             bool isApproved = campsite.is_approved;
      //             return Container(
      //               height: 150,
      //               child: Card(
      //                 elevation: 4,
      //                 margin: EdgeInsets.all(8),
      //                 child: new InkWell(
      //                   onTap: () {},
      //                   child: Center(
      //                     child: ListTile(
      //                       title: Row(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           SizedBox(
      //                             width: 8,
      //                           ), // Add some spacing between icon and text
      //                           Text(campsite.name),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //           itemCount: controller.campsiteList.length,
      //         )),
      //       ]),
      //     ),
      // Container(
      //   height: 150,
      //   child: Card(
      //     elevation: 4,
      //     margin: EdgeInsets.all(8),
      //     child: new InkWell(
      //       onTap: () {
      //         print("tapped");
      //         controller.addMyCampsite();
      //       },
      //       child: Center(
      //         child: ListTile(
      //           title: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(Icons.add),
      //               SizedBox(
      //                   width: 8), // Add some spacing between icon and text
      //               Text('Add My Campsite'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      //     // Add more widgets below as needed
      //   ],
      // ),
    );
  }
}
