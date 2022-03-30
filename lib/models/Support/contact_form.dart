  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataContactForm(String triger, var model
   ){
  
   String action =   'ContactForm';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"contact_form[_trigger_]":"$tgr"};
  formData.addAll({"contact_form[your_name]": "${model.model.your_name }"});
  formData.addAll({"contact_form[email_address]": "${model.model.email_address }"});
   formData.addAll({"contact_form[question]": "${model.model.question }"});
  formData.addAll({"contact_form[captcha]": "${model.model.captcha }"});
 


    return( formData);
  } 	
	
