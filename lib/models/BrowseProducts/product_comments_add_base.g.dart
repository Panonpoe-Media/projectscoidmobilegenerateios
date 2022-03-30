// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_comments_add_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddModelProductComments _$AddModelProductCommentsFromJson(
        Map<String, dynamic> json) =>
    AddModelProductComments(
      json['id'] as String?,
      json['product_post_id'] as int?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['product_id'] as int?,
      json['product_str'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['thread_id'] as int?,
      json['thread_str'] as String?,
      (json['thread_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['thread_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['post_type_id'] as int?,
      json['post_type_str'] as String?,
      (json['post_type_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['post_type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..product_url = json['product_url'] as String?
      ..thread_url = json['thread_url'] as String?
      ..post_date = json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String)
      ..message = json['message'] as String?
      ..read_by_seller = json['read_by_seller'] as bool?
      ..read_by_buyer = json['read_by_buyer'] as bool?
      ..captcha = json['captcha'] as String?;

Map<String, dynamic> _$AddModelProductCommentsToJson(
        AddModelProductComments instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_post_id': instance.product_post_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'product_id': instance.product_id,
      'product_url': instance.product_url,
      'product_str': instance.product_str,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'thread_id': instance.thread_id,
      'thread_url': instance.thread_url,
      'thread_str': instance.thread_str,
      'thread_list': instance.thread_list,
      'thread_list_str': instance.thread_list_str,
      'post_type_id': instance.post_type_id,
      'post_type_str': instance.post_type_str,
      'post_type_list': instance.post_type_list,
      'post_type_list_str': instance.post_type_list_str,
      'post_date': instance.post_date?.toIso8601String(),
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'read_by_seller': instance.read_by_seller,
      'read_by_buyer': instance.read_by_buyer,
      'captcha': instance.captcha,
    };

ProductCommentsSuperBase _$ProductCommentsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ProductCommentsSuperBase(
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
          : AddModelProductComments.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCommentsSuperBaseToJson(
        ProductCommentsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
