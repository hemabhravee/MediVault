import 'package:get/get.dart';

class NewMainViewController extends GetxController {
  @override
  void onInit() {
    print("init");
    super.onInit();
  }

  @override
  void onReady() {
    print("ready");
  }

  @override
  void onClose() {
    print("dispose");
  }
}
