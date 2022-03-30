// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_comments_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelProductComments _$ViewModelProductCommentsFromJson(
        Map<String, dynamic> json) =>
    ViewModelProductComments(
      json['id'] as String?,
      json['product_post_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      json['user_url'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['product_id'] as int?,
      json['product_str'] as String?,
      json['product_url'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['thread_id'] as int?,
      json['thread_str'] as String?,
      json['thread_url'] as String?,
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
      json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String),
      json['message'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['read_by_seller'] as bool,
      json['read_by_buyer'] as bool,
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelProductCommentsToJson(
        ViewModelProductComments instance) =>
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
      'user_str': instance.user_str,
      'user_url': instance.user_url,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'product_id': instance.product_id,
      'product_str': instance.product_str,
      'product_url': instance.product_url,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'thread_id': instance.thread_id,
      'thread_str': instance.thread_str,
      'thread_url': instance.thread_url,
      'thread_list': instance.thread_list,
      'thread_list_str': instance.thread_list_str,
      'post_type_id': instance.post_type_id,
      'post_type_str': instance.post_type_str,
      'post_type_list': instance.post_type_list,
      'post_type_list_str': instance.post_type_list_str,
      'post_date': instance.post_date?.toIso8601String(),
      'message': instance.message,
      'attachments': instance.attachments,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'read_by_seller': instance.read_by_seller,
      'read_by_buyer': instance.read_by_buyer,
      'captcha': instance.captcha,
    };

ProductCommentsViewSuperBase _$ProductCommentsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ProductCommentsViewSuperBase(
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
          : ViewModelProductComments.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCommentsViewSuperBaseToJson(
        ProductCommentsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
