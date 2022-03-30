// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Selection _$SelectionFromJson(Map<String, dynamic> json) => Selection(
      json['url'] as String?,
      json['key'] as String?,
      json['value'] as String?,
      json['text'] as String?,
      json['selected'] as bool?,
    );

Map<String, dynamic> _$SelectionToJson(Selection instance) => <String, dynamic>{
      'url': instance.url,
      'key': instance.key,
      'value': instance.value,
      'text': instance.text,
      'selected': instance.selected,
    };
