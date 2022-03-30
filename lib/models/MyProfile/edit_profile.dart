  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataEditProfile(String triger, var model
            ,var photolast 
   ){
  
   String action =   'EditProfile';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String photo = '';
  String photo_last = '';
  if(isEdit && photolast != null){
      photo_last = '{"name":"${ photolast.name}","dir":"${ photolast.dir}","file":"${ photolast.file}","thumb":"${ photolast.thumb}"}';
   
  }
	if (model.model.photo!= null) {
		 if (model.model.photo.temp != '' && model.model.photo.temp != null) {
		   photo = '{"status":"1","name":"${model.model.photo.name}","temp":"${model.model.photo.temp}"}';
      		
     }
	 }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"user[_trigger_]":"$tgr"};
  formData.addAll({"user[photo]": '$photo'});
  formData.addAll({"user[photo_lastval]": '$photo_last'});
  formData.addAll({"user[display_name]": "${model.model.display_name }"});
  formData.addAll({"user[birth_date]": "${model.model.birth_date == null? '':DateFormat('dd/MM/yyyy').format(model.model.birth_date)}"});
   formData.addAll({"user[jenis_kelamin_id]": "${model.model.jenis_kelamin_id }"});
  formData.addAll({"user[address]": "${model.model.address }"});
  formData.addAll({"user[country_id]": "${model.model.country_id }"});
  formData.addAll({"user[provinsi_id]": "${model.model.provinsi_id }"});
  formData.addAll({"user[kabupaten_id]": "${model.model.kabupaten_id }"});
  formData.addAll({"user[kecamatan_id]": "${model.model.kecamatan_id }"});
  formData.addAll({"user[kelurahan_id]": "${model.model.kelurahan_id }"});
  formData.addAll({"user[post_code]": "${model.model.post_code }"});
  formData.addAll({"user[self_introduction]": "${model.model.self_introduction }"});
  formData.addAll({"user[website]": "${model.model.website }"});
  formData.addAll({"user[language_id]": "${model.model.language_id }"});
  formData.addAll({"user[notify_projects]": "${model.model.notify_projects ? 1 : 0}"});
 
      int count = 0;
      for(var tag in model.model.skills_id){
        formData.addAll({"user[skills][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
