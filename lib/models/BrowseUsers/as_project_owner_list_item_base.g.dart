// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_project_owner_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAsProjectOwner _$ItemAsProjectOwnerFromJson(Map<String, dynamic> json) =>
    ItemAsProjectOwner(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_id'] as String?,
      json['arbitration_id'] as int?,
      json['arbitration_str'] as String?,
      json['arbitration_url'] as String?,
      (json['arbitration_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitration_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_ending_id'] as int?,
      json['project_ending_str'] as String?,
      (json['project_ending_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_ending_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_rating'] as int?,
      json['owner_feedback'] as String?,
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      json['accepted_worker_url'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
      json['title'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemAsProjectOwnerToJson(ItemAsProjectOwner instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'project_id': instance.project_id,
      'arbitration_id': instance.arbitration_id,
      'arbitration_str': instance.arbitration_str,
      'arbitration_url': instance.arbitration_url,
      'arbitration_list': instance.arbitration_list,
      'arbitration_list_str': instance.arbitration_list_str,
      'project_ending_id': instance.project_ending_id,
      'project_ending_str': instance.project_ending_str,
      'project_ending_list': instance.project_ending_list,
      'project_ending_list_str': instance.project_ending_list_str,
      'owner_rating': instance.owner_rating,
      'owner_feedback': instance.owner_feedback,
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'finish_date': instance.finish_date?.toIso8601String(),
      'title': instance.title,
    };
