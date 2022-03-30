// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyProducts _$ItemMyProductsFromJson(Map<String, dynamic> json) =>
    ItemMyProducts(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_id'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      json['seller_url'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['short_description'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['admin_note'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemMyProductsToJson(ItemMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'product_id': instance.product_id,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'short_description': instance.short_description,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'price': instance.price,
      'price_str': instance.price_str,
      'published_date': instance.published_date?.toIso8601String(),
      'last_bump': instance.last_bump?.toIso8601String(),
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'admin_note': instance.admin_note,
    };
