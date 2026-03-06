import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app/core/responsive/responsive_layout.dart';
import 'package:portfolio/app/modules/home_desktop/views/home_desktop_view.dart';
import 'package:portfolio/app/modules/home_mobile/views/home_mobile_view.dart';
import 'package:portfolio/app/modules/home_tablet/views/home_tablet_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: HomeMobileView(),
      tablet: HomeTabletView(),
      desktop: HomeDesktopView(),
    );
  }
}
