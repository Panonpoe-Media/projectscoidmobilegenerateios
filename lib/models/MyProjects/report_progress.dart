  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataReportProgress(String triger, var model
   ){
  
   String action =   'ReportProgress';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"project[_trigger_]":"$tgr"};
  formData.addAll({"project[progress]": "${model.model.progress }"});
 


    return( formData);
  } 	
	
