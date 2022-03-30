  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataScreenshots(String triger, var model
            ,var imagelast 
   ){
  
   String action =   'Screenshots';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String image = '';
  String image_last = '';
  if(isEdit && imagelast != null){
      image_last = '{"name":"${ imagelast.name}","dir":"${ imagelast.dir}","file":"${ imagelast.file}","thumb":"${ imagelast.thumb}"}';
   
  }
	if (model.model.image!= null) {
		 if (model.model.image.temp != '' && model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"}';
      		
     }
	 }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"service_images[_trigger_]":"$tgr"};
  formData.addAll({"service_images[service_id]": "${model.model.service_id }"});
   formData.addAll({"service_images[description]": "${model.model.description }"});
  formData.addAll({"service_images[image]": '$image'});
  formData.addAll({"service_images[image_lastval]": '$image_last'});
 


    return( formData);
  } 	
	
