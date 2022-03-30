// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_arbitrations_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelUserArbitrations _$ViewModelUserArbitrationsFromJson(
        Map<String, dynamic> json) =>
    ViewModelUserArbitrations(
      json['id'] as String?,
      json['arbitration_id'] as String?,
      json['plaintiff_id'] as int?,
      json['plaintiff_str'] as String?,
      json['plaintiff_url'] as String?,
      (json['plaintiff_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['plaintiff_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['defendant_id'] as int?,
      json['defendant_str'] as String?,
      json['defendant_url'] as String?,
      (json['defendant_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['defendant_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_id'] as int?,
      json['project_str'] as String?,
      json['project_url'] as String?,
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
      json['status_date'] == null
          ? null
          : DateTime.parse(json['status_date'] as String),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['plaintiff_description'] as String?,
      json['plaintiff_wishes'] as String?,
      json['plaintiff_has_offer'] as bool,
      (json['plaintiff_offer_for_worker'] as num?)?.toDouble(),
      json['plaintiff_offer_for_worker_str'] as String?,
      (json['plaintiff_offer_for_owner'] as num?)?.toDouble(),
      json['plaintiff_offer_for_owner_str'] as String?,
      json['plaintiff_response_date'] == null
          ? null
          : DateTime.parse(json['plaintiff_response_date'] as String),
      json['plaintiff_ip'] as String?,
      json['defendant_description'] as String?,
      json['defendant_wishes'] as String?,
      json['defendant_has_offer'] as bool,
      (json['defendant_offer_for_worker'] as num?)?.toDouble(),
      json['defendant_offer_for_worker_str'] as String?,
      (json['defendant_offer_for_owner'] as num?)?.toDouble(),
      json['defendant_offer_for_owner_str'] as String?,
      json['defendant_response_date'] == null
          ? null
          : DateTime.parse(json['defendant_response_date'] as String),
      json['defendant_last_status_id'] as int?,
      json['defendant_last_status_str'] as String?,
      (json['defendant_last_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['defendant_last_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['defendant_ip'] as String?,
      json['requested_date'] == null
          ? null
          : DateTime.parse(json['requested_date'] as String),
      json['requested_by_id'] as int?,
      json['requested_by_str'] as String?,
      json['requested_by_url'] as String?,
      (json['requested_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['requested_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['requested_ip'] as String?,
      json['decided_date'] == null
          ? null
          : DateTime.parse(json['decided_date'] as String),
      json['decided_by_id'] as int?,
      json['decided_by_str'] as String?,
      json['decided_by_url'] as String?,
      (json['decided_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['decided_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['decided_ip'] as String?,
      json['canceled_date'] == null
          ? null
          : DateTime.parse(json['canceled_date'] as String),
      json['canceled_by_id'] as int?,
      json['canceled_by_str'] as String?,
      json['canceled_by_url'] as String?,
      (json['canceled_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['canceled_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['canceled_ip'] as String?,
      json['arbitrator_2_id'] as int?,
      json['arbitrator_2_str'] as String?,
      json['arbitrator_2_url'] as String?,
      (json['arbitrator_2_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitrator_2_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['arbitrator_3_id'] as int?,
      json['arbitrator_3_str'] as String?,
      json['arbitrator_3_url'] as String?,
      (json['arbitrator_3_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitrator_3_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_rating'] as int?,
      json['owner_point'] as int?,
      json['owner_point_str'] as String?,
      json['owner_point_base_id'] as int?,
      json['owner_point_base_str'] as String?,
      json['owner_point_base_url'] as String?,
      (json['owner_point_base_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['owner_point_base_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['owner_amount'] as num?)?.toDouble(),
      json['owner_amount_str'] as String?,
      json['owner_percentage'] as int?,
      json['worker_rating'] as int?,
      json['worker_point'] as int?,
      json['worker_point_str'] as String?,
      json['worker_point_base_id'] as int?,
      json['worker_point_base_str'] as String?,
      json['worker_point_base_url'] as String?,
      (json['worker_point_base_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['worker_point_base_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['worker_amount'] as num?)?.toDouble(),
      json['worker_amount_str'] as String?,
      json['worker_percentage'] as int?,
      json['analysis'] as String?,
      json['your_offer'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelUserArbitrationsToJson(
        ViewModelUserArbitrations instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'arbitration_id': instance.arbitration_id,
      'plaintiff_id': instance.plaintiff_id,
      'plaintiff_str': instance.plaintiff_str,
      'plaintiff_url': instance.plaintiff_url,
      'plaintiff_list': instance.plaintiff_list,
      'plaintiff_list_str': instance.plaintiff_list_str,
      'defendant_id': instance.defendant_id,
      'defendant_str': instance.defendant_str,
      'defendant_url': instance.defendant_url,
      'defendant_list': instance.defendant_list,
      'defendant_list_str': instance.defendant_list_str,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_url': instance.project_url,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'status_date': instance.status_date?.toIso8601String(),
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'plaintiff_description': instance.plaintiff_description,
      'plaintiff_wishes': instance.plaintiff_wishes,
      'plaintiff_has_offer': instance.plaintiff_has_offer,
      'plaintiff_offer_for_worker': instance.plaintiff_offer_for_worker,
      'plaintiff_offer_for_worker_str': instance.plaintiff_offer_for_worker_str,
      'plaintiff_offer_for_owner': instance.plaintiff_offer_for_owner,
      'plaintiff_offer_for_owner_str': instance.plaintiff_offer_for_owner_str,
      'plaintiff_response_date':
          instance.plaintiff_response_date?.toIso8601String(),
      'plaintiff_ip': instance.plaintiff_ip,
      'defendant_description': instance.defendant_description,
      'defendant_wishes': instance.defendant_wishes,
      'defendant_has_offer': instance.defendant_has_offer,
      'defendant_offer_for_worker': instance.defendant_offer_for_worker,
      'defendant_offer_for_worker_str': instance.defendant_offer_for_worker_str,
      'defendant_offer_for_owner': instance.defendant_offer_for_owner,
      'defendant_offer_for_owner_str': instance.defendant_offer_for_owner_str,
      'defendant_response_date':
          instance.defendant_response_date?.toIso8601String(),
      'defendant_last_status_id': instance.defendant_last_status_id,
      'defendant_last_status_str': instance.defendant_last_status_str,
      'defendant_last_status_list': instance.defendant_last_status_list,
      'defendant_last_status_list_str': instance.defendant_last_status_list_str,
      'defendant_ip': instance.defendant_ip,
      'requested_date': instance.requested_date?.toIso8601String(),
      'requested_by_id': instance.requested_by_id,
      'requested_by_str': instance.requested_by_str,
      'requested_by_url': instance.requested_by_url,
      'requested_by_list': instance.requested_by_list,
      'requested_by_list_str': instance.requested_by_list_str,
      'requested_ip': instance.requested_ip,
      'decided_date': instance.decided_date?.toIso8601String(),
      'decided_by_id': instance.decided_by_id,
      'decided_by_str': instance.decided_by_str,
      'decided_by_url': instance.decided_by_url,
      'decided_by_list': instance.decided_by_list,
      'decided_by_list_str': instance.decided_by_list_str,
      'decided_ip': instance.decided_ip,
      'canceled_date': instance.canceled_date?.toIso8601String(),
      'canceled_by_id': instance.canceled_by_id,
      'canceled_by_str': instance.canceled_by_str,
      'canceled_by_url': instance.canceled_by_url,
      'canceled_by_list': instance.canceled_by_list,
      'canceled_by_list_str': instance.canceled_by_list_str,
      'canceled_ip': instance.canceled_ip,
      'arbitrator_2_id': instance.arbitrator_2_id,
      'arbitrator_2_str': instance.arbitrator_2_str,
      'arbitrator_2_url': instance.arbitrator_2_url,
      'arbitrator_2_list': instance.arbitrator_2_list,
      'arbitrator_2_list_str': instance.arbitrator_2_list_str,
      'arbitrator_3_id': instance.arbitrator_3_id,
      'arbitrator_3_str': instance.arbitrator_3_str,
      'arbitrator_3_url': instance.arbitrator_3_url,
      'arbitrator_3_list': instance.arbitrator_3_list,
      'arbitrator_3_list_str': instance.arbitrator_3_list_str,
      'owner_rating': instance.owner_rating,
      'owner_point': instance.owner_point,
      'owner_point_str': instance.owner_point_str,
      'owner_point_base_id': instance.owner_point_base_id,
      'owner_point_base_str': instance.owner_point_base_str,
      'owner_point_base_url': instance.owner_point_base_url,
      'owner_point_base_list': instance.owner_point_base_list,
      'owner_point_base_list_str': instance.owner_point_base_list_str,
      'owner_amount': instance.owner_amount,
      'owner_amount_str': instance.owner_amount_str,
      'owner_percentage': instance.owner_percentage,
      'worker_rating': instance.worker_rating,
      'worker_point': instance.worker_point,
      'worker_point_str': instance.worker_point_str,
      'worker_point_base_id': instance.worker_point_base_id,
      'worker_point_base_str': instance.worker_point_base_str,
      'worker_point_base_url': instance.worker_point_base_url,
      'worker_point_base_list': instance.worker_point_base_list,
      'worker_point_base_list_str': instance.worker_point_base_list_str,
      'worker_amount': instance.worker_amount,
      'worker_amount_str': instance.worker_amount_str,
      'worker_percentage': instance.worker_percentage,
      'analysis': instance.analysis,
      'your_offer': instance.your_offer,
    };

UserArbitrationsViewSuperBase _$UserArbitrationsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    UserArbitrationsViewSuperBase(
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
          : ViewModelUserArbitrations.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserArbitrationsViewSuperBaseToJson(
        UserArbitrationsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
