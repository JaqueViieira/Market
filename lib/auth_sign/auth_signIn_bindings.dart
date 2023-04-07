import 'package:get/get.dart';
import 'package:shopping/auth_sign/auth_signIn_controller.dart';

class AuthSignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthSignInController());
  }
}
