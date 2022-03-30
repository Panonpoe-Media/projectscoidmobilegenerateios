// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bids_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexUserBids _$ItemIndexUserBidsFromJson(Map<String, dynamic> json) =>
    ItemIndexUserBids(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bid_id'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['worker_id'] as int?,
      json['worker_str'] as String?,
      json['worker_url'] as String?,
      (json['worker_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['location_id'] as int?,
      json['location_str'] as String?,
      json['location_url'] as String?,
      (json['location_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['location_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rating'] as int?,
      json['matching_skills'] as int?,
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
      json['shortlisted'] as bool?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexUserBidsToJson(ItemIndexUserBids instance) =>
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
      'date': instance.date?.toIso8601String(),
      'worker_id': instance.worker_id,
      'worker_str': instance.worker_str,
      'worker_url': instance.worker_url,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'location_id': instance.location_id,
      'location_str': instance.location_str,
      'location_url': instance.location_url,
      'location_list': instance.location_list,
      'location_list_str': instance.location_list_str,
      'rating': instance.rating,
      'matching_skills': instance.matching_skills,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
      'shortlisted': instance.shortlisted,
    };
