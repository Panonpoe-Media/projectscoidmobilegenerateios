// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionContactFormSupport _$ModelActionContactFormSupportFromJson(
        Map<String, dynamic> json) =>
    ModelActionContactFormSupport(
      json['id'] as String?,
      json['contact_form_id'] as String?,
      json['your_name'] as String?,
      json['email_address'] as String?,
      json['question'] as String?,
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionContactFormSupportToJson(
        ModelActionContactFormSupport instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'contact_form_id': instance.contact_form_id,
      'your_name': instance.your_name,
      'email_address': instance.email_address,
      'question': instance.question,
      'captcha': instance.captcha,
    };

ContactFormSupportSuperBase _$ContactFormSupportSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ContactFormSupportSuperBase(
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
          : ModelActionContactFormSupport.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactFormSupportSuperBaseToJson(
        ContactFormSupportSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelSupport _$ModelSupportFromJson(Map<String, dynamic> json) => ModelSupport(
      json['id'] as String?,
      json['contact_form_id'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['replied_by_id'] as int?,
      json['replied_by_str'] as String?,
      (json['replied_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['replied_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..your_name = json['your_name'] as String?
      ..email_address = json['email_address'] as String?
      ..question = json['question'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..ip_address = json['ip_address'] as String?
      ..replied = json['replied'] as bool?
      ..reply = json['reply'] as String?
      ..replied_by_url = json['replied_by_url'] as String?
      ..replied_date = json['replied_date'] == null
          ? null
          : DateTime.parse(json['replied_date'] as String)
      ..replied_ip = json['replied_ip'] as String?
      ..captcha = json['captcha'] as String?;

Map<String, dynamic> _$ModelSupportToJson(ModelSupport instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
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
      'replied_by_url': instance.replied_by_url,
      'replied_by_str': instance.replied_by_str,
      'replied_by_list': instance.replied_by_list,
      'replied_by_list_str': instance.replied_by_list_str,
      'replied_date': instance.replied_date?.toIso8601String(),
      'replied_ip': instance.replied_ip,
      'captcha': instance.captcha,
    };

SupportSuperBase _$SupportSuperBaseFromJson(Map<String, dynamic> json) =>
    SupportSuperBase(
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
          : ModelSupport.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportSuperBaseToJson(SupportSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelSupport _$ViewModelSupportFromJson(Map<String, dynamic> json) =>
    ViewModelSupport(
      json['id'] as String?,
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
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelSupportToJson(ViewModelSupport instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
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

SupportViewSuperBase _$SupportViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    SupportViewSuperBase(
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
          : ViewModelSupport.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportViewSuperBaseToJson(
        SupportViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

SupportListingTools _$SupportListingToolsFromJson(Map<String, dynamic> json) =>
    SupportListingTools(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ItemSupport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupportListingToolsToJson(
        SupportListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
