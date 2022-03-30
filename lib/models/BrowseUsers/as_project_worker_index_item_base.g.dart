// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_project_worker_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexAsProjectWorker _$ItemIndexAsProjectWorkerFromJson(
        Map<String, dynamic> json) =>
    ItemIndexAsProjectWorker(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_id'] as String?,
      json['category_id'] as int?,
      json['category_str'] as String?,
      json['category_url'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['title'] as String?,
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
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexAsProjectWorkerToJson(
        ItemIndexAsProjectWorker instance) =>
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
      'category_id': instance.category_id,
      'category_str': instance.category_str,
      'category_url': instance.category_url,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
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
      'published_date': instance.published_date?.toIso8601String(),
    };
