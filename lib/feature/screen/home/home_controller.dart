import 'package:get/get.dart';
import 'package:sqflite_demo/data/user_data_model.dart';
import 'package:sqflite_demo/helper/db_helper.dart';
import 'package:sqflite_demo/routes/app_page.dart';

class HomeController extends GetxController {
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    isLoading.value = true;
    transactions.value = await DbHelper.getAllTransaction();
    isLoading.value = false;
  }

  Future<void> addTransaction(TransactionModel model) async {
    await DbHelper.insertTransaction(model);
    loadTransactions(); // 🔥 auto refresh
  }

  void goToAddItemPage() {
    Get.toNamed(AppPages.addItem);
  }
}
