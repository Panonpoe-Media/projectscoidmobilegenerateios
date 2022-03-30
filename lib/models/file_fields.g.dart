// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileField _$FileFieldFromJson(Map<String, dynamic> json) => FileField(
      json['status'] as String?,
      json['name'] as String?,
      json['size'] as int?,
      json['created'] as int?,
      json['modified'] as int?,
      json['temp'] as String?,
      json['remote'] as String?,
      json['dir'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$FileFieldToJson(FileField instance) => <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'size': instance.size,
      'created': instance.created,
      'modified': instance.modified,
      'temp': instance.temp,
      'remote': instance.remote,
      'dir': instance.dir,
      'date': instance.date,
    };
