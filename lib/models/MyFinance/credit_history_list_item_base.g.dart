// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_history_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCreditHistory _$ItemCreditHistoryFromJson(Map<String, dynamic> json) =>
    ItemCreditHistory(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['credit_id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['user_id'] as int?,
      json['user_str'] as String?,
      json['user_url'] as String?,
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
      json['title'] as String?,
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['balance'] as num?)?.toDouble(),
      json['balance_str'] as String?,
      json['ref_id'] as int?,
      json['ref_id_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemCreditHistoryToJson(ItemCreditHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'credit_id': instance.credit_id,
      'date': instance.date?.toIso8601String(),
      'user_id': instance.user_id,
      'user_str': instance.user_str,
      'user_url': instance.user_url,
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
    };
