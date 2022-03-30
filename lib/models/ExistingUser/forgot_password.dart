  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataForgotPassword(String triger, var model
   ){
  
   String action =   'ForgotPassword';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[your_email]": "${model.model.your_email }"});
  formData.addAll({"user[captcha]": "${model.model.captcha }"});
 


    return( formData);
  } 	
	
