import 'package:amaljariah/model/organization.dart';
import 'package:amaljariah/repositories/dropBoxRepositories.dart';
import 'package:get/get.dart';

class DropBoxController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<Organization> organization = Organization().obs;

  RxList<Map<String, dynamic>> dropBoxLocatioin = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> dropBoxResults = <Map<String, dynamic>>[].obs;

  @override
  void onReady() {
    getData();
    DropBoxRepositories.getDropBox();
    super.onReady();
  }

  Future getData() async {
    isLoading.value = true;
    var _org = await DropBoxRepositories.getOrganization();
    if (_org != null) {
      organization.value = _org;
    }

    var _dropBoxLocation = await DropBoxRepositories.getDropBox();
    if (_dropBoxLocation != null) {
      dropBoxLocatioin.value = _dropBoxLocation;
    }

     var _dropBoxResults = await DropBoxRepositories.getDropBoxResult();
    if (_dropBoxResults != null) {
      dropBoxResults.value = _dropBoxResults;
    }
    isLoading.value = false;
  }

  List<double> get organizationCoordinate =>
      organization()
          .location
          ?.split(",")
          .map((e) => double.tryParse(e) ?? 0.0)
          .toList() ??
      [0.0, 0.0];
}
