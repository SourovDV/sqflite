import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/feature/screen/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite Curd Operation"),
      ),
      body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.transactions.isEmpty) {
        return const Center(child: Text("No data found"));
      }

      return ListView.builder(
        itemCount: controller.transactions.length,
        itemBuilder: (context, index) {
          final item = controller.transactions[index];
          return ListTile(
            title: Text(item.income),
            subtitle: Text(item.note),
            trailing: Text("৳${item.amount}"),
          );
        },
      );
    }),

    floatingActionButton: FloatingActionButton(onPressed: (){
        controller.goToAddItemPage();
      },child: Icon(Icons.add),),

    );
  }
}
