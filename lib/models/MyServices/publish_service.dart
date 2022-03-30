  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataPublishService(String triger, var model
            ,var logolast 
   ){
  
   String action =   'PublishService';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String logo = '';
  String logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != '' && model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
  	String options = '';
	if(model.model.options!= null){
	  for(var obj in model.model.options){
	    options = options + '{"description":"${obj.description}","price":"${obj.price.toString()}"},';
    }
	  options = '[${ options.substring(0, options.length - 1)}]';
  }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"service[_trigger_]":"$tgr"};
 
  int count1 = 1;
      String ro = '';
   for(var obj in model.model.options){
     formData.addAll({"service__options_tbl_description_${count1.toString()}": "${obj.description}"});
     formData.addAll({"service__options_tbl_price_${count1.toString()}": "${obj.price.toString()}"});

     if(count1 == 1){
       ro = '1';
     }else{
       ro = ro + ',${count1.toString()}';
     }
     count1++;

   }
   formData.addAll({"service__options_tbl_rowOrder":"$ro"});

      int count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"service[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
