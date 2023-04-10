import 'package:get/get.dart';
import 'package:shopping/modules/auth_sign/auth_signin_controller.dart';

class AuthSignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthSignInController());
  }
}
