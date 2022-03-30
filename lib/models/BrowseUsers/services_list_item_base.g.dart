// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemServices _$ItemServicesFromJson(Map<String, dynamic> json) => ItemServices(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['service_id'] as String?,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['rating'] as int?,
      (json['rating_num'] as num?)?.toDouble(),
      json['rating_num_str'] as String?,
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      json['short_description'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemServicesToJson(ItemServices instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'service_id': instance.service_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'price': instance.price,
      'price_str': instance.price_str,
      'rating': instance.rating,
      'rating_num': instance.rating_num,
      'rating_num_str': instance.rating_num_str,
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'short_description': instance.short_description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
    };
