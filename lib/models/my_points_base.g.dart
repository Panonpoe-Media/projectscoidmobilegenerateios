// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_points_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelMyPoints _$ModelMyPointsFromJson(Map<String, dynamic> json) =>
    ModelMyPoints(
      json['id'] as String?,
      json['user_id'] as String?,
      json['group_id'] as int?,
      json['group_str'] as String?,
      (json['group_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['group_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['account_status_id'] as int?,
      json['account_status_str'] as String?,
      (json['account_status_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['account_status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['account_type_id'] as int?,
      json['account_type_str'] as String?,
      (json['account_type_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['account_type_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['online_hours'] as num?)?.toDouble(),
      json['online_hours_str'] as String?,
      json['scan_ktp'] == null
          ? null
          : Photo.fromJson(json['scan_ktp'] as Map<String, dynamic>),
      json['scan_ktp_url'] as String?,
      json['scan_siup'] == null
          ? null
          : Photo.fromJson(json['scan_siup'] as Map<String, dynamic>),
      json['scan_siup_url'] as String?,
      json['status_marital_id'] as int?,
      json['status_marital_str'] as String?,
      (json['status_marital_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['status_marital_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['jumlah_tanggungan'] as int?,
      json['jumlah_tanggungan_str'] as String?,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String?,
      json['jenis_kelamin_id'] as int?,
      json['jenis_kelamin_str'] as String?,
      (json['jenis_kelamin_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['jenis_kelamin_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['country_id'] as int?,
      json['country_str'] as String?,
      (json['country_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['country_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['provinsi_id'] as int?,
      json['provinsi_str'] as String?,
      (json['provinsi_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['provinsi_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kabupaten_id'] as int?,
      json['kabupaten_str'] as String?,
      (json['kabupaten_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kabupaten_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kecamatan_id'] as int?,
      json['kecamatan_str'] as String?,
      (json['kecamatan_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kecamatan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['kelurahan_id'] as int?,
      json['kelurahan_str'] as String?,
      (json['kelurahan_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['kelurahan_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['language_id'] as int?,
      json['language_str'] as String?,
      (json['language_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['language_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['skills_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['skills_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['skills_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['skills_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['skills_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['cutoff_period_id'] as int?,
      json['cutoff_period_str'] as String?,
      (json['cutoff_period_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['cutoff_period_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['cutoff_amount'] as num?)?.toDouble(),
      json['cutoff_amount_str'] as String?,
      (json['deposit_amount'] as num?)?.toDouble(),
      json['deposit_amount_str'] as String?,
      (json['money_earned'] as num?)?.toDouble(),
      json['money_earned_str'] as String?,
      (json['money_spent'] as num?)?.toDouble(),
      json['money_spent_str'] as String?,
      (json['available_balance'] as num?)?.toDouble(),
      json['available_balance_str'] as String?,
      (json['withheld_balance'] as num?)?.toDouble(),
      json['withheld_balance_str'] as String?,
      json['pesta_point'] as int?,
      json['pesta_point_str'] as String?,
      json['worker_ranking'] as int?,
      json['worker_ranking_str'] as String?,
      json['worker_point'] as int?,
      json['worker_point_str'] as String?,
      (json['worker_rating_num'] as num?)?.toDouble(),
      json['worker_rating_num_str'] as String?,
      json['worker_rating_sum'] as int?,
      json['worker_rating_sum_str'] as String?,
      json['worker_rating_div'] as int?,
      json['worker_rating_div_str'] as String?,
      json['owner_ranking'] as int?,
      json['owner_ranking_str'] as String?,
      json['owner_point'] as int?,
      json['owner_point_str'] as String?,
      (json['owner_rating_num'] as num?)?.toDouble(),
      json['owner_rating_num_str'] as String?,
      json['owner_rating_sum'] as int?,
      json['owner_rating_sum_str'] as String?,
      json['owner_rating_div'] as int?,
      json['owner_rating_div_str'] as String?,
      json['seller_ranking'] as int?,
      json['seller_ranking_str'] as String?,
      json['seller_point'] as int?,
      json['seller_point_str'] as String?,
      (json['seller_rating_num'] as num?)?.toDouble(),
      json['seller_rating_num_str'] as String?,
      json['seller_rating_sum'] as int?,
      json['seller_rating_sum_str'] as String?,
      json['seller_rating_div'] as int?,
      json['seller_rating_div_str'] as String?,
      json['buyer_ranking'] as int?,
      json['buyer_ranking_str'] as String?,
      json['buyer_point'] as int?,
      json['buyer_point_str'] as String?,
      (json['buyer_rating_num'] as num?)?.toDouble(),
      json['buyer_rating_num_str'] as String?,
      json['buyer_rating_sum'] as int?,
      json['buyer_rating_sum_str'] as String?,
      json['buyer_rating_div'] as int?,
      json['buyer_rating_div_str'] as String?,
      json['affiliate_ranking'] as int?,
      json['affiliate_ranking_str'] as String?,
      json['affiliate_point'] as int?,
      json['affiliate_point_str'] as String?,
      (json['affiliate_rating_num'] as num?)?.toDouble(),
      json['affiliate_rating_num_str'] as String?,
      json['affiliate_rating_sum'] as int?,
      json['affiliate_rating_sum_str'] as String?,
      json['affiliate_rating_div'] as int?,
      json['affiliate_rating_div_str'] as String?,
      json['projects_won'] as int?,
      json['projects_won_str'] as String?,
      (json['projects_won_cumulative'] as num?)?.toDouble(),
      json['projects_won_cumulative_str'] as String?,
      json['projects_owned'] as int?,
      json['projects_owned_str'] as String?,
      (json['projects_owned_cumulative'] as num?)?.toDouble(),
      json['projects_owned_cumulative_str'] as String?,
      json['projects_noaction'] as int?,
      json['projects_noaction_str'] as String?,
      json['projects_canceled'] as int?,
      json['projects_canceled_str'] as String?,
      json['missed_payment'] as int?,
      json['missed_payment_str'] as String?,
      json['projects_completed'] as int?,
      json['projects_completed_str'] as String?,
      json['projects_arbitrated'] as int?,
      json['projects_arbitrated_str'] as String?,
      json['projects_arbit_won'] as int?,
      json['projects_arbit_won_str'] as String?,
      json['projects_arbit_lost'] as int?,
      json['projects_arbit_lost_str'] as String?,
      json['current_projects'] as int?,
      json['current_projects_str'] as String?,
      json['missed_weekly_report'] as int?,
      json['missed_weekly_report_str'] as String?,
      json['product_sold'] as int?,
      json['product_sold_str'] as String?,
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
      (json['work_quality_num'] as num?)?.toDouble(),
      json['work_quality_num_str'] as String?,
      json['work_quality_sum'] as int?,
      json['work_quality_sum_str'] as String?,
      json['work_quality_div'] as int?,
      json['work_quality_div_str'] as String?,
      (json['expertise_num'] as num?)?.toDouble(),
      json['expertise_num_str'] as String?,
      json['expertise_sum'] as int?,
      json['expertise_sum_str'] as String?,
      json['expertise_div'] as int?,
      json['expertise_div_str'] as String?,
      (json['worker_communication_num'] as num?)?.toDouble(),
      json['worker_communication_num_str'] as String?,
      json['worker_communication_sum'] as int?,
      json['worker_communication_sum_str'] as String?,
      json['worker_communication_div'] as int?,
      json['worker_communication_div_str'] as String?,
      (json['worker_professionalism_num'] as num?)?.toDouble(),
      json['worker_professionalism_num_str'] as String?,
      json['worker_professionalism_sum'] as int?,
      json['worker_professionalism_sum_str'] as String?,
      json['worker_professionalism_div'] as int?,
      json['worker_professionalism_div_str'] as String?,
      (json['clarity_num'] as num?)?.toDouble(),
      json['clarity_num_str'] as String?,
      json['clarity_sum'] as int?,
      json['clarity_sum_str'] as String?,
      json['clarity_div'] as int?,
      json['clarity_div_str'] as String?,
      (json['friendliness_num'] as num?)?.toDouble(),
      json['friendliness_num_str'] as String?,
      json['friendliness_sum'] as int?,
      json['friendliness_sum_str'] as String?,
      json['friendliness_div'] as int?,
      json['friendliness_div_str'] as String?,
      (json['owner_communication_num'] as num?)?.toDouble(),
      json['owner_communication_num_str'] as String?,
      json['owner_communication_sum'] as int?,
      json['owner_communication_sum_str'] as String?,
      json['owner_communication_div'] as int?,
      json['owner_communication_div_str'] as String?,
      (json['owner_professionalism_num'] as num?)?.toDouble(),
      json['owner_professionalism_num_str'] as String?,
      json['owner_professionalism_sum'] as int?,
      json['owner_professionalism_sum_str'] as String?,
      json['owner_professionalism_div'] as int?,
      json['owner_professionalism_div_str'] as String?,
      (json['product_quality_num'] as num?)?.toDouble(),
      json['product_quality_num_str'] as String?,
      json['product_quality_sum'] as int?,
      json['product_quality_sum_str'] as String?,
      json['product_quality_div'] as int?,
      json['product_quality_div_str'] as String?,
      (json['service_quality_num'] as num?)?.toDouble(),
      json['service_quality_num_str'] as String?,
      json['service_quality_sum'] as int?,
      json['service_quality_sum_str'] as String?,
      json['service_quality_div'] as int?,
      json['service_quality_div_str'] as String?,
      (json['seller_communication_num'] as num?)?.toDouble(),
      json['seller_communication_num_str'] as String?,
      json['seller_communication_sum'] as int?,
      json['seller_communication_sum_str'] as String?,
      json['seller_communication_div'] as int?,
      json['seller_communication_div_str'] as String?,
      (json['seller_professionalism_num'] as num?)?.toDouble(),
      json['seller_professionalism_num_str'] as String?,
      json['seller_professionalism_sum'] as int?,
      json['seller_professionalism_sum_str'] as String?,
      json['seller_professionalism_div'] as int?,
      json['seller_professionalism_div_str'] as String?,
      json['referer_id'] as int?,
      json['referer_str'] as String?,
      (json['referer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['referer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['referal_this_month'] as int?,
      json['referal_this_month_str'] as String?,
      json['cookies_this_month'] as int?,
      json['cookies_this_month_str'] as String?,
      json['refered_users'] as int?,
      json['refered_users_str'] as String?,
      (json['referal_earnings'] as num?)?.toDouble(),
      json['referal_earnings_str'] as String?,
      json['last_announced_project'] as int?,
      json['last_announced_project_str'] as String?,
      json['notif_count'] as int?,
      json['notif_count_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..user_name = json['user_name'] as String?
      ..group_url = json['group_url'] as String?
      ..email = json['email'] as String?
      ..password = json['password'] as String?
      ..auth = json['auth'] as String?
      ..date_registered = json['date_registered'] == null
          ? null
          : DateTime.parse(json['date_registered'] as String)
      ..last_login = json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String)
      ..last_seen = json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String)
      ..online = json['online'] as bool?
      ..last_online_mark = json['last_online_mark'] == null
          ? null
          : DateTime.parse(json['last_online_mark'] as String)
      ..nomor_ktp = json['nomor_ktp'] as String?
      ..nomor_siup = json['nomor_siup'] as String?
      ..npwp = json['npwp'] as String?
      ..personal_data = json['personal_data'] as String?
      ..display_name = json['display_name'] as String?
      ..birth_date = json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String)
      ..birth_code = json['birth_code'] as String?
      ..address = json['address'] as String?
      ..country_url = json['country_url'] as String?
      ..provinsi_url = json['provinsi_url'] as String?
      ..kabupaten_url = json['kabupaten_url'] as String?
      ..kecamatan_url = json['kecamatan_url'] as String?
      ..kelurahan_url = json['kelurahan_url'] as String?
      ..post_code = json['post_code'] as String?
      ..handphone = json['handphone'] as String?
      ..self_introduction = json['self_introduction'] as String?
      ..website = json['website'] as String?
      ..language_url = json['language_url'] as String?
      ..full_name = json['full_name'] as String?
      ..captcha = json['captcha'] as String?
      ..secure_code = json['secure_code'] as String?
      ..old_password = json['old_password'] as String?
      ..new_email = json['new_email'] as String?
      ..your_email = json['your_email'] as String?
      ..invitation_message = json['invitation_message'] as String?
      ..financial_data = json['financial_data'] as String?
      ..bank_url = json['bank_url'] as String?
      ..branch = json['branch'] as String?
      ..city = json['city'] as String?
      ..account_number = json['account_number'] as String?
      ..account_name = json['account_name'] as String?
      ..statistics = json['statistics'] as String?
      ..admin_notes = json['admin_notes'] as String?
      ..worker_rating = json['worker_rating'] as int?
      ..owner_rating = json['owner_rating'] as int?
      ..seller_rating = json['seller_rating'] as int?
      ..buyer_rating = json['buyer_rating'] as int?
      ..affiliate_rating = json['affiliate_rating'] as int?
      ..work_quality = json['work_quality'] as int?
      ..expertise = json['expertise'] as int?
      ..worker_communication = json['worker_communication'] as int?
      ..worker_professionalism = json['worker_professionalism'] as int?
      ..clarity = json['clarity'] as int?
      ..friendliness = json['friendliness'] as int?
      ..owner_communication = json['owner_communication'] as int?
      ..owner_professionalism = json['owner_professionalism'] as int?
      ..product_quality = json['product_quality'] as int?
      ..service_quality = json['service_quality'] as int?
      ..seller_communication = json['seller_communication'] as int?
      ..seller_professionalism = json['seller_professionalism'] as int?
      ..referer_url = json['referer_url'] as String?
      ..referer_expires = json['referer_expires'] == null
          ? null
          : DateTime.parse(json['referer_expires'] as String)
      ..premium_affiliate = json['premium_affiliate'] as bool?
      ..affiliate_id = json['affiliate_id'] as int?
      ..affiliate_id_str = json['affiliate_id_str'] as String?
      ..notify_projects = json['notify_projects'] as bool?
      ..lost_arbitration_recently = json['lost_arbitration_recently'] as bool?
      ..coupon = json['coupon'] as String?;

Map<String, dynamic> _$ModelMyPointsToJson(ModelMyPoints instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'group_id': instance.group_id,
      'group_url': instance.group_url,
      'group_str': instance.group_str,
      'group_list': instance.group_list,
      'group_list_str': instance.group_list_str,
      'email': instance.email,
      'password': instance.password,
      'auth': instance.auth,
      'account_status_id': instance.account_status_id,
      'account_status_str': instance.account_status_str,
      'account_status_list': instance.account_status_list,
      'account_status_list_str': instance.account_status_list_str,
      'account_type_id': instance.account_type_id,
      'account_type_str': instance.account_type_str,
      'account_type_list': instance.account_type_list,
      'account_type_list_str': instance.account_type_list_str,
      'date_registered': instance.date_registered?.toIso8601String(),
      'last_login': instance.last_login?.toIso8601String(),
      'last_seen': instance.last_seen?.toIso8601String(),
      'online': instance.online,
      'last_online_mark': instance.last_online_mark?.toIso8601String(),
      'online_hours': instance.online_hours,
      'online_hours_str': instance.online_hours_str,
      'nomor_ktp': instance.nomor_ktp,
      'scan_ktp': instance.scan_ktp,
      'scan_ktp_url': instance.scan_ktp_url,
      'nomor_siup': instance.nomor_siup,
      'scan_siup': instance.scan_siup,
      'scan_siup_url': instance.scan_siup_url,
      'npwp': instance.npwp,
      'status_marital_id': instance.status_marital_id,
      'status_marital_str': instance.status_marital_str,
      'status_marital_list': instance.status_marital_list,
      'status_marital_list_str': instance.status_marital_list_str,
      'jumlah_tanggungan': instance.jumlah_tanggungan,
      'jumlah_tanggungan_str': instance.jumlah_tanggungan_str,
      'personal_data': instance.personal_data,
      'photo': instance.photo,
      'photo_url': instance.photo_url,
      'display_name': instance.display_name,
      'birth_date': instance.birth_date?.toIso8601String(),
      'birth_code': instance.birth_code,
      'jenis_kelamin_id': instance.jenis_kelamin_id,
      'jenis_kelamin_str': instance.jenis_kelamin_str,
      'jenis_kelamin_list': instance.jenis_kelamin_list,
      'jenis_kelamin_list_str': instance.jenis_kelamin_list_str,
      'address': instance.address,
      'country_id': instance.country_id,
      'country_url': instance.country_url,
      'country_str': instance.country_str,
      'country_list': instance.country_list,
      'country_list_str': instance.country_list_str,
      'provinsi_id': instance.provinsi_id,
      'provinsi_url': instance.provinsi_url,
      'provinsi_str': instance.provinsi_str,
      'provinsi_list': instance.provinsi_list,
      'provinsi_list_str': instance.provinsi_list_str,
      'kabupaten_id': instance.kabupaten_id,
      'kabupaten_url': instance.kabupaten_url,
      'kabupaten_str': instance.kabupaten_str,
      'kabupaten_list': instance.kabupaten_list,
      'kabupaten_list_str': instance.kabupaten_list_str,
      'kecamatan_id': instance.kecamatan_id,
      'kecamatan_url': instance.kecamatan_url,
      'kecamatan_str': instance.kecamatan_str,
      'kecamatan_list': instance.kecamatan_list,
      'kecamatan_list_str': instance.kecamatan_list_str,
      'kelurahan_id': instance.kelurahan_id,
      'kelurahan_url': instance.kelurahan_url,
      'kelurahan_str': instance.kelurahan_str,
      'kelurahan_list': instance.kelurahan_list,
      'kelurahan_list_str': instance.kelurahan_list_str,
      'post_code': instance.post_code,
      'handphone': instance.handphone,
      'self_introduction': instance.self_introduction,
      'website': instance.website,
      'language_id': instance.language_id,
      'language_url': instance.language_url,
      'language_str': instance.language_str,
      'language_list': instance.language_list,
      'language_list_str': instance.language_list_str,
      'skills_id': instance.skills_id,
      'skills_str': instance.skills_str,
      'skills_url': instance.skills_url,
      'skills_list': instance.skills_list,
      'skills_list_str': instance.skills_list_str,
      'full_name': instance.full_name,
      'captcha': instance.captcha,
      'secure_code': instance.secure_code,
      'old_password': instance.old_password,
      'new_email': instance.new_email,
      'your_email': instance.your_email,
      'invitation_message': instance.invitation_message,
      'financial_data': instance.financial_data,
      'bank_id': instance.bank_id,
      'bank_url': instance.bank_url,
      'bank_str': instance.bank_str,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'branch': instance.branch,
      'city': instance.city,
      'account_number': instance.account_number,
      'account_name': instance.account_name,
      'cutoff_period_id': instance.cutoff_period_id,
      'cutoff_period_str': instance.cutoff_period_str,
      'cutoff_period_list': instance.cutoff_period_list,
      'cutoff_period_list_str': instance.cutoff_period_list_str,
      'cutoff_amount': instance.cutoff_amount,
      'cutoff_amount_str': instance.cutoff_amount_str,
      'deposit_amount': instance.deposit_amount,
      'deposit_amount_str': instance.deposit_amount_str,
      'statistics': instance.statistics,
      'money_earned': instance.money_earned,
      'money_earned_str': instance.money_earned_str,
      'money_spent': instance.money_spent,
      'money_spent_str': instance.money_spent_str,
      'available_balance': instance.available_balance,
      'available_balance_str': instance.available_balance_str,
      'withheld_balance': instance.withheld_balance,
      'withheld_balance_str': instance.withheld_balance_str,
      'admin_notes': instance.admin_notes,
      'pesta_point': instance.pesta_point,
      'pesta_point_str': instance.pesta_point_str,
      'worker_rating': instance.worker_rating,
      'worker_ranking': instance.worker_ranking,
      'worker_ranking_str': instance.worker_ranking_str,
      'worker_point': instance.worker_point,
      'worker_point_str': instance.worker_point_str,
      'worker_rating_num': instance.worker_rating_num,
      'worker_rating_num_str': instance.worker_rating_num_str,
      'worker_rating_sum': instance.worker_rating_sum,
      'worker_rating_sum_str': instance.worker_rating_sum_str,
      'worker_rating_div': instance.worker_rating_div,
      'worker_rating_div_str': instance.worker_rating_div_str,
      'owner_rating': instance.owner_rating,
      'owner_ranking': instance.owner_ranking,
      'owner_ranking_str': instance.owner_ranking_str,
      'owner_point': instance.owner_point,
      'owner_point_str': instance.owner_point_str,
      'owner_rating_num': instance.owner_rating_num,
      'owner_rating_num_str': instance.owner_rating_num_str,
      'owner_rating_sum': instance.owner_rating_sum,
      'owner_rating_sum_str': instance.owner_rating_sum_str,
      'owner_rating_div': instance.owner_rating_div,
      'owner_rating_div_str': instance.owner_rating_div_str,
      'seller_rating': instance.seller_rating,
      'seller_ranking': instance.seller_ranking,
      'seller_ranking_str': instance.seller_ranking_str,
      'seller_point': instance.seller_point,
      'seller_point_str': instance.seller_point_str,
      'seller_rating_num': instance.seller_rating_num,
      'seller_rating_num_str': instance.seller_rating_num_str,
      'seller_rating_sum': instance.seller_rating_sum,
      'seller_rating_sum_str': instance.seller_rating_sum_str,
      'seller_rating_div': instance.seller_rating_div,
      'seller_rating_div_str': instance.seller_rating_div_str,
      'buyer_rating': instance.buyer_rating,
      'buyer_ranking': instance.buyer_ranking,
      'buyer_ranking_str': instance.buyer_ranking_str,
      'buyer_point': instance.buyer_point,
      'buyer_point_str': instance.buyer_point_str,
      'buyer_rating_num': instance.buyer_rating_num,
      'buyer_rating_num_str': instance.buyer_rating_num_str,
      'buyer_rating_sum': instance.buyer_rating_sum,
      'buyer_rating_sum_str': instance.buyer_rating_sum_str,
      'buyer_rating_div': instance.buyer_rating_div,
      'buyer_rating_div_str': instance.buyer_rating_div_str,
      'affiliate_rating': instance.affiliate_rating,
      'affiliate_ranking': instance.affiliate_ranking,
      'affiliate_ranking_str': instance.affiliate_ranking_str,
      'affiliate_point': instance.affiliate_point,
      'affiliate_point_str': instance.affiliate_point_str,
      'affiliate_rating_num': instance.affiliate_rating_num,
      'affiliate_rating_num_str': instance.affiliate_rating_num_str,
      'affiliate_rating_sum': instance.affiliate_rating_sum,
      'affiliate_rating_sum_str': instance.affiliate_rating_sum_str,
      'affiliate_rating_div': instance.affiliate_rating_div,
      'affiliate_rating_div_str': instance.affiliate_rating_div_str,
      'projects_won': instance.projects_won,
      'projects_won_str': instance.projects_won_str,
      'projects_won_cumulative': instance.projects_won_cumulative,
      'projects_won_cumulative_str': instance.projects_won_cumulative_str,
      'projects_owned': instance.projects_owned,
      'projects_owned_str': instance.projects_owned_str,
      'projects_owned_cumulative': instance.projects_owned_cumulative,
      'projects_owned_cumulative_str': instance.projects_owned_cumulative_str,
      'projects_noaction': instance.projects_noaction,
      'projects_noaction_str': instance.projects_noaction_str,
      'projects_canceled': instance.projects_canceled,
      'projects_canceled_str': instance.projects_canceled_str,
      'missed_payment': instance.missed_payment,
      'missed_payment_str': instance.missed_payment_str,
      'projects_completed': instance.projects_completed,
      'projects_completed_str': instance.projects_completed_str,
      'projects_arbitrated': instance.projects_arbitrated,
      'projects_arbitrated_str': instance.projects_arbitrated_str,
      'projects_arbit_won': instance.projects_arbit_won,
      'projects_arbit_won_str': instance.projects_arbit_won_str,
      'projects_arbit_lost': instance.projects_arbit_lost,
      'projects_arbit_lost_str': instance.projects_arbit_lost_str,
      'current_projects': instance.current_projects,
      'current_projects_str': instance.current_projects_str,
      'missed_weekly_report': instance.missed_weekly_report,
      'missed_weekly_report_str': instance.missed_weekly_report_str,
      'product_sold': instance.product_sold,
      'product_sold_str': instance.product_sold_str,
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
      'work_quality': instance.work_quality,
      'work_quality_num': instance.work_quality_num,
      'work_quality_num_str': instance.work_quality_num_str,
      'work_quality_sum': instance.work_quality_sum,
      'work_quality_sum_str': instance.work_quality_sum_str,
      'work_quality_div': instance.work_quality_div,
      'work_quality_div_str': instance.work_quality_div_str,
      'expertise': instance.expertise,
      'expertise_num': instance.expertise_num,
      'expertise_num_str': instance.expertise_num_str,
      'expertise_sum': instance.expertise_sum,
      'expertise_sum_str': instance.expertise_sum_str,
      'expertise_div': instance.expertise_div,
      'expertise_div_str': instance.expertise_div_str,
      'worker_communication': instance.worker_communication,
      'worker_communication_num': instance.worker_communication_num,
      'worker_communication_num_str': instance.worker_communication_num_str,
      'worker_communication_sum': instance.worker_communication_sum,
      'worker_communication_sum_str': instance.worker_communication_sum_str,
      'worker_communication_div': instance.worker_communication_div,
      'worker_communication_div_str': instance.worker_communication_div_str,
      'worker_professionalism': instance.worker_professionalism,
      'worker_professionalism_num': instance.worker_professionalism_num,
      'worker_professionalism_num_str': instance.worker_professionalism_num_str,
      'worker_professionalism_sum': instance.worker_professionalism_sum,
      'worker_professionalism_sum_str': instance.worker_professionalism_sum_str,
      'worker_professionalism_div': instance.worker_professionalism_div,
      'worker_professionalism_div_str': instance.worker_professionalism_div_str,
      'clarity': instance.clarity,
      'clarity_num': instance.clarity_num,
      'clarity_num_str': instance.clarity_num_str,
      'clarity_sum': instance.clarity_sum,
      'clarity_sum_str': instance.clarity_sum_str,
      'clarity_div': instance.clarity_div,
      'clarity_div_str': instance.clarity_div_str,
      'friendliness': instance.friendliness,
      'friendliness_num': instance.friendliness_num,
      'friendliness_num_str': instance.friendliness_num_str,
      'friendliness_sum': instance.friendliness_sum,
      'friendliness_sum_str': instance.friendliness_sum_str,
      'friendliness_div': instance.friendliness_div,
      'friendliness_div_str': instance.friendliness_div_str,
      'owner_communication': instance.owner_communication,
      'owner_communication_num': instance.owner_communication_num,
      'owner_communication_num_str': instance.owner_communication_num_str,
      'owner_communication_sum': instance.owner_communication_sum,
      'owner_communication_sum_str': instance.owner_communication_sum_str,
      'owner_communication_div': instance.owner_communication_div,
      'owner_communication_div_str': instance.owner_communication_div_str,
      'owner_professionalism': instance.owner_professionalism,
      'owner_professionalism_num': instance.owner_professionalism_num,
      'owner_professionalism_num_str': instance.owner_professionalism_num_str,
      'owner_professionalism_sum': instance.owner_professionalism_sum,
      'owner_professionalism_sum_str': instance.owner_professionalism_sum_str,
      'owner_professionalism_div': instance.owner_professionalism_div,
      'owner_professionalism_div_str': instance.owner_professionalism_div_str,
      'product_quality': instance.product_quality,
      'product_quality_num': instance.product_quality_num,
      'product_quality_num_str': instance.product_quality_num_str,
      'product_quality_sum': instance.product_quality_sum,
      'product_quality_sum_str': instance.product_quality_sum_str,
      'product_quality_div': instance.product_quality_div,
      'product_quality_div_str': instance.product_quality_div_str,
      'service_quality': instance.service_quality,
      'service_quality_num': instance.service_quality_num,
      'service_quality_num_str': instance.service_quality_num_str,
      'service_quality_sum': instance.service_quality_sum,
      'service_quality_sum_str': instance.service_quality_sum_str,
      'service_quality_div': instance.service_quality_div,
      'service_quality_div_str': instance.service_quality_div_str,
      'seller_communication': instance.seller_communication,
      'seller_communication_num': instance.seller_communication_num,
      'seller_communication_num_str': instance.seller_communication_num_str,
      'seller_communication_sum': instance.seller_communication_sum,
      'seller_communication_sum_str': instance.seller_communication_sum_str,
      'seller_communication_div': instance.seller_communication_div,
      'seller_communication_div_str': instance.seller_communication_div_str,
      'seller_professionalism': instance.seller_professionalism,
      'seller_professionalism_num': instance.seller_professionalism_num,
      'seller_professionalism_num_str': instance.seller_professionalism_num_str,
      'seller_professionalism_sum': instance.seller_professionalism_sum,
      'seller_professionalism_sum_str': instance.seller_professionalism_sum_str,
      'seller_professionalism_div': instance.seller_professionalism_div,
      'seller_professionalism_div_str': instance.seller_professionalism_div_str,
      'referer_id': instance.referer_id,
      'referer_url': instance.referer_url,
      'referer_str': instance.referer_str,
      'referer_list': instance.referer_list,
      'referer_list_str': instance.referer_list_str,
      'referer_expires': instance.referer_expires?.toIso8601String(),
      'referal_this_month': instance.referal_this_month,
      'referal_this_month_str': instance.referal_this_month_str,
      'cookies_this_month': instance.cookies_this_month,
      'cookies_this_month_str': instance.cookies_this_month_str,
      'premium_affiliate': instance.premium_affiliate,
      'refered_users': instance.refered_users,
      'refered_users_str': instance.refered_users_str,
      'referal_earnings': instance.referal_earnings,
      'referal_earnings_str': instance.referal_earnings_str,
      'affiliate_id': instance.affiliate_id,
      'affiliate_id_str': instance.affiliate_id_str,
      'last_announced_project': instance.last_announced_project,
      'last_announced_project_str': instance.last_announced_project_str,
      'notif_count': instance.notif_count,
      'notif_count_str': instance.notif_count_str,
      'notify_projects': instance.notify_projects,
      'lost_arbitration_recently': instance.lost_arbitration_recently,
      'coupon': instance.coupon,
    };

MyPointsSuperBase _$MyPointsSuperBaseFromJson(Map<String, dynamic> json) =>
    MyPointsSuperBase(
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
          : ModelMyPoints.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyPointsSuperBaseToJson(MyPointsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelMyPoints _$ViewModelMyPointsFromJson(Map<String, dynamic> json) =>
    ViewModelMyPoints(
      json['user_id'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyPointsToJson(ViewModelMyPoints instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
    };

MyPointsViewSuperBase _$MyPointsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyPointsViewSuperBase(
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
          : ViewModelMyPoints.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyPointsViewSuperBaseToJson(
        MyPointsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyPointsListingTools _$MyPointsListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyPointsListingTools(
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
              : ItemMyPoints.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyPointsListingToolsToJson(
        MyPointsListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
