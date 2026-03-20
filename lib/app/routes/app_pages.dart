import 'package:get/get.dart';
import 'package:portfolio/app/modules/legal/paper_trade/privacy_policy.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_desktop/bindings/home_desktop_binding.dart';
import '../modules/home_desktop/views/home_desktop_view.dart';
import '../modules/home_mobile/bindings/home_mobile_binding.dart';
import '../modules/home_mobile/views/home_mobile_view.dart';
import '../modules/home_tablet/bindings/home_tablet_binding.dart';
import '../modules/home_tablet/views/home_tablet_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MOBILE,
      page: () => const HomeMobileView(),
      binding: HomeMobileBinding(),
    ),
    GetPage(
      name: _Paths.HOME_TABLET,
      page: () => const HomeTabletView(),
      binding: HomeTabletBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DESKTOP,
      page: () => HomeDesktopView(),
      binding: HomeDesktopBinding(),
    ),

    GetPage(
      name: Routes.PAPER_TRADING_PRIVACY,
      page: () => const PrivacyPolicyView(),
    ),
  ];
}
