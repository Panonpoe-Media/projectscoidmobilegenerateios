// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_services_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionPlaceOrderBrowseServices
    _$ModelActionPlaceOrderBrowseServicesFromJson(Map<String, dynamic> json) =>
        ModelActionPlaceOrderBrowseServices(
          json['id'] as String?,
          json['service_id'] as String?,
          json['title'] as String?,
          json['short_description'] as String?,
          json['finish_days'] as int?,
          json['finish_days_str'] as String?,
          json['seller_id'] as int?,
          json['seller_str'] as String?,
          json['seller_url'] as String?,
          (json['seller_list'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
          (json['seller_list_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          json['selected_options'] as String?,
          (json['total_price'] as num?)?.toDouble(),
          json['total_price_str'] as String?,
          json['special_requirements'] as String?,
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionPlaceOrderBrowseServicesToJson(
        ModelActionPlaceOrderBrowseServices instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'service_id': instance.service_id,
      'title': instance.title,
      'short_description': instance.short_description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'selected_options': instance.selected_options,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'special_requirements': instance.special_requirements,
    };

PlaceOrderBrowseServicesSuperBase _$PlaceOrderBrowseServicesSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderBrowseServicesSuperBase(
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
          : ModelActionPlaceOrderBrowseServices.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOrderBrowseServicesSuperBaseToJson(
        PlaceOrderBrowseServicesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelBrowseServices _$ModelBrowseServicesFromJson(Map<String, dynamic> json) =>
    ModelBrowseServices(
      json['id'] as String?,
      json['service_id'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['category_id'] as int?,
      json['category_str'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['finish_days'] as int?,
      json['finish_days_str'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
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
      json['verified_by_id'] as int?,
      json['verified_by_str'] as String?,
      (json['verified_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['verified_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['approved_by_id'] as int?,
      json['approved_by_str'] as String?,
      (json['approved_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['approved_by_list_str'] as List<dynamic>?)
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
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['sales_amount'] as num?)?.toDouble(),
      json['sales_amount_str'] as String?,
      json['points'] as int?,
      json['points_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      (json['rating_num'] as num?)?.toDouble(),
      json['rating_num_str'] as String?,
      json['rating_sum'] as int?,
      json['rating_sum_str'] as String?,
      json['rating_div'] as int?,
      json['rating_div_str'] as String?,
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..service_info = json['service_info'] as String?
      ..seller_url = json['seller_url'] as String?
      ..comments = json['comments'] as String?
      ..reviews = json['reviews'] as String?
      ..category_url = json['category_url'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..short_description = json['short_description'] as String?
      ..options = json['options'] as String?
      ..registered_by_url = json['registered_by_url'] as String?
      ..registered_date = json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String)
      ..registered_from_ip = json['registered_from_ip'] as String?
      ..verified_by_url = json['verified_by_url'] as String?
      ..verified_date = json['verified_date'] == null
          ? null
          : DateTime.parse(json['verified_date'] as String)
      ..verified_from_ip = json['verified_from_ip'] as String?
      ..verifier_note = json['verifier_note'] as String?
      ..approved_by_url = json['approved_by_url'] as String?
      ..approved_date = json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String)
      ..approved_from_ip = json['approved_from_ip'] as String?
      ..approver_note = json['approver_note'] as String?
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
      ..last_bump = json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String)
      ..rating = json['rating'] as int?
      ..selected_options = json['selected_options'] as String?
      ..special_requirements = json['special_requirements'] as String?;

Map<String, dynamic> _$ModelBrowseServicesToJson(
        ModelBrowseServices instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'service_id': instance.service_id,
      'service_info': instance.service_info,
      'seller_id': instance.seller_id,
      'seller_url': instance.seller_url,
      'seller_str': instance.seller_str,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'comments': instance.comments,
      'reviews': instance.reviews,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'tags_list': instance.tags_list,
      'tags_list_str': instance.tags_list_str,
      'logo': instance.logo,
      'logo_url': instance.logo_url,
      'category_id': instance.category_id,
      'category_url': instance.category_url,
      'category_str': instance.category_str,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'finish_days': instance.finish_days,
      'finish_days_str': instance.finish_days_str,
      'price': instance.price,
      'price_str': instance.price_str,
      'options': instance.options,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'registered_by_id': instance.registered_by_id,
      'registered_by_url': instance.registered_by_url,
      'registered_by_str': instance.registered_by_str,
      'registered_by_list': instance.registered_by_list,
      'registered_by_list_str': instance.registered_by_list_str,
      'registered_date': instance.registered_date?.toIso8601String(),
      'registered_from_ip': instance.registered_from_ip,
      'verified_by_id': instance.verified_by_id,
      'verified_by_url': instance.verified_by_url,
      'verified_by_str': instance.verified_by_str,
      'verified_by_list': instance.verified_by_list,
      'verified_by_list_str': instance.verified_by_list_str,
      'verified_date': instance.verified_date?.toIso8601String(),
      'verified_from_ip': instance.verified_from_ip,
      'verifier_note': instance.verifier_note,
      'approved_by_id': instance.approved_by_id,
      'approved_by_url': instance.approved_by_url,
      'approved_by_str': instance.approved_by_str,
      'approved_by_list': instance.approved_by_list,
      'approved_by_list_str': instance.approved_by_list_str,
      'approved_date': instance.approved_date?.toIso8601String(),
      'approved_from_ip': instance.approved_from_ip,
      'approver_note': instance.approver_note,
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
      'last_bump': instance.last_bump?.toIso8601String(),
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'sales_amount': instance.sales_amount,
      'sales_amount_str': instance.sales_amount_str,
      'rating': instance.rating,
      'points': instance.points,
      'points_str': instance.points_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'rating_num': instance.rating_num,
      'rating_num_str': instance.rating_num_str,
      'rating_sum': instance.rating_sum,
      'rating_sum_str': instance.rating_sum_str,
      'rating_div': instance.rating_div,
      'rating_div_str': instance.rating_div_str,
      'selected_options': instance.selected_options,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'special_requirements': instance.special_requirements,
    };

BrowseServicesSuperBase _$BrowseServicesSuperBaseFromJson(
        Map<String, dynamic> json) =>
    BrowseServicesSuperBase(
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
          : ModelBrowseServices.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseServicesSuperBaseToJson(
        BrowseServicesSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelBrowseServices _$ViewModelBrowseServicesFromJson(
        Map<String, dynamic> json) =>
    ViewModelBrowseServices(
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
              : OptionField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      json['seller_url'] as String?,
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
      (json['seller_online_hours'] as num?)?.toDouble(),
      json['seller_online_hours_str'] as String?,
      json['seller_projects_won'] as int?,
      json['seller_projects_won_str'] as String?,
      json['seller_projects_completed'] as int?,
      json['seller_projects_completed_str'] as String?,
      json['seller_projects_arbitrated'] as int?,
      json['seller_projects_arbitrated_str'] as String?,
      json['seller_projects_won_in_arbitration'] as int?,
      json['seller_projects_won_in_arbitration_str'] as String?,
      json['seller_projects_lost_in_arbitration'] as int?,
      json['seller_projects_lost_in_arbitration_str'] as String?,
      json['seller_current_projects'] as int?,
      json['seller_current_projects_str'] as String?,
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      json['rating'] as int?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..seller_user_name = json['seller_user_name'] as String?
      ..seller_seller_rating = json['seller_seller_rating'] as int?
      ..seller_date_registered = json['seller_date_registered'] as String?
      ..seller_last_seen = json['seller_last_seen'] as String?;

Map<String, dynamic> _$ViewModelBrowseServicesToJson(
        ViewModelBrowseServices instance) =>
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
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
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
      'seller_date_registered': instance.seller_date_registered,
      'seller_last_seen': instance.seller_last_seen,
      'seller_online_hours': instance.seller_online_hours,
      'seller_online_hours_str': instance.seller_online_hours_str,
      'seller_projects_won': instance.seller_projects_won,
      'seller_projects_won_str': instance.seller_projects_won_str,
      'seller_projects_completed': instance.seller_projects_completed,
      'seller_projects_completed_str': instance.seller_projects_completed_str,
      'seller_projects_arbitrated': instance.seller_projects_arbitrated,
      'seller_projects_arbitrated_str': instance.seller_projects_arbitrated_str,
      'seller_projects_won_in_arbitration':
          instance.seller_projects_won_in_arbitration,
      'seller_projects_won_in_arbitration_str':
          instance.seller_projects_won_in_arbitration_str,
      'seller_projects_lost_in_arbitration':
          instance.seller_projects_lost_in_arbitration,
      'seller_projects_lost_in_arbitration_str':
          instance.seller_projects_lost_in_arbitration_str,
      'seller_current_projects': instance.seller_current_projects,
      'seller_current_projects_str': instance.seller_current_projects_str,
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'rating': instance.rating,
    };

BrowseServicesViewSuperBase _$BrowseServicesViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    BrowseServicesViewSuperBase(
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
          : ViewModelBrowseServices.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseServicesViewSuperBaseToJson(
        BrowseServicesViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

BrowseServicesListingTools _$BrowseServicesListingToolsFromJson(
        Map<String, dynamic> json) =>
    BrowseServicesListingTools(
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
              : ItemBrowseServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrowseServicesListingToolsToJson(
        BrowseServicesListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
