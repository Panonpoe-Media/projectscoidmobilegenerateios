  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataFileArbitration(String triger, var model
   ){
  
   String action =   'FileArbitration';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"arbitration[_trigger_]":"$tgr"};
  formData.addAll({"arbitration[problem_description]": "${model.model.problem_description }"});
  formData.addAll({"arbitration[your_wishes]": "${model.model.your_wishes }"});
  formData.addAll({"arbitration[worker_receives]": "${model.model.worker_receives }"});
  formData.addAll({"arbitration[owner_receives]": "${model.model.owner_receives }"});
 


    return( formData);
  } 	
	
