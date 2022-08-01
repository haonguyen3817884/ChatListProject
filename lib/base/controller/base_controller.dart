import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  void goToPage(String pageName) {
    Get.offNamed(pageName);
  }
}
