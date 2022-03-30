// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_bids_index_item_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemIndexShowBids _$ItemIndexShowBidsFromJson(Map<String, dynamic> json) =>
    ItemIndexShowBids(
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bid_id'] as String?,
      json['worker_id'] as int?,
      json['worker_str'] as String?,
      json['worker_url'] as String?,
      (json['worker_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['worker_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rating'] as int?,
      json['matching_skills'] as int?,
      (json['amount'] as num?)?.toDouble(),
      json['amount_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..id = json['id'] as String?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ItemIndexShowBidsToJson(ItemIndexShowBids instance) =>
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
      'worker_id': instance.worker_id,
      'worker_str': instance.worker_str,
      'worker_url': instance.worker_url,
      'worker_list': instance.worker_list,
      'worker_list_str': instance.worker_list_str,
      'rating': instance.rating,
      'matching_skills': instance.matching_skills,
      'amount': instance.amount,
      'amount_str': instance.amount_str,
    };
