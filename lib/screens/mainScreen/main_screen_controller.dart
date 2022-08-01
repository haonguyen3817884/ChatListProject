import 'dart:async';

import "package:chat_list_project/base/controller/base_controller.dart";
import 'package:get/get.dart';
import "package:chat_list_project/models/category.dart";
import "package:chat_list_project/models/list_item.dart";
import 'package:flutter/material.dart';

import "package:chat_list_project/screens/mainScreen/main_screen_list_controller.dart";

import "package:chat_list_project/widgets/main_screen_list.dart";

class MainScreenController extends BaseController {
  List<Category> categories = <Category>[].obs;
  var categoryLength = 0.obs;

  List<ListItem> customerItems = <ListItem>[].obs;

  var itemLength = 0.obs;

  void updateCategoryLength(int length) {
    categoryLength.value = length;
  }

  void updateItemLength(int length) {
    itemLength.value = length;
  }

  void updateCustomerItems(ListItem customerItem) {
    int itemIndex = -1;

    for (int i = 0; i < customerItems.length; ++i) {
      if (customerItems[i].getId() == customerItem.getId()) {
        itemIndex = i;
      }
    }

    if (itemIndex == -1) {
      customerItems.add(customerItem);

      updateItemLength(itemLength.value + 1);
    }
  }

  void deleteCustomerItem(int customerItemId) {
    int itemIndex = -1;

    for (int i = 0; i < customerItems.length; ++i) {
      if (customerItems[i].getId() == customerItemId) {
        itemIndex = i;
      }
    }

    if (itemIndex != -1) {
      customerItems.removeAt(itemIndex);

      updateItemLength(itemLength.value - 1);
    }
  }

  List<Tab> getTabsByCategories() {
    List<Tab> tabs = <Tab>[];

    for (int i = 0; i < categories.length; ++i) {
      Tab tab = Tab(
          child: Text(categories[i].getName(),
              style: const TextStyle(color: Colors.black)));

      tabs.add(tab);
    }

    return tabs;
  }

  List<Widget> getTabViewsByCategories() {
    List<Widget> tabViews = <Widget>[];

    for (int i = 0; i < categories.length; ++i) {
      Widget tabView = MainScreenList(tagName: categories[i].getName());

      tabViews.add(tabView);
    }

    return tabViews;
  }

  void onItemClicked(ListItem listItem, BuildContext context) async {
    updateCustomerItems(listItem);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Timer(const Duration(seconds: 5), () {
            Navigator.pop(context);
          });

          return AlertDialog(
              content: const Text("notification"),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("delete"),
                    onPressed: () {
                      deleteCustomerItem(listItem.getId());
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  @override
  void onReady() {
    super.onReady();

    categories = <Category>[Category("all"), Category("unread")].obs;

    Get.put(MainScreenListController(categories[0], onItemClicked),
        tag: categories[0].getName());

    Get.put(MainScreenListController(categories[1], onItemClicked),
        tag: categories[1].getName());

    updateCategoryLength(2);
  }
}
