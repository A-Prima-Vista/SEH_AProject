import 'package:amaljariah/screens/about.dart';
import 'package:amaljariah/screens/dashboard.dart';
import 'package:amaljariah/screens/dropBoxs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  RxString activeMewnu = 'Kotak Amal'.obs;

  Map<String, Icon> menuItem = {
    'Kotak Amal': Icon(Icons.map),
    'Hasil Amal': Icon(Icons.data_usage),
    'About': Icon(Icons.info)
  };

  Map<String, Widget> _menuContent = {
    'Kotak Amal': Dashboard(),
    'Hasil Amal': DropBox(),
    'About': About()
  };

  void setActiveMenu(String key) {
    activeMewnu.value = key;
  }

  Widget getMenuContent() => _menuContent[activeMewnu]!;
}
