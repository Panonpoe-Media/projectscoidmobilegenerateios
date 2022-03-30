  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataChangeHandphone(String triger, var model
   ){
  
   String action =   'ChangeHandphone';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[handphone]": "${model.model.handphone }"});
  formData.addAll({"user[secure_code]": "${model.model.secure_code }"});
 


    return( formData);
  } 	
	
