import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/real_purchase/real_purchase_bindings.dart';
import 'package:shopping/real_purchase/widgets/body_real_purchase.dart';

class RealPurchasePage extends StatelessWidget {
  static const String routeName = '/real_purchase';
  static final page = GetPage(
    name: routeName,
    page: () => const RealPurchasePage(),
    binding: RealPurchaseBindings(),
  );
  const RealPurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Compras'),
        centerTitle: true,
      ),
      body: const BodyRealPurchase(),
    );
  }
}
