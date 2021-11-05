import 'package:amaljariah/components/drawer.dart';
import 'package:amaljariah/controller/ui_controller/drawerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends GetView<CustomDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Jari jariah'),
      ),
      body: Obx(() => controller.getMenuContent()),
    );
  }
}
