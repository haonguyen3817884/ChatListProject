import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'sender.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Sender {
  Sender(this.id, this.name);

  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  String getId() {
    return id;
  }

  void setId(String senderId) {
    id = senderId;
  }

  String getName() {
    return name;
  }

  void setName(String senderName) {
    name = senderName;
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}