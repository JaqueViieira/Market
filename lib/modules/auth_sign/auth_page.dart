import 'package:flutter/material.dart';

import 'widgets/body_auth.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth';

  const AuthPage({super.key});

  // final AuthSigninController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: const BodyAuth(),
    );
  }
}
