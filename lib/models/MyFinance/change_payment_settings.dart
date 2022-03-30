  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataChangePaymentSettings(String triger, var model
   ){
  
   String action =   'ChangePaymentSettings';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[bank_id]": "${model.model.bank_id }"});
  formData.addAll({"user[branch]": "${model.model.branch }"});
  formData.addAll({"user[city]": "${model.model.city }"});
  formData.addAll({"user[account_number]": "${model.model.account_number }"});
  formData.addAll({"user[account_name]": "${model.model.account_name }"});
   formData.addAll({"user[cutoff_period_id]": "${model.model.cutoff_period_id }"});
  formData.addAll({"user[cutoff_amount]": "${model.model.cutoff_amount }"});
  formData.addAll({"user[npwp]": "${model.model.npwp }"});
   formData.addAll({"user[status_marital_id]": "${model.model.status_marital_id }"});
  formData.addAll({"user[jumlah_tanggungan]": "${model.model.jumlah_tanggungan }"});
  formData.addAll({"user[secure_code]": "${model.model.secure_code }"});
 


    return( formData);
  } 	
	
