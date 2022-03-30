  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataRateOwner(String triger, var model
   ){
  
   String action =   'RateOwner';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"project[_trigger_]":"$tgr"};
  formData.addAll({"project[clarity]": "${model.model.clarity }"});
  formData.addAll({"project[friendliness]": "${model.model.friendliness }"});
  formData.addAll({"project[owner_communication]": "${model.model.owner_communication }"});
  formData.addAll({"project[owner_professionalism]": "${model.model.owner_professionalism }"});
  formData.addAll({"project[owner_feedback]": "${model.model.owner_feedback }"});
  formData.addAll({"project[testimony]": "${model.model.testimony }"});
 


    return( formData);
  } 	
	
