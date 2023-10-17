import '../../../configs/export_config.dart';
import '../../../models/export_models.dart';
import '../../../widgets/export_widgets.dart';

class AddPackagePageController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();

  addPackage() {
    String packageName = name.text;
    double packagePrice = double.parse(price.text);
    String packageDescription = description.text;

    // Create a Package object
    Package newPackage = Package(
      name: packageName,
      price: packagePrice,
      description: packageDescription,
      images: [], // You can add logic to handle images if needed
    );

    // Clear the text fields
    name.clear();
    description.clear();
    price.clear();

    Get.back(result: newPackage);
  }

  // ... (rest of your controller code)
}
