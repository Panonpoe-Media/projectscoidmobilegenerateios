  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataNewOffer(String triger, var model
   ){
  
   String action =   'NewOffer';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"arbitration[_trigger_]":"$tgr"};
  formData.addAll({"arbitration[worker_receives]": "${model.model.worker_receives }"});
  formData.addAll({"arbitration[owner_receives]": "${model.model.owner_receives }"});
 


    return( formData);
  } 	
	
