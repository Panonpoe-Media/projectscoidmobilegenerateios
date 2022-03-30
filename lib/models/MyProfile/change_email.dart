  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataChangeEmail(String triger, var model
   ){
  
   String action =   'ChangeEmail';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[new_email]": "${model.model.new_email }"});
  formData.addAll({"user[secure_code]": "${model.model.secure_code }"});
 


    return( formData);
  } 	
	
