// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_thread_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemShowThread _$ItemShowThreadFromJson(Map<String, dynamic> json) =>
    ItemShowThread(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['post_id'] as String?,
      json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String),
      json['message'] as String?,
      json['attachments_name'] as String?,
      json['attachments_url'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['user_photo_url'] as String?,
      json['user_photo'] == null
          ? null
          : Photo.fromJson(json['user_photo'] as Map<String, dynamic>),
      json['user_owner_point'] as int?,
      json['user_owner_point_str'] as String?,
      json['user_owner_ranking'] as int?,
      json['user_owner_ranking_str'] as String?,
      json['user_worker_point'] as int?,
      json['user_worker_point_str'] as String?,
      json['user_worker_ranking'] as int?,
      json['user_worker_ranking_str'] as String?,
      json['user_kabupaten_id'] as int?,
      json['user_kabupaten_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_user_name = json['user_user_name'] as String?
      ..user_owner_rating = json['user_owner_rating'] as int?
      ..user_worker_rating = json['user_worker_rating'] as int?;

Map<String, dynamic> _$ItemShowThreadToJson(ItemShowThread instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'post_id': instance.post_id,
      'post_date': instance.post_date?.toIso8601String(),
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments_url': instance.attachments_url,
      'attachments': instance.attachments,
      'user_photo_url': instance.user_photo_url,
      'user_photo': instance.user_photo,
      'user_user_name': instance.user_user_name,
      'user_owner_rating': instance.user_owner_rating,
      'user_owner_point': instance.user_owner_point,
      'user_owner_point_str': instance.user_owner_point_str,
      'user_owner_ranking': instance.user_owner_ranking,
      'user_owner_ranking_str': instance.user_owner_ranking_str,
      'user_worker_rating': instance.user_worker_rating,
      'user_worker_point': instance.user_worker_point,
      'user_worker_point_str': instance.user_worker_point_str,
      'user_worker_ranking': instance.user_worker_ranking,
      'user_worker_ranking_str': instance.user_worker_ranking_str,
      'user_kabupaten_id': instance.user_kabupaten_id,
      'user_kabupaten_str': instance.user_kabupaten_str,
    };
