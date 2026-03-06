import 'package:get/get.dart';

import '../controllers/home_tablet_controller.dart';

class HomeTabletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTabletController>(
      () => HomeTabletController(),
    );
  }
}
