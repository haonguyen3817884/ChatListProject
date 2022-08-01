import 'package:json_annotation/json_annotation.dart';

import "package:chat_list_project/models/item_message.dart";

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'list_item.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ListItem {
  ListItem(this.id, this.avatar, this.name, this.messageCount, this.readCount,
      this.unreadCount, this.lastMessage);

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "avatar")
  String avatar;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "message_count")
  int messageCount;

  @JsonKey(name: "read_count")
  int readCount;

  @JsonKey(name: "unread_count")
  int unreadCount;

  @JsonKey(name: "last_message")
  ItemMessage lastMessage;

  bool isUnread() {
    bool isMessageUnread = false;

    if (unreadCount > 0) {
      isMessageUnread = true;
    }

    return isMessageUnread;
  }

  bool isAvatarFilled() {
    return (avatar != "");
  }

  int getId() {
    return id;
  }

  void setId(int itemId) {
    id = itemId;
  }

  String getAvatar() {
    return avatar;
  }

  void setAvatar(String itemAvatar) {
    avatar = itemAvatar;
  }

  String getName() {
    return name;
  }

  void setName(String itemName) {
    name = itemName;
  }

  int getMessageCount() {
    return messageCount;
  }

  void setMessageCount(int itemMessageCount) {
    messageCount = itemMessageCount;
  }

  int getReadCount() {
    return readCount;
  }

  void setReadCount(int itemReadCount) {
    readCount = itemReadCount;
  }

  int getUnreadCount() {
    return unreadCount;
  }

  void setUnreadCount(int itemUnreadCount) {
    unreadCount = itemUnreadCount;
  }

  ItemMessage getLastMessage() {
    return lastMessage;
  }

  void setLastMessage(ItemMessage itemLastMessage) {
    lastMessage = itemLastMessage;
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ListItemToJson(this);
}
