import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_signIn_controller.dart';
import 'auth_signin_bindings.dart';

class AuthSignInPage extends StatelessWidget {
  static const String routeName = '/auth_signIn';
  static final page = GetPage(
    name: routeName,
    page: () => AuthSignInPage(),
    binding: AuthSignInBindings(),
  );
  AuthSignInPage({Key? key}) : super(key: key);

  final AuthSignInController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _authController.signInWithGoogle(),
          child: const Text("Login com Google"),
        ),
      ),
    );
  }
}
