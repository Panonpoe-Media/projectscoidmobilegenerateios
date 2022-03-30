// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginItem _$LoginItemFromJson(Map<String, dynamic> json) => LoginItem(
      json['result'] as String?,
      json['user_id'] as String?,
      json['user_name'] as String?,
      json['user_display'] as String?,
      json['user_hash'] as String?,
      json['notif_count'] as String?,
      json['user_photo'] as String?,
    )..hash = json['hash'] as String?;

Map<String, dynamic> _$LoginItemToJson(LoginItem instance) => <String, dynamic>{
      'result': instance.result,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'user_display': instance.user_display,
      'user_photo': instance.user_photo,
      'user_hash': instance.user_hash,
      'notif_count': instance.notif_count,
      'hash': instance.hash,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      json['result'] as String?,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
