import 'package:get/get.dart';

import '../controllers/home_desktop_controller.dart';

class HomeDesktopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDesktopController>(
      () => HomeDesktopController(),
    );
  }
}
