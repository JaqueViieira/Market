import 'dart:convert';

class RealPurchaseModel {
  final String? id;
  final String nameProduct;
  final double valueProduct;

  RealPurchaseModel({
    this.id,
    required this.nameProduct,
    required this.valueProduct,
  });

  Map<String, dynamic> toMap() {
    return {
      'nameProduct': nameProduct,
      'valueProduct': valueProduct,
    };
  }

  factory RealPurchaseModel.fromMap(Map<String, dynamic> map) {
    return RealPurchaseModel(
      nameProduct: map['nameProduct'] ?? '',
      valueProduct: map['valueProduct'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RealPurchaseModel.fromJson(String source) =>
      RealPurchaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
