// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelTest _$ModelTestFromJson(Map<String, dynamic> json) => ModelTest(
      json['id'] as String?,
      json['test_id'] as String?,
      json['model_id'] as int?,
      json['model_str'] as String?,
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
      json['number'] as int?,
      json['number_str'] as String?,
      (json['money'] as num?)?.toDouble(),
      json['money_str'] as String?,
      (json['double1'] as num?)?.toDouble(),
      json['double1_str'] as String?,
      (json['inline_tags_id'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['inline_tags_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['inline_tags_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['inline_tags_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['inline_tags_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['image'] == null
          ? null
          : Photo.fromJson(json['image'] as Map<String, dynamic>),
      json['image_url'] as String?,
      (json['file'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['file_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_name = json['user_name'] as String?
      ..password = json['password'] as String?
      ..display_name = json['display_name'] as String?
      ..title = json['title'] as String?
      ..email = json['email'] as String?
      ..model_url = json['model_url'] as String?
      ..address = json['address'] as String?
      ..multiline = json['multiline'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..date_time = json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String)
      ..time =
          json['time'] == null ? null : DateTime.parse(json['time'] as String)
      ..rating = json['rating'] as int?
      ..boolean = json['boolean'] as bool?
      ..percent = json['percent'] as int?
      ..website = json['website'] as String?
      ..article = json['article'] as String?
      ..handphone = json['handphone'] as String?
      ..captcha = json['captcha'] as String?;

Map<String, dynamic> _$ModelTestToJson(ModelTest instance) => <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'test_id': instance.test_id,
      'user_name': instance.user_name,
      'password': instance.password,
      'display_name': instance.display_name,
      'title': instance.title,
      'email': instance.email,
      'model_id': instance.model_id,
      'model_url': instance.model_url,
      'model_str': instance.model_str,
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
      'inline_tags_list': instance.inline_tags_list,
      'inline_tags_list_str': instance.inline_tags_list_str,
      'handphone': instance.handphone,
      'image': instance.image,
      'image_url': instance.image_url,
      'file_name': instance.file_name,
      'file': instance.file,
      'captcha': instance.captcha,
    };

TestSuperBase _$TestSuperBaseFromJson(Map<String, dynamic> json) =>
    TestSuperBase(
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
          : ModelTest.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestSuperBaseToJson(TestSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelTest _$ViewModelTestFromJson(Map<String, dynamic> json) =>
    ViewModelTest(
      json['id'] as String?,
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
      (json['file'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['file_url'] as String?,
      json['file_name'] as String?,
      json['captcha'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelTestToJson(ViewModelTest instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
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
      'file': instance.file,
      'file_url': instance.file_url,
      'file_name': instance.file_name,
      'captcha': instance.captcha,
    };

TestViewSuperBase _$TestViewSuperBaseFromJson(Map<String, dynamic> json) =>
    TestViewSuperBase(
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
          : ViewModelTest.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestViewSuperBaseToJson(TestViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

TestListingTools _$TestListingToolsFromJson(Map<String, dynamic> json) =>
    TestListingTools(
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
          ?.map((e) =>
              e == null ? null : ItemTest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestListingToolsToJson(TestListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
