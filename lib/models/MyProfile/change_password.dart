  import 'package:intl/intl.dart';
  /** AUTOGENERATE OFF **/
  
  Map<String, dynamic> convertFormDataChangePassword(String triger, var model
   ){
  
   String action =   'ChangePassword';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[old_password]": "${model.model.old_password }"});
   formData.addAll({"user[old_password_confirmation]": "${model.model.old_password_confirmation }"});
  formData.addAll({"user[password]": "${model.model.password }"});
   formData.addAll({"user[password_confirmation]": "${model.model.password_confirmation }"});

   /*
   user[old_password]: Jagadata2
    user[old_password_confirmation]: Jagadata2
    user[password]: Jagadata1
    user[password_confirmation]: Jagadata1

    */


    return( formData);
  } 	
	
