import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jari_ah/controller/instansi_controller.dart';
import 'package:jari_ah/qr_controller.dart';
import 'package:jari_ah/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(InstansiController());
    Get.put(QrScannerController());

    return GetMaterialApp(
      title: 'A Prima Vista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6), () {
      Get.off(HomeScreen());
    });
    return Material(
      child: Container(
        color: Color(0xFF95E1D3),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 26, vertical: 0),
                child: Text(
                  'Jari Jariah',
                  style: TextStyle(color: Colors.white, fontSize: 58, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: Get.width/2,
              child: Text(
                'Sebuah karya dari tim\nA PRIMA VISTA',
                textAlign: TextAlign.right,
                style:
                    TextStyle(color: Color(0xff161E54), fontSize: 10, fontWeight: FontWeight.bold,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
