// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionBumpUpMyProjects _$ModelActionBumpUpMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionBumpUpMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionBumpUpMyProjectsToJson(
        ModelActionBumpUpMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
    };

BumpUpMyProjectsSuperBase _$BumpUpMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    BumpUpMyProjectsSuperBase(
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
          : ModelActionBumpUpMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BumpUpMyProjectsSuperBaseToJson(
        BumpUpMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionBroadcastMessageMyProjects
    _$ModelActionBroadcastMessageMyProjectsFromJson(
            Map<String, dynamic> json) =>
        ModelActionBroadcastMessageMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['title'] as String?,
          json['short_description'] as String?,
          json['broadcast_message'] as String?,
          (json['attach_file'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['attach_file_url'] as String?,
          json['attach_file_name'] as String?,
          json['automatic_send_to_new_bidder'] as bool?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionBroadcastMessageMyProjectsToJson(
        ModelActionBroadcastMessageMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'short_description': instance.short_description,
      'broadcast_message': instance.broadcast_message,
      'attach_file_url': instance.attach_file_url,
      'attach_file_name': instance.attach_file_name,
      'attach_file': instance.attach_file,
      'automatic_send_to_new_bidder': instance.automatic_send_to_new_bidder,
    };

BroadcastMessageMyProjectsSuperBase
    _$BroadcastMessageMyProjectsSuperBaseFromJson(Map<String, dynamic> json) =>
        BroadcastMessageMyProjectsSuperBase(
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
              : ModelActionBroadcastMessageMyProjects.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$BroadcastMessageMyProjectsSuperBaseToJson(
        BroadcastMessageMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionCreateProjectMyProjects _$ModelActionCreateProjectMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionCreateProjectMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionCreateProjectMyProjectsToJson(
        ModelActionCreateProjectMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
      'channels_list': instance.channels_list,
      'channels_list_str': instance.channels_list_str,
    };

CreateProjectMyProjectsSuperBase _$CreateProjectMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    CreateProjectMyProjectsSuperBase(
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
          : ModelActionCreateProjectMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProjectMyProjectsSuperBaseToJson(
        CreateProjectMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionEditDraftMyProjects _$ModelActionEditDraftMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionEditDraftMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionEditDraftMyProjectsToJson(
        ModelActionEditDraftMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
      'channels_list': instance.channels_list,
      'channels_list_str': instance.channels_list_str,
    };

EditDraftMyProjectsSuperBase _$EditDraftMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    EditDraftMyProjectsSuperBase(
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
          : ModelActionEditDraftMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditDraftMyProjectsSuperBaseToJson(
        EditDraftMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionPublishProjectMyProjects
    _$ModelActionPublishProjectMyProjectsFromJson(Map<String, dynamic> json) =>
        ModelActionPublishProjectMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['title'] as String?,
          json['description'] as String?,
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['attachments_url'] as String?,
          json['attachments_name'] as String?,
          json['finish_days'] as int?,
          json['finish_days_str'] as String?,
          json['budget_range'] as String?,
          (json['budget_range_min'] as num?)?.toDouble(),
          json['budget_range_min_str'] as String?,
          (json['budget_range_max'] as num?)?.toDouble(),
          json['budget_range_max_str'] as String?,
          json['budget_range_str'] as String?,
          (json['channels_id'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['channels_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          (json['channels_url'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionPublishProjectMyProjectsToJson(
        ModelActionPublishProjectMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
    };

PublishProjectMyProjectsSuperBase _$PublishProjectMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PublishProjectMyProjectsSuperBase(
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
          : ModelActionPublishProjectMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublishProjectMyProjectsSuperBaseToJson(
        PublishProjectMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionCancelProjectMyProjects _$ModelActionCancelProjectMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionCancelProjectMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionCancelProjectMyProjectsToJson(
        ModelActionCancelProjectMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
    };

CancelProjectMyProjectsSuperBase _$CancelProjectMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    CancelProjectMyProjectsSuperBase(
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
          : ModelActionCancelProjectMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CancelProjectMyProjectsSuperBaseToJson(
        CancelProjectMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionAcceptOrRejectWorkMyProjects
    _$ModelActionAcceptOrRejectWorkMyProjectsFromJson(
            Map<String, dynamic> json) =>
        ModelActionAcceptOrRejectWorkMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['message'] as String?,
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['attachments_url'] as String?,
          json['attachments_name'] as String?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAcceptOrRejectWorkMyProjectsToJson(
        ModelActionAcceptOrRejectWorkMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'message': instance.message,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
    };

AcceptOrRejectWorkMyProjectsSuperBase
    _$AcceptOrRejectWorkMyProjectsSuperBaseFromJson(
            Map<String, dynamic> json) =>
        AcceptOrRejectWorkMyProjectsSuperBase(
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
              : ModelActionAcceptOrRejectWorkMyProjects.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$AcceptOrRejectWorkMyProjectsSuperBaseToJson(
        AcceptOrRejectWorkMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionRateWorkerMyProjects _$ModelActionRateWorkerMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionRateWorkerMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['short_description'] as String?,
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      json['accepted_worker_url'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['work_quality'] as int?,
      json['expertise'] as int?,
      json['worker_communication'] as int?,
      json['worker_professionalism'] as int?,
      json['worker_feedback'] as String?,
      json['testimonial_for_projects_co_id'] as String?,
      json['testimony'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionRateWorkerMyProjectsToJson(
        ModelActionRateWorkerMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'short_description': instance.short_description,
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'work_quality': instance.work_quality,
      'expertise': instance.expertise,
      'worker_communication': instance.worker_communication,
      'worker_professionalism': instance.worker_professionalism,
      'worker_feedback': instance.worker_feedback,
      'testimonial_for_projects_co_id': instance.testimonial_for_projects_co_id,
      'testimony': instance.testimony,
    };

RateWorkerMyProjectsSuperBase _$RateWorkerMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    RateWorkerMyProjectsSuperBase(
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
          : ModelActionRateWorkerMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateWorkerMyProjectsSuperBaseToJson(
        RateWorkerMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionReportProgressMyProjects
    _$ModelActionReportProgressMyProjectsFromJson(Map<String, dynamic> json) =>
        ModelActionReportProgressMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['title'] as String?,
          json['description'] as String?,
          json['finish_days'] as int?,
          json['finish_days_str'] as String?,
          (json['accepted_budget'] as num?)?.toDouble(),
          json['accepted_budget_str'] as String?,
          json['progress'] as int?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionReportProgressMyProjectsToJson(
        ModelActionReportProgressMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'description': instance.description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'accepted_budget': instance.accepted_budget,
      'accepted_budget_str': instance.accepted_budget_str,
      'progress': instance.progress,
    };

ReportProgressMyProjectsSuperBase _$ReportProgressMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ReportProgressMyProjectsSuperBase(
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
          : ModelActionReportProgressMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportProgressMyProjectsSuperBaseToJson(
        ReportProgressMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionWeeklyReportMyProjects _$ModelActionWeeklyReportMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionWeeklyReportMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['message'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionWeeklyReportMyProjectsToJson(
        ModelActionWeeklyReportMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'message': instance.message,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
    };

WeeklyReportMyProjectsSuperBase _$WeeklyReportMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    WeeklyReportMyProjectsSuperBase(
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
          : ModelActionWeeklyReportMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeeklyReportMyProjectsSuperBaseToJson(
        WeeklyReportMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionReportDoneMyProjects _$ModelActionReportDoneMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionReportDoneMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['message'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionReportDoneMyProjectsToJson(
        ModelActionReportDoneMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'message': instance.message,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
    };

ReportDoneMyProjectsSuperBase _$ReportDoneMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ReportDoneMyProjectsSuperBase(
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
          : ModelActionReportDoneMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportDoneMyProjectsSuperBaseToJson(
        ReportDoneMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionRateOwnerMyProjects _$ModelActionRateOwnerMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionRateOwnerMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['title'] as String?,
      json['short_description'] as String?,
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      json['owner_url'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['clarity'] as int?,
      json['friendliness'] as int?,
      json['owner_communication'] as int?,
      json['owner_professionalism'] as int?,
      json['owner_feedback'] as String?,
      json['testimonial_for_projects_co_id'] as String?,
      json['testimony'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionRateOwnerMyProjectsToJson(
        ModelActionRateOwnerMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'short_description': instance.short_description,
      'owner_id': instance.owner_id,
      'owner_str': instance.owner_str,
      'owner_url': instance.owner_url,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'clarity': instance.clarity,
      'friendliness': instance.friendliness,
      'owner_communication': instance.owner_communication,
      'owner_professionalism': instance.owner_professionalism,
      'owner_feedback': instance.owner_feedback,
      'testimonial_for_projects_co_id': instance.testimonial_for_projects_co_id,
      'testimony': instance.testimony,
    };

RateOwnerMyProjectsSuperBase _$RateOwnerMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    RateOwnerMyProjectsSuperBase(
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
          : ModelActionRateOwnerMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateOwnerMyProjectsSuperBaseToJson(
        RateOwnerMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionFileArbitrationMyProjects
    _$ModelActionFileArbitrationMyProjectsFromJson(Map<String, dynamic> json) =>
        ModelActionFileArbitrationMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['project_title'] as String?,
          json['project_owner'] as String?,
          json['project_worker'] as String?,
          json['problem_description'] as String?,
          json['your_wishes'] as String?,
          json['your_offer'] as String?,
          (json['budget'] as num?)?.toDouble(),
          json['budget_str'] as String?,
          (json['worker_receives'] as num?)?.toDouble(),
          (json['owner_receives'] as num?)?.toDouble(),
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionFileArbitrationMyProjectsToJson(
        ModelActionFileArbitrationMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'project_title': instance.project_title,
      'project_owner': instance.project_owner,
      'project_worker': instance.project_worker,
      'problem_description': instance.problem_description,
      'your_wishes': instance.your_wishes,
      'your_offer': instance.your_offer,
      'budget': instance.budget,
      'budget_str': instance.budget_str,
      'worker_receives': instance.worker_receives,
      'owner_receives': instance.owner_receives,
    };

FileArbitrationMyProjectsSuperBase _$FileArbitrationMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    FileArbitrationMyProjectsSuperBase(
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
          : ModelActionFileArbitrationMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileArbitrationMyProjectsSuperBaseToJson(
        FileArbitrationMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionNewOfferMyProjects _$ModelActionNewOfferMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionNewOfferMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['project_title'] as String?,
      json['project_owner'] as String?,
      json['project_worker'] as String?,
      (json['budget'] as num?)?.toDouble(),
      json['budget_str'] as String?,
      (json['worker_receives'] as num?)?.toDouble(),
      (json['owner_receives'] as num?)?.toDouble(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionNewOfferMyProjectsToJson(
        ModelActionNewOfferMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'project_title': instance.project_title,
      'project_owner': instance.project_owner,
      'project_worker': instance.project_worker,
      'budget': instance.budget,
      'budget_str': instance.budget_str,
      'worker_receives': instance.worker_receives,
      'owner_receives': instance.owner_receives,
    };

NewOfferMyProjectsSuperBase _$NewOfferMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    NewOfferMyProjectsSuperBase(
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
          : ModelActionNewOfferMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewOfferMyProjectsSuperBaseToJson(
        NewOfferMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionAcceptOfferMyProjects _$ModelActionAcceptOfferMyProjectsFromJson(
        Map<String, dynamic> json) =>
    ModelActionAcceptOfferMyProjects(
      json['id'] as String?,
      json['bid_id'] as String?,
      json['project_id'] as int?,
      json['project_str'] as String?,
      json['project_url'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['requested_date'] == null
          ? null
          : DateTime.parse(json['requested_date'] as String),
      json['type_id'] as int?,
      json['type_str'] as String?,
      (json['type_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['plaintiff_id'] as int?,
      json['plaintiff_str'] as String?,
      json['plaintiff_url'] as String?,
      (json['plaintiff_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['plaintiff_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['defendant_id'] as int?,
      json['defendant_str'] as String?,
      json['defendant_url'] as String?,
      (json['defendant_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['defendant_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['worker_receives'] as num?)?.toDouble(),
      json['worker_receives_str'] as String?,
      (json['owner_receives'] as num?)?.toDouble(),
      json['owner_receives_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAcceptOfferMyProjectsToJson(
        ModelActionAcceptOfferMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'bid_id': instance.bid_id,
      'project_id': instance.project_id,
      'project_str': instance.project_str,
      'project_url': instance.project_url,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'requested_date': instance.requested_date?.toIso8601String(),
      'type_id': instance.type_id,
      'type_str': instance.type_str,
      'type_list': instance.type_list,
      'type_list_str': instance.type_list_str,
      'plaintiff_id': instance.plaintiff_id,
      'plaintiff_str': instance.plaintiff_str,
      'plaintiff_url': instance.plaintiff_url,
      'plaintiff_list': instance.plaintiff_list,
      'plaintiff_list_str': instance.plaintiff_list_str,
      'defendant_id': instance.defendant_id,
      'defendant_str': instance.defendant_str,
      'defendant_url': instance.defendant_url,
      'defendant_list': instance.defendant_list,
      'defendant_list_str': instance.defendant_list_str,
      'worker_receives': instance.worker_receives,
      'worker_receives_str': instance.worker_receives_str,
      'owner_receives': instance.owner_receives,
      'owner_receives_str': instance.owner_receives_str,
    };

AcceptOfferMyProjectsSuperBase _$AcceptOfferMyProjectsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AcceptOfferMyProjectsSuperBase(
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
          : ModelActionAcceptOfferMyProjects.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptOfferMyProjectsSuperBaseToJson(
        AcceptOfferMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionRespondArbitrationMyProjects
    _$ModelActionRespondArbitrationMyProjectsFromJson(
            Map<String, dynamic> json) =>
        ModelActionRespondArbitrationMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['project_title'] as String?,
          json['project_owner'] as String?,
          json['project_worker'] as String?,
          json['requested_date'] == null
              ? null
              : DateTime.parse(json['requested_date'] as String),
          json['plaintiff_id'] as int?,
          json['plaintiff_str'] as String?,
          json['plaintiff_url'] as String?,
          (json['plaintiff_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['plaintiff_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['plaintiff_description'] as String?,
          json['plaintiff_wishes'] as String?,
          json['problem_description'] as String?,
          json['your_wishes'] as String?,
          json['your_offer'] as String?,
          (json['budget'] as num?)?.toDouble(),
          json['budget_str'] as String?,
          (json['worker_receives'] as num?)?.toDouble(),
          (json['owner_receives'] as num?)?.toDouble(),
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionRespondArbitrationMyProjectsToJson(
        ModelActionRespondArbitrationMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'project_title': instance.project_title,
      'project_owner': instance.project_owner,
      'project_worker': instance.project_worker,
      'requested_date': instance.requested_date?.toIso8601String(),
      'plaintiff_id': instance.plaintiff_id,
      'plaintiff_str': instance.plaintiff_str,
      'plaintiff_url': instance.plaintiff_url,
      'plaintiff_list': instance.plaintiff_list,
      'plaintiff_list_str': instance.plaintiff_list_str,
      'plaintiff_description': instance.plaintiff_description,
      'plaintiff_wishes': instance.plaintiff_wishes,
      'problem_description': instance.problem_description,
      'your_wishes': instance.your_wishes,
      'your_offer': instance.your_offer,
      'budget': instance.budget,
      'budget_str': instance.budget_str,
      'worker_receives': instance.worker_receives,
      'owner_receives': instance.owner_receives,
    };

RespondArbitrationMyProjectsSuperBase
    _$RespondArbitrationMyProjectsSuperBaseFromJson(
            Map<String, dynamic> json) =>
        RespondArbitrationMyProjectsSuperBase(
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
              : ModelActionRespondArbitrationMyProjects.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RespondArbitrationMyProjectsSuperBaseToJson(
        RespondArbitrationMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionCancelArbitrationMyProjects
    _$ModelActionCancelArbitrationMyProjectsFromJson(
            Map<String, dynamic> json) =>
        ModelActionCancelArbitrationMyProjects(
          json['id'] as String?,
          json['project_id'] as String?,
          json['title'] as String?,
          json['short_description'] as String?,
          json['start_date'] == null
              ? null
              : DateTime.parse(json['start_date'] as String),
          json['finish_deadline'] == null
              ? null
              : DateTime.parse(json['finish_deadline'] as String),
          json['extend_deadline_days'] as int?,
          json['your_wishes'] as String?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionCancelArbitrationMyProjectsToJson(
        ModelActionCancelArbitrationMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'title': instance.title,
      'short_description': instance.short_description,
      'start_date': instance.start_date?.toIso8601String(),
      'finish_deadline': instance.finish_deadline?.toIso8601String(),
      'extend_deadline_days': instance.extend_deadline_days,
      'your_wishes': instance.your_wishes,
    };

CancelArbitrationMyProjectsSuperBase
    _$CancelArbitrationMyProjectsSuperBaseFromJson(Map<String, dynamic> json) =>
        CancelArbitrationMyProjectsSuperBase(
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
              : ModelActionCancelArbitrationMyProjects.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CancelArbitrationMyProjectsSuperBaseToJson(
        CancelArbitrationMyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelMyProjects _$ModelMyProjectsFromJson(Map<String, dynamic> json) =>
    ModelMyProjects(
      json['id'] as String?,
      json['project_id'] as String?,
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['category_id'] as int?,
      json['category_str'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bid_count'] as int?,
      json['bid_count_str'] as String?,
      json['project_status_id'] as int?,
      json['project_status_str'] as String?,
      (json['project_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_ending_id'] as int?,
      json['project_ending_str'] as String?,
      (json['project_ending_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_ending_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_type_id'] as int?,
      json['project_type_str'] as String?,
      (json['project_type_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_type_list_str'] as List<dynamic>?)
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
      (json['published_budget'] as num?)?.toDouble(),
      json['published_budget_str'] as String?,
      json['budget_range'] as String?,
      (json['budget_range_min'] as num?)?.toDouble(),
      json['budget_range_min_str'] as String?,
      (json['budget_range_max'] as num?)?.toDouble(),
      json['budget_range_max_str'] as String?,
      json['budget_range_str'] as String?,
      json['fee_percent'] as int?,
      json['fee_percent_str'] as String?,
      json['service_id'] as int?,
      json['service_str'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['private_worker_id'] as int?,
      json['private_worker_str'] as String?,
      (json['private_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['private_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['accepted_bid_id'] as int?,
      json['accepted_bid_str'] as String?,
      (json['accepted_bid_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_bid_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['accepted_budget'] as num?)?.toDouble(),
      json['accepted_budget_str'] as String?,
      json['accepted_work_id'] as int?,
      json['accepted_work_str'] as String?,
      (json['accepted_work_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_work_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['available_budget'] as num?)?.toDouble(),
      json['available_budget_str'] as String?,
      (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
      json['owner_escrow_id'] as int?,
      json['owner_escrow_str'] as String?,
      (json['owner_escrow_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['owner_escrow_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['worker_credit_id'] as int?,
      json['worker_credit_str'] as String?,
      (json['worker_credit_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['worker_credit_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['arbitration_id'] as int?,
      json['arbitration_str'] as String?,
      (json['arbitration_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitration_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_credit_id'] as int?,
      json['owner_credit_str'] as String?,
      (json['owner_credit_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['owner_credit_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_by_id'] as int?,
      json['registered_by_str'] as String?,
      (json['registered_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['registered_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['canceled_by_id'] as int?,
      json['canceled_by_str'] as String?,
      (json['canceled_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['canceled_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['published_by_id'] as int?,
      json['published_by_str'] as String?,
      (json['published_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['published_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rejected_by_id'] as int?,
      json['rejected_by_str'] as String?,
      (json['rejected_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['rejected_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['extend_deadline_days'] as int?,
      json['extend_deadline_days_str'] as String?,
      (json['attach_file'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attach_file_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..owner_url = json['owner_url'] as String?
      ..accepted_worker_url = json['accepted_worker_url'] as String?
      ..testimonial_for_projects_co_id =
          json['testimonial_for_projects_co_id'] as String?
      ..your_offer = json['your_offer'] as String?
      ..category_url = json['category_url'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..short_description = json['short_description'] as String?
      ..search_text = json['search_text'] as String?
      ..last_bump = json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String)
      ..select_deadline = json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String)
      ..start_date = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..finish_deadline = json['finish_deadline'] == null
          ? null
          : DateTime.parse(json['finish_deadline'] as String)
      ..finish_date = json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String)
      ..closed_date = json['closed_date'] == null
          ? null
          : DateTime.parse(json['closed_date'] as String)
      ..progress = json['progress'] as int?
      ..service_url = json['service_url'] as String?
      ..private_worker_url = json['private_worker_url'] as String?
      ..invited_users = json['invited_users'] as String?
      ..accepted_bid_url = json['accepted_bid_url'] as String?
      ..accepted_work_url = json['accepted_work_url'] as String?
      ..accepted_date = json['accepted_date'] == null
          ? null
          : DateTime.parse(json['accepted_date'] as String)
      ..need_weekly_report = json['need_weekly_report'] as bool?
      ..weekly_report_needed = json['weekly_report_needed'] as bool?
      ..weekly_report_posted = json['weekly_report_posted'] as bool?
      ..deadline_passed_sent = json['deadline_passed_sent'] as bool?
      ..deadline_approaching_sent = json['deadline_approaching_sent'] as bool?
      ..rating_for_worker = json['rating_for_worker'] as String?
      ..work_quality = json['work_quality'] as int?
      ..expertise = json['expertise'] as int?
      ..worker_communication = json['worker_communication'] as int?
      ..worker_professionalism = json['worker_professionalism'] as int?
      ..worker_rating = json['worker_rating'] as int?
      ..worker_feedback = json['worker_feedback'] as String?
      ..rating_for_owner = json['rating_for_owner'] as String?
      ..clarity = json['clarity'] as int?
      ..friendliness = json['friendliness'] as int?
      ..owner_communication = json['owner_communication'] as int?
      ..owner_professionalism = json['owner_professionalism'] as int?
      ..owner_rating = json['owner_rating'] as int?
      ..owner_feedback = json['owner_feedback'] as String?
      ..owner_signature_ip = json['owner_signature_ip'] as String?
      ..owner_signature_date = json['owner_signature_date'] == null
          ? null
          : DateTime.parse(json['owner_signature_date'] as String)
      ..worker_signature_ip = json['worker_signature_ip'] as String?
      ..worker_signature_date = json['worker_signature_date'] == null
          ? null
          : DateTime.parse(json['worker_signature_date'] as String)
      ..owner_escrow_url = json['owner_escrow_url'] as String?
      ..worker_credit_url = json['worker_credit_url'] as String?
      ..arbitration_url = json['arbitration_url'] as String?
      ..owner_credit_url = json['owner_credit_url'] as String?
      ..registered_by_url = json['registered_by_url'] as String?
      ..registered_date = json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String)
      ..registered_from_ip = json['registered_from_ip'] as String?
      ..canceled_by_url = json['canceled_by_url'] as String?
      ..canceled_date = json['canceled_date'] == null
          ? null
          : DateTime.parse(json['canceled_date'] as String)
      ..canceled_from_ip = json['canceled_from_ip'] as String?
      ..published_by_url = json['published_by_url'] as String?
      ..published_date = json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String)
      ..published_from_ip = json['published_from_ip'] as String?
      ..rejected_by_url = json['rejected_by_url'] as String?
      ..rejected_date = json['rejected_date'] == null
          ? null
          : DateTime.parse(json['rejected_date'] as String)
      ..rejected_from_ip = json['rejected_from_ip'] as String?
      ..admin_note = json['admin_note'] as String?
      ..announced = json['announced'] as bool?
      ..your_wishes = json['your_wishes'] as String?
      ..testimony = json['testimony'] as String?
      ..pick_user_name = json['pick_user_name'] as String?
      ..enter_email_address = json['enter_email_address'] as String?
      ..handphone = json['handphone'] as String?
      ..broadcast_message = json['broadcast_message'] as String?
      ..automatic_send_to_new_bidder =
          json['automatic_send_to_new_bidder'] as bool?
      ..is_system_message = json['is_system_message'] as bool?
      ..admin_notes = json['admin_notes'] as String?;

Map<String, dynamic> _$ModelMyProjectsToJson(ModelMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'owner_id': instance.owner_id,
      'owner_url': instance.owner_url,
      'owner_str': instance.owner_str,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'testimonial_for_projects_co_id': instance.testimonial_for_projects_co_id,
      'your_offer': instance.your_offer,
      'category_id': instance.category_id,
      'category_url': instance.category_url,
      'category_str': instance.category_str,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'search_text': instance.search_text,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
      'channels_list': instance.channels_list,
      'channels_list_str': instance.channels_list_str,
      'last_bump': instance.last_bump?.toIso8601String(),
      'select_deadline': instance.select_deadline?.toIso8601String(),
      'start_date': instance.start_date?.toIso8601String(),
      'finish_deadline': instance.finish_deadline?.toIso8601String(),
      'finish_date': instance.finish_date?.toIso8601String(),
      'closed_date': instance.closed_date?.toIso8601String(),
      'bid_count': instance.bid_count,
      'bid_count_str': instance.bid_count_str,
      'progress': instance.progress,
      'project_status_id': instance.project_status_id,
      'project_status_str': instance.project_status_str,
      'project_status_list': instance.project_status_list,
      'project_status_list_str': instance.project_status_list_str,
      'project_ending_id': instance.project_ending_id,
      'project_ending_str': instance.project_ending_str,
      'project_ending_list': instance.project_ending_list,
      'project_ending_list_str': instance.project_ending_list_str,
      'project_type_id': instance.project_type_id,
      'project_type_str': instance.project_type_str,
      'project_type_list': instance.project_type_list,
      'project_type_list_str': instance.project_type_list_str,
      'project_class_id': instance.project_class_id,
      'project_class_str': instance.project_class_str,
      'project_class_list': instance.project_class_list,
      'project_class_list_str': instance.project_class_list_str,
      'published_budget': instance.published_budget,
      'published_budget_str': instance.published_budget_str,
      'budget_range': instance.budget_range,
      'budget_range_min': instance.budget_range_min,
      'budget_range_min_str': instance.budget_range_min_str,
      'budget_range_max': instance.budget_range_max,
      'budget_range_max_str': instance.budget_range_max_str,
      'budget_range_str': instance.budget_range_str,
      'fee_percent': instance.fee_percent,
      'fee_percent_str': instance.fee_percent_str,
      'service_id': instance.service_id,
      'service_url': instance.service_url,
      'service_str': instance.service_str,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
      'private_worker_id': instance.private_worker_id,
      'private_worker_url': instance.private_worker_url,
      'private_worker_str': instance.private_worker_str,
      'private_worker_list': instance.private_worker_list,
      'private_worker_list_str': instance.private_worker_list_str,
      'invited_users': instance.invited_users,
      'accepted_bid_id': instance.accepted_bid_id,
      'accepted_bid_url': instance.accepted_bid_url,
      'accepted_bid_str': instance.accepted_bid_str,
      'accepted_bid_list': instance.accepted_bid_list,
      'accepted_bid_list_str': instance.accepted_bid_list_str,
      'accepted_budget': instance.accepted_budget,
      'accepted_budget_str': instance.accepted_budget_str,
      'accepted_work_id': instance.accepted_work_id,
      'accepted_work_url': instance.accepted_work_url,
      'accepted_work_str': instance.accepted_work_str,
      'accepted_work_list': instance.accepted_work_list,
      'accepted_work_list_str': instance.accepted_work_list_str,
      'accepted_date': instance.accepted_date?.toIso8601String(),
      'available_budget': instance.available_budget,
      'available_budget_str': instance.available_budget_str,
      'need_weekly_report': instance.need_weekly_report,
      'weekly_report_needed': instance.weekly_report_needed,
      'weekly_report_posted': instance.weekly_report_posted,
      'deadline_passed_sent': instance.deadline_passed_sent,
      'deadline_approaching_sent': instance.deadline_approaching_sent,
      'rating_for_worker': instance.rating_for_worker,
      'work_quality': instance.work_quality,
      'expertise': instance.expertise,
      'worker_communication': instance.worker_communication,
      'worker_professionalism': instance.worker_professionalism,
      'worker_rating': instance.worker_rating,
      'worker_rating_num': instance.worker_rating_num,
      'worker_rating_num_str': instance.worker_rating_num_str,
      'worker_feedback': instance.worker_feedback,
      'rating_for_owner': instance.rating_for_owner,
      'clarity': instance.clarity,
      'friendliness': instance.friendliness,
      'owner_communication': instance.owner_communication,
      'owner_professionalism': instance.owner_professionalism,
      'owner_rating': instance.owner_rating,
      'owner_rating_num': instance.owner_rating_num,
      'owner_rating_num_str': instance.owner_rating_num_str,
      'owner_feedback': instance.owner_feedback,
      'owner_signature_ip': instance.owner_signature_ip,
      'owner_signature_date': instance.owner_signature_date?.toIso8601String(),
      'worker_signature_ip': instance.worker_signature_ip,
      'worker_signature_date':
          instance.worker_signature_date?.toIso8601String(),
      'owner_escrow_id': instance.owner_escrow_id,
      'owner_escrow_url': instance.owner_escrow_url,
      'owner_escrow_str': instance.owner_escrow_str,
      'owner_escrow_list': instance.owner_escrow_list,
      'owner_escrow_list_str': instance.owner_escrow_list_str,
      'worker_credit_id': instance.worker_credit_id,
      'worker_credit_url': instance.worker_credit_url,
      'worker_credit_str': instance.worker_credit_str,
      'worker_credit_list': instance.worker_credit_list,
      'worker_credit_list_str': instance.worker_credit_list_str,
      'arbitration_id': instance.arbitration_id,
      'arbitration_url': instance.arbitration_url,
      'arbitration_str': instance.arbitration_str,
      'arbitration_list': instance.arbitration_list,
      'arbitration_list_str': instance.arbitration_list_str,
      'owner_credit_id': instance.owner_credit_id,
      'owner_credit_url': instance.owner_credit_url,
      'owner_credit_str': instance.owner_credit_str,
      'owner_credit_list': instance.owner_credit_list,
      'owner_credit_list_str': instance.owner_credit_list_str,
      'registered_by_id': instance.registered_by_id,
      'registered_by_url': instance.registered_by_url,
      'registered_by_str': instance.registered_by_str,
      'registered_by_list': instance.registered_by_list,
      'registered_by_list_str': instance.registered_by_list_str,
      'registered_date': instance.registered_date?.toIso8601String(),
      'registered_from_ip': instance.registered_from_ip,
      'canceled_by_id': instance.canceled_by_id,
      'canceled_by_url': instance.canceled_by_url,
      'canceled_by_str': instance.canceled_by_str,
      'canceled_by_list': instance.canceled_by_list,
      'canceled_by_list_str': instance.canceled_by_list_str,
      'canceled_date': instance.canceled_date?.toIso8601String(),
      'canceled_from_ip': instance.canceled_from_ip,
      'published_by_id': instance.published_by_id,
      'published_by_url': instance.published_by_url,
      'published_by_str': instance.published_by_str,
      'published_by_list': instance.published_by_list,
      'published_by_list_str': instance.published_by_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'published_from_ip': instance.published_from_ip,
      'rejected_by_id': instance.rejected_by_id,
      'rejected_by_url': instance.rejected_by_url,
      'rejected_by_str': instance.rejected_by_str,
      'rejected_by_list': instance.rejected_by_list,
      'rejected_by_list_str': instance.rejected_by_list_str,
      'rejected_date': instance.rejected_date?.toIso8601String(),
      'rejected_from_ip': instance.rejected_from_ip,
      'admin_note': instance.admin_note,
      'announced': instance.announced,
      'your_wishes': instance.your_wishes,
      'extend_deadline_days': instance.extend_deadline_days,
      'extend_deadline_days_str': instance.extend_deadline_days_str,
      'testimony': instance.testimony,
      'pick_user_name': instance.pick_user_name,
      'enter_email_address': instance.enter_email_address,
      'handphone': instance.handphone,
      'broadcast_message': instance.broadcast_message,
      'attach_file_name': instance.attach_file_name,
      'attach_file': instance.attach_file,
      'automatic_send_to_new_bidder': instance.automatic_send_to_new_bidder,
      'is_system_message': instance.is_system_message,
      'admin_notes': instance.admin_notes,
    };

MyProjectsSuperBase _$MyProjectsSuperBaseFromJson(Map<String, dynamic> json) =>
    MyProjectsSuperBase(
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
          : ModelMyProjects.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProjectsSuperBaseToJson(
        MyProjectsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelMyProjects _$ViewModelMyProjectsFromJson(Map<String, dynamic> json) =>
    ViewModelMyProjects(
      json['id'] as String?,
      json['admin_note'] as String?,
      json['description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
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
      json['project_status_id'] as int?,
      json['project_status_str'] as String?,
      (json['project_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['published_budget'] as num?)?.toDouble(),
      json['published_budget_str'] as String?,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['project_ending_id'] as int?,
      json['project_ending_str'] as String?,
      (json['project_ending_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['project_ending_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bid_count'] as int?,
      json['bid_count_str'] as String?,
      json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String),
      json['need_weekly_report'] as bool?,
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['finish_deadline'] == null
          ? null
          : DateTime.parse(json['finish_deadline'] as String),
      json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
      json['closed_date'] == null
          ? null
          : DateTime.parse(json['closed_date'] as String),
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
      json['progress'] as int?,
      json['arbitration_id'] as int?,
      json['arbitration_str'] as String?,
      json['arbitration_url'] as String?,
      (json['arbitration_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitration_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
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
      json['accepted_worker_worker_point'] as int?,
      json['accepted_worker_worker_point_str'] as String?,
      json['accepted_worker_worker_ranking'] as int?,
      json['accepted_worker_worker_ranking_str'] as String?,
      json['owner_feedback'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..owner_user_name = json['owner_user_name'] as String?
      ..owner_owner_rating = json['owner_owner_rating'] as int?
      ..accepted_worker_worker_rating =
          json['accepted_worker_worker_rating'] as int?;

Map<String, dynamic> _$ViewModelMyProjectsToJson(
        ViewModelMyProjects instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'admin_note': instance.admin_note,
      'description': instance.description,
      'attachments': instance.attachments,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
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
      'project_status_id': instance.project_status_id,
      'project_status_str': instance.project_status_str,
      'project_status_list': instance.project_status_list,
      'project_status_list_str': instance.project_status_list_str,
      'published_budget': instance.published_budget,
      'published_budget_str': instance.published_budget_str,
      'published_date': instance.published_date?.toIso8601String(),
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'project_ending_id': instance.project_ending_id,
      'project_ending_str': instance.project_ending_str,
      'project_ending_list': instance.project_ending_list,
      'project_ending_list_str': instance.project_ending_list_str,
      'bid_count': instance.bid_count,
      'bid_count_str': instance.bid_count_str,
      'select_deadline': instance.select_deadline?.toIso8601String(),
      'need_weekly_report': instance.need_weekly_report,
      'start_date': instance.start_date?.toIso8601String(),
      'finish_deadline': instance.finish_deadline?.toIso8601String(),
      'finish_date': instance.finish_date?.toIso8601String(),
      'closed_date': instance.closed_date?.toIso8601String(),
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'accepted_budget': instance.accepted_budget,
      'accepted_budget_str': instance.accepted_budget_str,
      'progress': instance.progress,
      'arbitration_id': instance.arbitration_id,
      'arbitration_str': instance.arbitration_str,
      'arbitration_url': instance.arbitration_url,
      'arbitration_list': instance.arbitration_list,
      'arbitration_list_str': instance.arbitration_list_str,
      'last_bump': instance.last_bump?.toIso8601String(),
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
      'accepted_worker_worker_rating': instance.accepted_worker_worker_rating,
      'accepted_worker_worker_point': instance.accepted_worker_worker_point,
      'accepted_worker_worker_point_str':
          instance.accepted_worker_worker_point_str,
      'accepted_worker_worker_ranking': instance.accepted_worker_worker_ranking,
      'accepted_worker_worker_ranking_str':
          instance.accepted_worker_worker_ranking_str,
      'owner_feedback': instance.owner_feedback,
    };

MyProjectsViewSuperBase _$MyProjectsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyProjectsViewSuperBase(
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
          : ViewModelMyProjects.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProjectsViewSuperBaseToJson(
        MyProjectsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyProjectsListingTools _$MyProjectsListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyProjectsListingTools(
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
              : ItemMyProjects.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyProjectsListingToolsToJson(
        MyProjectsListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
