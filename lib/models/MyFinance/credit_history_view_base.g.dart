// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_history_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelCreditHistory _$ViewModelCreditHistoryFromJson(
        Map<String, dynamic> json) =>
    ViewModelCreditHistory(
      json['id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['balance'] as num?)?.toDouble(),
      json['balance_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelCreditHistoryToJson(
        ViewModelCreditHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'date': instance.date?.toIso8601String(),
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'title': instance.title,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'balance': instance.balance,
      'balance_str': instance.balance_str,
    };

CreditHistoryViewSuperBase _$CreditHistoryViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    CreditHistoryViewSuperBase(
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
          : ViewModelCreditHistory.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditHistoryViewSuperBaseToJson(
        CreditHistoryViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
