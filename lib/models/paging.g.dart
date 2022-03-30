// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      json['total_rows'] as int?,
      json['total_pages'] as int?,
      json['current_page'] as int?,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'total_rows': instance.total_rows,
      'total_pages': instance.total_pages,
      'current_page': instance.current_page,
    };
