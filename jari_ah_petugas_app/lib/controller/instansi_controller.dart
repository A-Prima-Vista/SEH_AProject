import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InstansiController extends GetxController {
  var kotakAmals = [].obs;
  var markerKotak = BitmapDescriptor.defaultMarker.obs;
  var markerLembaga = BitmapDescriptor.defaultMarker.obs;

  Rx<Lembaga> lembaga = Lembaga().obs;
  CollectionReference get fire => FirebaseFirestore.instance.collection('lembaga');

  InstansiController() {
    _loadMarker();
    fire.get().then((value) {
      log('count ${value.size}');
      var lm = value.docs.map((element) {
        var data = element.data() as Map<String, dynamic>?;
        var id = element.id;
        var lembaga = Lembaga.fromMap(data ?? {})..id = id;
        return lembaga;
      }).first;
      lembaga.value = lm;
      _loadKotak();
    });
  }

  _loadKotak() {
    log('loading drop-box ${lembaga.value.id}');
    fire.doc(lembaga.value.id).collection('drop-box').get().then((value) {
      log('jumlah drop box ${value.size}');
      kotakAmals.value = value.docs.map((e) => e.data()).toList();
    });
  }

  void _loadMarker() async {
    markerKotak.value = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(50, 50)), 'images/donate.png');
    markerLembaga.value = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(50, 50)), 'images/office.png');
  }
}

// {
// drop-by: *,
// created: Timestamp(seconds=1635696000, nanoseconds=0),
// qr-code: dFNJmIDawpLokOcqFgZo/drop-box/hY3Y61aTJSu6eBnX4N2D,
// scheduled-pickup: Timestamp(seconds=1638288000, nanoseconds=0),
// assignee: *, drop-time: Timestamp(seconds=1635696000, nanoseconds=0),
// drop-location: -8.581279734174483, 116.10078108681287
// }

class Lembaga {
  String? id;
  final String? city;
  final String? name;
  final String? location;

  Lembaga({this.id, this.city, this.name, this.location,});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'city': this.city,
      'name': this.name,
      'location': this.location,
    };
  }

  factory Lembaga.fromMap(Map<String, dynamic> map) {
    return Lembaga(
      id: map['id'] as String?,
      city: map['city'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
    );
  }
}

