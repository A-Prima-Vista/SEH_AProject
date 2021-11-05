import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class KotakAmalDetail extends StatelessWidget {
  final Map<String, dynamic> data;

  const KotakAmalDetail(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timestamp? tm = data['drop-time'];
    Timestamp? tmj = data['scheduled-pickup'];

    var items = <Map<String, dynamic>>[].obs;
    if (data['qr-code'] != null) {
      var cc = FirebaseFirestore.instance.collection('lembaga/${data['qr-code']}/scan_history');
      cc.get().then((value) {
        items.value = value.docs.map((e) => e.data()).toList();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Kode: ${data['qr-code'].toString().split('/').last}'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              children: [
                TableRow(children: [Text('Kode Kotak'), Text('${data['qr-code'].toString().split('/').last}')]),
                TableRow(children: [
                  Text('Tgl Drop'),
                  Text(
                      '${tm?.millisecondsSinceEpoch != null ? DateTime.fromMillisecondsSinceEpoch(tm!.millisecondsSinceEpoch).toIso8601String().split('T').first : '-'}')
                ]),
                TableRow(children: [
                  Text('Schedule Ambil'),
                  Text(
                      '${tmj?.millisecondsSinceEpoch != null ? DateTime.fromMillisecondsSinceEpoch(tmj!.millisecondsSinceEpoch).toIso8601String().split('T').first : '-'}')
                ]),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'History Scan/Kondisi Kotak amal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemBuilder: (c, i) {
                  var element = items[i];
                  return ListTile(
                    onTap: () {
                      Get.dialog(
                        PhotoView(
                          imageProvider: NetworkImage(element['image']),
                        ),
                        barrierDismissible: true,
                      );
                    },
                    leading: Image.network(
                      element['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(element['timestamp'] != null
                        ? DateTime.fromMillisecondsSinceEpoch(element['timestamp']!).toIso8601String().split('T').first
                        : '-'),
                    subtitle: Text(
                        'Kondisi: ${element['status']} | Butuh Tindakan: ${element['need_action'] == true ? 'Iya' : 'Tidak'}'),
                  );
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
