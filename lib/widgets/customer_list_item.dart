import 'package:flutter/material.dart';

import "package:chat_list_project/models/list_item.dart";

import "package:chat_list_project/widgets/customer_image.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem(
      {Key? key, required this.listItem, required this.onItemClicked})
      : super(key: key);

  final ListItem listItem;

  final Function onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        endActionPane:
            ActionPane(motion: const DrawerMotion(), children: <Widget>[
          SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {
                showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                          height: 437.4,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 98, 98, 98),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(43.0),
                                  topRight: Radius.circular(43.0))),
                          child: Column(children: <Widget>[
                            Container(
                                child: Row(children: <Widget>[
                                  const Text("Actions"),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                      icon: const Icon(Icons.close),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      constraints: const BoxConstraints())
                                ]),
                                padding: const EdgeInsets.all(17.4),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 1.5)))),
                            Expanded(
                                child: ListView(children: <Widget>[
                              const ListTile(
                                  title: Text("ban message"),
                                  leading: Icon(Icons.do_not_disturb)),
                              const ListTile(
                                  title: Text("pin"),
                                  leading: Icon(Icons.push_pin)),
                              const ListTile(
                                  title: Text("turn off notification"),
                                  leading: Icon(Icons.notifications_off)),
                              const ListTile(
                                  title: Text("private conversation"),
                                  leading: Icon(Icons.message)),
                              ListTile(
                                  title: const Text("save conversation"),
                                  onTap: () {
                                    Navigator.pop(context);

                                    onItemClicked(listItem, context);
                                  },
                                  leading: const Icon(Icons.list_alt)),
                              const ListTile(
                                  title: Text("delete conversation"),
                                  leading: Icon(Icons.delete))
                            ]))
                          ]));
                    });
              },
              backgroundColor: const Color.fromARGB(255, 98, 98, 98),
              foregroundColor: Colors.black,
              icon: Icons.more_vert,
              label: "Actions"),
          SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
              icon: Icons.delete,
              label: "Delete")
        ]),
        child: ListTile(
            title: Text(listItem.getName(),
                style: TextStyle(
                    fontWeight: (listItem.isUnread())
                        ? FontWeight.bold
                        : FontWeight.normal)),
            leading: CustomerImage(
                customerImage:
                    (listItem.isAvatarFilled()) ? listItem.getAvatar() : "",
                customerImageHeight: 174.0,
                customerImageWidth: 43.0),
            subtitle: Text(listItem.lastMessage.getText(),
                style: TextStyle(
                    fontWeight: (listItem.isUnread())
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: (listItem.isUnread())
                        ? Colors.black
                        : const Color.fromARGB(255, 98, 98, 98)))));
  }
}
