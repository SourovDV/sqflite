import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hellow Sourov"),),
    );
  }
}
