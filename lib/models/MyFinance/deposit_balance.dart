  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataDepositBalance(String triger, var model
   ){
  
   String action =   'DepositBalance';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[deposit_amount]": "${model.model.deposit_amount }"});
 


    return( formData);
  } 	
	
