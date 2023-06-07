  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataShowBids(String triger, var model
            ,var attachmentslast   
   ){
  
   String action =   'ShowBids';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachments = '';
  String attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"bid[_trigger_]":"$tgr"};
  formData.addAll({"bid[worker_id]": "${model.model.worker_id }"});
  formData.addAll({"bid[project_id]": "${model.model.project_id }"});
   formData.addAll({"bid[status_id]": "${model.model.status_id }"});
   formData.addAll({"bid[mark_id]": "${model.model.mark_id }"});
  formData.addAll({"bid[date]": "${model.model.date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}"});
  formData.addAll({"bid[location_id]": "${model.model.location_id }"});
  formData.addAll({"bid[rating]": "${model.model.rating }"});
  formData.addAll({"bid[matching_skills]": "${model.model.matching_skills }"});
  formData.addAll({"bid[amount]": "${model.model.amount }"});
  formData.addAll({"bid[message]": "${model.model.message }"});
  formData.addAll({"bid[attachments]": '$attachments'});
  formData.addAll({"bid[attachments_lastval]": '$attachments_last'});
  formData.addAll({"bid[read_by_owner]": "${model.model.read_by_owner ? 1 : 0}"});
  formData.addAll({"bid[shortlisted]": "${model.model.shortlisted ? 1 : 0}"});
  formData.addAll({"bid[captcha]": "${model.model.captcha }"});
  formData.addAll({"bid[project_title]": "${model.model.project_title }"});
  formData.addAll({"bid[project_owner]": "${model.model.project_owner }"});
  formData.addAll({"bid[description]": "${model.model.description }"});
  formData.addAll({"bid[published_budget]": "${model.model.published_budget }"});
  formData.addAll({"bid[budget_range_min]": "${model.model.budget_range_min }"});
  formData.addAll({"bid[budget_range_max]": "${model.model.budget_range_max }"});
 


    return( formData);
  } 	
	
