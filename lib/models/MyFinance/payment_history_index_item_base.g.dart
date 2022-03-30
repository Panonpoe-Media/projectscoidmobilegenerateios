// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexPaymentHistory _$ItemIndexPaymentHistoryFromJson(
        Map<String, dynamic> json) =>
    ItemIndexPaymentHistory(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['payment_id'] as String?,
      json['transfer_date'] == null
          ? null
          : DateTime.parse(json['transfer_date'] as String),
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      json['bank_url'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['transfer_fee'] as num?)?.toDouble(),
      json['transfer_fee_str'] as String?,
      json['direction_id'] as int?,
      json['direction_str'] as String?,
      (json['direction_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['direction_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexPaymentHistoryToJson(
        ItemIndexPaymentHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'payment_id': instance.payment_id,
      'transfer_date': instance.transfer_date?.toIso8601String(),
      'bank_id': instance.bank_id,
      'bank_str': instance.bank_str,
      'bank_url': instance.bank_url,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'transfer_fee': instance.transfer_fee,
      'transfer_fee_str': instance.transfer_fee_str,
      'direction_id': instance.direction_id,
      'direction_str': instance.direction_str,
      'direction_list': instance.direction_list,
      'direction_list_str': instance.direction_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
    };
