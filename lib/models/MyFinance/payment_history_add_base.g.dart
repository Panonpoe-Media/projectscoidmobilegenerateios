// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_add_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddModelPaymentHistory _$AddModelPaymentHistoryFromJson(
        Map<String, dynamic> json) =>
    AddModelPaymentHistory(
      json['id'] as String?,
      json['payment_id'] as int?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['our_account_id'] as int?,
      json['our_account_str'] as String?,
      (json['our_account_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['our_account_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
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
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      (json['transfer_fee'] as num?)?.toDouble(),
      json['transfer_fee_str'] as String?,
      json['attachment'] == null
          ? null
          : Photo.fromJson(json['attachment'] as Map<String, dynamic>),
      json['attachment_url'] as String?,
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['ref_id'] as int?,
      json['ref_id_str'] as String?,
      json['approved_by_id'] as int?,
      json['approved_by_str'] as String?,
      (json['approved_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['approved_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..our_account_url = json['our_account_url'] as String?
      ..bank_url = json['bank_url'] as String?
      ..branch = json['branch'] as String?
      ..city = json['city'] as String?
      ..account_no = json['account_no'] as String?
      ..account_name = json['account_name'] as String?
      ..transfer_date = json['transfer_date'] == null
          ? null
          : DateTime.parse(json['transfer_date'] as String)
      ..message = json['message'] as String?
      ..approved_date = json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String)
      ..approved_by_url = json['approved_by_url'] as String?
      ..approved_from_ip = json['approved_from_ip'] as String?
      ..approver_note = json['approver_note'] as String?
      ..secure_code = json['secure_code'] as String?;

Map<String, dynamic> _$AddModelPaymentHistoryToJson(
        AddModelPaymentHistory instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'payment_id': instance.payment_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'our_account_id': instance.our_account_id,
      'our_account_url': instance.our_account_url,
      'our_account_str': instance.our_account_str,
      'our_account_list': instance.our_account_list,
      'our_account_list_str': instance.our_account_list_str,
      'direction_id': instance.direction_id,
      'direction_str': instance.direction_str,
      'direction_list': instance.direction_list,
      'direction_list_str': instance.direction_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'bank_id': instance.bank_id,
      'bank_url': instance.bank_url,
      'bank_str': instance.bank_str,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'branch': instance.branch,
      'city': instance.city,
      'account_no': instance.account_no,
      'account_name': instance.account_name,
      'transfer_date': instance.transfer_date?.toIso8601String(),
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'transfer_fee': instance.transfer_fee,
      'transfer_fee_str': instance.transfer_fee_str,
      'message': instance.message,
      'attachment': instance.attachment,
      'attachment_url': instance.attachment_url,
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'ref_id': instance.ref_id,
      'ref_id_str': instance.ref_id_str,
      'approved_date': instance.approved_date?.toIso8601String(),
      'approved_by_id': instance.approved_by_id,
      'approved_by_url': instance.approved_by_url,
      'approved_by_str': instance.approved_by_str,
      'approved_by_list': instance.approved_by_list,
      'approved_by_list_str': instance.approved_by_list_str,
      'approved_from_ip': instance.approved_from_ip,
      'approver_note': instance.approver_note,
      'secure_code': instance.secure_code,
    };

PaymentHistorySuperBase _$PaymentHistorySuperBaseFromJson(
        Map<String, dynamic> json) =>
    PaymentHistorySuperBase(
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
          : AddModelPaymentHistory.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentHistorySuperBaseToJson(
        PaymentHistorySuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
