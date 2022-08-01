import 'package:json_annotation/json_annotation.dart';

import "package:chat_list_project/models/sender.dart";
import "package:chat_list_project/config/constant_values.dart";

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'item_message.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ItemMessage {
  ItemMessage(this.id, this.body, this.sender);

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "body")
  String body;

  @JsonKey(name: "sender")
  Sender sender;

  int getId() {
    return id;
  }

  void setId(int messageId) {
    id = messageId;
  }

  String getBody() {
    return body;
  }

  void setBody(String messageBody) {
    body = messageBody;
  }

  Sender getSender() {
    return sender;
  }

  void setSender(Sender messageSender) {
    sender = messageSender;
  }

  String getText() {
    String text = "";

    text = sender.getName() + ":" + " " + body.split(",")[0];

    if (text.length > ConstantValues.maxLength) {
      text = text.substring(0, ConstantValues.maxLength - 3) + "...";
    }

    return text;
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ItemMessage.fromJson(Map<String, dynamic> json) =>
      _$ItemMessageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ItemMessageToJson(this);
}
