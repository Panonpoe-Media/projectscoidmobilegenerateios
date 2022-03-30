// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_thread_new_reply_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionNewReplyShowThread _$ModelActionNewReplyShowThreadFromJson(
        Map<String, dynamic> json) =>
    ModelActionNewReplyShowThread(
      json['id'] as String?,
      json['post_id'] as String?,
      json['message'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..attachments_name = json['attachments_name'] as String?;

Map<String, dynamic> _$ModelActionNewReplyShowThreadToJson(
        ModelActionNewReplyShowThread instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'post_id': instance.post_id,
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
    };

NewReplyShowThreadSuperBase _$NewReplyShowThreadSuperBaseFromJson(
        Map<String, dynamic> json) =>
    NewReplyShowThreadSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ModelActionNewReplyShowThread.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewReplyShowThreadSuperBaseToJson(
        NewReplyShowThreadSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
