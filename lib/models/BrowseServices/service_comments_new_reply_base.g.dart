// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_comments_new_reply_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionNewReplyServiceComments _$ModelActionNewReplyServiceCommentsFromJson(
        Map<String, dynamic> json) =>
    ModelActionNewReplyServiceComments(
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

Map<String, dynamic> _$ModelActionNewReplyServiceCommentsToJson(
        ModelActionNewReplyServiceComments instance) =>
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

NewReplyServiceCommentsSuperBase _$NewReplyServiceCommentsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    NewReplyServiceCommentsSuperBase(
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
          : ModelActionNewReplyServiceComments.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewReplyServiceCommentsSuperBaseToJson(
        NewReplyServiceCommentsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
