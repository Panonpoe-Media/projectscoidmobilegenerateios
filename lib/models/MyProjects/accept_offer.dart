  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataAcceptOffer(String triger, var model
   ){
  
   String action =   'AcceptOffer';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"arbitration[_trigger_]":"$tgr"};
 


    return( formData);
  } 	
	
