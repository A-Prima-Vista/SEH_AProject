import 'package:amaljariah/repositories/dropBoxRepositories.dart';
import 'package:amaljariah/router.dart';
import 'package:amaljariah/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DropBoxRepositories.init();
    return GetMaterialApp(
      title: 'Amal Jariah',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      getPages: AppRouter.routes,
      initialRoute: AppRouter.home,
    );
  }
}
