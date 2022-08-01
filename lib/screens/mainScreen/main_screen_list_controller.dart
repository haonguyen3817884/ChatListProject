import "package:chat_list_project/base/controller/base_controller.dart";

import "package:chat_list_project/models/list_item.dart";

import "package:chat_list_project/models/category.dart";

import "package:chat_list_project/data.dart";

class MainScreenListController extends BaseListController<ListItem> {
  MainScreenListController(this.category, this.onItemClicked);

  Category category;

  Function onItemClicked;

  void setData(List<dynamic> dataList) {
    int count = 0;

    for (int i = 0; i < dataList.length; ++i) {
      ListItem listItem = ListItem.fromJson(dataList[i]);
      if (category.isUnread()) {
        if (listItem.isUnread()) {
          data.add(listItem);

          count = count + 1;
        }
      } else {
        data.add(listItem);

        count = count + 1;
      }
    }

    updateDataLength(count);
  }

  @override
  void onReady() {
    super.onReady();

    setData(getData()["data"]);
  }
}
