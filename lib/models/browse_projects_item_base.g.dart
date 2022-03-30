// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_projects_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemBrowseProjects _$ItemBrowseProjectsFromJson(Map<String, dynamic> json) =>
    ItemBrowseProjects(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_id'] as String?,
      json['owner_photo_url'] as String?,
      json['owner_photo'] == null
          ? null
          : Photo.fromJson(json['owner_photo'] as Map<String, dynamic>),
      json['owner_kabupaten_id'] as int?,
      json['owner_kabupaten_str'] as String?,
      (json['owner_owner_rating_num'] as num?)?.toDouble(),
      json['owner_owner_rating_num_str'] as String?,
      json['owner_projects_owned'] as int?,
      json['owner_projects_owned_str'] as String?,
      json['owner_owner_point'] as int?,
      json['owner_owner_point_str'] as String?,
      json['owner_owner_ranking'] as int?,
      json['owner_owner_ranking_str'] as String?,
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      json['owner_url'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
      json['short_description'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_class_id'] as int?,
      json['project_class_str'] as String?,
      (json['project_class_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_class_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['published_budget'] as num?)?.toDouble(),
      json['published_budget_str'] as String?,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String),
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['project_status_id'] as int?,
      json['project_status_str'] as String?,
      (json['project_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bid_count'] as int?,
      json['bid_count_str'] as String?,
      json['need_weekly_report'] as bool?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..owner_user_name = json['owner_user_name'] as String?
      ..owner_owner_rating = json['owner_owner_rating'] as int?;

Map<String, dynamic> _$ItemBrowseProjectsToJson(ItemBrowseProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'project_id': instance.project_id,
      'owner_photo_url': instance.owner_photo_url,
      'owner_photo': instance.owner_photo,
      'owner_user_name': instance.owner_user_name,
      'owner_kabupaten_id': instance.owner_kabupaten_id,
      'owner_kabupaten_str': instance.owner_kabupaten_str,
      'owner_owner_rating': instance.owner_owner_rating,
      'owner_owner_rating_num': instance.owner_owner_rating_num,
      'owner_owner_rating_num_str': instance.owner_owner_rating_num_str,
      'owner_projects_owned': instance.owner_projects_owned,
      'owner_projects_owned_str': instance.owner_projects_owned_str,
      'owner_owner_point': instance.owner_owner_point,
      'owner_owner_point_str': instance.owner_owner_point_str,
      'owner_owner_ranking': instance.owner_owner_ranking,
      'owner_owner_ranking_str': instance.owner_owner_ranking_str,
      'owner_id': instance.owner_id,
      'owner_str': instance.owner_str,
      'owner_url': instance.owner_url,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'title': instance.title,
      'short_description': instance.short_description,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
      'project_class_id': instance.project_class_id,
      'project_class_str': instance.project_class_str,
      'project_class_list': instance.project_class_list,
      'project_class_list_str': instance.project_class_list_str,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'published_budget': instance.published_budget,
      'published_budget_str': instance.published_budget_str,
      'published_date': instance.published_date?.toIso8601String(),
      'select_deadline': instance.select_deadline?.toIso8601String(),
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'project_status_id': instance.project_status_id,
      'project_status_str': instance.project_status_str,
      'project_status_list': instance.project_status_list,
      'project_status_list_str': instance.project_status_list_str,
      'bid_count': instance.bid_count,
      'bid_count_str': instance.bid_count_str,
      'need_weekly_report': instance.need_weekly_report,
    };
