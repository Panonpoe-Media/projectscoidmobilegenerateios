// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTest _$ItemTestFromJson(Map<String, dynamic> json) => ItemTest(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['test_id'] as String?,
      json['user_name'] as String?,
      json['password'] as String?,
      json['display_name'] as String?,
      json['title'] as String?,
      json['email'] as String?,
      json['model_id'] as int?,
      json['model_str'] as String?,
      json['model_url'] as String?,
      (json['model_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['model_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['enum_id'] as int?,
      json['enum_str'] as String?,
      (json['enum_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['enum_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['address'] as String?,
      json['multiline'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String),
      json['time'] == null ? null : DateTime.parse(json['time'] as String),
      json['rating'] as int?,
      json['number'] as int?,
      json['number_str'] as String?,
      (json['money'] as num?)?.toDouble(),
      json['money_str'] as String?,
      (json['double1'] as num?)?.toDouble(),
      json['double1_str'] as String?,
      json['boolean'] as bool?,
      json['percent'] as int?,
      json['website'] as String?,
      json['article'] as String?,
      (json['inline_tags_id'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['inline_tags_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['inline_tags_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['handphone'] as String?,
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
      json['file_name'] as String?,
      json['file_url'] as String?,
      (json['file'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemTestToJson(ItemTest instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'test_id': instance.test_id,
      'user_name': instance.user_name,
      'password': instance.password,
      'display_name': instance.display_name,
      'title': instance.title,
      'email': instance.email,
      'model_id': instance.model_id,
      'model_str': instance.model_str,
      'model_url': instance.model_url,
      'model_list': instance.model_list,
      'model_list_str': instance.model_list_str,
      'enum_id': instance.enum_id,
      'enum_str': instance.enum_str,
      'enum_list': instance.enum_list,
      'enum_list_str': instance.enum_list_str,
      'address': instance.address,
      'multiline': instance.multiline,
      'date': instance.date?.toIso8601String(),
      'date_time': instance.date_time?.toIso8601String(),
      'time': instance.time?.toIso8601String(),
      'rating': instance.rating,
      'number': instance.number,
      'number_str': instance.number_str,
      'money': instance.money,
      'money_str': instance.money_str,
      'double1': instance.double1,
      'double1_str': instance.double1_str,
      'boolean': instance.boolean,
      'percent': instance.percent,
      'website': instance.website,
      'article': instance.article,
      'inline_tags_id': instance.inline_tags_id,
      'inline_tags_str': instance.inline_tags_str,
      'inline_tags_url': instance.inline_tags_url,
      'handphone': instance.handphone,
      'image_url': instance.image_url,
      'image': instance.image,
      'file_name': instance.file_name,
      'file_url': instance.file_url,
      'file': instance.file,
      'captcha': instance.captcha,
    };
