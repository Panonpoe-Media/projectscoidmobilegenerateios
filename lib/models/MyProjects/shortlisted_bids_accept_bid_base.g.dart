// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortlisted_bids_accept_bid_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionAcceptBidShortlistedBids
    _$ModelActionAcceptBidShortlistedBidsFromJson(Map<String, dynamic> json) =>
        ModelActionAcceptBidShortlistedBids(
          json['id'] as String?,
          json['bid_id'] as String?,
          json['worker_id'] as int?,
          json['worker_str'] as String?,
          json['worker_url'] as String?,
          (json['worker_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['worker_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['project_id'] as int?,
          json['project_str'] as String?,
          json['project_url'] as String?,
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
              json['mark_id'] as int?,
              json['mark_str'] as String?,
              (json['mark_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
              (json['mark_list_str'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList(),
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
          json['location_id'] as int?,
          json['location_str'] as String?,
          json['location_url'] as String?,
          (json['location_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['location_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['rating'] as int?,
          json['matching_skills'] as int?,
          (json['amount'] as num?)?.toDouble(),
          json['amount_str'] as String?,
          json['message'] as String?,
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['attachments_url'] as String?,
          json['attachments_name'] as String?,
          json['shortlisted'] as bool?,
          json['published_budget'] as String?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAcceptBidShortlistedBidsToJson(
        ModelActionAcceptBidShortlistedBids instance) =>
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
      'worker_url': instance.worker_url,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_url': instance.project_url,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'date': instance.date?.toIso8601String(),
      'location_id': instance.location_id,
      'location_str': instance.location_str,
      'location_url': instance.location_url,
      'location_list': instance.location_list,
      'location_list_str': instance.location_list_str,
      'rating': instance.rating,
      'matching_skills': instance.matching_skills,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'message': instance.message,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'shortlisted': instance.shortlisted,
      'published_budget': instance.published_budget,
    };

AcceptBidShortlistedBidsSuperBase _$AcceptBidShortlistedBidsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AcceptBidShortlistedBidsSuperBase(
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
          : ModelActionAcceptBidShortlistedBids.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptBidShortlistedBidsSuperBaseToJson(
        AcceptBidShortlistedBidsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
