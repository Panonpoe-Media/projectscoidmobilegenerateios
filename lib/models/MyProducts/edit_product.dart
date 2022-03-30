  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataEditProduct(String triger, var model
            ,var logolast 
            ,var deliverablelast   
            ,var trial_versionlast   
   ){
  
   String action =   'EditProduct';
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
	String deliverable = '';
  String deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String trial_version = '';
  String trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"product[_trigger_]":"$tgr"};
  formData.addAll({"product[logo]": '$logo'});
  formData.addAll({"product[logo_lastval]": '$logo_last'});
  formData.addAll({"product[title]": "${model.model.title }"});
  formData.addAll({"product[description]": "${model.model.description }"});
  formData.addAll({"product[deliverable]": '$deliverable'});
  formData.addAll({"product[deliverable_lastval]": '$deliverable_last'});
  formData.addAll({"product[trial_version]": '$trial_version'});
  formData.addAll({"product[trial_version_lastval]": '$trial_version_last'});
  formData.addAll({"product[price]": "${model.model.price }"});
 
      int count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
