import 'package:get/get.dart';
import 'package:sqflite_demo/data/user_data_model.dart';
import 'package:sqflite_demo/helper/db_helper.dart';
import 'package:sqflite_demo/routes/app_page.dart';
class HomeController extends GetxController {
  RxList<TransactionModel> transaction = <TransactionModel>[].obs;
  RxBool getLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTransaction();
  }

  Future<void> loadTransaction() async {
    getLoading.value = true;
    final data = await DbHelper.getAllTransaction();
    transaction.assignAll(data);
    getLoading.value = false;
  }
  Future<void> insertTransaction(TransactionModel model)async{
    final data = await DbHelper.insertTransaction(model);

    loadTransaction(); //auto update
  }

Future<void> deleteTransaction(int id)async{
    await DbHelper.deleteTransaction(id);
    await loadTransaction();
}
  void editData(TransactionModel model){
    Get.toNamed(AppPages.addItem,arguments:model);
  }

  void goToAddData( ){
    Get.toNamed(AppPages.addItem);
  }
  Future<void> updateTransaction(TransactionModel model) async {
    await DbHelper.updateTransaction(model);
    await loadTransaction(); // 🔥 UI refresh
  }


}
