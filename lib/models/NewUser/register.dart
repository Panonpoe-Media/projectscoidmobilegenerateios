  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataRegister(String triger, var model
   ){
  
   String action =   'Register';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[email]": "${model.model.email }"});
  formData.addAll({"user[user_name]": "${model.model.user_name }"});
  formData.addAll({"user[captcha]": "${model.model.captcha }"});
 


    return( formData);
  } 	
	
