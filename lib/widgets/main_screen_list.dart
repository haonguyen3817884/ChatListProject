import 'package:flutter/material.dart';
import "package:chat_list_project/screens/mainScreen/main_screen_list_controller.dart";
import 'package:get/get.dart';

import "package:chat_list_project/widgets/customer_list_item.dart";

class MainScreenList extends GetView<MainScreenListController> {
  const MainScreenList({Key? key, required this.tagName}) : super(key: key);

  final String tagName;

  @override
  String? get tag => tagName;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: controller.dataLength.value,
          itemBuilder: (context, index) {
            return CustomerListItem(
                listItem: controller.data[index],
                onItemClicked: controller.onItemClicked);
          });
    });
  }
}
