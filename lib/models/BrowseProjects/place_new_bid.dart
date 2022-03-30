  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPlaceNewBid(String triger, var model
            ,var attachmentslast   
   ){
  
   String action =   'PlaceNewBid';
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
  formData.addAll({"bid[amount]": "${model.model.amount }"});
  formData.addAll({"bid[message]": "${model.model.message }"});
  formData.addAll({"bid[attachments]": '$attachments'});
  formData.addAll({"bid[attachments_lastval]": '$attachments_last'});
  formData.addAll({"bid[captcha]": "${model.model.captcha }"});
 


    return( formData);
  } 	
	
