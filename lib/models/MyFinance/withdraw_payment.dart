  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataWithdrawPayment(String triger, var model
   ){
  
   String action =   'WithdrawPayment';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"payment[_trigger_]":"$tgr"};
  formData.addAll({"payment[amount]": "${model.model.amount }"});
 


    return( formData);
  } 	
	
