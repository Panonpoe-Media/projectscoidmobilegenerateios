  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataCancelArbitration(String triger, var model
   ){
  
   String action =   'CancelArbitration';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"project[_trigger_]":"$tgr"};
  formData.addAll({"project[extend_deadline_days]": "${model.model.extend_deadline_days }"});
  formData.addAll({"project[your_wishes]": "${model.model.your_wishes }"});
 


    return( formData);
  } 	
	
