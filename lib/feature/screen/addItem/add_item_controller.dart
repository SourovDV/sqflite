import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/data/user_data_model.dart';
import 'package:sqflite_demo/feature/screen/home/home_controller.dart';

class AddItemController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  final key = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  TransactionModel? editModel; // 🔥 ADD THIS

  @override
  void onInit() {
    super.onInit();

    // 🔥 EDIT MODE CHECK
    if (Get.arguments != null && Get.arguments is TransactionModel) {
      editModel = Get.arguments;
      amountController.text = editModel!.amount;
      categoryController.text = editModel!.income;
      noteController.text = editModel!.note;
      dateController.text = editModel!.date;
    }
  }

  String? checkValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  void saveItem() {
    if (!key.currentState!.validate()) return;

    final model = TransactionModel(
      id: editModel?.id, // 🔥 id থাকলে UPDATE
      income: categoryController.text,
      amount: amountController.text,
      note: noteController.text,
      date: dateController.text,
    );

    if (editModel == null) {
      // ➕ ADD
      homeController.insertTransaction(model);
    } else {
      // ✏️ UPDATE
      homeController.updateTransaction(model);
    }

    Get.back();
  }

  @override
  void onClose() {
    amountController.dispose();
    categoryController.dispose();
    noteController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
