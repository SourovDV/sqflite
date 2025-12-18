import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(),permanent: true);
  }

}