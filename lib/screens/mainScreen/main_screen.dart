import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:chat_list_project/screens/mainScreen/main_screen_controller.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import "package:chat_list_project/widgets/customer_image.dart";
import "package:chat_list_project/widgets/customer_input.dart";

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
  }
}

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
          length: controller.categoryLength.value,
          child: Scaffold(
              appBar: AppBar(
                  title: const Text("place",
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.transparent),
                  leading: CustomerImage(
                      customerImage:
                          "https://i.pinimg.com/474x/0c/eb/c3/0cebc3e2a01fe5abcff9f68e9d2a06e4.jpg",
                      customerImageHeight: kToolbarHeight,
                      customerImageWidth:
                          MediaQuery.of(context).size.width * 0.2,
                      customerImageMargin: const EdgeInsets.only(left: 11.5)),
                  elevation: 0.0,
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
                        constraints: const BoxConstraints()),
                    IconButton(
                        icon: const Icon(Icons.folder, color: Colors.black),
                        onPressed: () {},
                        constraints: const BoxConstraints()),
                    IconButton(
                        icon: const Icon(Icons.edit_outlined,
                            color: Colors.black),
                        onPressed: () {},
                        constraints: const BoxConstraints())
                  ]),
              body: Column(children: <Widget>[
                CustomerInput(
                    customerInputWidth: MediaQuery.of(context).size.width,
                    customerInputMargin: const EdgeInsets.only(
                        top: 17.4, right: 11.5, left: 11.5, bottom: 17.4)),
                SizedBox(
                    child: TabBar(tabs: controller.getTabsByCategories()),
                    width: MediaQuery.of(context).size.width),
                Expanded(
                    child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        dragStartBehavior: DragStartBehavior.down,
                        children: controller.getTabViewsByCategories())),
                Container(color: Colors.black, height: 74.0)
              ]),
              backgroundColor: const Color(0xFFFFFFFF)));
    });
  }
}
