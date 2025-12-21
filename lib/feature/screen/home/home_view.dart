import 'dart:ffi';

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
    body: Obx((){
      if(controller.getLoading.value){
        return Center(child: CircularProgressIndicator(),);
      }
      if(controller.transaction.isEmpty){
        return Text("No Data Found");
      }
      return ListView.builder(
          itemCount: controller.transaction.length,
          itemBuilder: (context,index){
            final item =  controller.transaction[index];
        return ListTile(
          title:InkWell(
              onTap: (){
                if(item.id !=null){
                  controller.deleteTransaction(item.id!);
                }
              },
              child: Text(item.date)),
          subtitle: Text(item.income),
          trailing: InkWell(
              onTap: (){
                controller.editData(item);
              },
              child: Text("edit")),
        );
      });
    }),

    floatingActionButton: FloatingActionButton(onPressed: (){
      controller.goToAddData();
      },child: Icon(Icons.add),),

    );
  }
}
