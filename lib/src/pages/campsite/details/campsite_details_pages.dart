import 'package:flutter/material.dart';

import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';
import 'campsite_details_ctrl.dart';

class CampsiteDetailsPage extends StatefulWidget {
  final Campsite campsite;
  const CampsiteDetailsPage({Key? key, required this.campsite})
      : super(key: key);

  @override
  State<CampsiteDetailsPage> createState() => CampsiteDetailsPageState();
}

class CampsiteDetailsPageState extends State<CampsiteDetailsPage> {
  late CampsiteDetailsPageController controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.put(CampsiteDetailsPageController(campsite: widget.campsite));
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<CampsiteDetailsPageController>();
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
                    widget.campsite.name,
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
                      const SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 32.0,
                                  ),
                                ),
                                child: const Text(
                                  "Message",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                                onPressed: () {
                                  controller.goMessage();
                                  // Add your onPressed logic for Button 1
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 10), // Add some space between the buttons
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Colors
                                      .blue, // You can change the color for Button 2
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 32.0,
                                  ),
                                ),
                                child: const Text(
                                  "Book",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                                onPressed: () {
                                  controller.goBook();
                                  // Add your onPressed logic for Button 2
                                },
                              ),
                            ),
                          ),
                        ],
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
                "Back",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
