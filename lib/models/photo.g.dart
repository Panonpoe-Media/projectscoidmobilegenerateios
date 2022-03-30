// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['name'] as String?,
      json['status'] as String?,
      json['dir'] as String?,
      json['file'] as String?,
      json['thumb'] as String?,
      json['temp'] as String?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'dir': instance.dir,
      'file': instance.file,
      'thumb': instance.thumb,
      'temp': instance.temp,
    };
