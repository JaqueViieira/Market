import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/auth_sign/auth_signIn_bindings.dart';
import 'package:shopping/auth_sign/widgets/body_auth_signIn.dart';

class AuthSignInPage extends StatelessWidget {
  static const String routeName = '/auth_signIn';
  static final page = GetPage(
    name: routeName,
    page: () => const AuthSignInPage(),
    binding: AuthSignInBindings(),
  );
  const AuthSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: const BodyAuthSignIn(),
    );
  }
}
