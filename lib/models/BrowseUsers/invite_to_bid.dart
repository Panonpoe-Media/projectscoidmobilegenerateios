  import 'package:intl/intl.dart';
  /** AUTOGENERATE OFF **/
  
  Map<String, dynamic> convertFormDataInviteToBid(String triger, var model
   ){
  
   String action =   'InviteToBid';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[invitation_message]": "${model.model.invitation_message }"});
  formData.addAll({"files": ""});
  print(" ini projects_id ${model.model.projects[0].project_id}");
 // formData.addAll({"projects[]:": "${model.model.projects[0].project_id }"});

  // int count = 0;
   for(var pid in model.model.projects){
     formData.addAll({"projects[]": "${pid.project_id }"});
    // count++;
   }


    return( formData);
  } 	
	
