import 'dart:async';

import 'package:amaljariah/controller/controller/dropBoxController.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUiController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();

  CameraPosition getCamPosition() {
    return CameraPosition(
      target: LatLng(Get.find<DropBoxController>().organizationCoordinate.first,
          Get.find<DropBoxController>().organizationCoordinate.last),
      zoom: 14.4746,
    );
  }
}
