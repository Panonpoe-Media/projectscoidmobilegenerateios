// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelPaymentHistory _$ViewModelPaymentHistoryFromJson(
        Map<String, dynamic> json) =>
    ViewModelPaymentHistory(
      json['id'] as String?,
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      json['bank_url'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['account_no'] as String?,
      json['account_name'] as String?,
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
      json['transfer_date'] == null
          ? null
          : DateTime.parse(json['transfer_date'] as String),
      json['message'] as String?,
      json['attachment'] == null
          ? null
          : Photo.fromJson(json['attachment'] as Map<String, dynamic>),
      json['attachment_url'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelPaymentHistoryToJson(
        ViewModelPaymentHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'bank_id': instance.bank_id,
      'bank_str': instance.bank_str,
      'bank_url': instance.bank_url,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'account_no': instance.account_no,
      'account_name': instance.account_name,
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
      'transfer_date': instance.transfer_date?.toIso8601String(),
      'message': instance.message,
      'attachment_url': instance.attachment_url,
      'attachment': instance.attachment,
    };

PaymentHistoryViewSuperBase _$PaymentHistoryViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryViewSuperBase(
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
          : ViewModelPaymentHistory.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentHistoryViewSuperBaseToJson(
        PaymentHistoryViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
