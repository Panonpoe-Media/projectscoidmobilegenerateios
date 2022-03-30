  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataConfirmPayment(String triger, var model
            ,var attachmentlast 
   ){
  
   String action =   'ConfirmPayment';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachment = '';
  String attachment_last = '';
  if(isEdit && attachmentlast != null){
      attachment_last = '{"name":"${ attachmentlast.name}","dir":"${ attachmentlast.dir}","file":"${ attachmentlast.file}","thumb":"${ attachmentlast.thumb}"}';
   
  }
	if (model.model.attachment!= null) {
		 if (model.model.attachment.temp != '' && model.model.attachment.temp != null) {
		   attachment = '{"status":"1","name":"${model.model.attachment.name}","temp":"${model.model.attachment.temp}"}';
      		
     }
	 }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"payment[_trigger_]":"$tgr"};
  formData.addAll({"payment[our_account_id]": "${model.model.our_account_id }"});
  formData.addAll({"payment[bank_id]": "${model.model.bank_id }"});
  formData.addAll({"payment[account_no]": "${model.model.account_no }"});
  formData.addAll({"payment[account_name]": "${model.model.account_name }"});
  formData.addAll({"payment[transfer_date]": "${model.model.transfer_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.transfer_date)}"});
  formData.addAll({"payment[amount]": "${model.model.amount }"});
   formData.addAll({"payment[message]": "${model.model.message }"});
  formData.addAll({"payment[attachment]": '$attachment'});
  formData.addAll({"payment[attachment_lastval]": '$attachment_last'});
 


    return( formData);
  } 	
	
