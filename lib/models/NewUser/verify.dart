  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataVerify(String triger, var model
   ){
  
   String action =   'Verify';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[handphone]": "${model.model.handphone }"});
 


    return( formData);
  } 	
	
