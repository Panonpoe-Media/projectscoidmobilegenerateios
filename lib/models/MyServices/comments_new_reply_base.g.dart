// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_new_reply_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionNewReplyComments _$ModelActionNewReplyCommentsFromJson(
        Map<String, dynamic> json) =>
    ModelActionNewReplyComments(
      json['id'] as String?,
      json['service_post_id'] as String?,
      json['message'] as String?,
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionNewReplyCommentsToJson(
        ModelActionNewReplyComments instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'service_post_id': instance.service_post_id,
      'message': instance.message,
      'captcha': instance.captcha,
    };

NewReplyCommentsSuperBase _$NewReplyCommentsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    NewReplyCommentsSuperBase(
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
          : ModelActionNewReplyComments.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewReplyCommentsSuperBaseToJson(
        NewReplyCommentsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
