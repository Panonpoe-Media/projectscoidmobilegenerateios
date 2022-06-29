// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelMyServicesRev _$ViewModelMyServicesRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelMyServicesRev(
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
      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OptionField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
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
      json['service_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyServicesRevToJson(
        ViewModelMyServicesRev instance) =>
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
      'registered_date': instance.registered_date?.toIso8601String(),
      'published_date': instance.published_date?.toIso8601String(),
      'last_bump': instance.last_bump?.toIso8601String(),
      'price': instance.price,
      'price_str': instance.price_str,
      'options': instance.options,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
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
      'service_id': instance.service_id,
    };

MyServicesViewRevSuperBase _$MyServicesViewRevSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyServicesViewRevSuperBase(
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
              : ViewModelMyServicesRev.fromJson(
              json['model'] as Map<String, dynamic>),
      //json['model'],
    );

Map<String, dynamic> _$MyServicesViewRevSuperBaseToJson(
        MyServicesViewRevSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
