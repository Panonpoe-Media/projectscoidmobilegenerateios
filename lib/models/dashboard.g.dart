// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      json['title'] as String,
      json['url'] as String,
      json['icon'] as String,
      json['color'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'icon': instance.icon,
      'color': instance.color,
      'value': instance.value,
    };
