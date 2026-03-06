import 'package:get/get.dart';

import '../controllers/home_mobile_controller.dart';

class HomeMobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMobileController>(
      () => HomeMobileController(),
    );
  }
}
