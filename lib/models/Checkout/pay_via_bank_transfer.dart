  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPayViaBankTransfer(String triger, var model
   ){
  
   String action =   'PayViaBankTransfer';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
 


    return( formData);
  } 	
	
