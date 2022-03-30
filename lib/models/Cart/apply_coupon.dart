  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataApplyCoupon(String triger, var model
   ){
  
   String action =   'ApplyCoupon';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[coupon]": "${model.model.coupon }"});
 


    return( formData);
  } 	
	
