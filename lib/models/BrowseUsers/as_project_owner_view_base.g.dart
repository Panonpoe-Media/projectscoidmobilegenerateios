// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_project_owner_view_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelAsProjectOwner _$ViewModelAsProjectOwnerFromJson(
        Map<String, dynamic> json) =>
    ViewModelAsProjectOwner(
      json['id'] as String?,
      json['project_id'] as String?,
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      json['accepted_worker_url'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      json['owner_url'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['category_id'] as int?,
      json['category_str'] as String?,
      json['category_url'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
      json['description'] as String?,
      json['short_description'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_url'] as String?,
      json['attachments_name'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      json['search_text'] as String?,
      (json['channels_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['channels_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['channels_url'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String),
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
      json['bid_count'] as int?,
      json['bid_count_str'] as String?,
      json['progress'] as int?,
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
      json['service_url'] as String?,
      (json['service_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['service_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['private_worker_id'] as int?,
      json['private_worker_str'] as String?,
      json['private_worker_url'] as String?,
      (json['private_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['private_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['invited_users'] as String?,
      json['accepted_bid_id'] as int?,
      json['accepted_bid_str'] as String?,
      json['accepted_bid_url'] as String?,
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
      json['accepted_work_url'] as String?,
      (json['accepted_work_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_work_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['accepted_date'] == null
          ? null
          : DateTime.parse(json['accepted_date'] as String),
      (json['available_budget'] as num?)?.toDouble(),
      json['available_budget_str'] as String?,
      json['need_weekly_report'] as bool,
      json['weekly_report_needed'] as bool,
      json['weekly_report_posted'] as bool,
      json['deadline_passed_sent'] as bool,
      json['deadline_approaching_sent'] as bool,
      json['rating_for_worker'] as String?,
      json['work_quality'] as int?,
      json['expertise'] as int?,
      json['worker_communication'] as int?,
      json['worker_professionalism'] as int?,
      json['worker_rating'] as int?,
      (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      json['worker_feedback'] as String?,
      json['rating_for_owner'] as String?,
      json['clarity'] as int?,
      json['friendliness'] as int?,
      json['owner_communication'] as int?,
      json['owner_professionalism'] as int?,
      json['owner_rating'] as int?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
      json['owner_feedback'] as String?,
      json['owner_signature_ip'] as String?,
      json['owner_signature_date'] == null
          ? null
          : DateTime.parse(json['owner_signature_date'] as String),
      json['worker_signature_ip'] as String?,
      json['worker_signature_date'] == null
          ? null
          : DateTime.parse(json['worker_signature_date'] as String),
      json['owner_escrow_id'] as int?,
      json['owner_escrow_str'] as String?,
      json['owner_escrow_url'] as String?,
      (json['owner_escrow_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['owner_escrow_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['worker_credit_id'] as int?,
      json['worker_credit_str'] as String?,
      json['worker_credit_url'] as String?,
      (json['worker_credit_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['worker_credit_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['arbitration_id'] as int?,
      json['arbitration_str'] as String?,
      json['arbitration_url'] as String?,
      (json['arbitration_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['arbitration_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_credit_id'] as int?,
      json['owner_credit_str'] as String?,
      json['owner_credit_url'] as String?,
      (json['owner_credit_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['owner_credit_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_by_id'] as int?,
      json['registered_by_str'] as String?,
      json['registered_by_url'] as String?,
      (json['registered_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['registered_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      json['registered_from_ip'] as String?,
      json['canceled_by_id'] as int?,
      json['canceled_by_str'] as String?,
      json['canceled_by_url'] as String?,
      (json['canceled_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['canceled_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['canceled_date'] == null
          ? null
          : DateTime.parse(json['canceled_date'] as String),
      json['canceled_from_ip'] as String?,
      json['published_by_id'] as int?,
      json['published_by_str'] as String?,
      json['published_by_url'] as String?,
      (json['published_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['published_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['published_from_ip'] as String?,
      json['rejected_by_id'] as int?,
      json['rejected_by_str'] as String?,
      json['rejected_by_url'] as String?,
      (json['rejected_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['rejected_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rejected_date'] == null
          ? null
          : DateTime.parse(json['rejected_date'] as String),
      json['rejected_from_ip'] as String?,
      json['admin_note'] as String?,
      json['announced'] as bool,
      json['broadcast_message'] as String?,
      (json['attach_file'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attach_file_url'] as String?,
      json['attach_file_name'] as String?,
      json['automatic_send_to_new_bidder'] as bool,
      json['is_system_message'] as bool,
      json['admin_notes'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelAsProjectOwnerToJson(
        ViewModelAsProjectOwner instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'project_id': instance.project_id,
      'accepted_worker_id': instance.accepted_worker_id,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'owner_id': instance.owner_id,
      'owner_str': instance.owner_str,
      'owner_url': instance.owner_url,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'category_id': instance.category_id,
      'category_str': instance.category_str,
      'category_url': instance.category_url,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'attachments': instance.attachments,
      'attachments_url': instance.attachments_url,
      'attachments_name': instance.attachments_name,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'search_text': instance.search_text,
      'channels_id': instance.channels_id,
      'channels_str': instance.channels_str,
      'channels_url': instance.channels_url,
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
      'service_str': instance.service_str,
      'service_url': instance.service_url,
      'service_list': instance.service_list,
      'service_list_str': instance.service_list_str,
      'private_worker_id': instance.private_worker_id,
      'private_worker_str': instance.private_worker_str,
      'private_worker_url': instance.private_worker_url,
      'private_worker_list': instance.private_worker_list,
      'private_worker_list_str': instance.private_worker_list_str,
      'invited_users': instance.invited_users,
      'accepted_bid_id': instance.accepted_bid_id,
      'accepted_bid_str': instance.accepted_bid_str,
      'accepted_bid_url': instance.accepted_bid_url,
      'accepted_bid_list': instance.accepted_bid_list,
      'accepted_bid_list_str': instance.accepted_bid_list_str,
      'accepted_budget': instance.accepted_budget,
      'accepted_budget_str': instance.accepted_budget_str,
      'accepted_work_id': instance.accepted_work_id,
      'accepted_work_str': instance.accepted_work_str,
      'accepted_work_url': instance.accepted_work_url,
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
      'owner_escrow_str': instance.owner_escrow_str,
      'owner_escrow_url': instance.owner_escrow_url,
      'owner_escrow_list': instance.owner_escrow_list,
      'owner_escrow_list_str': instance.owner_escrow_list_str,
      'worker_credit_id': instance.worker_credit_id,
      'worker_credit_str': instance.worker_credit_str,
      'worker_credit_url': instance.worker_credit_url,
      'worker_credit_list': instance.worker_credit_list,
      'worker_credit_list_str': instance.worker_credit_list_str,
      'arbitration_id': instance.arbitration_id,
      'arbitration_str': instance.arbitration_str,
      'arbitration_url': instance.arbitration_url,
      'arbitration_list': instance.arbitration_list,
      'arbitration_list_str': instance.arbitration_list_str,
      'owner_credit_id': instance.owner_credit_id,
      'owner_credit_str': instance.owner_credit_str,
      'owner_credit_url': instance.owner_credit_url,
      'owner_credit_list': instance.owner_credit_list,
      'owner_credit_list_str': instance.owner_credit_list_str,
      'registered_by_id': instance.registered_by_id,
      'registered_by_str': instance.registered_by_str,
      'registered_by_url': instance.registered_by_url,
      'registered_by_list': instance.registered_by_list,
      'registered_by_list_str': instance.registered_by_list_str,
      'registered_date': instance.registered_date?.toIso8601String(),
      'registered_from_ip': instance.registered_from_ip,
      'canceled_by_id': instance.canceled_by_id,
      'canceled_by_str': instance.canceled_by_str,
      'canceled_by_url': instance.canceled_by_url,
      'canceled_by_list': instance.canceled_by_list,
      'canceled_by_list_str': instance.canceled_by_list_str,
      'canceled_date': instance.canceled_date?.toIso8601String(),
      'canceled_from_ip': instance.canceled_from_ip,
      'published_by_id': instance.published_by_id,
      'published_by_str': instance.published_by_str,
      'published_by_url': instance.published_by_url,
      'published_by_list': instance.published_by_list,
      'published_by_list_str': instance.published_by_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'published_from_ip': instance.published_from_ip,
      'rejected_by_id': instance.rejected_by_id,
      'rejected_by_str': instance.rejected_by_str,
      'rejected_by_url': instance.rejected_by_url,
      'rejected_by_list': instance.rejected_by_list,
      'rejected_by_list_str': instance.rejected_by_list_str,
      'rejected_date': instance.rejected_date?.toIso8601String(),
      'rejected_from_ip': instance.rejected_from_ip,
      'admin_note': instance.admin_note,
      'announced': instance.announced,
      'broadcast_message': instance.broadcast_message,
      'attach_file': instance.attach_file,
      'attach_file_url': instance.attach_file_url,
      'attach_file_name': instance.attach_file_name,
      'automatic_send_to_new_bidder': instance.automatic_send_to_new_bidder,
      'is_system_message': instance.is_system_message,
      'admin_notes': instance.admin_notes,
    };

AsProjectOwnerViewSuperBase _$AsProjectOwnerViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AsProjectOwnerViewSuperBase(
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
          : ViewModelAsProjectOwner.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsProjectOwnerViewSuperBaseToJson(
        AsProjectOwnerViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
