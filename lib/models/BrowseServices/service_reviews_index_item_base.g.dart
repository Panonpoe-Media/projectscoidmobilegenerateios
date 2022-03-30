// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_reviews_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexServiceReviews _$ItemIndexServiceReviewsFromJson(
        Map<String, dynamic> json) =>
    ItemIndexServiceReviews(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_id'] as String?,
      json['owner_id'] as int?,
      json['owner_str'] as String?,
      json['owner_url'] as String?,
      (json['owner_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['owner_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['worker_rating'] as int?,
      json['worker_feedback'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexServiceReviewsToJson(
        ItemIndexServiceReviews instance) =>
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
      'owner_id': instance.owner_id,
      'owner_str': instance.owner_str,
      'owner_url': instance.owner_url,
      'owner_list': instance.owner_list,
      'owner_list_str': instance.owner_list_str,
      'start_date': instance.start_date?.toIso8601String(),
      'worker_rating': instance.worker_rating,
      'worker_feedback': instance.worker_feedback,
    };
