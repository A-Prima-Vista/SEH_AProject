import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jari_ah/screen/history_scan.dart';
import 'package:jari_ah/screen/home_map_page.dart';
import 'package:jari_ah/screen/profile_screen.dart';
import 'package:jari_ah/screen/scanner_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final scannerPage = ScannerPage();
  final mapPage = HomeMapPage();

  @override
  Widget build(BuildContext context) {
    var tab = 1.obs;
    Geolocator.requestPermission();
    return Scaffold(
      body: Obx(() {
        if(tab.value == 0) return mapPage;
        if(tab.value == 1) return scannerPage;
        if(tab.value == 2) return HistoryScan();
        if(tab.value == 3) return ProfileScreen();
        return Container();
      }),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: 'Home'),
          TabData(iconData: Icons.qr_code, title: 'Scan Jariah'),
          TabData(iconData: Icons.history, title: 'History'),
          TabData(iconData: Icons.person, title: 'Profil'),
        ],
        onTabChangedListener: (i) => tab.value = i,
        initialSelection: 1,
      ),
    );
  }

}
