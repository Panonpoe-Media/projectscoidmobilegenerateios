// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortlisted_bids_list_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemShortlistedBids _$ItemShortlistedBidsFromJson(Map<String, dynamic> json) =>
    ItemShortlistedBids(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bid_id'] as String?,
      json['worker_photo_url'] as String?,
      json['worker_photo'] == null
          ? null
          : Photo.fromJson(json['worker_photo'] as Map<String, dynamic>),
      json['worker_worker_point'] as int?,
      json['worker_worker_point_str'] as String?,
      json['worker_worker_ranking'] as int?,
      json['worker_worker_ranking_str'] as String?,
      json['worker_kabupaten_id'] as int?,
      json['worker_kabupaten_str'] as String?,
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      json['matching_skills'] as int?,
      json['message'] as String?,
      json['attachments_name'] as String?,
      json['attachments_url'] as String?,
      (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..worker_user_name = json['worker_user_name'] as String?
      ..worker_worker_rating = json['worker_worker_rating'] as int?;

Map<String, dynamic> _$ItemShortlistedBidsToJson(
        ItemShortlistedBids instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'buttons': instance.buttons,
      'bid_id': instance.bid_id,
      'worker_photo_url': instance.worker_photo_url,
      'worker_photo': instance.worker_photo,
      'worker_user_name': instance.worker_user_name,
      'worker_worker_point': instance.worker_worker_point,
      'worker_worker_point_str': instance.worker_worker_point_str,
      'worker_worker_ranking': instance.worker_worker_ranking,
      'worker_worker_ranking_str': instance.worker_worker_ranking_str,
      'worker_kabupaten_id': instance.worker_kabupaten_id,
      'worker_kabupaten_str': instance.worker_kabupaten_str,
      'worker_worker_rating': instance.worker_worker_rating,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'matching_skills': instance.matching_skills,
      'message': instance.message,
      'attachments_name': instance.attachments_name,
      'attachments_url': instance.attachments_url,
      'attachments': instance.attachments,
    };
