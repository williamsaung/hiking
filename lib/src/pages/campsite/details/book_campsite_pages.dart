import 'package:flutter/material.dart';

import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../utils/datetime_util.dart';
import '../../../widgets/export_widgets.dart';
import 'book_campsite_ctrl.dart';

class BookCampsitePage extends StatefulWidget {
  final Campsite campsite;
  const BookCampsitePage({Key? key, required this.campsite}) : super(key: key);

  @override
  State<BookCampsitePage> createState() => BookCampsitePageState();
}

class BookCampsitePageState extends State<BookCampsitePage> {
  late BookCampsitePageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(BookCampsitePageController(campsite: widget.campsite));
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<BookCampsitePageController>();
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
                      Text(
                        "Start Date".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      verticalSpace(10),
                      InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            locale: UserConfig.locale,
                            initialDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppTheme.blue_1,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null &&
                              validateDateTimeRange(
                                from: picked.toStringDate(),
                                to: controller.checkOut.text,
                              )) {
                            controller.setFromCtrl(TextFormatUtil.textFormat
                                .formatCurrentDate(picked));
                          }
                        },
                        child: AbsorbPointer(
                          child: textFormFieldWithHintText(
                              controller: controller.checkIn,
                              keyboardType: TextInputType.datetime,
                              hintText: Texts.texts.from,
                              readonly: true),
                        ),
                      ),
                      verticalSpace(10),
                      Text(
                        "End Date".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            locale: UserConfig.locale,
                            initialDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppTheme.blue_1,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null &&
                              validateDateTimeRange(
                                from: controller.checkIn.text,
                                to: picked.toStringDate(),
                              )) {
                            controller.setToCtrl(TextFormatUtil.textFormat
                                .formatCurrentDate(picked));
                          }
                        },
                        child: AbsorbPointer(
                          child: textFormFieldWithHintText(
                              controller: controller.checkOut,
                              keyboardType: TextInputType.text,
                              hintText: Texts.texts.to,
                              readonly: true),
                        ),
                      ),
                      verticalSpace(10),
                      Text(
                        "Number of People".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      TextField(
                        controller: controller.numberOfPeople,
                        decoration: InputDecoration(
                          labelText: 'Number of People',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      verticalSpace(10),
                      Column(
                        children: List.generate(
                          controller.checkListItems.length,
                          (index) => CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(
                              controller.checkListItems[index]["title"],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            value: controller.checkListItems[index]["value"],
                            onChanged: (value) {
                              setState(() {
                                controller.checkListItems[index]["value"] =
                                    value;
                                if (controller.multipleSelected.contains(
                                    controller.checkListItems[index])) {
                                  controller.multipleSelected
                                      .remove(controller.checkListItems[index]);
                                } else {
                                  controller.multipleSelected
                                      .add(controller.checkListItems[index]);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: const Text(
                            "Book Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            controller.clickBooking();
                          },
                        ),
                      ),
                      verticalSpace(10),
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
