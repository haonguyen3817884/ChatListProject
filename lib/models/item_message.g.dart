// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMessage _$ItemMessageFromJson(Map<String, dynamic> json) => ItemMessage(
    json['id'] as int,
    json['body'] as String,
    Sender.fromJson(json['sender'] as Map<String, dynamic>));

Map<String, dynamic> _$ItemMessageToJson(ItemMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'sender': instance.sender
    };
