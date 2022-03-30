  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPlaceOrder(String triger, var model
   ){
  
   String action =   'PlaceOrder';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"service[_trigger_]":"$tgr"};
  formData.addAll({"service[special_requirements]": "${model.model.special_requirements }"});
 


    return( formData);
  } 	
	
