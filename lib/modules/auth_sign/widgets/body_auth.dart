import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/routes/app_imports.dart';

import '../auth_controller.dart';

class BodyAuth extends StatelessWidget {
  const BodyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RealPurchasePage.routeName);
                },
                child: const Center(
                  child: Text(
                    'Autenticação com o google',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
