import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/addItem/add_item_binding.dart';
import 'package:sqflite_demo/feature/screen/addItem/add_item_view.dart';
import 'package:sqflite_demo/feature/screen/home/home_bindings.dart';
import 'package:sqflite_demo/feature/screen/home/home_view.dart';
import 'package:sqflite_demo/routes/app_page.dart';

class AppRoute{

  static const String initialRoute =AppPages.home;
  static List<GetPage> route =[
    GetPage(name:AppPages.home, page: ()=>HomeView(),binding: HomeBinding()),
    GetPage(name:AppPages.addItem, page: ()=>AddItemView(),binding: AddItemBindings())
  ];



}