// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      json['before_title'] as String?,
      json['title'] as String?,
      json['after_title'] as String?,
      json['before_view'] as String?,
      json['after_view'] as String?,
      json['before_edit'] as String?,
      json['after_edit'] as String?,
      json['before_add'] as String?,
      json['after_add'] as String?,
      json['include_before'] as String?,
      json['include_after'] as String?,
      json['before_content'] as String?,
      json['after_content'] as String?,
    )..warning = json['warning'] == null
        ? null
        : Warning.fromJson(json['warning'] as Map<String, dynamic>);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'before_title': instance.before_title,
      'title': instance.title,
      'after_title': instance.after_title,
      'before_view': instance.before_view,
      'after_view': instance.after_view,
      'before_edit': instance.before_edit,
      'after_edit': instance.after_edit,
      'before_add': instance.before_add,
      'after_add': instance.after_add,
      'include_before': instance.include_before,
      'include_after': instance.include_after,
      'warning': instance.warning,
      'before_content': instance.before_content,
      'after_content': instance.after_content,
    };
