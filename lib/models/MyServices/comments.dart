  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataComments(String triger, var model
            ,var attachmentslast   
   ){
  
   String action =   'Comments';
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
      var formData = {"service_post[_trigger_]":"$tgr"};
  formData.addAll({"service_post[user_id]": "${model.model.user_id }"});
  formData.addAll({"service_post[service_id]": "${model.model.service_id }"});
  formData.addAll({"service_post[thread_id]": "${model.model.thread_id }"});
   formData.addAll({"service_post[post_type_id]": "${model.model.post_type_id }"});
  formData.addAll({"service_post[post_date]": "${model.model.post_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.post_date)}"});
  formData.addAll({"service_post[message]": "${model.model.message }"});
  formData.addAll({"service_post[attachments]": '$attachments'});
  formData.addAll({"service_post[attachments_lastval]": '$attachments_last'});
  formData.addAll({"service_post[read_by_seller]": "${model.model.read_by_seller ? 1 : 0}"});
  formData.addAll({"service_post[read_by_buyer]": "${model.model.read_by_buyer ? 1 : 0}"});
  formData.addAll({"service_post[captcha]": "${model.model.captcha }"});
 


    return( formData);
  } 	
	
