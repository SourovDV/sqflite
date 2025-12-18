import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/addItem/add_item_controller.dart';

class AddItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddItemController());
  }
}
