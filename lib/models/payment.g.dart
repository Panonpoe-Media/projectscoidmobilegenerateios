// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      json['no'] as int?,
      json['transfer_date'] == null
          ? null
          : DateTime.parse(json['transfer_date'] as String),
      json['bank'] as String?,
      (json['amount'] as num?)?.toDouble(),
      (json['fee'] as num?)?.toDouble(),
      json['direction'] as String?,
      (json['status'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['status_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'no': instance.no,
      'transfer_date': instance.transfer_date?.toIso8601String(),
      'bank': instance.bank,
      'amount': instance.amount,
      'fee': instance.fee,
      'direction': instance.direction,
      'status': instance.status,
      'status_str': instance.status_str,
      'status_url': instance.status_url,
    };
