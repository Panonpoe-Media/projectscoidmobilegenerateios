// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_products_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemBrowseProducts _$ItemBrowseProductsFromJson(Map<String, dynamic> json) =>
    ItemBrowseProducts(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_id'] as String?,
      json['title'] as String?,
      json['rating'] as int?,
      (json['rating_num'] as num?)?.toDouble(),
      json['rating_num_str'] as String?,
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      json['seller_url'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['seller_product_sold'] as int?,
      json['seller_seller_rating'] as int?,
      json['short_description'] as String?,
      json['trial_version_name'] as String?,
      json['trial_version_url'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemBrowseProductsToJson(ItemBrowseProducts instance) =>
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
      'title': instance.title,
      'rating': instance.rating,
      'rating_num': instance.rating_num,
      'rating_num_str': instance.rating_num_str,
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'price': instance.price,
      'price_str': instance.price_str,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'seller_product_sold': instance.seller_product_sold,
      'seller_seller_rating': instance.seller_seller_rating,
      'short_description': instance.short_description,
      'trial_version_name': instance.trial_version_name,
      'trial_version_url': instance.trial_version_url,
      'trial_version': instance.trial_version,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
    };
