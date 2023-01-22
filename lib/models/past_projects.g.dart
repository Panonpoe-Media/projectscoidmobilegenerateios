// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_projects.dart';
/** AUTOGENERATE OFF **/
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelPastProjectsRev _$ViewModelPastProjectsRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelPastProjectsRev(
      json['id'] as String?,
      json['description'] as String?,
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
      json['budget_range_min_str'] as String?,
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['published_budget'] as num?)?.toDouble(),
      json['published_budget_str'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['project_status_id'] as int?,
      json['project_status_str'] as String?,
      (json['project_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      json['accepted_worker_url'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['accepted_budget'] as num?)?.toDouble(),
      json['accepted_budget_str'] as String?,
      json['project_ending_id'] as int?,
      json['project_ending_str'] as String?,
      (json['project_ending_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_ending_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
     json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      json['owner_url'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_photo_url'] as String?,
      json['owner_photo'] == null
          ? null
          : Photo.fromJson(json['owner_photo'] as Map<String, dynamic>),
      json['owner_kabupaten_id'] as int?,
      json['owner_kabupaten_str'] as String?,
      (json['owner_owner_rating_num'] as num?)?.toDouble(),
      json['owner_owner_rating_num_str'] as String?,
      json['owner_owner_point'] as int?,
      json['owner_owner_point_str'] as String?,
      json['owner_owner_ranking'] as int?,
      json['owner_owner_ranking_str'] as String?,
           (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      json['worker_feedback'] as String?,
      json['accepted_worker_photo_url'] as String?,
      json['accepted_worker_user_name'] as String?,
      json['accepted_worker_kabupaten_str'] as String?,
      json['accepted_worker_worker_rating'] as int?,
      (json['accepted_worker_worker_rating_num'] as num?)?.toDouble(),
      json['accepted_worker_worker_rating_num_str'] as String?,
      json['accepted_worker_worker_point'] as int?,
      json['accepted_worker_worker_point_str'] as String?,
      json['accepted_worker_worker_ranking'] as int?,
      json['accepted_worker_worker_ranking_str'] as String?,
             json['owner_feedback'] as String?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
       json['arbitration_id'] as int?,
      json['arbitration_str'] as String?,
      json['arbitration_url'] as String?,
          json['attachments_url'] as String?,
          json['attachments']  == ''? null :
          (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null  ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_name'] as String?,
           (json['arbitration_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitration_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['user_bids'] == null
          ? null
          : UserBidsListingToolsRev.fromJson(
              json['user_bids'] as Map<String, dynamic>),
      json['project_id'] as String?,




    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..owner_user_name = json['owner_user_name'] as String?
      ..owner_owner_rating = json['owner_owner_rating'] as int?;

Map<String, dynamic> _$ViewModelPastProjectsRevToJson(
        ViewModelPastProjectsRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'description': instance.description,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
      'project_class_id': instance.project_class_id,
      'project_class_str': instance.project_class_str,
      'project_class_list': instance.project_class_list,
      'project_class_list_str': instance.project_class_list_str,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'published_budget': instance.published_budget,
      'published_budget_str': instance.published_budget_str,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'published_date': instance.published_date?.toIso8601String(),
      'start_date': instance.start_date?.toIso8601String(),
      'project_status_id': instance.project_status_id,
      'project_status_str': instance.project_status_str,
      'project_status_list': instance.project_status_list,
      'project_status_list_str': instance.project_status_list_str,
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'accepted_budget': instance.accepted_budget,
      'accepted_budget_str': instance.accepted_budget_str,
      'project_ending_id': instance.project_ending_id,
      'project_ending_str': instance.project_ending_str,
      'project_ending_list': instance.project_ending_list,
      'project_ending_list_str': instance.project_ending_list_str,
      'finish_date': instance.finish_date?.toIso8601String(),
      'owner_id': instance.owner_id,
      'owner_str': instance.owner_str,
      'owner_url': instance.owner_url,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'owner_photo_url': instance.owner_photo_url,
      'owner_photo': instance.owner_photo,
      'owner_user_name': instance.owner_user_name,
      'owner_kabupaten_id': instance.owner_kabupaten_id,
      'owner_kabupaten_str': instance.owner_kabupaten_str,
      'owner_owner_rating': instance.owner_owner_rating,
      'owner_owner_rating_num': instance.owner_owner_rating_num,
      'owner_owner_rating_num_str': instance.owner_owner_rating_num_str,
      'owner_owner_point': instance.owner_owner_point,
      'owner_owner_point_str': instance.owner_owner_point_str,
      'owner_owner_ranking': instance.owner_owner_ranking,
      'owner_owner_ranking_str': instance.owner_owner_ranking_str,
      'worker_rating_num': instance.worker_rating_num,
      'worker_rating_num_str': instance.worker_rating_num_str,
      'worker_feedback': instance.worker_feedback,
           'accepted_worker_photo_url': instance.accepted_worker_photo_url,
      'accepted_worker_user_name': instance.accepted_worker_user_name,
      'accepted_worker_kabupaten_str': instance.accepted_worker_kabupaten_str,
      'accepted_worker_worker_rating': instance.accepted_worker_worker_rating,
      'accepted_worker_worker_rating_num':
          instance.accepted_worker_worker_rating_num,
      'accepted_worker_worker_rating_num_str':
          instance.accepted_worker_worker_rating_num_str,
      'accepted_worker_worker_point': instance.accepted_worker_worker_point,
      'accepted_worker_worker_point_str':
          instance.accepted_worker_worker_point_str,
      'accepted_worker_worker_ranking': instance.accepted_worker_worker_ranking,
      'accepted_worker_worker_ranking_str':
          instance.accepted_worker_worker_ranking_str,
            'owner_feedback': instance.owner_feedback,
      'owner_rating_num': instance.owner_rating_num,
      'owner_rating_num_str': instance.owner_rating_num_str,
      'arbitration_id': instance.arbitration_id,
      'arbitration_str': instance.arbitration_str,
      'arbitration_url': instance.arbitration_url,

      'attachments_url': instance.attachments_url,
      'attachments': instance.attachments,
      'attachments_name': instance.attachments_name,
           'arbitration_list': instance.arbitration_list,
      'arbitration_list_str': instance.arbitration_list_str,
      'user_bids': instance.user_bids,
      'project_id': instance.project_id


    };

PastProjectsViewSuperBaseRev _$PastProjectsViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    PastProjectsViewSuperBaseRev(
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
          : ViewModelPastProjectsRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PastProjectsViewSuperBaseRevToJson(
        PastProjectsViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
