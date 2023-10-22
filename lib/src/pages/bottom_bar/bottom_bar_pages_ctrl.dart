import 'package:hiking/src/pages/map/map_page.dart';

import '../../configs/export_config.dart';
import 'package:hiking/src/utils/base_controller/base_controller.dart';
import 'package:flutter/material.dart';

import '../../constants/export_constants.dart';

class BottomBarPagesController extends BaseController with StateMixin {
  var currentIndex = 0.obs;
  var productNumber = 0.obs;
  var isInMainPage = true.obs;
  var isUserPage = true.obs;
  var currentRouteName = ''.obs;

  final pages = <String>[
    Routes.profile,
    Routes.map,
    Routes.favorite,
    Routes.history,
    Routes.chat,
  ];

  List<Widget> get menuPages {
    var routes = [
      Navigator(
        key: Get.nestedKey(Keys.profileNavigationKey),
        onGenerateRoute: Routes.profilePageGenerateRoute,
      ),
      Navigator(
        key: Get.nestedKey(Keys.mapNavigationKey),
        onGenerateRoute: Routes.mapPageGenerateRoute,
      ),
      Navigator(
        key: Get.nestedKey(Keys.profileNavigationKey4),
        onGenerateRoute: Routes.profilePageGenerateRoute,
      ),
      Navigator(
        key: Get.nestedKey(Keys.chatNavigation),
        onGenerateRoute: Routes.chatPageGenerateRoute,
      ),
    ];
    var middleRoute = isUserPage.value
        ? Navigator(
            key: Get.nestedKey(Keys.profileNavigationKey3),
            onGenerateRoute: Routes.profilePageGenerateRoute,
          )
        : Navigator(
            key: Get.nestedKey(Keys.myCampsiteNavigationKey),
            onGenerateRoute: Routes.myCampsitePageGenerateRoute,
          );
    routes.insert(2, middleRoute);
    return routes;
  }

  @override
  void onInit() {
    initAPI();
    super.onInit();
  }

  Future initAPI() async {
    change(null, status: RxStatus.loading());
  }

  setIsUserPage(bool value) {
    isUserPage(value);
  }

  setCurrentRouteName(String value) {
    currentRouteName(value);
  }

  void changePage(int index, context) {
    if (!isInMainPage.value) {
      Get.offAllNamed(Routes.start, id: Keys.profileNavigationKey);
      isInMainPage(true);
      update();
    }
    currentIndex(index);
    print(index);
  }

  void setProductNumber(int number) {
    productNumber(number);
  }
}
