// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_buddies_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyBuddies _$ItemMyBuddiesFromJson(Map<String, dynamic> json) =>
    ItemMyBuddies(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['buddy_id'] as String?,
      json['fav_photo_url'] as String?,
      json['fav_photo'] == null
          ? null
          : Photo.fromJson(json['fav_photo'] as Map<String, dynamic>),
      json['fav_country_id'] as int?,
      json['fav_country_str'] as String?,
      json['fav_provinsi_id'] as int?,
      json['fav_provinsi_str'] as String?,
      json['fav_kabupaten_id'] as int?,
      json['fav_kabupaten_str'] as String?,
      json['fav_worker_ranking'] as int?,
      json['fav_worker_ranking_str'] as String?,
      json['fav_worker_point'] as int?,
      json['fav_worker_point_str'] as String?,
      json['fav_owner_ranking'] as int?,
      json['fav_owner_ranking_str'] as String?,
      json['fav_owner_point'] as int?,
      json['fav_owner_point_str'] as String?,
      json['fav_seller_ranking'] as int?,
      json['fav_seller_ranking_str'] as String?,
      json['fav_seller_point'] as int?,
      json['fav_seller_point_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..fav_user_name = json['fav_user_name'] as String?
      ..fav_display_name = json['fav_display_name'] as String?
      ..fav_website = json['fav_website'] as String?
      ..fav_self_introduction = json['fav_self_introduction'] as String?
      ..fav_worker_rating = json['fav_worker_rating'] as int?
      ..fav_owner_rating = json['fav_owner_rating'] as int?
      ..fav_seller_rating = json['fav_seller_rating'] as int?;

Map<String, dynamic> _$ItemMyBuddiesToJson(ItemMyBuddies instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'buddy_id': instance.buddy_id,
      'fav_photo_url': instance.fav_photo_url,
      'fav_photo': instance.fav_photo,
      'fav_user_name': instance.fav_user_name,
      'fav_display_name': instance.fav_display_name,
      'fav_country_id': instance.fav_country_id,
      'fav_country_str': instance.fav_country_str,
      'fav_provinsi_id': instance.fav_provinsi_id,
      'fav_provinsi_str': instance.fav_provinsi_str,
      'fav_kabupaten_id': instance.fav_kabupaten_id,
      'fav_kabupaten_str': instance.fav_kabupaten_str,
      'fav_website': instance.fav_website,
      'fav_self_introduction': instance.fav_self_introduction,
      'fav_worker_ranking': instance.fav_worker_ranking,
      'fav_worker_ranking_str': instance.fav_worker_ranking_str,
      'fav_worker_point': instance.fav_worker_point,
      'fav_worker_point_str': instance.fav_worker_point_str,
      'fav_worker_rating': instance.fav_worker_rating,
      'fav_owner_ranking': instance.fav_owner_ranking,
      'fav_owner_ranking_str': instance.fav_owner_ranking_str,
      'fav_owner_point': instance.fav_owner_point,
      'fav_owner_point_str': instance.fav_owner_point_str,
      'fav_owner_rating': instance.fav_owner_rating,
      'fav_seller_ranking': instance.fav_seller_ranking,
      'fav_seller_ranking_str': instance.fav_seller_ranking_str,
      'fav_seller_point': instance.fav_seller_point,
      'fav_seller_point_str': instance.fav_seller_point_str,
      'fav_seller_rating': instance.fav_seller_rating,
    };
