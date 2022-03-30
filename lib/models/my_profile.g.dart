// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelMyProfileRev _$ViewModelMyProfileRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelMyProfileRev(
      json['id'] as String?,
      json['user_name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String?,
      json['display_name'] as String?,
      json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      json['jenis_kelamin_id'] as int?,
      json['jenis_kelamin_str'] as String?,
      (json['jenis_kelamin_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['jenis_kelamin_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['address'] as String?,
      json['country_id'] as int?,
      json['country_str'] as String?,
      json['country_url'] as String?,
      (json['country_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['country_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['provinsi_id'] as int?,
      json['provinsi_str'] as String?,
      json['provinsi_url'] as String?,
      (json['provinsi_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['provinsi_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kabupaten_id'] as int?,
      json['kabupaten_str'] as String?,
      json['kabupaten_url'] as String?,
      (json['kabupaten_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kabupaten_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kecamatan_id'] as int?,
      json['kecamatan_str'] as String?,
      json['kecamatan_url'] as String?,
      (json['kecamatan_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kecamatan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kelurahan_id'] as int?,
      json['kelurahan_str'] as String?,
      json['kelurahan_url'] as String?,
      (json['kelurahan_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kelurahan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['post_code'] as String?,
      json['handphone'] as String?,
      json['self_introduction'] as String?,
      json['website'] as String?,
      json['language_id'] as int?,
      json['language_str'] as String?,
      json['language_url'] as String?,
      (json['language_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['language_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['notify_projects'] as bool?,
      (json['skills_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['skills_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['skills_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['user_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyProfileRevToJson(
        ViewModelMyProfileRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'user_name': instance.user_name,
      'email': instance.email,
      'password': instance.password,
      'photo_url': instance.photo_url,
      'photo': instance.photo,
      'display_name': instance.display_name,
      'birth_date': instance.birth_date?.toIso8601String(),
      'jenis_kelamin_id': instance.jenis_kelamin_id,
      'jenis_kelamin_str': instance.jenis_kelamin_str,
      'jenis_kelamin_list': instance.jenis_kelamin_list,
      'jenis_kelamin_list_str': instance.jenis_kelamin_list_str,
      'address': instance.address,
      'country_id': instance.country_id,
      'country_str': instance.country_str,
      'country_url': instance.country_url,
      'country_list': instance.country_list,
      'country_list_str': instance.country_list_str,
      'provinsi_id': instance.provinsi_id,
      'provinsi_str': instance.provinsi_str,
      'provinsi_url': instance.provinsi_url,
      'provinsi_list': instance.provinsi_list,
      'provinsi_list_str': instance.provinsi_list_str,
      'kabupaten_id': instance.kabupaten_id,
      'kabupaten_str': instance.kabupaten_str,
      'kabupaten_url': instance.kabupaten_url,
      'kabupaten_list': instance.kabupaten_list,
      'kabupaten_list_str': instance.kabupaten_list_str,
      'kecamatan_id': instance.kecamatan_id,
      'kecamatan_str': instance.kecamatan_str,
      'kecamatan_url': instance.kecamatan_url,
      'kecamatan_list': instance.kecamatan_list,
      'kecamatan_list_str': instance.kecamatan_list_str,
      'kelurahan_id': instance.kelurahan_id,
      'kelurahan_str': instance.kelurahan_str,
      'kelurahan_url': instance.kelurahan_url,
      'kelurahan_list': instance.kelurahan_list,
      'kelurahan_list_str': instance.kelurahan_list_str,
      'post_code': instance.post_code,
      'handphone': instance.handphone,
      'self_introduction': instance.self_introduction,
      'website': instance.website,
      'language_id': instance.language_id,
      'language_str': instance.language_str,
      'language_url': instance.language_url,
      'language_list': instance.language_list,
      'language_list_str': instance.language_list_str,
      'notify_projects': instance.notify_projects,
      'skills_id': instance.skills_id,
      'skills_str': instance.skills_str,
      'skills_url': instance.skills_url,
      'user_id': instance.user_id,
    };

MyProfileViewSuperBaseRev _$MyProfileViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    MyProfileViewSuperBaseRev(
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
          : ViewModelMyProfileRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProfileViewSuperBaseRevToJson(
        MyProfileViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
