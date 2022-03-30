  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataResetPassword(String triger, var model
   ){
  
   String action =   'ResetPassword';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[password]": "${model.model.password }"});
 


    return( formData);
  } 	
	
