import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:chat_list_project/screens/storeScreen/store_screen_controller.dart";
import "package:chat_list_project/routes/router_name.dart";

import "package:chat_list_project/widgets/customer_list_item.dart";
import "package:chat_list_project/models/list_item.dart";

class StoreScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreScreenController());
  }
}

class StoreScreen extends GetView<StoreScreenController> {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("place"),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  controller.goToPage(RouterName.mainScreen);
                })),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomerListItem(
                        listItem: controller.data[index],
                        onItemClicked: (ListItem listItem) {});
                  }))
        ]),
        backgroundColor: const Color(0xFFFFFFFF));
  }
}
