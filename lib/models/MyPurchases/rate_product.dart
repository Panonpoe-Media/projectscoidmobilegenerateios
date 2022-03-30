  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataRateProduct(String triger, var model
   ){
  
   String action =   'RateProduct';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"order_item[_trigger_]":"$tgr"};
  formData.addAll({"order_item[rating]": "${model.model.rating }"});
  formData.addAll({"order_item[testimony]": "${model.model.testimony }"});
 


    return( formData);
  } 	
	
