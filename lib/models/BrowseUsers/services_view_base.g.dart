// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelServices _$ViewModelServicesFromJson(Map<String, dynamic> json) =>
    ViewModelServices(
      json['id'] as String?,
      json['service_id'] as String?,
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
      json['category_id'] as int?,
      json['category_str'] as String?,
      json['category_url'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
      json['description'] as String?,
      json['short_description'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['options'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_by_id'] as int?,
      json['registered_by_str'] as String?,
      json['registered_by_url'] as String?,
      (json['registered_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['registered_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      json['registered_from_ip'] as String?,
      json['verified_by_id'] as int?,
      json['verified_by_str'] as String?,
      json['verified_by_url'] as String?,
      (json['verified_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['verified_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['verified_date'] == null
          ? null
          : DateTime.parse(json['verified_date'] as String),
      json['verified_from_ip'] as String?,
      json['verifier_note'] as String?,
      json['approved_by_id'] as int?,
      json['approved_by_str'] as String?,
      json['approved_by_url'] as String?,
      (json['approved_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['approved_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String),
      json['approved_from_ip'] as String?,
      json['approver_note'] as String?,
      json['published_by_id'] as int?,
      json['published_by_str'] as String?,
      json['published_by_url'] as String?,
      (json['published_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['published_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['published_from_ip'] as String?,
      json['rejected_by_id'] as int?,
      json['rejected_by_str'] as String?,
      json['rejected_by_url'] as String?,
      (json['rejected_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['rejected_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rejected_date'] == null
          ? null
          : DateTime.parse(json['rejected_date'] as String),
      json['rejected_from_ip'] as String?,
      json['admin_note'] as String?,
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['sales_amount'] as num?)?.toDouble(),
      json['sales_amount_str'] as String?,
      json['rating'] as int?,
      json['points'] as int?,
      json['points_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      (json['rating_num'] as num?)?.toDouble(),
      json['rating_num_str'] as String?,
      json['rating_sum'] as int?,
      json['rating_sum_str'] as String?,
      json['rating_div'] as int?,
      json['rating_div_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelServicesToJson(ViewModelServices instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'service_id': instance.service_id,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'category_id': instance.category_id,
      'category_str': instance.category_str,
      'category_url': instance.category_url,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'price': instance.price,
      'price_str': instance.price_str,
      'options': instance.options,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'registered_by_id': instance.registered_by_id,
      'registered_by_str': instance.registered_by_str,
      'registered_by_url': instance.registered_by_url,
      'registered_by_list': instance.registered_by_list,
      'registered_by_list_str': instance.registered_by_list_str,
      'registered_date': instance.registered_date?.toIso8601String(),
      'registered_from_ip': instance.registered_from_ip,
      'verified_by_id': instance.verified_by_id,
      'verified_by_str': instance.verified_by_str,
      'verified_by_url': instance.verified_by_url,
      'verified_by_list': instance.verified_by_list,
      'verified_by_list_str': instance.verified_by_list_str,
      'verified_date': instance.verified_date?.toIso8601String(),
      'verified_from_ip': instance.verified_from_ip,
      'verifier_note': instance.verifier_note,
      'approved_by_id': instance.approved_by_id,
      'approved_by_str': instance.approved_by_str,
      'approved_by_url': instance.approved_by_url,
      'approved_by_list': instance.approved_by_list,
      'approved_by_list_str': instance.approved_by_list_str,
      'approved_date': instance.approved_date?.toIso8601String(),
      'approved_from_ip': instance.approved_from_ip,
      'approver_note': instance.approver_note,
      'published_by_id': instance.published_by_id,
      'published_by_str': instance.published_by_str,
      'published_by_url': instance.published_by_url,
      'published_by_list': instance.published_by_list,
      'published_by_list_str': instance.published_by_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'published_from_ip': instance.published_from_ip,
      'rejected_by_id': instance.rejected_by_id,
      'rejected_by_str': instance.rejected_by_str,
      'rejected_by_url': instance.rejected_by_url,
      'rejected_by_list': instance.rejected_by_list,
      'rejected_by_list_str': instance.rejected_by_list_str,
      'rejected_date': instance.rejected_date?.toIso8601String(),
      'rejected_from_ip': instance.rejected_from_ip,
      'admin_note': instance.admin_note,
      'last_bump': instance.last_bump?.toIso8601String(),
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'sales_amount': instance.sales_amount,
      'sales_amount_str': instance.sales_amount_str,
      'rating': instance.rating,
      'points': instance.points,
      'points_str': instance.points_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'rating_num': instance.rating_num,
      'rating_num_str': instance.rating_num_str,
      'rating_sum': instance.rating_sum,
      'rating_sum_str': instance.rating_sum_str,
      'rating_div': instance.rating_div,
      'rating_div_str': instance.rating_div_str,
    };

ServicesViewSuperBase _$ServicesViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ServicesViewSuperBase(
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
          : ViewModelServices.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServicesViewSuperBaseToJson(
        ServicesViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
