// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bids_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemUserBidsRev _$ItemUserBidsRevFromJson(Map<String, dynamic> json) =>
    ItemUserBidsRev(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bid_id'] as String?,
      json['worker_user_id'] as int?,
      json['worker_photo_url'] as String?,
      json['worker_photo'] == null
          ? null
          : Photo.fromJson(json['worker_photo'] as Map<String, dynamic>),
      (json['worker_worker_rating_num'] as num?)?.toDouble(),
      json['worker_worker_rating_num_str'] as String?,
      json['worker_projects_won'] as int?,
      json['worker_projects_completed'] as int?,
      json['worker_projects_arbitrated'] as int?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..worker_user_name = json['worker_user_name'] as String?
      ..worker_worker_rating = json['worker_worker_rating'] as int?;

Map<String, dynamic> _$ItemUserBidsRevToJson(ItemUserBidsRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'bid_id': instance.bid_id,
      'worker_user_id': instance.worker_user_id,
      'worker_photo_url': instance.worker_photo_url,
      'worker_photo': instance.worker_photo,
      'worker_user_name': instance.worker_user_name,
      'worker_worker_rating': instance.worker_worker_rating,
      'worker_worker_rating_num': instance.worker_worker_rating_num,
      'worker_worker_rating_num_str': instance.worker_worker_rating_num_str,
      'worker_projects_won': instance.worker_projects_won,
      'worker_projects_completed': instance.worker_projects_completed,
      'worker_projects_arbitrated': instance.worker_projects_arbitrated,
    };
