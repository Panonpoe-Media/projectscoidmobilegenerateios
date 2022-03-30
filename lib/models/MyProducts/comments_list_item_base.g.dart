// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemComments _$ItemCommentsFromJson(Map<String, dynamic> json) => ItemComments(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_post_id'] as String?,
      json['user_photo_url'] as String?,
      json['user_photo'] == null
          ? null
          : Photo.fromJson(json['user_photo'] as Map<String, dynamic>),
      json['user_seller_ranking'] as int?,
      json['user_seller_ranking_str'] as String?,
      json['user_kabupaten_id'] as int?,
      json['user_kabupaten_str'] as String?,
      json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String),
      json['message'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_user_name = json['user_user_name'] as String?
      ..user_seller_rating = json['user_seller_rating'] as int?;

Map<String, dynamic> _$ItemCommentsToJson(ItemComments instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'product_post_id': instance.product_post_id,
      'user_photo_url': instance.user_photo_url,
      'user_photo': instance.user_photo,
      'user_user_name': instance.user_user_name,
      'user_seller_rating': instance.user_seller_rating,
      'user_seller_ranking': instance.user_seller_ranking,
      'user_seller_ranking_str': instance.user_seller_ranking_str,
      'user_kabupaten_id': instance.user_kabupaten_id,
      'user_kabupaten_str': instance.user_kabupaten_str,
      'post_date': instance.post_date?.toIso8601String(),
      'message': instance.message,
    };
