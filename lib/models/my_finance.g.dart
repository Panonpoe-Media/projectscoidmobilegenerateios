// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_finance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelMyFinanceRev _$ViewModelMyFinanceRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelMyFinanceRev(
      json['id'] as String?,
      (json['available_balance'] as num?)?.toDouble(),
      json['available_balance_str'] as String?,
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      json['bank_url'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['branch'] as String?,
      json['city'] as String?,
      json['account_number'] as String?,
      json['account_name'] as String?,
      json['cutoff_period_id'] as int?,
      json['cutoff_period_str'] as String?,
      (json['cutoff_period_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['cutoff_period_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['cutoff_amount'] as num?)?.toDouble(),
      json['cutoff_amount_str'] as String?,
      json['user_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyFinanceRevToJson(
        ViewModelMyFinanceRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'available_balance': instance.available_balance,
      'available_balance_str': instance.available_balance_str,
      'bank_id': instance.bank_id,
      'bank_str': instance.bank_str,
      'bank_url': instance.bank_url,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'branch': instance.branch,
      'city': instance.city,
      'account_number': instance.account_number,
      'account_name': instance.account_name,
      'cutoff_period_id': instance.cutoff_period_id,
      'cutoff_period_str': instance.cutoff_period_str,
      'cutoff_period_list': instance.cutoff_period_list,
      'cutoff_period_list_str': instance.cutoff_period_list_str,
      'cutoff_amount': instance.cutoff_amount,
      'cutoff_amount_str': instance.cutoff_amount_str,
      'user_id': instance.user_id,
    };

MyFinanceViewSuperBaseRev _$MyFinanceViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    MyFinanceViewSuperBaseRev(
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
          : ViewModelMyFinanceRev.fromJson(
              json['model'] as Map<String, dynamic>),
      (json['credits'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Credit.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['payments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyFinanceViewSuperBaseRevToJson(
        MyFinanceViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
      'credits': instance.credits,
      'payments': instance.payments,
    };
