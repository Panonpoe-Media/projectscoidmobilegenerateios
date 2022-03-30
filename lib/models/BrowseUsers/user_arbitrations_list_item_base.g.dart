// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_arbitrations_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemUserArbitrations _$ItemUserArbitrationsFromJson(
        Map<String, dynamic> json) =>
    ItemUserArbitrations(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['arbitration_id'] as String?,
      json['project_id'] as int?,
      json['project_str'] as String?,
      json['project_url'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['plaintiff_id'] as int?,
      json['plaintiff_str'] as String?,
      json['plaintiff_url'] as String?,
      (json['plaintiff_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['plaintiff_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['requested_date'] == null
          ? null
          : DateTime.parse(json['requested_date'] as String),
      json['plaintiff_description'] as String?,
      json['plaintiff_wishes'] as String?,
      json['defendant_id'] as int?,
      json['defendant_str'] as String?,
      json['defendant_url'] as String?,
      (json['defendant_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['defendant_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['defendant_response_date'] == null
          ? null
          : DateTime.parse(json['defendant_response_date'] as String),
      json['defendant_description'] as String?,
      json['defendant_wishes'] as String?,
      json['analysis'] as String?,
      json['decided_date'] == null
          ? null
          : DateTime.parse(json['decided_date'] as String),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_rating'] as int?,
      json['owner_point'] as int?,
      json['owner_point_str'] as String?,
      (json['owner_amount'] as num?)?.toDouble(),
      json['owner_amount_str'] as String?,
      json['owner_percentage'] as int?,
      json['worker_rating'] as int?,
      json['worker_point'] as int?,
      json['worker_point_str'] as String?,
      (json['worker_amount'] as num?)?.toDouble(),
      json['worker_amount_str'] as String?,
      json['worker_percentage'] as int?,
      json['plaintiff_avatar'] as String?,
      json['defendant_avatar'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemUserArbitrationsToJson(
        ItemUserArbitrations instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'arbitration_id': instance.arbitration_id,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_url': instance.project_url,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'plaintiff_id': instance.plaintiff_id,
      'plaintiff_str': instance.plaintiff_str,
      'plaintiff_url': instance.plaintiff_url,
      'plaintiff_list': instance.plaintiff_list,
      'plaintiff_list_str': instance.plaintiff_list_str,
      'requested_date': instance.requested_date?.toIso8601String(),
      'plaintiff_description': instance.plaintiff_description,
      'plaintiff_wishes': instance.plaintiff_wishes,
      'defendant_id': instance.defendant_id,
      'defendant_str': instance.defendant_str,
      'defendant_url': instance.defendant_url,
      'defendant_list': instance.defendant_list,
      'defendant_list_str': instance.defendant_list_str,
      'defendant_response_date':
          instance.defendant_response_date?.toIso8601String(),
      'defendant_description': instance.defendant_description,
      'defendant_wishes': instance.defendant_wishes,
      'analysis': instance.analysis,
      'decided_date': instance.decided_date?.toIso8601String(),
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'owner_rating': instance.owner_rating,
      'owner_point': instance.owner_point,
      'owner_point_str': instance.owner_point_str,
      'owner_amount': instance.owner_amount,
      'owner_amount_str': instance.owner_amount_str,
      'owner_percentage': instance.owner_percentage,
      'worker_rating': instance.worker_rating,
      'worker_point': instance.worker_point,
      'worker_point_str': instance.worker_point_str,
      'worker_amount': instance.worker_amount,
      'worker_amount_str': instance.worker_amount_str,
      'worker_percentage': instance.worker_percentage,
      'plaintiff_avatar': instance.plaintiff_avatar,
      'defendant_avatar': instance.defendant_avatar,
    };
