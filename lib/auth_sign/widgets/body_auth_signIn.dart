import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/auth_sign/auth_signIn_controller.dart';
import 'package:shopping/real_purchase/real_purchase_page.dart';

class BodyAuthSignIn extends StatelessWidget {
  const BodyAuthSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<AuthSignInController>(
          builder: (controller) {
            return ElevatedButton(
              onPressed: () {
                // controller.signInWithGoogle();
                Get.toNamed(RealPurchasePage.routeName);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300),
              child: const Text(
                'Entrar com o google',
              ),
            );
          },
        ),
      ],
    );
  }
}
