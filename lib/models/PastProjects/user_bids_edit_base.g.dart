// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bids_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelUserBids _$EditModelUserBidsFromJson(Map<String, dynamic> json) =>
    EditModelUserBids(
      json['id'] as String?,
      json['bid_id'] as String?,
      json['project_id'] as int?,
      json['project_str'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['mark_id'] as int?,
      json['mark_str'] as String?,
      (json['mark_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['mark_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['worker_id'] as int?,
      json['worker_str'] as String?,
      (json['worker_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['location_id'] as int?,
      json['location_str'] as String?,
      (json['location_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['location_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..project_url = json['project_url'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..worker_url = json['worker_url'] as String?
      ..location_url = json['location_url'] as String?
      ..rating = json['rating'] as int?
      ..matching_skills = json['matching_skills'] as int?
      ..message = json['message'] as String?
      ..read_by_owner = json['read_by_owner'] as bool?
      ..shortlisted = json['shortlisted'] as bool?
      ..captcha = json['captcha'] as String?
      ..project_title = json['project_title'] as String?
      ..project_owner = json['project_owner'] as String?
      ..description = json['description'] as String?
      ..published_budget = json['published_budget'] as String?
      ..budget_range = json['budget_range'] as String?;

Map<String, dynamic> _$EditModelUserBidsToJson(EditModelUserBids instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'bid_id': instance.bid_id,
      'project_id': instance.project_id,
      'project_url': instance.project_url,
      'project_str': instance.project_str,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'date': instance.date?.toIso8601String(),
      'worker_id': instance.worker_id,
      'worker_url': instance.worker_url,
      'worker_str': instance.worker_str,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'location_id': instance.location_id,
      'location_url': instance.location_url,
      'location_str': instance.location_str,
      'location_list': instance.location_list,
      'location_list_str': instance.location_list_str,
      'rating': instance.rating,
      'matching_skills': instance.matching_skills,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
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
    };

UserBidsSuperBase _$UserBidsSuperBaseFromJson(Map<String, dynamic> json) =>
    UserBidsSuperBase(
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
          : EditModelUserBids.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBidsSuperBaseToJson(UserBidsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
