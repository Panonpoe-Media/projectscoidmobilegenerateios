  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataRemove(String triger, var model
   ){
  
   String action =   'Remove';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"buddy[_trigger_]":"$tgr"};
  formData.addAll({"buddy[user_id]": "${model.model.user_id }"});
  formData.addAll({"buddy[fav_id]": "${model.model.fav_id }"});
 


    return( formData);
  } 	
	
