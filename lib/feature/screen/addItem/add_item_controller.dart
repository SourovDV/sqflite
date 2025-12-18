import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/home/home_controller.dart';

import '../../../data/user_data_model.dart';

class AddItemController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  final addKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String? checkValidation(value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }

  void addData() {
    if (addKey.currentState!.validate()) {
      final model = TransactionModel(
        income: categoryController.text,
        amount: amountController.text,
        note: noteController.text,
        date: DateTime.now().toIso8601String(),
      );

      homeController.addTransaction(model); // 🔥 MAIN LINE
      Get.back(); // back to HomeView
    }
  }
}
