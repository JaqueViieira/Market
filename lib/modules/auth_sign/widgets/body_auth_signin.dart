import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_signin_controller.dart';

class BodyAuthSignIn extends StatelessWidget {
  const BodyAuthSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthSignInController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(title: const Text("Home")),
            body: Center(
              child: Obx(() => controller.isLogged
                  ? Text("Usuário logado: ${controller.userEmail}")
                  : const Text("Você ainda não está logado")),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => controller.signOut(),
              child: const Icon(Icons.logout),
            ));
      },
    );
  }
}
