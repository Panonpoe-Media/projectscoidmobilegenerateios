// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelurahan_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelKelurahan _$ModelKelurahanFromJson(Map<String, dynamic> json) =>
    ModelKelurahan(
      json['id'] as String?,
      json['kelurahan_id'] as String?,
      json['provinsi_id'] as int?,
      json['provinsi_str'] as String?,
      (json['provinsi_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['provinsi_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kabupaten_id'] as int?,
      json['kabupaten_str'] as String?,
      (json['kabupaten_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kabupaten_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kecamatan_id'] as int?,
      json['kecamatan_str'] as String?,
      (json['kecamatan_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kecamatan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..provinsi_url = json['provinsi_url'] as String?
      ..kabupaten_url = json['kabupaten_url'] as String?
      ..kecamatan_url = json['kecamatan_url'] as String?
      ..kelurahan_name = json['kelurahan_name'] as String?
      ..kode_pos = json['kode_pos'] as String?;

Map<String, dynamic> _$ModelKelurahanToJson(ModelKelurahan instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'kelurahan_id': instance.kelurahan_id,
      'provinsi_id': instance.provinsi_id,
      'provinsi_url': instance.provinsi_url,
      'provinsi_str': instance.provinsi_str,
      'provinsi_list': instance.provinsi_list,
      'provinsi_list_str': instance.provinsi_list_str,
      'kabupaten_id': instance.kabupaten_id,
      'kabupaten_url': instance.kabupaten_url,
      'kabupaten_str': instance.kabupaten_str,
      'kabupaten_list': instance.kabupaten_list,
      'kabupaten_list_str': instance.kabupaten_list_str,
      'kecamatan_id': instance.kecamatan_id,
      'kecamatan_url': instance.kecamatan_url,
      'kecamatan_str': instance.kecamatan_str,
      'kecamatan_list': instance.kecamatan_list,
      'kecamatan_list_str': instance.kecamatan_list_str,
      'kelurahan_name': instance.kelurahan_name,
      'kode_pos': instance.kode_pos,
    };

KelurahanSuperBase _$KelurahanSuperBaseFromJson(Map<String, dynamic> json) =>
    KelurahanSuperBase(
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
          : ModelKelurahan.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KelurahanSuperBaseToJson(KelurahanSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelKelurahan _$ViewModelKelurahanFromJson(Map<String, dynamic> json) =>
    ViewModelKelurahan(
      json['id'] as String?,
      json['kelurahan_id'] as String?,
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
      json['kelurahan_name'] as String?,
      json['kode_pos'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelKelurahanToJson(ViewModelKelurahan instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'kelurahan_id': instance.kelurahan_id,
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
      'kelurahan_name': instance.kelurahan_name,
      'kode_pos': instance.kode_pos,
    };

KelurahanViewSuperBase _$KelurahanViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    KelurahanViewSuperBase(
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
          : ViewModelKelurahan.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KelurahanViewSuperBaseToJson(
        KelurahanViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

KelurahanListingTools _$KelurahanListingToolsFromJson(
        Map<String, dynamic> json) =>
    KelurahanListingTools(
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
              : ItemKelurahan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KelurahanListingToolsToJson(
        KelurahanListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
