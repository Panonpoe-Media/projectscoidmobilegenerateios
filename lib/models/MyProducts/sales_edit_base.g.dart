// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelSales _$EditModelSalesFromJson(Map<String, dynamic> json) =>
    EditModelSales(
      json['id'] as String?,
      json['order_item_id'] as String?,
      json['buyer_id'] as int?,
      json['buyer_str'] as String?,
      (json['buyer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['buyer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['order_id'] as int?,
      json['order_str'] as String?,
      (json['order_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['order_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['product_id'] as int?,
      json['product_str'] as String?,
      (json['product_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['product_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_id'] as int?,
      json['project_str'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['service_id'] as int?,
      json['service_str'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bid_id'] as int?,
      json['bid_str'] as String?,
      (json['bid_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bid_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['iklan_id'] as int?,
      json['iklan_str'] as String?,
      (json['iklan_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['iklan_list_str'] as List<dynamic>?)
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
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['buyer_payment_id'] as int?,
      json['buyer_payment_str'] as String?,
      (json['buyer_payment_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['buyer_payment_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['seller_credit_id'] as int?,
      json['seller_credit_str'] as String?,
      (json['seller_credit_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['seller_credit_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..buyer_url = json['buyer_url'] as String?
      ..order_url = json['order_url'] as String?
      ..title = json['title'] as String?
      ..product_url = json['product_url'] as String?
      ..project_url = json['project_url'] as String?
      ..service_url = json['service_url'] as String?
      ..bid_url = json['bid_url'] as String?
      ..iklan_url = json['iklan_url'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..seller_url = json['seller_url'] as String?
      ..buyer_payment_url = json['buyer_payment_url'] as String?
      ..seller_credit_url = json['seller_credit_url'] as String?
      ..rating = json['rating'] as int?
      ..testimony = json['testimony'] as String?;

Map<String, dynamic> _$EditModelSalesToJson(EditModelSales instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'order_item_id': instance.order_item_id,
      'buyer_id': instance.buyer_id,
      'buyer_url': instance.buyer_url,
      'buyer_str': instance.buyer_str,
      'buyer_list': instance.buyer_list,
      'buyer_list_str': instance.buyer_list_str,
      'order_id': instance.order_id,
      'order_url': instance.order_url,
      'order_str': instance.order_str,
      'order_list': instance.order_list,
      'order_list_str': instance.order_list_str,
      'title': instance.title,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'product_id': instance.product_id,
      'product_url': instance.product_url,
      'product_str': instance.product_str,
      'product_list': instance.product_list,
      'product_list_str': instance.product_list_str,
      'project_id': instance.project_id,
      'project_url': instance.project_url,
      'project_str': instance.project_str,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'service_id': instance.service_id,
      'service_url': instance.service_url,
      'service_str': instance.service_str,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
      'bid_id': instance.bid_id,
      'bid_url': instance.bid_url,
      'bid_str': instance.bid_str,
      'bid_list': instance.bid_list,
      'bid_list_str': instance.bid_list_str,
      'iklan_id': instance.iklan_id,
      'iklan_url': instance.iklan_url,
      'iklan_str': instance.iklan_str,
      'iklan_list': instance.iklan_list,
      'iklan_list_str': instance.iklan_list_str,
      'date': instance.date?.toIso8601String(),
      'price': instance.price,
      'price_str': instance.price_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'seller_id': instance.seller_id,
      'seller_url': instance.seller_url,
      'seller_str': instance.seller_str,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'buyer_payment_id': instance.buyer_payment_id,
      'buyer_payment_url': instance.buyer_payment_url,
      'buyer_payment_str': instance.buyer_payment_str,
      'buyer_payment_list': instance.buyer_payment_list,
      'buyer_payment_list_str': instance.buyer_payment_list_str,
      'seller_credit_id': instance.seller_credit_id,
      'seller_credit_url': instance.seller_credit_url,
      'seller_credit_str': instance.seller_credit_str,
      'seller_credit_list': instance.seller_credit_list,
      'seller_credit_list_str': instance.seller_credit_list_str,
      'rating': instance.rating,
      'testimony': instance.testimony,
    };

SalesSuperBase _$SalesSuperBaseFromJson(Map<String, dynamic> json) =>
    SalesSuperBase(
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
          : EditModelSales.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesSuperBaseToJson(SalesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
