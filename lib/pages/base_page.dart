import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/controllers/c_base.dart';
import 'package:property_app/pages/blank_page.dart';
import 'package:property_app/pages/home_page.dart';
import 'package:property_app/widgets/bottom_navigation_custom.dart';

class BasePage extends StatelessWidget {
  BasePage({super.key});

  final cBase = Get.put(CBase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cBase.indexPage == 1) {
          return const BlankPage();
        } else if (cBase.indexPage == 2) {
          return const BlankPage();
        } else if (cBase.indexPage == 3) {
          return const BlankPage();
        } else if (cBase.indexPage == 4) {
          return const BlankPage();
        }
        return const HomePage();
      }),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavBar(
          onChange: (index) {
            cBase.indexPage = index;
          },
          defaultSelectedIndex: cBase.indexPage,
          iconList: const [
            'assets/icons/homebar.png',
            'assets/icons/buildbar.png',
            'assets/icons/docbar.png',
            'assets/icons/cartbar.png',
            'assets/icons/userbar.png',
          ],
          iconFillList: const [
            'assets/icons/home_fill.png',
            'assets/icons/build_fill.png',
            'assets/icons/doc_fill.png',
            'assets/icons/cart_fill.png',
            'assets/icons/user_fill.png'
          ],
        );
      }),
    );
  }
}
