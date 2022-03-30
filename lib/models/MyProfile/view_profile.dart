  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataViewProfile(String triger, var model
            ,var scan_ktplast 
            ,var scan_siuplast 
            ,var photolast 
   ){
  
   String action =   'ViewProfile';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String scan_ktp = '';
  String scan_ktp_last = '';
  if(isEdit && scan_ktplast != null){
      scan_ktp_last = '{"name":"${ scan_ktplast.name}","dir":"${ scan_ktplast.dir}","file":"${ scan_ktplast.file}","thumb":"${ scan_ktplast.thumb}"}';
   
  }
	if (model.model.scan_ktp!= null) {
		 if (model.model.scan_ktp.temp != '' && model.model.scan_ktp.temp != null) {
		   scan_ktp = '{"status":"1","name":"${model.model.scan_ktp.name}","temp":"${model.model.scan_ktp.temp}"}';
      		
     }
	 }
	String scan_siup = '';
  String scan_siup_last = '';
  if(isEdit && scan_siuplast != null){
      scan_siup_last = '{"name":"${ scan_siuplast.name}","dir":"${ scan_siuplast.dir}","file":"${ scan_siuplast.file}","thumb":"${ scan_siuplast.thumb}"}';
   
  }
	if (model.model.scan_siup!= null) {
		 if (model.model.scan_siup.temp != '' && model.model.scan_siup.temp != null) {
		   scan_siup = '{"status":"1","name":"${model.model.scan_siup.name}","temp":"${model.model.scan_siup.temp}"}';
      		
     }
	 }
	String photo = '';
  String photo_last = '';
  if(isEdit && photolast != null){
      photo_last = '{"name":"${ photolast.name}","dir":"${ photolast.dir}","file":"${ photolast.file}","thumb":"${ photolast.thumb}"}';
   
  }
	if (model.model.photo!= null) {
		 if (model.model.photo.temp != '' && model.model.photo.temp != null) {
		   photo = '{"status":"1","name":"${model.model.photo.name}","temp":"${model.model.photo.temp}"}';
      		
     }
	 }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[user_name]": "${model.model.user_name }"});
  formData.addAll({"user[group_id]": "${model.model.group_id }"});
  formData.addAll({"user[email]": "${model.model.email }"});
  formData.addAll({"user[password]": "${model.model.password }"});
  formData.addAll({"user[auth]": "${model.model.auth }"});
   formData.addAll({"user[account_status_id]": "${model.model.account_status_id }"});
   formData.addAll({"user[account_type_id]": "${model.model.account_type_id }"});
  formData.addAll({"user[date_registered]": "${model.model.date_registered == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date_registered)}"});
  formData.addAll({"user[last_login]": "${model.model.last_login == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_login)}"});
  formData.addAll({"user[last_seen]": "${model.model.last_seen == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_seen)}"});
  formData.addAll({"user[online]": "${model.model.online ? 1 : 0}"});
  formData.addAll({"user[last_online_mark]": "${model.model.last_online_mark == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_online_mark)}"});
  formData.addAll({"user[online_hours]": "${model.model.online_hours }"});
  formData.addAll({"user[nomor_ktp]": "${model.model.nomor_ktp }"});
  formData.addAll({"user[scan_ktp]": '$scan_ktp'});
  formData.addAll({"user[scan_ktp_lastval]": '$scan_ktp_last'});
  formData.addAll({"user[nomor_siup]": "${model.model.nomor_siup }"});
  formData.addAll({"user[scan_siup]": '$scan_siup'});
  formData.addAll({"user[scan_siup_lastval]": '$scan_siup_last'});
  formData.addAll({"user[npwp]": "${model.model.npwp }"});
   formData.addAll({"user[status_marital_id]": "${model.model.status_marital_id }"});
  formData.addAll({"user[jumlah_tanggungan]": "${model.model.jumlah_tanggungan }"});
  formData.addAll({"user[photo]": '$photo'});
  formData.addAll({"user[photo_lastval]": '$photo_last'});
  formData.addAll({"user[display_name]": "${model.model.display_name }"});
  formData.addAll({"user[birth_date]": "${model.model.birth_date == null? '':DateFormat('dd/MM/yyyy').format(model.model.birth_date)}"});
  formData.addAll({"user[birth_code]": "${model.model.birth_code }"});
   formData.addAll({"user[jenis_kelamin_id]": "${model.model.jenis_kelamin_id }"});
  formData.addAll({"user[address]": "${model.model.address }"});
  formData.addAll({"user[country_id]": "${model.model.country_id }"});
  formData.addAll({"user[provinsi_id]": "${model.model.provinsi_id }"});
  formData.addAll({"user[kabupaten_id]": "${model.model.kabupaten_id }"});
  formData.addAll({"user[kecamatan_id]": "${model.model.kecamatan_id }"});
  formData.addAll({"user[kelurahan_id]": "${model.model.kelurahan_id }"});
  formData.addAll({"user[post_code]": "${model.model.post_code }"});
  formData.addAll({"user[handphone]": "${model.model.handphone }"});
  formData.addAll({"user[self_introduction]": "${model.model.self_introduction }"});
  formData.addAll({"user[website]": "${model.model.website }"});
  formData.addAll({"user[language_id]": "${model.model.language_id }"});
  formData.addAll({"user[full_name]": "${model.model.full_name }"});
  formData.addAll({"user[captcha]": "${model.model.captcha }"});
  formData.addAll({"user[secure_code]": "${model.model.secure_code }"});
  formData.addAll({"user[old_password]": "${model.model.old_password }"});
  formData.addAll({"user[new_email]": "${model.model.new_email }"});
  formData.addAll({"user[your_email]": "${model.model.your_email }"});
  formData.addAll({"user[invitation_message]": "${model.model.invitation_message }"});
  formData.addAll({"user[bank_id]": "${model.model.bank_id }"});
  formData.addAll({"user[branch]": "${model.model.branch }"});
  formData.addAll({"user[city]": "${model.model.city }"});
  formData.addAll({"user[account_number]": "${model.model.account_number }"});
  formData.addAll({"user[account_name]": "${model.model.account_name }"});
   formData.addAll({"user[cutoff_period_id]": "${model.model.cutoff_period_id }"});
  formData.addAll({"user[cutoff_amount]": "${model.model.cutoff_amount }"});
  formData.addAll({"user[deposit_amount]": "${model.model.deposit_amount }"});
  formData.addAll({"user[money_earned]": "${model.model.money_earned }"});
  formData.addAll({"user[money_spent]": "${model.model.money_spent }"});
  formData.addAll({"user[available_balance]": "${model.model.available_balance }"});
  formData.addAll({"user[withheld_balance]": "${model.model.withheld_balance }"});
  formData.addAll({"user[admin_notes]": "${model.model.admin_notes }"});
  formData.addAll({"user[pesta_point]": "${model.model.pesta_point }"});
  formData.addAll({"user[worker_rating]": "${model.model.worker_rating }"});
  formData.addAll({"user[worker_ranking]": "${model.model.worker_ranking }"});
  formData.addAll({"user[worker_point]": "${model.model.worker_point }"});
  formData.addAll({"user[worker_rating_num]": "${model.model.worker_rating_num }"});
  formData.addAll({"user[worker_rating_sum]": "${model.model.worker_rating_sum }"});
  formData.addAll({"user[worker_rating_div]": "${model.model.worker_rating_div }"});
  formData.addAll({"user[owner_rating]": "${model.model.owner_rating }"});
  formData.addAll({"user[owner_ranking]": "${model.model.owner_ranking }"});
  formData.addAll({"user[owner_point]": "${model.model.owner_point }"});
  formData.addAll({"user[owner_rating_num]": "${model.model.owner_rating_num }"});
  formData.addAll({"user[owner_rating_sum]": "${model.model.owner_rating_sum }"});
  formData.addAll({"user[owner_rating_div]": "${model.model.owner_rating_div }"});
  formData.addAll({"user[seller_rating]": "${model.model.seller_rating }"});
  formData.addAll({"user[seller_ranking]": "${model.model.seller_ranking }"});
  formData.addAll({"user[seller_point]": "${model.model.seller_point }"});
  formData.addAll({"user[seller_rating_num]": "${model.model.seller_rating_num }"});
  formData.addAll({"user[seller_rating_sum]": "${model.model.seller_rating_sum }"});
  formData.addAll({"user[seller_rating_div]": "${model.model.seller_rating_div }"});
  formData.addAll({"user[buyer_rating]": "${model.model.buyer_rating }"});
  formData.addAll({"user[buyer_ranking]": "${model.model.buyer_ranking }"});
  formData.addAll({"user[buyer_point]": "${model.model.buyer_point }"});
  formData.addAll({"user[buyer_rating_num]": "${model.model.buyer_rating_num }"});
  formData.addAll({"user[buyer_rating_sum]": "${model.model.buyer_rating_sum }"});
  formData.addAll({"user[buyer_rating_div]": "${model.model.buyer_rating_div }"});
  formData.addAll({"user[affiliate_rating]": "${model.model.affiliate_rating }"});
  formData.addAll({"user[affiliate_ranking]": "${model.model.affiliate_ranking }"});
  formData.addAll({"user[affiliate_point]": "${model.model.affiliate_point }"});
  formData.addAll({"user[affiliate_rating_num]": "${model.model.affiliate_rating_num }"});
  formData.addAll({"user[affiliate_rating_sum]": "${model.model.affiliate_rating_sum }"});
  formData.addAll({"user[affiliate_rating_div]": "${model.model.affiliate_rating_div }"});
  formData.addAll({"user[projects_won]": "${model.model.projects_won }"});
  formData.addAll({"user[projects_won_cumulative]": "${model.model.projects_won_cumulative }"});
  formData.addAll({"user[projects_owned]": "${model.model.projects_owned }"});
  formData.addAll({"user[projects_owned_cumulative]": "${model.model.projects_owned_cumulative }"});
  formData.addAll({"user[projects_noaction]": "${model.model.projects_noaction }"});
  formData.addAll({"user[projects_canceled]": "${model.model.projects_canceled }"});
  formData.addAll({"user[missed_payment]": "${model.model.missed_payment }"});
  formData.addAll({"user[projects_completed]": "${model.model.projects_completed }"});
  formData.addAll({"user[projects_arbitrated]": "${model.model.projects_arbitrated }"});
  formData.addAll({"user[projects_arbit_won]": "${model.model.projects_arbit_won }"});
  formData.addAll({"user[projects_arbit_lost]": "${model.model.projects_arbit_lost }"});
  formData.addAll({"user[current_projects]": "${model.model.current_projects }"});
  formData.addAll({"user[missed_weekly_report]": "${model.model.missed_weekly_report }"});
  formData.addAll({"user[product_sold]": "${model.model.product_sold }"});
  formData.addAll({"user[product_sold_cumulative]": "${model.model.product_sold_cumulative }"});
  formData.addAll({"user[product_bought]": "${model.model.product_bought }"});
  formData.addAll({"user[product_bought_cumulative]": "${model.model.product_bought_cumulative }"});
  formData.addAll({"user[bid_count]": "${model.model.bid_count }"});
  formData.addAll({"user[post_count]": "${model.model.post_count }"});
  formData.addAll({"user[work_quality]": "${model.model.work_quality }"});
  formData.addAll({"user[work_quality_num]": "${model.model.work_quality_num }"});
  formData.addAll({"user[work_quality_sum]": "${model.model.work_quality_sum }"});
  formData.addAll({"user[work_quality_div]": "${model.model.work_quality_div }"});
  formData.addAll({"user[expertise]": "${model.model.expertise }"});
  formData.addAll({"user[expertise_num]": "${model.model.expertise_num }"});
  formData.addAll({"user[expertise_sum]": "${model.model.expertise_sum }"});
  formData.addAll({"user[expertise_div]": "${model.model.expertise_div }"});
  formData.addAll({"user[worker_communication]": "${model.model.worker_communication }"});
  formData.addAll({"user[worker_communication_num]": "${model.model.worker_communication_num }"});
  formData.addAll({"user[worker_communication_sum]": "${model.model.worker_communication_sum }"});
  formData.addAll({"user[worker_communication_div]": "${model.model.worker_communication_div }"});
  formData.addAll({"user[worker_professionalism]": "${model.model.worker_professionalism }"});
  formData.addAll({"user[worker_professionalism_num]": "${model.model.worker_professionalism_num }"});
  formData.addAll({"user[worker_professionalism_sum]": "${model.model.worker_professionalism_sum }"});
  formData.addAll({"user[worker_professionalism_div]": "${model.model.worker_professionalism_div }"});
  formData.addAll({"user[clarity]": "${model.model.clarity }"});
  formData.addAll({"user[clarity_num]": "${model.model.clarity_num }"});
  formData.addAll({"user[clarity_sum]": "${model.model.clarity_sum }"});
  formData.addAll({"user[clarity_div]": "${model.model.clarity_div }"});
  formData.addAll({"user[friendliness]": "${model.model.friendliness }"});
  formData.addAll({"user[friendliness_num]": "${model.model.friendliness_num }"});
  formData.addAll({"user[friendliness_sum]": "${model.model.friendliness_sum }"});
  formData.addAll({"user[friendliness_div]": "${model.model.friendliness_div }"});
  formData.addAll({"user[owner_communication]": "${model.model.owner_communication }"});
  formData.addAll({"user[owner_communication_num]": "${model.model.owner_communication_num }"});
  formData.addAll({"user[owner_communication_sum]": "${model.model.owner_communication_sum }"});
  formData.addAll({"user[owner_communication_div]": "${model.model.owner_communication_div }"});
  formData.addAll({"user[owner_professionalism]": "${model.model.owner_professionalism }"});
  formData.addAll({"user[owner_professionalism_num]": "${model.model.owner_professionalism_num }"});
  formData.addAll({"user[owner_professionalism_sum]": "${model.model.owner_professionalism_sum }"});
  formData.addAll({"user[owner_professionalism_div]": "${model.model.owner_professionalism_div }"});
  formData.addAll({"user[product_quality]": "${model.model.product_quality }"});
  formData.addAll({"user[product_quality_num]": "${model.model.product_quality_num }"});
  formData.addAll({"user[product_quality_sum]": "${model.model.product_quality_sum }"});
  formData.addAll({"user[product_quality_div]": "${model.model.product_quality_div }"});
  formData.addAll({"user[service_quality]": "${model.model.service_quality }"});
  formData.addAll({"user[service_quality_num]": "${model.model.service_quality_num }"});
  formData.addAll({"user[service_quality_sum]": "${model.model.service_quality_sum }"});
  formData.addAll({"user[service_quality_div]": "${model.model.service_quality_div }"});
  formData.addAll({"user[seller_communication]": "${model.model.seller_communication }"});
  formData.addAll({"user[seller_communication_num]": "${model.model.seller_communication_num }"});
  formData.addAll({"user[seller_communication_sum]": "${model.model.seller_communication_sum }"});
  formData.addAll({"user[seller_communication_div]": "${model.model.seller_communication_div }"});
  formData.addAll({"user[seller_professionalism]": "${model.model.seller_professionalism }"});
  formData.addAll({"user[seller_professionalism_num]": "${model.model.seller_professionalism_num }"});
  formData.addAll({"user[seller_professionalism_sum]": "${model.model.seller_professionalism_sum }"});
  formData.addAll({"user[seller_professionalism_div]": "${model.model.seller_professionalism_div }"});
  formData.addAll({"user[referer_id]": "${model.model.referer_id }"});
  formData.addAll({"user[referer_expires]": "${model.model.referer_expires == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.referer_expires)}"});
  formData.addAll({"user[referal_this_month]": "${model.model.referal_this_month }"});
  formData.addAll({"user[cookies_this_month]": "${model.model.cookies_this_month }"});
  formData.addAll({"user[premium_affiliate]": "${model.model.premium_affiliate ? 1 : 0}"});
  formData.addAll({"user[refered_users]": "${model.model.refered_users }"});
  formData.addAll({"user[referal_earnings]": "${model.model.referal_earnings }"});
  formData.addAll({"user[affiliate_id]": "${model.model.affiliate_id }"});
  formData.addAll({"user[last_announced_project]": "${model.model.last_announced_project }"});
  formData.addAll({"user[notif_count]": "${model.model.notif_count }"});
  formData.addAll({"user[notify_projects]": "${model.model.notify_projects ? 1 : 0}"});
  formData.addAll({"user[lost_arbitration_recently]": "${model.model.lost_arbitration_recently ? 1 : 0}"});
  formData.addAll({"user[coupon]": "${model.model.coupon }"});
 
      int count = 0;
      for(var tag in model.model.skills_id){
        formData.addAll({"user[skills][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
