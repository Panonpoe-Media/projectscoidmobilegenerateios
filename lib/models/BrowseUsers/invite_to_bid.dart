  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataInviteToBid(String triger, var model
   ){
  
   String action =   'InviteToBid';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[invitation_message]": "${model.model.invitation_message }"});
 


    return( formData);
  } 	
	
