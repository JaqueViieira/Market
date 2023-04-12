import 'package:flutter/material.dart';
import 'package:shopping/modules/real_purchase/widgets/body_real_purchase.dart';

class RealPurchasePage extends StatelessWidget {
  static const String routeName = '/real_purchase';

  const RealPurchasePage({super.key});

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
