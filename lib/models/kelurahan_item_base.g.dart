// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelurahan_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemKelurahan _$ItemKelurahanFromJson(Map<String, dynamic> json) =>
    ItemKelurahan(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemKelurahanToJson(ItemKelurahan instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
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
