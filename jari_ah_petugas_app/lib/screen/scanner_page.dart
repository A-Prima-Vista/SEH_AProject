import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jari_ah/qr_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends GetView<QrScannerController> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  ScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(),
          )
        ],
      ),
    );
  }

  _onQRViewCreated(QRViewController c) {
    c.scannedDataStream.listen((scanData) {
      if (scanData.code == null) return;
      controller.onCode(scanData.code!);
    });
  }
}
