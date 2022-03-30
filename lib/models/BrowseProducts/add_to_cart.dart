  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataAddToCart(String triger, var model
   ){
  
   String action =   'AddToCart';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"product[_trigger_]":"$tgr"};
 


    return( formData);
  } 	
	
