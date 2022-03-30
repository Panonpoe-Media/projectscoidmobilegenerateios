// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_referals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelMyReferalsRev _$ViewModelMyReferalsRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelMyReferalsRev(
      json['id'] as String?,
      json['affiliate_id'] as String?,
      json['referal_this_month'] as int?,
      json['referal_this_month_str'] as String?,
      json['cookies_this_month'] as int?,
      json['cookies_this_month_str'] as String?,
      json['refered_users'] as int?,
      json['refered_users_str'] as String?,
      (json['referal_earnings'] as num?)?.toDouble(),
      json['referal_earnings_str'] as String?,
      json['user_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..affiliate_id_str = json['affiliate_id_str'] as String?;

Map<String, dynamic> _$ViewModelMyReferalsRevToJson(
        ViewModelMyReferalsRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'affiliate_id': instance.affiliate_id,
      'affiliate_id_str': instance.affiliate_id_str,
      'referal_this_month': instance.referal_this_month,
      'referal_this_month_str': instance.referal_this_month_str,
      'cookies_this_month': instance.cookies_this_month,
      'cookies_this_month_str': instance.cookies_this_month_str,
      'refered_users': instance.refered_users,
      'refered_users_str': instance.refered_users_str,
      'referal_earnings': instance.referal_earnings,
      'referal_earnings_str': instance.referal_earnings_str,
      'user_id': instance.user_id,
    };

MyReferalsViewSuperBaseRev _$MyReferalsViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    MyReferalsViewSuperBaseRev(
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
          : ViewModelMyReferalsRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyReferalsViewSuperBaseRevToJson(
        MyReferalsViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
