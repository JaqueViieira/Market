import 'package:get/get.dart';

import 'app_imports.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    AuthSignInPage.page,
    RealPurchasePage.page,
  ];
}
