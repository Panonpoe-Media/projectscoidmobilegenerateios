// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSupport _$ItemSupportFromJson(Map<String, dynamic> json) => ItemSupport(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['contact_form_id'] as String?,
      json['your_name'] as String?,
      json['email_address'] as String?,
      json['question'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['ip_address'] as String?,
      json['replied'] as bool?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['reply'] as String?,
      json['replied_by_id'] as int?,
      json['replied_by_str'] as String?,
      json['replied_by_url'] as String?,
      (json['replied_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['replied_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['replied_date'] == null
          ? null
          : DateTime.parse(json['replied_date'] as String),
      json['replied_ip'] as String?,
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemSupportToJson(ItemSupport instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'contact_form_id': instance.contact_form_id,
      'your_name': instance.your_name,
      'email_address': instance.email_address,
      'question': instance.question,
      'date': instance.date?.toIso8601String(),
      'ip_address': instance.ip_address,
      'replied': instance.replied,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'reply': instance.reply,
      'replied_by_id': instance.replied_by_id,
      'replied_by_str': instance.replied_by_str,
      'replied_by_url': instance.replied_by_url,
      'replied_by_list': instance.replied_by_list,
      'replied_by_list_str': instance.replied_by_list_str,
      'replied_date': instance.replied_date?.toIso8601String(),
      'replied_ip': instance.replied_ip,
      'captcha': instance.captcha,
    };
