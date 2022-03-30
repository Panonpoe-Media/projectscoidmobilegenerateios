// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_history_add_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddModelCreditHistory _$AddModelCreditHistoryFromJson(
        Map<String, dynamic> json) =>
    AddModelCreditHistory(
      json['id'] as String?,
      json['credit_id'] as int?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['balance'] as num?)?.toDouble(),
      json['balance_str'] as String?,
      json['ref_id'] as int?,
      json['ref_id_str'] as String?,
      json['adjustment_amount'] as int?,
      json['adjustment_amount_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..user_url = json['user_url'] as String?
      ..title = json['title'] as String?;

Map<String, dynamic> _$AddModelCreditHistoryToJson(
        AddModelCreditHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'credit_id': instance.credit_id,
      'date': instance.date?.toIso8601String(),
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'title': instance.title,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'balance': instance.balance,
      'balance_str': instance.balance_str,
      'ref_id': instance.ref_id,
      'ref_id_str': instance.ref_id_str,
      'adjustment_amount': instance.adjustment_amount,
      'adjustment_amount_str': instance.adjustment_amount_str,
    };

CreditHistorySuperBase _$CreditHistorySuperBaseFromJson(
        Map<String, dynamic> json) =>
    CreditHistorySuperBase(
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
          : AddModelCreditHistory.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditHistorySuperBaseToJson(
        CreditHistorySuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
