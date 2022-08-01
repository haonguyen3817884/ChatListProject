// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItem _$ListItemFromJson(Map<String, dynamic> json) => ListItem(
      json['id'] as int,
      json['avatar'] as String,
      json['name'] as String,
      json['message_count'] as int,
      json['read_count'] as int,
      json['unread_count'] as int,
      ItemMessage.fromJson(json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListItemToJson(ListItem instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'message_count': instance.messageCount,
      'read_count': instance.readCount,
      'unread_count': instance.unreadCount,
      'last_message': instance.lastMessage,
    };
