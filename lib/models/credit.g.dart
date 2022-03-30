// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credit _$CreditFromJson(Map<String, dynamic> json) => Credit(
      json['no'] as int?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['type'] as String?,
      json['title'] as String?,
      (json['balance'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      (json['order'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['order_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['order_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['user'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['user_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['projects'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['projects_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['projects_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$CreditToJson(Credit instance) => <String, dynamic>{
      'no': instance.no,
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'title': instance.title,
      'balance': instance.balance,
      'amount': instance.amount,
      'order': instance.order,
      'order_str': instance.order_str,
      'order_url': instance.order_url,
      'user': instance.user,
      'user_str': instance.user_str,
      'user_url': instance.user_url,
      'projects': instance.projects,
      'projects_str': instance.projects_str,
      'projects_url': instance.projects_url,
    };
