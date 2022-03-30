// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSales _$ItemSalesFromJson(Map<String, dynamic> json) => ItemSales(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['order_item_id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['buyer_id'] as int?,
      json['buyer_str'] as String?,
      json['buyer_url'] as String?,
      (json['buyer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['buyer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rating'] as int?,
      json['testimony'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemSalesToJson(ItemSales instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'order_item_id': instance.order_item_id,
      'date': instance.date?.toIso8601String(),
      'buyer_id': instance.buyer_id,
      'buyer_str': instance.buyer_str,
      'buyer_url': instance.buyer_url,
      'buyer_list': instance.buyer_list,
      'buyer_list_str': instance.buyer_list_str,
      'price': instance.price,
      'price_str': instance.price_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'rating': instance.rating,
      'testimony': instance.testimony,
    };
