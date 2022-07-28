// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewModelBrowseUsersRev _$ViewModelBrowseUsersRevFromJson(
        Map<String, dynamic> json) =>
    ViewModelBrowseUsersRev(
      json['id'] as String?,
      json['self_introduction'] as String?,
      (json['skills_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['skills_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['skills_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String?,
      json['display_name'] as String?,
      json['user_name'] as String?,
      json['account_type_id'] as int?,
      json['account_type_str'] as String?,
      (json['account_type_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['account_type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['date_registered'] == null
          ? null
          : DateTime.parse(json['date_registered'] as String),
      json['provinsi_id'] as int?,
      json['provinsi_str'] as String?,
      json['provinsi_url'] as String?,
      (json['provinsi_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['provinsi_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kabupaten_id'] as int?,
      json['kabupaten_str'] as String?,
      json['kabupaten_url'] as String?,
      (json['kabupaten_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kabupaten_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['website'] as String?,
      (json['online_hours'] as num?)?.toDouble(),
      json['online_hours_str'] as String?,
      json['projects_completed'] as int?,
      json['projects_completed_str'] as String?,
      json['current_projects'] as int?,
      json['current_projects_str'] as String?,
      json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String),
      json['worker_rating'] as int?,
      (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      json['worker_point'] as int?,
      json['worker_point_str'] as String?,
      json['worker_ranking'] as int?,
      json['worker_ranking_str'] as String?,
      json['owner_rating'] as int?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
      json['owner_point'] as int?,
      json['owner_point_str'] as String?,
      json['owner_ranking'] as int?,
      json['owner_ranking_str'] as String?,
     json['projects_owned'] as int?,
      json['projects_owned_str'] as String?,
      json['seller_rating'] as int?,
      (json['seller_rating_num'] as num?)?.toDouble(),
      json['seller_rating_num_str'] as String?,
      json['seller_point'] as int?,
      json['seller_point_str'] as String?,
      json['seller_ranking'] as int?,
      json['seller_ranking_str'] as String?,
      json['product_sold'] as int?,
      json['product_sold_str'] as String?,
      json['affiliate_rating'] as int?,
      (json['affiliate_rating_num'] as num?)?.toDouble(),
      json['affiliate_rating_num_str'] as String?,
      json['affiliate_point'] as int?,
      json['affiliate_point_str'] as String?,
      json['affiliate_ranking'] as int?,
      json['affiliate_ranking_str'] as String?,
      json['refered_users'] as int?,
      json['refered_users_str'] as String?,
      json['work_quality'] as int?,
      json['expertise'] as int?,
      json['worker_communication'] as int?,
      json['worker_professionalism'] as int?,
      json['clarity'] as int?,
      json['friendliness'] as int?,


      json['owner_communication'] as int?,
      json['owner_professionalism'] as int?,
      json['projects_won'] as int?,
      json['projects_won_str'] as String?,
      (json['projects_won_cumulative'] as num?)?.toDouble(),
      json['projects_won_cumulative_str'] as String?,
      (json['projects_owned_cumulative'] as num?)?.toDouble(),
      json['projects_owned_cumulative_str'] as String?,
      json['projects_noaction'] as int?,
      json['projects_noaction_str'] as String?,
      json['projects_canceled'] as int?,
      json['projects_canceled_str'] as String?,
      json['missed_payment'] as int?,
      json['missed_payment_str'] as String?,
      json['projects_arbitrated'] as int?,
      json['projects_arbitrated_str'] as String?,
      json['projects_arbit_won'] as int?,
      json['projects_arbit_won_str'] as String?,
      json['projects_arbit_lost'] as int?,
      json['projects_arbit_lost_str'] as String?,
      json['missed_weekly_report'] as int?,
      json['missed_weekly_report_str'] as String?,
      (json['product_sold_cumulative'] as num?)?.toDouble(),
      json['product_sold_cumulative_str'] as String?,
      json['product_bought'] as int?,
      json['product_bought_str'] as String?,
      (json['product_bought_cumulative'] as num?)?.toDouble(),
      json['product_bought_cumulative_str'] as String?,
      json['bid_count'] as int?,
      json['bid_count_str'] as String?,
      json['post_count'] as int?,
      json['post_count_str'] as String?,
      (json['completion_rate'] as num?)?.toDouble(),
      (json['arbitration_rate'] as num?)?.toDouble(),




      json['services'] == null
          ? null
          : ServicesListingTools.fromJson(
              json['services'] as Map<String, dynamic>),
      json['products'] == null
          ? null
          : ProductsListingTools.fromJson(
              json['products'] as Map<String, dynamic>),


      json['portofolio'] == null
          ? null
          : PortofolioListingTools.fromJson(
              json['portofolio'] as Map<String, dynamic>),



      json['as_project_worker'] == null
          ? null
          : AsProjectWorkerListingTools.fromJson(
              json['as_project_worker'] as Map<String, dynamic>),





      json['as_project_owner'] == null
          ? null
          : AsProjectOwnerListingTools.fromJson(
              json['as_project_owner'] as Map<String, dynamic>),

      json['user_arbitrations'] == null
          ? null
          : UserArbitrationsListingTools.fromJson(
              json['user_arbitrations'] as Map<String, dynamic>),






      json['user_id'] as String?





    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelBrowseUsersRevToJson(
        ViewModelBrowseUsersRev instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'self_introduction': instance.self_introduction,
      'skills_id': instance.skills_id,
      'skills_str': instance.skills_str,
      'skills_url': instance.skills_url,
      'photo_url': instance.photo_url,
      'photo': instance.photo,
      'display_name': instance.display_name,
      'user_name': instance.user_name,
      'account_type_id': instance.account_type_id,
      'account_type_str': instance.account_type_str,
      'account_type_list': instance.account_type_list,
      'account_type_list_str': instance.account_type_list_str,
      'date_registered': instance.date_registered?.toIso8601String(),
      'provinsi_id': instance.provinsi_id,
      'provinsi_str': instance.provinsi_str,
      'provinsi_url': instance.provinsi_url,
      'provinsi_list': instance.provinsi_list,
      'provinsi_list_str': instance.provinsi_list_str,
      'kabupaten_id': instance.kabupaten_id,
      'kabupaten_str': instance.kabupaten_str,
      'kabupaten_url': instance.kabupaten_url,
      'kabupaten_list': instance.kabupaten_list,
      'kabupaten_list_str': instance.kabupaten_list_str,
      'website': instance.website,
      'online_hours': instance.online_hours,
      'online_hours_str': instance.online_hours_str,
      'projects_completed': instance.projects_completed,
      'projects_completed_str': instance.projects_completed_str,
      'current_projects': instance.current_projects,
      'current_projects_str': instance.current_projects_str,
      'last_seen': instance.last_seen?.toIso8601String(),
      'worker_rating': instance.worker_rating,
      'worker_rating_num': instance.worker_rating_num,
      'worker_rating_num_str': instance.worker_rating_num_str,
      'worker_point': instance.worker_point,
      'worker_point_str': instance.worker_point_str,
      'worker_ranking': instance.worker_ranking,
      'worker_ranking_str': instance.worker_ranking_str,
      'owner_rating': instance.owner_rating,
      'owner_rating_num': instance.owner_rating_num,
      'owner_rating_num_str': instance.owner_rating_num_str,
      'owner_point': instance.owner_point,
      'owner_point_str': instance.owner_point_str,
      'owner_ranking': instance.owner_ranking,
      'owner_ranking_str': instance.owner_ranking_str,
      'projects_owned': instance.projects_owned,
      'projects_owned_str': instance.projects_owned_str,
      'seller_rating': instance.seller_rating,
      'seller_rating_num': instance.seller_rating_num,
      'seller_rating_num_str': instance.seller_rating_num_str,
      'seller_point': instance.seller_point,
      'seller_point_str': instance.seller_point_str,
      'seller_ranking': instance.seller_ranking,
      'seller_ranking_str': instance.seller_ranking_str,
      'product_sold': instance.product_sold,
      'product_sold_str': instance.product_sold_str,
      'affiliate_rating': instance.affiliate_rating,
      'affiliate_rating_num': instance.affiliate_rating_num,
      'affiliate_rating_num_str': instance.affiliate_rating_num_str,
      'affiliate_point': instance.affiliate_point,
      'affiliate_point_str': instance.affiliate_point_str,
      'affiliate_ranking': instance.affiliate_ranking,
      'affiliate_ranking_str': instance.affiliate_ranking_str,
      'refered_users': instance.refered_users,
      'refered_users_str': instance.refered_users_str,
      'work_quality': instance.work_quality,
      'expertise': instance.expertise,
      'worker_communication': instance.worker_communication,
      'worker_professionalism': instance.worker_professionalism,
      'clarity': instance.clarity,
      'friendliness': instance.friendliness,

      'owner_communication': instance.owner_communication,
      'owner_professionalism': instance.owner_professionalism,
      'projects_won': instance.projects_won,
      'projects_won_str': instance.projects_won_str,
      'projects_won_cumulative': instance.projects_won_cumulative,
      'projects_won_cumulative_str': instance.projects_won_cumulative_str,
      'projects_owned_cumulative': instance.projects_owned_cumulative,
      'projects_owned_cumulative_str': instance.projects_owned_cumulative_str,
      'projects_noaction': instance.projects_noaction,
      'projects_noaction_str': instance.projects_noaction_str,
      'projects_canceled': instance.projects_canceled,
      'projects_canceled_str': instance.projects_canceled_str,
      'missed_payment': instance.missed_payment,
      'missed_payment_str': instance.missed_payment_str,
      'projects_arbitrated': instance.projects_arbitrated,
      'projects_arbitrated_str': instance.projects_arbitrated_str,
      'projects_arbit_won': instance.projects_arbit_won,
      'projects_arbit_won_str': instance.projects_arbit_won_str,
      'projects_arbit_lost': instance.projects_arbit_lost,
      'projects_arbit_lost_str': instance.projects_arbit_lost_str,
      'missed_weekly_report': instance.missed_weekly_report,
      'missed_weekly_report_str': instance.missed_weekly_report_str,
      'product_sold_cumulative': instance.product_sold_cumulative,
      'product_sold_cumulative_str': instance.product_sold_cumulative_str,
      'product_bought': instance.product_bought,
      'product_bought_str': instance.product_bought_str,
      'product_bought_cumulative': instance.product_bought_cumulative,
      'product_bought_cumulative_str': instance.product_bought_cumulative_str,
      'bid_count': instance.bid_count,
      'bid_count_str': instance.bid_count_str,
      'post_count': instance.post_count,
      'post_count_str': instance.post_count_str,
      'completion_rate': instance.completion_rate,
      'arbitration_rate': instance.arbitration_rate,


      'services': instance.services,
      'products': instance.products,


      'portofolio': instance.portofolio,


      'as_project_worker': instance.as_project_worker,

      'as_project_owner': instance.as_project_owner,


      'user_arbitrations': instance.user_arbitrations,


      'user_id': instance.user_id,


    };

BrowseUsersViewSuperBaseRev _$BrowseUsersViewSuperBaseRevFromJson(
        Map<String, dynamic> json) =>
    BrowseUsersViewSuperBaseRev(
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
          : ViewModelBrowseUsersRev.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseUsersViewSuperBaseRevToJson(
        BrowseUsersViewSuperBaseRev instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };
