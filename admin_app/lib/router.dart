import 'package:amaljariah/bindings/homeBinding.dart';
import 'package:amaljariah/screens/dashboard.dart';
import 'package:amaljariah/screens/home.dart';
import 'package:get/get.dart';

class AppRouter {
  static String home = '/home';
  static final List<GetPage> routes = [
    GetPage(
      binding: HomeBinding(),
      name: home,
      page: () => Home(),
    ),
  ];
}
