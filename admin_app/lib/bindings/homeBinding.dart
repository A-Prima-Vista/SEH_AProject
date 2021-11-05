import 'package:amaljariah/controller/controller/dropBoxController.dart';
import 'package:amaljariah/controller/ui_controller/drawerController.dart';
import 'package:amaljariah/controller/ui_controller/mapUiController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomDrawerController());
    Get.put(MapUiController());
    Get.put(DropBoxController());
  }
}
