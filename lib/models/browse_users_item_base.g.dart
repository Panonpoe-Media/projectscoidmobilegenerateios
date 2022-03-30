// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_users_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemBrowseUsers _$ItemBrowseUsersFromJson(Map<String, dynamic> json) =>
    ItemBrowseUsers(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['user_id'] as String?,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String?,
      json['online'] as bool?,
      json['user_name'] as String?,
      json['worker_rating'] as int?,
      (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      json['worker_point'] as int?,
      json['worker_point_str'] as String?,
      json['worker_ranking'] as int?,
      json['worker_ranking_str'] as String?,
      json['projects_completed'] as int?,
      json['projects_completed_str'] as String?,
      json['owner_rating'] as int?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
      json['owner_point'] as int?,
      json['owner_point_str'] as String?,
      json['owner_ranking'] as int?,
      json['owner_ranking_str'] as String?,
      json['projects_owned'] as int?,
      json['projects_owned_str'] as String?,
      json['seller_rating'] as int?,
      (json['seller_rating_num'] as num?)?.toDouble(),
      json['seller_rating_num_str'] as String?,
      json['seller_point'] as int?,
      json['seller_point_str'] as String?,
      json['seller_ranking'] as int?,
      json['seller_ranking_str'] as String?,
      json['product_sold'] as int?,
      json['product_sold_str'] as String?,
      json['affiliate_rating'] as int?,
      (json['affiliate_rating_num'] as num?)?.toDouble(),
      json['affiliate_rating_num_str'] as String?,
      json['affiliate_point'] as int?,
      json['affiliate_point_str'] as String?,
      json['affiliate_ranking'] as int?,
      json['affiliate_ranking_str'] as String?,
      json['refered_users'] as int?,
      json['refered_users_str'] as String?,
      json['self_introduction'] as String?,
      (json['skills_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['skills_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['skills_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemBrowseUsersToJson(ItemBrowseUsers instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'user_id': instance.user_id,
      'photo_url': instance.photo_url,
      'photo': instance.photo,
      'online': instance.online,
      'user_name': instance.user_name,
      'worker_rating': instance.worker_rating,
      'worker_rating_num': instance.worker_rating_num,
      'worker_rating_num_str': instance.worker_rating_num_str,
      'worker_point': instance.worker_point,
      'worker_point_str': instance.worker_point_str,
      'worker_ranking': instance.worker_ranking,
      'worker_ranking_str': instance.worker_ranking_str,
      'projects_completed': instance.projects_completed,
      'projects_completed_str': instance.projects_completed_str,
      'owner_rating': instance.owner_rating,
      'owner_rating_num': instance.owner_rating_num,
      'owner_rating_num_str': instance.owner_rating_num_str,
      'owner_point': instance.owner_point,
      'owner_point_str': instance.owner_point_str,
      'owner_ranking': instance.owner_ranking,
      'owner_ranking_str': instance.owner_ranking_str,
      'projects_owned': instance.projects_owned,
      'projects_owned_str': instance.projects_owned_str,
      'seller_rating': instance.seller_rating,
      'seller_rating_num': instance.seller_rating_num,
      'seller_rating_num_str': instance.seller_rating_num_str,
      'seller_point': instance.seller_point,
      'seller_point_str': instance.seller_point_str,
      'seller_ranking': instance.seller_ranking,
      'seller_ranking_str': instance.seller_ranking_str,
      'product_sold': instance.product_sold,
      'product_sold_str': instance.product_sold_str,
      'affiliate_rating': instance.affiliate_rating,
      'affiliate_rating_num': instance.affiliate_rating_num,
      'affiliate_rating_num_str': instance.affiliate_rating_num_str,
      'affiliate_point': instance.affiliate_point,
      'affiliate_point_str': instance.affiliate_point_str,
      'affiliate_ranking': instance.affiliate_ranking,
      'affiliate_ranking_str': instance.affiliate_ranking_str,
      'refered_users': instance.refered_users,
      'refered_users_str': instance.refered_users_str,
      'self_introduction': instance.self_introduction,
      'skills_id': instance.skills_id,
      'skills_str': instance.skills_str,
      'skills_url': instance.skills_url,
    };
