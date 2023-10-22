import 'package:map_location_picker/map_location_picker.dart';

import '../../../configs/export_config.dart';
import '../../../models/campsite/CampsiteModel.dart';
import '../../../widgets/export_widgets.dart';
import 'add_campsite_form_ctrl.dart';
import 'add_package_pages.dart';

class AddCampsiteFormPage extends StatefulWidget {
  const AddCampsiteFormPage({Key? key}) : super(key: key);

  @override
  State<AddCampsiteFormPage> createState() => _AddCampsiteFormPageState();
}

class _AddCampsiteFormPageState extends State<AddCampsiteFormPage> {
  final AddCampsiteFormPageController controller =
      Get.put(AddCampsiteFormPageController());
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Campsite Form Page'),
        ),
        body: ListView(
          // Wrap your content with ListView
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Campsite Name',
                      ),
                    ),
                    verticalSpace(15),
                    TextField(
                      controller: controller.description,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          filled: true, hintText: 'Enter Campsite description'),
                    ),
                    verticalSpace(15),
                    TextFormField(
                      controller: controller.price,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Campsite Price',
                      ),
                    ),
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
                              controller.checkListItems[index]["value"] = value;
                              if (controller.multipleSelected
                                  .contains(controller.checkListItems[index])) {
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
                    verticalSpace(15),
                    ElevatedButton(
                      child: const Text('Search for address on map'),
                      onPressed: () async {
                        controller.selectLocation(context);
                      },
                    ),
                    verticalSpace(15),
                    Center(
                      child: Obx(
                        () => TextFormField(
                          controller: controller.addressField.value,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter Campsite Address',
                          ),
                          onChanged: (value) {
                            controller.address.value = value;
                          },
                        ),
                      ),
                    ),
                    verticalSpace(15),
                    TextFormField(
                      controller: controller.phoneNumber,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Campsite Phone Number',
                      ),
                    ),
                    verticalSpace(15),
                    Obx(() {
                      if (controller.selectedImageCount.value > 0) {
                        return Expanded(
                          child: GridView.builder(
                            itemCount: controller.selectedImageCount.value,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: ((context, index) {
                              return Image.file(
                                File(controller.selectedImagesPath[index]),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              );
                            }),
                          ),
                        );
                      } else {
                        return SizedBox
                            .shrink(); // This will render an empty, zero-sized box
                      }
                    }),
                    verticalSpace(15),
                    ElevatedButton(
                      onPressed: () {
                        controller.selectMultipleImage();
                      },
                      child: const Text('Select Images'),
                    ),
                    verticalSpace(15),
                    RadioListTile<bool>(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: const Text(
                        'Regular Package',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: true,
                      groupValue: controller.packageType.value,
                      onChanged: (value) {
                        setState(() {
                          controller.packageType.value = value as bool;
                        });
                      },
                    ),
                    RadioListTile<bool>(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: false,
                      groupValue: controller.packageType.value,
                      onChanged: (value) {
                        setState(() {
                          controller.packageType.value = value as bool;
                          if (value) {
                            print('Go Premium selected');
                          }
                        });
                      },
                    ),
                    verticalSpace(15),
                    Obx(() {
                      // count the number of packages
                      int packageCount = controller.packages.length;
                      if (packageCount > 0) {
                        return LimitedBox(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              Flexible(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Package package =
                                        controller.packages[index];
                                    return ListTile(
                                      title: Text(package.name),
                                      subtitle: Text(package.price.toString()),
                                    );
                                  },
                                  itemCount: packageCount,
                                ),
                              ),
                            ]));
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    Obx(() {
                      if (controller.packageType.value != true) {
                        return ElevatedButton(
                          onPressed: () {
                            // Navigate to the Add Package page
                            controller.addPackage(controller);
                          },
                          child: const Text('Add Package'),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.onClickAddCampsite();
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
