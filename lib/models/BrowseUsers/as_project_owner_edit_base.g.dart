// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_project_owner_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelAsProjectOwner _$EditModelAsProjectOwnerFromJson(
        Map<String, dynamic> json) =>
    EditModelAsProjectOwner(
      json['id'] as String?,
      json['project_id'] as String?,
      json['accepted_worker_id'] as int?,
      json['accepted_worker_str'] as String?,
      (json['accepted_worker_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['accepted_worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
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
      ..accepted_worker_url = json['accepted_worker_url'] as String?
      ..owner_url = json['owner_url'] as String?
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
      ..budget_range = json['budget_range'] as String?
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

Map<String, dynamic> _$EditModelAsProjectOwnerToJson(
        EditModelAsProjectOwner instance) =>
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
      'accepted_worker_url': instance.accepted_worker_url,
      'accepted_worker_str': instance.accepted_worker_str,
      'accepted_worker_list': instance.accepted_worker_list,
      'accepted_worker_list_str': instance.accepted_worker_list_str,
      'owner_id': instance.owner_id,
      'owner_url': instance.owner_url,
      'owner_str': instance.owner_str,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
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

AsProjectOwnerSuperBase _$AsProjectOwnerSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AsProjectOwnerSuperBase(
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
          : EditModelAsProjectOwner.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsProjectOwnerSuperBaseToJson(
        AsProjectOwnerSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
