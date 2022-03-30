  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPayWithQris(String triger, var model
   ){
  
   String action =   'PayWithQris';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
 


    return( formData);
  } 	
	
