// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_files_edit_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditModelShowFiles _$EditModelShowFilesFromJson(Map<String, dynamic> json) =>
    EditModelShowFiles(
      json['id'] as String?,
      json['post_id'] as String?,
      json['user_id'] as int?,
      json['user_str'] as String?,
      (json['user_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['user_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['project_id'] as int?,
      json['project_str'] as String?,
      (json['project_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['project_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['thread_id'] as int?,
      json['thread_str'] as String?,
      (json['thread_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['thread_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['post_type_id'] as int?,
      json['post_type_str'] as String?,
      (json['post_type_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['post_type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['bid_amount'] as num?)?.toDouble(),
      json['bid_amount_str'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['attachments_name'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_url = json['user_url'] as String?
      ..project_url = json['project_url'] as String?
      ..thread_url = json['thread_url'] as String?
      ..post_date = json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String)
      ..message = json['message'] as String?
      ..read_by_owner = json['read_by_owner'] as bool?
      ..read_by_worker = json['read_by_worker'] as bool?;

Map<String, dynamic> _$EditModelShowFilesToJson(EditModelShowFiles instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'post_id': instance.post_id,
      'user_id': instance.user_id,
      'user_url': instance.user_url,
      'user_str': instance.user_str,
      'user_list': instance.user_list,
      'user_list_str': instance.user_list_str,
      'project_id': instance.project_id,
      'project_url': instance.project_url,
      'project_str': instance.project_str,
      'project_list': instance.project_list,
      'project_list_str': instance.project_list_str,
      'thread_id': instance.thread_id,
      'thread_url': instance.thread_url,
      'thread_str': instance.thread_str,
      'thread_list': instance.thread_list,
      'thread_list_str': instance.thread_list_str,
      'post_type_id': instance.post_type_id,
      'post_type_str': instance.post_type_str,
      'post_type_list': instance.post_type_list,
      'post_type_list_str': instance.post_type_list_str,
      'post_date': instance.post_date?.toIso8601String(),
      'bid_amount': instance.bid_amount,
      'bid_amount_str': instance.bid_amount_str,
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments': instance.attachments,
      'read_by_owner': instance.read_by_owner,
      'read_by_worker': instance.read_by_worker,
    };

ShowFilesSuperBase _$ShowFilesSuperBaseFromJson(Map<String, dynamic> json) =>
    ShowFilesSuperBase(
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
          : EditModelShowFiles.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowFilesSuperBaseToJson(ShowFilesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
