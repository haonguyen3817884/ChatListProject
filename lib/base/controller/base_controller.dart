import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  void goToPage(String pageName, {dynamic arguments = const []}) {
    Get.toNamed(pageName, arguments: arguments);
  }
}

abstract class BaseListController<T> extends BaseController {
  List<T> data = <T>[].obs;

  var dataLength = 0.obs;

  void updateDataLength(int length) {
    dataLength.value = length;
  }
}
