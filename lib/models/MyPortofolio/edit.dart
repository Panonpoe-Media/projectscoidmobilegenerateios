  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataEdit(String triger, var model
            ,var imagelast 
   ){
  
   String action =   'Edit';
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
      var formData = {"portofolio[_trigger_]":"$tgr"};
  formData.addAll({"portofolio[year]": "${model.model.year }"});
   formData.addAll({"portofolio[description]": "${model.model.description }"});
  formData.addAll({"portofolio[link]": "${model.model.link }"});
  formData.addAll({"portofolio[image]": '$image'});
  formData.addAll({"portofolio[image_lastval]": '$image_last'});
 


    return( formData);
  } 	
	
