// import 'package:brasil_fields/brasil_fields.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../real_purchase_controller.dart';

class BodyRealPurchase extends GetView<RealPurchaseController> {
  const BodyRealPurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<RealPurchaseController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller.textProduct,
                decoration: const InputDecoration(
                  hintText: 'Nome do Produto',
                ),
              ),
              TextFormField(
                controller: controller.textValue,
                decoration: const InputDecoration(
                  hintText: 'Valor do Produto',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(moeda: true),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => controller.addShopping(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300),
                child: const Text(
                  'Adicionar',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    controller.search(
                      value,
                      controller.shoppingList,
                    );
                  },
                  decoration: InputDecoration(
                    labelText: 'Pesquisar',
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  final filteredList = controller.resultShoppingList.isNotEmpty
                      ? controller.resultShoppingList
                      : controller.shoppingList;
                  return ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      var shopping = filteredList[index];
                      return ListTile(
                        title: Text(
                          shopping.nameProduct,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('R\$ ${shopping.valueProduct}'),
                        trailing: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Delete'.tr,
                              middleText:
                                  'Tem certeza que deseja excluir compra?',
                              radius: 15,
                              textCancel: 'Cancelar',
                              textConfirm: 'Deletar',
                              backgroundColor: Colors.grey.shade300,
                              onConfirm: () {
                                controller
                                    .deleteShopping(shopping.id.toString());
                                Get.back();
                              },
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red.shade800,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              ColoredBox(
                color: Colors.green.shade100,
                child: Text(
                  'Total: R\$${controller.totalShopping.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
