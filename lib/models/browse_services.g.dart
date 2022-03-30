// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelBrowseServicesRev _$ViewModelBrowseServicesRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelBrowseServicesRev(
      json['id'] as String?,
      json['description'] as String?,
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,

      (json['options'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OptionField1.fromJson(e as Map<String, dynamic>))
          .toList(),


      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),

      json['rating'] as int?,
      json['logo_url'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      json['seller_url'] as String?,
      json['sales_count'] as int?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['seller_photo_url'] as String?,
      json['seller_photo'] == null
          ? null
          : Photo.fromJson(json['seller_photo'] as Map<String, dynamic>),
      json['seller_kabupaten_id'] as int?,
      json['seller_kabupaten_str'] as String?,
      (json['seller_seller_rating_num'] as num?)?.toDouble(),
      json['seller_seller_rating_num_str'] as String?,
      json['seller_seller_ranking'] as int?,
      json['seller_seller_ranking_str'] as String?,
      json['seller_date_registered'] == null
          ? null
          : DateTime.parse(json['seller_date_registered'] as String),
      json['seller_last_seen'] == null
          ? null
          : DateTime.parse(json['seller_last_seen'] as String),
      (json['seller_completion_rate'] as num?)?.toDouble(),
      (json['seller_arbitration_rate'] as num?)?.toDouble(),

      json['screenshots'] == null
          ? null
          : ScreenshotsListingTools.fromJson(
              json['screenshots'] as Map<String, dynamic>),
      json['service_reviews'] == null
          ? null
          : ServiceReviewsListingToolsRev.fromJson(
              json['service_reviews'] as Map<String, dynamic>),
      json['service_comments'] == null
          ? null
          : ServiceCommentsListingTools.fromJson(
              json['service_comments'] as Map<String, dynamic>),


      json['service_id'] as String?,


    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..seller_user_name = json['seller_user_name'] as String?
      ..seller_seller_rating = json['seller_seller_rating'] as int?;

Map<String, dynamic> _$ViewModelBrowseServicesRevToJson(
        ViewModelBrowseServicesRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'description': instance.description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'price': instance.price,
      'price_str': instance.price_str,
      'options': instance.options,
      'logo_url': instance.logo_url,
      'logo': instance.logo,

      'rating': instance.rating,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'sales_count': instance.sales_count,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'seller_photo_url': instance.seller_photo_url,
      'seller_photo': instance.seller_photo,
      'seller_user_name': instance.seller_user_name,
      'seller_kabupaten_id': instance.seller_kabupaten_id,
      'seller_kabupaten_str': instance.seller_kabupaten_str,
      'seller_seller_rating': instance.seller_seller_rating,
      'seller_seller_rating_num': instance.seller_seller_rating_num,
      'seller_seller_rating_num_str': instance.seller_seller_rating_num_str,
      'seller_seller_ranking': instance.seller_seller_ranking,
      'seller_seller_ranking_str': instance.seller_seller_ranking_str,
      'seller_date_registered':
          instance.seller_date_registered?.toIso8601String(),
      'seller_last_seen': instance.seller_last_seen?.toIso8601String(),
      'seller_completion_rate': instance.seller_completion_rate,
      'seller_arbitration_rate': instance.seller_arbitration_rate,

      'screenshots': instance.screenshots,
      'service_reviews': instance.service_reviews,
      'service_comments': instance.service_comments,
      'service_id': instance.service_id,




    };

BrowseServicesViewSuperBaseRev _$BrowseServicesViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    BrowseServicesViewSuperBaseRev(
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
          : ViewModelBrowseServicesRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseServicesViewSuperBaseRevToJson(
        BrowseServicesViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
