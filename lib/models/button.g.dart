// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Button _$ButtonFromJson(Map<String, dynamic> json) => Button(
      json['id'] as String?,
      json['url'] as String?,
      json['color'] as String?,
      json['icon'] as String?,
      json['badge'] as String?,
      json['text'] as String?,
      json['type'] as String?,
      (json['selections'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Selection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ButtonToJson(Button instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'color': instance.color,
      'icon': instance.icon,
      'badge': instance.badge,
      'text': instance.text,
      'type': instance.type,
      'selections': instance.selections,
    };
