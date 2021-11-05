import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class KotakAmalScreen extends StatelessWidget {
  final String lembagaId;
  final String kotakId;

  const KotakAmalScreen({Key? key, required this.lembagaId, required this.kotakId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = ''.obs;
    var kondisi = ''.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Kotak Amal'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Foto Kotak Amal/Kenclengan', style: TextStyle(fontWeight: FontWeight.bold)),
              Obx(
                () => Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(img.value)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () async {
                        var photo = await ImagePicker().pickImage(source: ImageSource.camera);
                        if (photo?.path != null) {
                          img.value = photo!.path;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text('Kondisi', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Obx(
                () => RadioListTile<String>(
                  value: 'Baru',
                  title: Text('Baru'),
                  groupValue: kondisi.value,
                  onChanged: (v) {
                    kondisi.value = v ?? '';
                  },
                ),
              ),
              Obx(
                () => RadioListTile<String>(
                  value: 'Penuh',
                  title: Text('Penuh'),
                  groupValue: kondisi.value,
                  onChanged: (v) {
                    kondisi.value = v ?? '';
                  },
                ),
              ),
              Obx(
                () => RadioListTile<String>(
                  value: 'Rusak',
                  title: Text('Rusak'),
                  groupValue: kondisi.value,
                  onChanged: (v) {
                    kondisi.value = v ?? '';
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
                      if (img.value.isNotEmpty) {
                        _upload(img.value, kondisi.value);
                      }
                    },
                    child: Text('KIRIM'),
                    color: Colors.blue,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _upload(String path, String kondisi) async {
    EasyLoading.show(dismissOnTap: false, status: 'Uploading');
    var fs = FirebaseStorage.instance;

    var lastPos = await Geolocator.getLastKnownPosition();

    var timestamp = DateTime.now().millisecondsSinceEpoch;
    fs.ref('/upload/$lembagaId/$kotakId/${timestamp}').putFile(File(path)).then((s) async {
      var link = await s.ref.getDownloadURL();
      var col = FirebaseFirestore.instance.collection('/lembaga/${lembagaId}/drop-box/${kotakId}/scan_history/');
      await col.doc('$timestamp').set({
        'image': link,
        'need_action': kondisi != 'Baru',
        'status': kondisi,
        'timestamp': timestamp,
        'location': '${lastPos?.latitude ?? 0}, ${lastPos?.latitude ?? 0}',
      });
      EasyLoading.dismiss();
      Get.back();
      EasyLoading.showSuccess('Berhasil disimpan');
    });
  }
}
