// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_buddies_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionRemoveMyBuddies _$ModelActionRemoveMyBuddiesFromJson(
        Map<String, dynamic> json) =>
    ModelActionRemoveMyBuddies(
      json['id'] as String?,
      json['buddy_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['fav_id'] as int?,
      json['fav_str'] as String?,
      (json['fav_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['fav_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionRemoveMyBuddiesToJson(
        ModelActionRemoveMyBuddies instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buddy_id': instance.buddy_id,
      'user_id': instance.user_id,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'fav_id': instance.fav_id,
      'fav_str': instance.fav_str,
      'fav_list': instance.fav_list,
      'fav_list_str': instance.fav_list_str,
    };

RemoveMyBuddiesSuperBase _$RemoveMyBuddiesSuperBaseFromJson(
        Map<String, dynamic> json) =>
    RemoveMyBuddiesSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ModelActionRemoveMyBuddies.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoveMyBuddiesSuperBaseToJson(
        RemoveMyBuddiesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelMyBuddies _$ModelMyBuddiesFromJson(Map<String, dynamic> json) =>
    ModelMyBuddies(
      json['id'] as String?,
      json['buddy_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['fav_id'] as int?,
      json['fav_str'] as String?,
      (json['fav_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['fav_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..fav_url = json['fav_url'] as String?;

Map<String, dynamic> _$ModelMyBuddiesToJson(ModelMyBuddies instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buddy_id': instance.buddy_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'fav_id': instance.fav_id,
      'fav_url': instance.fav_url,
      'fav_str': instance.fav_str,
      'fav_list': instance.fav_list,
      'fav_list_str': instance.fav_list_str,
    };

MyBuddiesSuperBase _$MyBuddiesSuperBaseFromJson(Map<String, dynamic> json) =>
    MyBuddiesSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ModelMyBuddies.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyBuddiesSuperBaseToJson(MyBuddiesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelMyBuddies _$ViewModelMyBuddiesFromJson(Map<String, dynamic> json) =>
    ViewModelMyBuddies(
      json['id'] as String?,
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
      json['fav_projects_won'] as int?,
      json['fav_projects_won_str'] as String?,
      (json['fav_projects_won_cumulative'] as num?)?.toDouble(),
      json['fav_projects_won_cumulative_str'] as String?,
      json['fav_projects_owned'] as int?,
      json['fav_projects_owned_str'] as String?,
      (json['fav_projects_owned_cumulative'] as num?)?.toDouble(),
      json['fav_projects_owned_cumulative_str'] as String?,
      json['fav_projects_noaction'] as int?,
      json['fav_projects_noaction_str'] as String?,
      json['fav_projects_canceled'] as int?,
      json['fav_projects_canceled_str'] as String?,
      json['fav_missed_payment'] as int?,
      json['fav_missed_payment_str'] as String?,
      json['fav_projects_completed'] as int?,
      json['fav_projects_completed_str'] as String?,
      json['fav_projects_arbitrated'] as int?,
      json['fav_projects_arbitrated_str'] as String?,
      json['fav_projects_won_in_arbitration'] as int?,
      json['fav_projects_won_in_arbitration_str'] as String?,
      json['fav_projects_lost_in_arbitration'] as int?,
      json['fav_projects_lost_in_arbitration_str'] as String?,
      json['fav_current_projects'] as int?,
      json['fav_current_projects_str'] as String?,
      json['fav_missed_weekly_report'] as int?,
      json['fav_missed_weekly_report_str'] as String?,
      json['fav_product_sold'] as int?,
      json['fav_product_sold_str'] as String?,
      (json['fav_product_sold_cumulative'] as num?)?.toDouble(),
      json['fav_product_sold_cumulative_str'] as String?,
      json['fav_product_bought'] as int?,
      json['fav_product_bought_str'] as String?,
      (json['fav_product_bought_cumulative'] as num?)?.toDouble(),
      json['fav_product_bought_cumulative_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
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

Map<String, dynamic> _$ViewModelMyBuddiesToJson(ViewModelMyBuddies instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
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
      'fav_projects_won': instance.fav_projects_won,
      'fav_projects_won_str': instance.fav_projects_won_str,
      'fav_projects_won_cumulative': instance.fav_projects_won_cumulative,
      'fav_projects_won_cumulative_str':
          instance.fav_projects_won_cumulative_str,
      'fav_projects_owned': instance.fav_projects_owned,
      'fav_projects_owned_str': instance.fav_projects_owned_str,
      'fav_projects_owned_cumulative': instance.fav_projects_owned_cumulative,
      'fav_projects_owned_cumulative_str':
          instance.fav_projects_owned_cumulative_str,
      'fav_projects_noaction': instance.fav_projects_noaction,
      'fav_projects_noaction_str': instance.fav_projects_noaction_str,
      'fav_projects_canceled': instance.fav_projects_canceled,
      'fav_projects_canceled_str': instance.fav_projects_canceled_str,
      'fav_missed_payment': instance.fav_missed_payment,
      'fav_missed_payment_str': instance.fav_missed_payment_str,
      'fav_projects_completed': instance.fav_projects_completed,
      'fav_projects_completed_str': instance.fav_projects_completed_str,
      'fav_projects_arbitrated': instance.fav_projects_arbitrated,
      'fav_projects_arbitrated_str': instance.fav_projects_arbitrated_str,
      'fav_projects_won_in_arbitration':
          instance.fav_projects_won_in_arbitration,
      'fav_projects_won_in_arbitration_str':
          instance.fav_projects_won_in_arbitration_str,
      'fav_projects_lost_in_arbitration':
          instance.fav_projects_lost_in_arbitration,
      'fav_projects_lost_in_arbitration_str':
          instance.fav_projects_lost_in_arbitration_str,
      'fav_current_projects': instance.fav_current_projects,
      'fav_current_projects_str': instance.fav_current_projects_str,
      'fav_missed_weekly_report': instance.fav_missed_weekly_report,
      'fav_missed_weekly_report_str': instance.fav_missed_weekly_report_str,
      'fav_product_sold': instance.fav_product_sold,
      'fav_product_sold_str': instance.fav_product_sold_str,
      'fav_product_sold_cumulative': instance.fav_product_sold_cumulative,
      'fav_product_sold_cumulative_str':
          instance.fav_product_sold_cumulative_str,
      'fav_product_bought': instance.fav_product_bought,
      'fav_product_bought_str': instance.fav_product_bought_str,
      'fav_product_bought_cumulative': instance.fav_product_bought_cumulative,
      'fav_product_bought_cumulative_str':
          instance.fav_product_bought_cumulative_str,
    };

MyBuddiesViewSuperBase _$MyBuddiesViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyBuddiesViewSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ViewModelMyBuddies.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyBuddiesViewSuperBaseToJson(
        MyBuddiesViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyBuddiesListingTools _$MyBuddiesListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyBuddiesListingTools(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ItemMyBuddies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyBuddiesListingToolsToJson(
        MyBuddiesListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
