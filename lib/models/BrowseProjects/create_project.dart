  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataCreateProject(String triger, var model
            ,var attachmentslast   
            ,var attach_filelast   
   ){
  
   String action =   'CreateProject';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachments = '';
  String attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
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
  formData.addAll({"project[owner_id]": "${model.model.owner_id }"});
  formData.addAll({"project[category_id]": "${model.model.category_id }"});
  formData.addAll({"project[title]": "${model.model.title }"});
  formData.addAll({"project[description]": "${model.model.description }"});
  formData.addAll({"project[short_description]": "${model.model.short_description }"});
  formData.addAll({"project[attachments]": '$attachments'});
  formData.addAll({"project[attachments_lastval]": '$attachments_last'});
  formData.addAll({"project[finish_days]": "${model.model.finish_days }"});
  formData.addAll({"project[search_text]": "${model.model.search_text }"});
  formData.addAll({"project[last_bump]": "${model.model.last_bump == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}"});
  formData.addAll({"project[select_deadline]": "${model.model.select_deadline == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.select_deadline)}"});
  formData.addAll({"project[start_date]": "${model.model.start_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.start_date)}"});
  formData.addAll({"project[finish_deadline]": "${model.model.finish_deadline == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_deadline)}"});
  formData.addAll({"project[finish_date]": "${model.model.finish_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_date)}"});
  formData.addAll({"project[closed_date]": "${model.model.closed_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.closed_date)}"});
  formData.addAll({"project[bid_count]": "${model.model.bid_count }"});
  formData.addAll({"project[progress]": "${model.model.progress }"});
   formData.addAll({"project[project_status_id]": "${model.model.project_status_id }"});
   formData.addAll({"project[project_ending_id]": "${model.model.project_ending_id }"});
   formData.addAll({"project[project_type_id]": "${model.model.project_type_id }"});
   formData.addAll({"project[project_class_id]": "${model.model.project_class_id }"});
  formData.addAll({"project[published_budget]": "${model.model.published_budget }"});
  formData.addAll({"project[budget_range_min]": "${model.model.budget_range_min }"});
  formData.addAll({"project[budget_range_max]": "${model.model.budget_range_max }"});
  formData.addAll({"project[fee_percent]": "${model.model.fee_percent }"});
  formData.addAll({"project[service_id]": "${model.model.service_id }"});
  formData.addAll({"project[private_worker_id]": "${model.model.private_worker_id }"});
  formData.addAll({"project[invited_users]": "${model.model.invited_users }"});
  formData.addAll({"project[accepted_bid_id]": "${model.model.accepted_bid_id }"});
  formData.addAll({"project[accepted_worker_id]": "${model.model.accepted_worker_id }"});
  formData.addAll({"project[accepted_budget]": "${model.model.accepted_budget }"});
  formData.addAll({"project[accepted_work_id]": "${model.model.accepted_work_id }"});
  formData.addAll({"project[accepted_date]": "${model.model.accepted_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.accepted_date)}"});
  formData.addAll({"project[available_budget]": "${model.model.available_budget }"});
  formData.addAll({"project[need_weekly_report]": "${model.model.need_weekly_report ? 1 : 0}"});
  formData.addAll({"project[weekly_report_needed]": "${model.model.weekly_report_needed ? 1 : 0}"});
  formData.addAll({"project[weekly_report_posted]": "${model.model.weekly_report_posted ? 1 : 0}"});
  formData.addAll({"project[deadline_passed_sent]": "${model.model.deadline_passed_sent ? 1 : 0}"});
  formData.addAll({"project[deadline_approaching_sent]": "${model.model.deadline_approaching_sent ? 1 : 0}"});
  formData.addAll({"project[work_quality]": "${model.model.work_quality }"});
  formData.addAll({"project[expertise]": "${model.model.expertise }"});
  formData.addAll({"project[worker_communication]": "${model.model.worker_communication }"});
  formData.addAll({"project[worker_professionalism]": "${model.model.worker_professionalism }"});
  formData.addAll({"project[worker_rating]": "${model.model.worker_rating }"});
  formData.addAll({"project[worker_rating_num]": "${model.model.worker_rating_num }"});
  formData.addAll({"project[worker_feedback]": "${model.model.worker_feedback }"});
  formData.addAll({"project[clarity]": "${model.model.clarity }"});
  formData.addAll({"project[friendliness]": "${model.model.friendliness }"});
  formData.addAll({"project[owner_communication]": "${model.model.owner_communication }"});
  formData.addAll({"project[owner_professionalism]": "${model.model.owner_professionalism }"});
  formData.addAll({"project[owner_rating]": "${model.model.owner_rating }"});
  formData.addAll({"project[owner_rating_num]": "${model.model.owner_rating_num }"});
  formData.addAll({"project[owner_feedback]": "${model.model.owner_feedback }"});
  formData.addAll({"project[owner_signature_ip]": "${model.model.owner_signature_ip }"});
  formData.addAll({"project[owner_signature_date]": "${model.model.owner_signature_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.owner_signature_date)}"});
  formData.addAll({"project[worker_signature_ip]": "${model.model.worker_signature_ip }"});
  formData.addAll({"project[worker_signature_date]": "${model.model.worker_signature_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.worker_signature_date)}"});
  formData.addAll({"project[owner_escrow_id]": "${model.model.owner_escrow_id }"});
  formData.addAll({"project[worker_credit_id]": "${model.model.worker_credit_id }"});
  formData.addAll({"project[arbitration_id]": "${model.model.arbitration_id }"});
  formData.addAll({"project[owner_credit_id]": "${model.model.owner_credit_id }"});
  formData.addAll({"project[registered_by_id]": "${model.model.registered_by_id }"});
  formData.addAll({"project[registered_date]": "${model.model.registered_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}"});
  formData.addAll({"project[registered_from_ip]": "${model.model.registered_from_ip }"});
  formData.addAll({"project[canceled_by_id]": "${model.model.canceled_by_id }"});
  formData.addAll({"project[canceled_date]": "${model.model.canceled_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.canceled_date)}"});
  formData.addAll({"project[canceled_from_ip]": "${model.model.canceled_from_ip }"});
  formData.addAll({"project[published_by_id]": "${model.model.published_by_id }"});
  formData.addAll({"project[published_date]": "${model.model.published_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}"});
  formData.addAll({"project[published_from_ip]": "${model.model.published_from_ip }"});
  formData.addAll({"project[rejected_by_id]": "${model.model.rejected_by_id }"});
  formData.addAll({"project[rejected_date]": "${model.model.rejected_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}"});
  formData.addAll({"project[rejected_from_ip]": "${model.model.rejected_from_ip }"});
  formData.addAll({"project[admin_note]": "${model.model.admin_note }"});
  formData.addAll({"project[announced]": "${model.model.announced ? 1 : 0}"});
  formData.addAll({"project[your_wishes]": "${model.model.your_wishes }"});
  formData.addAll({"project[extend_deadline_days]": "${model.model.extend_deadline_days }"});
  formData.addAll({"project[testimony]": "${model.model.testimony }"});
  formData.addAll({"project[pick_user_name]": "${model.model.pick_user_name }"});
  formData.addAll({"project[enter_email_address]": "${model.model.enter_email_address }"});
  formData.addAll({"project[handphone]": "${model.model.handphone }"});
  formData.addAll({"project[broadcast_message]": "${model.model.broadcast_message }"});
  formData.addAll({"project[attach_file]": '$attach_file'});
  formData.addAll({"project[attach_file_lastval]": '$attach_file_last'});
  formData.addAll({"project[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder ? 1 : 0}"});
  formData.addAll({"project[is_system_message]": "${model.model.is_system_message ? 1 : 0}"});
  formData.addAll({"project[admin_notes]": "${model.model.admin_notes }"});
 
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
