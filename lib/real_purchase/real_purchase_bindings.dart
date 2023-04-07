import 'package:get/get.dart';
import 'package:shopping/real_purchase/real_purchase_controller.dart';

class RealPurchaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealPurchaseController());
  }
}
