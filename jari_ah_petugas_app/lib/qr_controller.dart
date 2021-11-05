import 'dart:developer';

import 'package:get/get.dart';
import 'package:jari_ah/screen/kotak_amal_screen.dart';

class QrScannerController extends GetxController {
  onCode(String code) {
    log(code, name: 'Scanned');
    Get.to(() => KotakAmalScreen(kotakId: 'hY3Y61aTJSu6eBnX4N2D', lembagaId: 'dFNJmIDawpLokOcqFgZo',));
  }
}