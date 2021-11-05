import 'package:amaljariah/controller/controller/dropBoxController.dart';
import 'package:amaljariah/controller/ui_controller/mapUiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends GetView<MapUiController> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: controller.getCamPosition(),
        markers: Get.find<DropBoxController>().dropBoxLocatioin.map((element) {
          var loc = element['drop-location'].toString().split(",").map((e) => double.tryParse(e)??0.0);
          return Marker(
            markerId: MarkerId(element['drop-location'].toString()),
            position: LatLng(loc.first, loc.last),
            // icon: Bitm,
            infoWindow: InfoWindow(
                title: 'Kode: ${element['qr-code'].toString().split('/').last}',
                onTap: () {
                  if (element['qr-code'] != null) {
                    // Get.dialog(
                    //   KotakAmalDetail(element),
                    // );
                  }
                }),
          );
        }).toSet(),
        onMapCreated: (GoogleMapController mapcontrol) {
          controller.mapController.complete(mapcontrol);
        },
      ),
    );
  }
}
