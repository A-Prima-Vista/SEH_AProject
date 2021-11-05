import 'package:amaljariah/components/drawer.dart';
import 'package:amaljariah/components/mapsView.dart';
import 'package:amaljariah/controller/controller/dropBoxController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Dashboard extends GetView<DropBoxController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => controller.isLoading()
            ? Center(child: CircularProgressIndicator())
            : MapView(),
      ),
    );
  }
}
