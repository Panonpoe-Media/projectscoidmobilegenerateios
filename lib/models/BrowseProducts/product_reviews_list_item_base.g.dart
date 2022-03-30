// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemProductReviews _$ItemProductReviewsFromJson(Map<String, dynamic> json) =>
    ItemProductReviews(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['order_item_id'] as String?,
      json['rating'] as int?,
      json['testimony'] as String?,
      json['buyer_id'] as int?,
      json['buyer_str'] as String?,
      json['buyer_url'] as String?,
      (json['buyer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['buyer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['buyer_photo_url'] as String?,
      json['buyer_photo'] == null
          ? null
          : Photo.fromJson(json['buyer_photo'] as Map<String, dynamic>),
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemProductReviewsToJson(ItemProductReviews instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'order_item_id': instance.order_item_id,
      'rating': instance.rating,
      'testimony': instance.testimony,
      'buyer_id': instance.buyer_id,
      'buyer_str': instance.buyer_str,
      'buyer_url': instance.buyer_url,
      'buyer_list': instance.buyer_list,
      'buyer_list_str': instance.buyer_list_str,
      'buyer_photo_url': instance.buyer_photo_url,
      'buyer_photo': instance.buyer_photo,
      'date': instance.date?.toIso8601String(),
    };
