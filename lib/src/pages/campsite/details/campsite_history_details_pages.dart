import 'package:flutter/material.dart';

import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';
import 'campsite_details_ctrl.dart';
import 'campsite_history_details_pages_ctrl.dart';

class CampsiteHistoryDetailsPage extends StatefulWidget {
  final Booking booking;
  const CampsiteHistoryDetailsPage({Key? key, required this.booking})
      : super(key: key);

  @override
  State<CampsiteHistoryDetailsPage> createState() =>
      CampsiteHistoryDetailsPageState();
}

class CampsiteHistoryDetailsPageState
    extends State<CampsiteHistoryDetailsPage> {
  late CampsiteHistoryDetailsPageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CampsiteHistoryDetailsPageController(
        booking: widget.booking, campsite: widget.booking.campsite!));
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<CampsiteHistoryDetailsPageController>();
  }

  @override
  Widget build(BuildContext context) {
    int facilitiesCount = controller.campsite.facilities != null
        ? controller.campsite.facilities!.length
        : 0;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black26,
              image: DecorationImage(
                  image: NetworkImage(controller.campsite.thumbnail_image),
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 400,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    controller.campsite.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: 5), // Add margin here
                              child: Text(
                                controller.campsite.address,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                controller.campsite.price.toString(),
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                "/per night",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // const SizedBox(height: 30.0),
                      const SizedBox(height: 30.0),
                      Text(
                        "Booked At : ${controller.booking.check_in} ~  ${controller.booking.check_out}"
                            .toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Number of People : ${controller.booking.number_of_people}"
                            .toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        controller.campsite.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Facilities".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      LimitedBox(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                        Flexible(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                    controller.campsite.facilities![index]),
                              );
                            },
                            itemCount: facilitiesCount,
                          ),
                        ),
                      ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
