import 'package:get/get.dart';
import 'package:shopping/modules/real_purchase/real_purchase_controller.dart';

class RealPurchaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealPurchaseController());
  }
}
