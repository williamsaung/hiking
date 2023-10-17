import 'package:flutter/material.dart';

import '../../configs/export_config.dart';
import 'bottom_bar_pages_ctrl.dart';

class BottomBarPages extends StatelessWidget {
  final BottomBarPagesController controller =
      Get.put(BottomBarPagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex(),
            children: controller.menuPages,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(
                    key: Key('bottomBarHome'),
                    Icons.person,
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.map,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Obx(
                    () => controller.isUserPage.value
                        ? Icon(Icons.favorite)
                        : Icon(Icons.home),
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: ''),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: AppTheme.red,
            selectedIconTheme: const IconThemeData(color: AppTheme.red),
            unselectedItemColor: AppTheme.white,
            unselectedIconTheme: const IconThemeData(color: AppTheme.white),
            backgroundColor: AppTheme.blue_1,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.changePage(value, context);
            },
          ),
        ));
  }
}
