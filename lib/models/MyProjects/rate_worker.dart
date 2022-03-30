  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataRateWorker(String triger, var model
   ){
  
   String action =   'RateWorker';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"project[_trigger_]":"$tgr"};
  formData.addAll({"project[work_quality]": "${model.model.work_quality }"});
  formData.addAll({"project[expertise]": "${model.model.expertise }"});
  formData.addAll({"project[worker_communication]": "${model.model.worker_communication }"});
  formData.addAll({"project[worker_professionalism]": "${model.model.worker_professionalism }"});
  formData.addAll({"project[worker_feedback]": "${model.model.worker_feedback }"});
  formData.addAll({"project[testimony]": "${model.model.testimony }"});
 


    return( formData);
  } 	
	
