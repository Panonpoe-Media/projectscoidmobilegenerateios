// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datatest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataTest _$DataTestFromJson(Map<String, dynamic> json) => DataTest(
      json['user_name'] as String?,
      json['password'] as String?,
      json['email'] as String?,
      json['display_name'] as String?,
      json['title'] as String?,
      json['handphone'] as String?,
      json['multiline'] as String?,
      json['address'] as String?,
      json['percent'] as String?,
      json['test'] as String?,
      json['angka'] as int?,
      json['boolean1'] as bool?,
      json['image'] == null
          ? null
          : ImageField.fromJson(json['image'] as Map<String, dynamic>),
      json['file'] == null
          ? null
          : FileField.fromJson(json['file'] as Map<String, dynamic>),
      json['captcha'] as String?,
      json['rating'] as String?,
      json['datetime'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['article'] as String?,
      json['money'] as String?,
      json['number'] as String?,
      json['double'] as String?,
      json['boolean'] as String?,
      json['enume'] as String?,
      (json['enum_selection'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['model'] as String?,
      (json['model_selection'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['website'] as String?,
      (json['inline_tags'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['inline_tags_selection'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$DataTestToJson(DataTest instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'password': instance.password,
      'email': instance.email,
      'display_name': instance.display_name,
      'title': instance.title,
      'handphone': instance.handphone,
      'multiline': instance.multiline,
      'address': instance.address,
      'percent': instance.percent,
      'test': instance.test,
      'image': instance.image,
      'file': instance.file,
      'captcha': instance.captcha,
      'rating': instance.rating,
      'datetime': instance.datetime,
      'date': instance.date,
      'time': instance.time,
      'article': instance.article,
      'money': instance.money,
      'number': instance.number,
      'double': instance.double,
      'boolean': instance.boolean,
      'model': instance.model,
      'angka': instance.angka,
      'boolean1': instance.boolean1,
      'model_selection': instance.model_selection,
      'enume': instance.enume,
      'enum_selection': instance.enum_selection,
      'website': instance.website,
      'inline_tags': instance.inline_tags,
      'inline_tags_selection': instance.inline_tags_selection,
    };
