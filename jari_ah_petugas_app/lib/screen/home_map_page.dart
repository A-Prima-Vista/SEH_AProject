import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jari_ah/controller/instansi_controller.dart';
import 'package:jari_ah/widgets.dart';

class HomeMapPage extends StatelessWidget {
  HomeMapPage({Key? key}) : super(key: key);
  CameraPosition camPos = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    var _ct = Get.find<InstansiController>();
    var lt = _ct.lembaga.value.location?.toString().toLatLng();
    if (lt != null ) {
      camPos = CameraPosition(target: lt, zoom: 17);
    }

    _ct.lembaga.listen((v) {
      var ll = v.location?.split(',').map((e) => e.trim()).map((e) => double.tryParse(e)).toList();
      if (mapController != null && ll != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(ll[0] ?? 0, ll[1] ?? 0), zoom: 14.4746),
          ),
        );
      }
    });

    return Obx(
      () => GoogleMap(
        initialCameraPosition: camPos,
        markers: _ct.kotakAmals.map((element) {
          var loc = element['drop-location'].toString().toLatLng();
          return Marker(
            markerId: MarkerId(element['drop-location'].toString()),
            position: loc!,
            icon: _ct.markerKotak.value,
            infoWindow: InfoWindow(
                title: 'Kode: ${element['qr-code'].toString().split('/').last}',
                onTap: () {
                  if (element['qr-code'] != null) {
                    Get.dialog(
                      KotakAmalDetail(element),
                    );
                  }
                }),
          );
        }).toSet()..add(Marker(
          markerId: MarkerId(_ct.lembaga.value.id.toString()),
          position: lt!,
          icon: _ct.markerLembaga.value,
          infoWindow: InfoWindow(
              title: _ct.lembaga.value.name,
              onTap: () {
              }),
        )),
        onMapCreated: (c) {
          mapController = c;
        },
      ),
    );
  }
}

extension LL on String {
  LatLng? toLatLng() {
    var l = split(',').map((e) => e.trim()).map((e) => double.tryParse(e)).toList();
    if (l.length == 2) return LatLng(l[0] ?? 0, l[1] ?? 0);
    return null;
  }
}
