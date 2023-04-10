import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/real_purchase_model.dart';

class RealPurchaseController extends GetxController {
  final CollectionReference shoppingCollection =
      FirebaseFirestore.instance.collection('shopping');

  List<RealPurchaseModel> shoppingList = [];

  final textProduct = TextEditingController();
  final textValue = TextEditingController();
  final RxList<RealPurchaseModel> resultShoppingList =
      <RealPurchaseModel>[].obs;

  double totalShopping = 0;

  @override
  void onInit() {
    getShopping();
    super.onInit();
  }

  void search(String query, List<RealPurchaseModel> shoppingList) {
    if (query.isEmpty) {
      resultShoppingList.value = shoppingList;
    } else {
      final lowercaseQuery = query.toLowerCase();
      final filteredShoppingList = shoppingList
          .where((shopping) =>
              shopping.nameProduct.toLowerCase().contains(lowercaseQuery))
          .toList();
      resultShoppingList.value = filteredShoppingList;
    }
    update();
  }

  Future<void> addShopping() async {
    if (textProduct.text.isEmpty || textValue.text.isEmpty) {
      const SnackBar(
        content: Text(
          'Os campos não podem ficarem vazio',
        ),
      );

      return;
    }

    RegExp regex = RegExp(r'[^\d,]');
    String formatterText =
        textValue.text.replaceAll(regex, '').replaceAll(',', '.');

    shoppingCollection
        .add(
          RealPurchaseModel(
            nameProduct: textProduct.text,
            valueProduct: double.tryParse(formatterText) ?? 0,
          ).toMap(),
        )
        .then(
          (value) => debugPrint("Shopping Added"),
        )
        .whenComplete(
      () {
        textProduct.clear();
        textValue.clear();
        getShopping();
      },
    ).catchError((error) => debugPrint("Failed to add shopping: $error"));
  }

  Future<void> getShopping() async {
    return await shoppingCollection.get().then((QuerySnapshot querySnapshot) {
      shoppingList = [];
      totalShopping = 0;

      for (var doc in querySnapshot.docs) {
        final shopping = RealPurchaseModel(
          id: doc.reference.id,
          nameProduct: doc['nameProduct'],
          valueProduct: double.tryParse(doc['valueProduct'].toString()) ?? 0,
        );
        totalShopping += shopping.valueProduct;

        shoppingList.add(shopping);

        shoppingList.sort((a, b) => b.valueProduct.compareTo(a.valueProduct));
      }
    }).whenComplete(() => update());
  }

  Future<void> deleteShopping(String id) async {
    shoppingCollection
        .doc(id)
        .delete()
        .then((value) => debugPrint("Shopping Deleted"))
        .whenComplete(() => getShopping())
        .catchError(
          (error) => debugPrint("Failed to delete shopping: $error"),
        );
  }
}
