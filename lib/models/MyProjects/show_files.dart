  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataShowFiles(String triger, var model
            ,var attachmentslast   
   ){
  
   String action =   'ShowFiles';
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
      var formData = {"post[_trigger_]":"$tgr"};
  formData.addAll({"post[user_id]": "${model.model.user_id }"});
  formData.addAll({"post[project_id]": "${model.model.project_id }"});
  formData.addAll({"post[thread_id]": "${model.model.thread_id }"});
   formData.addAll({"post[post_type_id]": "${model.model.post_type_id }"});
  formData.addAll({"post[post_date]": "${model.model.post_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.post_date)}"});
  formData.addAll({"post[bid_amount]": "${model.model.bid_amount }"});
  formData.addAll({"post[message]": "${model.model.message }"});
  formData.addAll({"post[attachments]": '$attachments'});
  formData.addAll({"post[attachments_lastval]": '$attachments_last'});
  formData.addAll({"post[read_by_owner]": "${model.model.read_by_owner ? 1 : 0}"});
  formData.addAll({"post[read_by_worker]": "${model.model.read_by_worker ? 1 : 0}"});
 


    return( formData);
  } 	
	
