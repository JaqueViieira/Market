import 'package:get/get.dart';

import 'app_imports.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AuthPage.routeName,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: RealPurchasePage.routeName,
      page: () => const RealPurchasePage(),
      binding: RealPurchaseBindings(),
    ),
  ];
}
