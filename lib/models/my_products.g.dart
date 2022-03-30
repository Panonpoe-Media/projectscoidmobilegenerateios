// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelMyProductsRev _$ViewModelMyProductsRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelMyProductsRev(
      json['id'] as String?,
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
      json['description'] as String?,
      json['short_description'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['sales_amount'] as num?)?.toDouble(),
      json['sales_amount_str'] as String?,
      json['rating'] as int?,
      json['points'] as int?,
      json['points_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      json['admin_note'] as String?,
      json['product_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyProductsRevToJson(
        ViewModelMyProductsRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'deliverable': instance.deliverable,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'trial_version': instance.trial_version,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'registered_date': instance.registered_date?.toIso8601String(),
      'published_date': instance.published_date?.toIso8601String(),
      'last_bump': instance.last_bump?.toIso8601String(),
      'price': instance.price,
      'price_str': instance.price_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'sales_amount': instance.sales_amount,
      'sales_amount_str': instance.sales_amount_str,
      'rating': instance.rating,
      'points': instance.points,
      'points_str': instance.points_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'admin_note': instance.admin_note,
      'product_id': instance.product_id,
    };

MyProductsViewRevSuperBase _$MyProductsViewRevSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyProductsViewRevSuperBase(
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
          : ViewModelMyProductsRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductsViewRevSuperBaseToJson(
        MyProductsViewRevSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
