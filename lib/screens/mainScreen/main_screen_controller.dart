import "package:chat_list_project/base/controller/base_controller.dart";
import 'package:get/get.dart';
import "package:chat_list_project/models/category.dart";
import 'package:flutter/material.dart';

class MainScreenController extends BaseController {
  List<Category> categories = <Category>[].obs;

  var categoryLength = 0.obs;

  void updateCategoryLength(int length) {
    categoryLength.value = length;
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
      Widget tabView = const Text("place");

      tabViews.add(tabView);
    }

    return tabViews;
  }

  @override
  void onReady() {
    super.onReady();

    categories = <Category>[Category("all"), Category("unread")].obs;

    updateCategoryLength(2);
  }
}
