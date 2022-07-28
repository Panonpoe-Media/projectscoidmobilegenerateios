  import 'package:intl/intl.dart';

  /** AUTOGENERATE OFF **/
  Map<String, dynamic> convertFormDataFileArbitration(String triger, var model
   ){
  
   String action =   'FileArbitration';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"arbitration[_trigger_]":"$tgr"};
  formData.addAll({"arbitration[problem_description]": "${model.model.problem_description }"});
  formData.addAll({"arbitration[your_wishes]": "${model.model.your_wishes }"});
  if(model.model.worker_receives.toInt() == 0 && model.model.owner_receives.toInt() == 0){
    formData.addAll({"arbitration[worker_receives]": 0.toString() });
    formData.addAll({"arbitration[owner_receives]": 0.toString() });
  } else{
    formData.addAll({"arbitration[worker_receives]": "${model.model.worker_receives}" });
    formData.addAll({"arbitration[owner_receives]": "${model.model.owner_receives}" });
  }


  print('${model.model.worker_receives.toString()}    ${model.model.owner_receives.toString()}');

    return( formData);
  } 	
	
