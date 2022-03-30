// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortlisted_bids_view_profile_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionViewProfileShortlistedBids
    _$ModelActionViewProfileShortlistedBidsFromJson(
            Map<String, dynamic> json) =>
        ModelActionViewProfileShortlistedBids(
          json['id'] as String?,
          json['bid_id'] as String?,
          json['worker_id'] as int?,
          json['worker_str'] as String?,
          (json['worker_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['worker_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['project_id'] as int?,
          json['project_str'] as String?,
          (json['project_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['project_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['status_id'] as int?,
          json['status_str'] as String?,
          (json['status_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['status_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
          json['location_id'] as int?,
          json['location_str'] as String?,
          (json['location_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['location_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['rating'] as int?,
          json['matching_skills'] as int?,
          (json['amount'] as num?)?.toDouble(),
          json['message'] as String?,
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['read_by_owner'] as bool?,
          json['shortlisted'] as bool?,
          json['captcha'] as String?,
          json['project_title'] as String?,
          json['project_owner'] as String?,
          json['description'] as String?,
          json['published_budget'] as String?,
          json['budget_range'] as String?,
          (json['budget_range_min'] as num?)?.toDouble(),
          json['budget_range_min_str'] as String?,
          (json['budget_range_max'] as num?)?.toDouble(),
          json['budget_range_max_str'] as String?,
          json['budget_range_str'] as String?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?
          ..attachments_name = json['attachments_name'] as String?;

Map<String, dynamic> _$ModelActionViewProfileShortlistedBidsToJson(
        ModelActionViewProfileShortlistedBids instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'bid_id': instance.bid_id,
      'worker_id': instance.worker_id,
      'worker_str': instance.worker_str,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'date': instance.date?.toIso8601String(),
      'location_id': instance.location_id,
      'location_str': instance.location_str,
      'location_list': instance.location_list,
      'location_list_str': instance.location_list_str,
      'rating': instance.rating,
      'matching_skills': instance.matching_skills,
      'amount': instance.amount,
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'read_by_owner': instance.read_by_owner,
      'shortlisted': instance.shortlisted,
      'captcha': instance.captcha,
      'project_title': instance.project_title,
      'project_owner': instance.project_owner,
      'description': instance.description,
      'published_budget': instance.published_budget,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
    };

ViewProfileShortlistedBidsSuperBase
    _$ViewProfileShortlistedBidsSuperBaseFromJson(Map<String, dynamic> json) =>
        ViewProfileShortlistedBidsSuperBase(
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
              : ModelActionViewProfileShortlistedBids.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ViewProfileShortlistedBidsSuperBaseToJson(
        ViewProfileShortlistedBidsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
