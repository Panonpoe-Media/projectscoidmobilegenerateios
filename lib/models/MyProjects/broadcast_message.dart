  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataBroadcastMessage(String triger, var model
            ,var attach_filelast   
   ){
  
   String action =   'BroadcastMessage';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attach_file = '';
  String attach_file_last = '';
   if(isEdit && attach_filelast != null){
         attach_file_last = '[{"name":"${ attach_filelast.name}","size":${ attach_filelast.size.toString()},"created":${ attach_filelast.created.toString()},"modified":${ attach_filelast.modified.toString()},"temp":"${ attach_filelast.temp}","remote":"","dir":"${ attach_filelast.dir}"}]';

       }
	if (model.model.attach_file!= null) {
		if (model.model.attach_file[0].temp != '') {
			attach_file = '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size},"created":${model.model.attach_file[0].date},"modified":${model.model.attach_file[0].date},"temp":"${model.model.attach_file[0].temp}","remote":"${model.model.attach_file[0].remote}","dir":"${model.model.attach_file[0].dir}"}]';
	     
  	}
	}
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"project[_trigger_]":"$tgr"};
  formData.addAll({"project[broadcast_message]": "${model.model.broadcast_message }"});
  formData.addAll({"project[attach_file]": '$attach_file'});
  formData.addAll({"project[attach_file_lastval]": '$attach_file_last'});
  formData.addAll({"project[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder ? 1 : 0}"});
 


    return( formData);
  } 	
	
