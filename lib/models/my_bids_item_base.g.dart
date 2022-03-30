// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bids_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyBids _$ItemMyBidsFromJson(Map<String, dynamic> json) => ItemMyBids(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bid_id'] as String?,
      json['project_id'] as int?,
      json['project_str'] as String?,
      json['project_url'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_project_status_id'] as int?,
      json['project_project_status_str'] as String?,
      json['worker_id'] as int?,
      json['worker_str'] as String?,
      json['worker_url'] as String?,
      (json['worker_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['shortlisted'] as bool?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      json['message'] as String?,
      json['attachments_name'] as String?,
      json['attachments_url'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemMyBidsToJson(ItemMyBids instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'bid_id': instance.bid_id,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_url': instance.project_url,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'project_project_status_id': instance.project_project_status_id,
      'project_project_status_str': instance.project_project_status_str,
      'worker_id': instance.worker_id,
      'worker_str': instance.worker_str,
      'worker_url': instance.worker_url,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'shortlisted': instance.shortlisted,
      'date': instance.date?.toIso8601String(),
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments_url': instance.attachments_url,
      'attachments': instance.attachments,
    };
