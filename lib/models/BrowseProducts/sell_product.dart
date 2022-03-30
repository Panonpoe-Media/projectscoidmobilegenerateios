  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataSellProduct(String triger, var model
            ,var logolast 
            ,var deliverablelast   
            ,var trial_versionlast   
   ){
  
   String action =   'SellProduct';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String logo = '';
  String logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != '' && model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String deliverable = '';
  String deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String trial_version = '';
  String trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"product[_trigger_]":"$tgr"};
  formData.addAll({"product[seller_id]": "${model.model.seller_id }"});
  formData.addAll({"product[logo]": '$logo'});
  formData.addAll({"product[logo_lastval]": '$logo_last'});
  formData.addAll({"product[category_id]": "${model.model.category_id }"});
  formData.addAll({"product[title]": "${model.model.title }"});
  formData.addAll({"product[description]": "${model.model.description }"});
  formData.addAll({"product[short_description]": "${model.model.short_description }"});
  formData.addAll({"product[deliverable]": '$deliverable'});
  formData.addAll({"product[deliverable_lastval]": '$deliverable_last'});
  formData.addAll({"product[trial_version]": '$trial_version'});
  formData.addAll({"product[trial_version_lastval]": '$trial_version_last'});
  formData.addAll({"product[price]": "${model.model.price }"});
   formData.addAll({"product[status_id]": "${model.model.status_id }"});
  formData.addAll({"product[registered_by_id]": "${model.model.registered_by_id }"});
  formData.addAll({"product[registered_date]": "${model.model.registered_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}"});
  formData.addAll({"product[registered_from_ip]": "${model.model.registered_from_ip }"});
  formData.addAll({"product[verified_by_id]": "${model.model.verified_by_id }"});
  formData.addAll({"product[verified_date]": "${model.model.verified_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.verified_date)}"});
  formData.addAll({"product[verified_from_ip]": "${model.model.verified_from_ip }"});
   formData.addAll({"product[verifier_note]": "${model.model.verifier_note }"});
  formData.addAll({"product[approved_by_id]": "${model.model.approved_by_id }"});
  formData.addAll({"product[approved_date]": "${model.model.approved_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.approved_date)}"});
  formData.addAll({"product[approved_from_ip]": "${model.model.approved_from_ip }"});
   formData.addAll({"product[approver_note]": "${model.model.approver_note }"});
  formData.addAll({"product[published_by_id]": "${model.model.published_by_id }"});
  formData.addAll({"product[published_date]": "${model.model.published_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}"});
  formData.addAll({"product[published_from_ip]": "${model.model.published_from_ip }"});
  formData.addAll({"product[rejected_by_id]": "${model.model.rejected_by_id }"});
  formData.addAll({"product[rejected_date]": "${model.model.rejected_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}"});
  formData.addAll({"product[rejected_from_ip]": "${model.model.rejected_from_ip }"});
  formData.addAll({"product[admin_note]": "${model.model.admin_note }"});
  formData.addAll({"product[last_bump]": "${model.model.last_bump == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}"});
  formData.addAll({"product[sales_count]": "${model.model.sales_count }"});
  formData.addAll({"product[sales_amount]": "${model.model.sales_amount }"});
  formData.addAll({"product[rating]": "${model.model.rating }"});
  formData.addAll({"product[points]": "${model.model.points }"});
  formData.addAll({"product[ranking]": "${model.model.ranking }"});
  formData.addAll({"product[rating_num]": "${model.model.rating_num }"});
  formData.addAll({"product[rating_sum]": "${model.model.rating_sum }"});
  formData.addAll({"product[rating_div]": "${model.model.rating_div }"});
 
      int count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
