import 'package:get/get.dart';

import "package:chat_list_project/routes/router_name.dart";

import "package:chat_list_project/screens/mainScreen/main_screen.dart";

import "package:chat_list_project/screens/storeScreen/store_screen.dart";

class Pages {
  static List<GetPage> pages = <GetPage>[
    GetPage(
        name: RouterName.mainScreen,
        page: () => const MainScreen(),
        binding: MainScreenBinding()),
    GetPage(
        name: RouterName.storeScreen,
        page: () => const StoreScreen(),
        binding: StoreScreenBinding())
  ];
}
