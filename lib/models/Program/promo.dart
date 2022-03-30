  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPromo(String triger, var model
   ){
  
   String action =   'Promo';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[last_seen]": "${model.model.last_seen == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_seen)}"});
 


    return( formData);
  } 	
	
