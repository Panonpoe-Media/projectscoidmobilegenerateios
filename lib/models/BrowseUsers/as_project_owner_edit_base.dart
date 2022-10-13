
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
import '../option_fields.dart';
import '../image_fields.dart';
import '../file_fields.dart';
part 'as_project_owner_edit_base.g.dart';

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionAsProjectOwnerWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController as_project_owner,
 var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title,  var formData){
  var cl;
  var ic;
 //  final size =MediaQuery.of(context).size;
    double? width = 400; //size.width;
  if (button.color == 'green'){
    cl = Colors.green;
  }
  if (button.color == 'yellow'){
    cl = Colors.yellow;
  }
  if (button.color == 'blue'){
    cl = Colors.blue;
  }
  if (button.color == 'red'){
    cl = Colors.red;
  }
  if (button.color == 'orange'){
    cl = Colors.orange;
  }
  if (button.color == 'grey'){
    cl = Colors.grey;
  }
  if (button.color == 'black'){
    cl = Colors.black;
  }
  if (button.color == 'brown'){
    cl = Colors.brown;
  }
  if (button.icon == 'fa fa-briefcase'){
    ic = Icons.work;
  }
  if (button.icon == 'fa fa-plus'){
    ic = Icons.add;
  }
  if (button.icon == 'fa fa-list-alt'){
    ic = Icons.list;
  }

  if (button.icon == 'fa fa-credit-card'){
    ic = Icons.credit_card;
  }
  if (button.icon == 'fa fa-paypal'){
    ic = Icons.account_balance_wallet;
  }
  if (button.icon == 'fa fa-bank'){
    ic = Icons.account_balance;
  }
  if (button.icon == 'fa fa-dollar'){
    ic = Icons.attach_money;
  }
  if (button.icon == 'fa fa-user'){
    ic = Icons.person;
  }
  if (button.icon == 'fa fa-edit'){
    ic = Icons.edit;
  }
  if (button.icon == 'fa fa-picture-o'){
    ic = Icons.picture_in_picture;
  }
  if (button.icon == 'fa fa-asterisk'){
    ic = Icons.ac_unit;
  }
  if (button.icon == 'fa fa-envelope-o'){
    ic = Icons.local_post_office;
  }
  if (button.icon == 'fa fa-mobile'){
    ic = Icons.phone_iphone;
  }
      if (button.icon == 'fa fa-bullhorn'){
      ic = Icons.wifi_tethering;
    }

    if (button.icon == 'fa fa-arrow-circle-down'){
      ic = Icons.arrow_downward;
    }
    if (button.icon == 'fa fa-comment'){
      ic = Icons.comment;
    }
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
	  
  if(button.type == 'custom_filter'){
    return (
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
              style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.white)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  const Color(0xFF037f51),),
                                              ),

              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button.text,
                    initialitems: button.selections,
                    initvalue: button.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
							   Text(button.text!),
                             ],
                            ),
		       style: ButtonStyle(
                                                textStyle: button.color == 'green'?
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.white)):
												 MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.black))	,
                                                backgroundColor: button.color == 'green'? 
                                                MaterialStateProperty.all<Color>(
                                                  const Color(0xFF037f51),):
												  MaterialStateProperty.all<Color>(
                                                  Colors.white,) ,
												  shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
												  ),


             // shape: RoundedRectangleBorder(
               //   side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                //  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        as_project_owner =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = as_project_owner.sendData();
                        future.then((value) {
                        state.setState(() {
                        postAsProjectOwnerResult = value;
                        });
                        }).catchError((Error){
								       if(!Error.toString().contains('302')){
					                  _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					                    }
                      });
						;

                        } else {
						        _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
						}
                  }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild ButtonEditAsProjectOwnerWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController as_project_owner,
 var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title, var formData){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0),
                        onTap: ()=>{ showSearchSelectDialog(context: context,
                        caption:button.text,
                        initialitems: button.selections,
                        initvalue: button.selections![0])
                        //AppProvider.getRouter(context).navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        as_project_owner =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = as_project_owner.sendData();
                        future.then((value) {
                        state.setState(() {
                        postAsProjectOwnerResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelAsProjectOwner {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? project_id;
  int? accepted_worker_id;
  String? accepted_worker_url;
  String? accepted_worker_str;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  int? owner_id;
  String? owner_url;
  String? owner_str;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  int? category_id;
  String? category_url;
  String? category_str;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  String? description;
  String? short_description;
  String? attachments_name;
  List<FileField?>? attachments;
  int? finish_days;
  String? finish_days_str;
  String? search_text;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  List<int?>? channels_list;
  List<String?>? channels_list_str;

  DateTime? last_bump;
  DateTime? select_deadline;
  DateTime? start_date;
  DateTime? finish_deadline;
  DateTime? finish_date;
  DateTime? closed_date;
  int? bid_count;
  String? bid_count_str;
  int? progress;
  int? project_status_id;
  String? project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int? project_ending_id;
  String? project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  int? project_type_id;
  String? project_type_str;
  List<int?>? project_type_list;
  List<String?>? project_type_list_str;
  int? project_class_id;
  String? project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  double? published_budget;
  String? published_budget_str;
     String? budget_range;
  int? fee_percent;
  String? fee_percent_str;
  int? service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? private_worker_id;
  String? private_worker_url;
  String? private_worker_str;
  List<int?>? private_worker_list;
  List<String?>? private_worker_list_str;
  String? invited_users;
  int? accepted_bid_id;
  String? accepted_bid_url;
  String? accepted_bid_str;
  List<int?>? accepted_bid_list;
  List<String?>? accepted_bid_list_str;
  double? accepted_budget;
  String? accepted_budget_str;
  int? accepted_work_id;
  String? accepted_work_url;
  String? accepted_work_str;
  List<int?>? accepted_work_list;
  List<String?>? accepted_work_list_str;
  DateTime? accepted_date;
  double? available_budget;
  String? available_budget_str;
  bool? need_weekly_report;
  bool? weekly_report_needed;
  bool? weekly_report_posted;
  bool? deadline_passed_sent;
  bool? deadline_approaching_sent;
  String? rating_for_worker;
  int? work_quality;
  int? expertise;
  int? worker_communication;
  int? worker_professionalism;
  int? worker_rating;
  double? worker_rating_num;
  String? worker_rating_num_str;
  String? worker_feedback;
  String? rating_for_owner;
  int? clarity;
  int? friendliness;
  int? owner_communication;
  int? owner_professionalism;
  int? owner_rating;
  double? owner_rating_num;
  String? owner_rating_num_str;
  String? owner_feedback;
  String? owner_signature_ip;
  DateTime? owner_signature_date;
  String? worker_signature_ip;
  DateTime? worker_signature_date;
  int? owner_escrow_id;
  String? owner_escrow_url;
  String? owner_escrow_str;
  List<int?>? owner_escrow_list;
  List<String?>? owner_escrow_list_str;
  int? worker_credit_id;
  String? worker_credit_url;
  String? worker_credit_str;
  List<int?>? worker_credit_list;
  List<String?>? worker_credit_list_str;
  int? arbitration_id;
  String? arbitration_url;
  String? arbitration_str;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  int? owner_credit_id;
  String? owner_credit_url;
  String? owner_credit_str;
  List<int?>? owner_credit_list;
  List<String?>? owner_credit_list_str;
  int? registered_by_id;
  String? registered_by_url;
  String? registered_by_str;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime? registered_date;
  String? registered_from_ip;
  int? canceled_by_id;
  String? canceled_by_url;
  String? canceled_by_str;
  List<int?>? canceled_by_list;
  List<String?>? canceled_by_list_str;
  DateTime? canceled_date;
  String? canceled_from_ip;
  int? published_by_id;
  String? published_by_url;
  String? published_by_str;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime? published_date;
  String? published_from_ip;
  int? rejected_by_id;
  String? rejected_by_url;
  String? rejected_by_str;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime? rejected_date;
  String? rejected_from_ip;
  String? admin_note;
  bool? announced;
  String? your_wishes;
  int? extend_deadline_days;
  String? extend_deadline_days_str;
  String? testimony;
  String? pick_user_name;
  String? enter_email_address;
  String? handphone;
  String? broadcast_message;
  String? attach_file_name;
  List<FileField?>? attach_file;
  bool? automatic_send_to_new_bidder;
  bool? is_system_message;
  String? admin_notes;

	
	  EditModelAsProjectOwner(
            this.id,
            this.project_id,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.owner_id,
			this.owner_str,
			this.owner_list,
			this.owner_list_str,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.attachments,
			this.attachments_name,
			this.finish_days,
			this.finish_days_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,
			this.bid_count,
			this.bid_count_str,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.project_type_id,
			this.project_type_str,
			this.project_type_list,
			this.project_type_list_str,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
			this.published_budget,
			this.published_budget_str,
			this.fee_percent,
			this.fee_percent_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.private_worker_id,
			this.private_worker_str,
			this.private_worker_list,
			this.private_worker_list_str,
			this.accepted_bid_id,
			this.accepted_bid_str,
			this.accepted_bid_list,
			this.accepted_bid_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.accepted_work_id,
			this.accepted_work_str,
			this.accepted_work_list,
			this.accepted_work_list_str,
			this.available_budget,
			this.available_budget_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_escrow_id,
			this.owner_escrow_str,
			this.owner_escrow_list,
			this.owner_escrow_list_str,
			this.worker_credit_id,
			this.worker_credit_str,
			this.worker_credit_list,
			this.worker_credit_list_str,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_list,
			this.arbitration_list_str,
			this.owner_credit_id,
			this.owner_credit_str,
			this.owner_credit_list,
			this.owner_credit_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_list,
			this.registered_by_list_str,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.published_by_id,
			this.published_by_str,
			this.published_by_list,
			this.published_by_list_str,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.extend_deadline_days,
			this.extend_deadline_days_str,
			this.attach_file,
			this.attach_file_name,

  );
    factory EditModelAsProjectOwner.fromJson(Map<String, dynamic> json) => _$EditModelAsProjectOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelAsProjectOwnerToJson(this);

}



@JsonSerializable()

class AsProjectOwnerSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelAsProjectOwner? model;
  AsProjectOwnerSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory AsProjectOwnerSuperBase.fromJson(Map<String, dynamic> json) => _$AsProjectOwnerSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AsProjectOwnerSuperBaseToJson(this);
   
}




class EditAsProjectOwnerBase{
	var model;
	Map<String, dynamic> json;
	EditAsProjectOwnerBase(this.json){
		model = AsProjectOwnerSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "user_projects_owner[_trigger_]":"",
  "user_projects_owner[accepted_worker_id]": "${model.model.accepted_worker_id }",
  "user_projects_owner[owner_id]": "${model.model.owner_id }",
  "user_projects_owner[category_id]": "${model.model.category_id }",
  "user_projects_owner[title]": "${model.model.title }",
  "user_projects_owner[description]": "${model.model.description }",
  "user_projects_owner[short_description]": "${model.model.short_description }",
  "user_projects_owner[attachments]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "user_projects_owner[finish_days]": "${model.model.finish_days }",
  "user_projects_owner[search_text]": "${model.model.search_text }",
  "user_projects_owner[last_bump]": "${model.model.last_bump}",
  "user_projects_owner[select_deadline]": "${model.model.select_deadline}",
  "user_projects_owner[start_date]": "${model.model.start_date}",
  "user_projects_owner[finish_deadline]": "${model.model.finish_deadline}",
  "user_projects_owner[finish_date]": "${model.model.finish_date}",
  "user_projects_owner[closed_date]": "${model.model.closed_date}",
  "user_projects_owner[bid_count]": "${model.model.bid_count }",
  "user_projects_owner[progress]": "${model.model.progress }",
   "user_projects_owner[project_status_id]": "${model.model.project_status_id}",
   "user_projects_owner[project_ending_id]": "${model.model.project_ending_id}",
   "user_projects_owner[project_type_id]": "${model.model.project_type_id}",
   "user_projects_owner[project_class_id]": "${model.model.project_class_id}",
  "user_projects_owner[published_budget]": "${model.model.published_budget}",
  "user_projects_owner[fee_percent]": "${model.model.fee_percent }",
  "user_projects_owner[service_id]": "${model.model.service_id }",
  "user_projects_owner[private_worker_id]": "${model.model.private_worker_id }",
  "user_projects_owner[invited_users]": "${model.model.invited_users }",
  "user_projects_owner[accepted_bid_id]": "${model.model.accepted_bid_id }",
  "user_projects_owner[accepted_budget]": "${model.model.accepted_budget}",
  "user_projects_owner[accepted_work_id]": "${model.model.accepted_work_id }",
  "user_projects_owner[accepted_date]": "${model.model.accepted_date}",
  "user_projects_owner[available_budget]": "${model.model.available_budget}",
  "user_projects_owner[need_weekly_report]": "${model.model.need_weekly_report}",
  "user_projects_owner[weekly_report_needed]": "${model.model.weekly_report_needed}",
  "user_projects_owner[weekly_report_posted]": "${model.model.weekly_report_posted}",
  "user_projects_owner[deadline_passed_sent]": "${model.model.deadline_passed_sent}",
  "user_projects_owner[deadline_approaching_sent]": "${model.model.deadline_approaching_sent}",
  "user_projects_owner[rating_for_worker]": "${model.model.rating_for_worker }",
  "user_projects_owner[work_quality]": "${model.model.work_quality }",
  "user_projects_owner[expertise]": "${model.model.expertise }",
  "user_projects_owner[worker_communication]": "${model.model.worker_communication }",
  "user_projects_owner[worker_professionalism]": "${model.model.worker_professionalism }",
  "user_projects_owner[worker_rating]": "${model.model.worker_rating }",
  "user_projects_owner[worker_rating_num]": "${model.model.worker_rating_num}",
  "user_projects_owner[worker_feedback]": "${model.model.worker_feedback }",
  "user_projects_owner[rating_for_owner]": "${model.model.rating_for_owner }",
  "user_projects_owner[clarity]": "${model.model.clarity }",
  "user_projects_owner[friendliness]": "${model.model.friendliness }",
  "user_projects_owner[owner_communication]": "${model.model.owner_communication }",
  "user_projects_owner[owner_professionalism]": "${model.model.owner_professionalism }",
  "user_projects_owner[owner_rating]": "${model.model.owner_rating }",
  "user_projects_owner[owner_rating_num]": "${model.model.owner_rating_num}",
  "user_projects_owner[owner_feedback]": "${model.model.owner_feedback }",
  "user_projects_owner[owner_signature_ip]": "${model.model.owner_signature_ip }",
  "user_projects_owner[owner_signature_date]": "${model.model.owner_signature_date}",
  "user_projects_owner[worker_signature_ip]": "${model.model.worker_signature_ip }",
  "user_projects_owner[worker_signature_date]": "${model.model.worker_signature_date}",
  "user_projects_owner[owner_escrow_id]": "${model.model.owner_escrow_id }",
  "user_projects_owner[worker_credit_id]": "${model.model.worker_credit_id }",
  "user_projects_owner[arbitration_id]": "${model.model.arbitration_id }",
  "user_projects_owner[owner_credit_id]": "${model.model.owner_credit_id }",
  "user_projects_owner[registered_by_id]": "${model.model.registered_by_id }",
  "user_projects_owner[registered_date]": "${model.model.registered_date}",
  "user_projects_owner[registered_from_ip]": "${model.model.registered_from_ip }",
  "user_projects_owner[canceled_by_id]": "${model.model.canceled_by_id }",
  "user_projects_owner[canceled_date]": "${model.model.canceled_date}",
  "user_projects_owner[canceled_from_ip]": "${model.model.canceled_from_ip }",
  "user_projects_owner[published_by_id]": "${model.model.published_by_id }",
  "user_projects_owner[published_date]": "${model.model.published_date}",
  "user_projects_owner[published_from_ip]": "${model.model.published_from_ip }",
  "user_projects_owner[rejected_by_id]": "${model.model.rejected_by_id }",
  "user_projects_owner[rejected_date]": "${model.model.rejected_date}",
  "user_projects_owner[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "user_projects_owner[admin_note]": "${model.model.admin_note }",
  "user_projects_owner[announced]": "${model.model.announced}",
  "user_projects_owner[your_wishes]": "${model.model.your_wishes }",
  "user_projects_owner[extend_deadline_days]": "${model.model.extend_deadline_days }",
  "user_projects_owner[testimony]": "${model.model.testimony }",
  "user_projects_owner[pick_user_name]": "${model.model.pick_user_name }",
  "user_projects_owner[enter_email_address]": "${model.model.enter_email_address }",
  "user_projects_owner[handphone]": "${model.model.handphone }",
  "user_projects_owner[broadcast_message]": "${model.model.broadcast_message }",
  "user_projects_owner[attach_file]": '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size.toString()},"created":${model.model.attach_file[0].date.toString()},"modified":${model.model.attach_file[0].date.toString()},"temp":"${model.model.attach_file[0].temp}","remote":"","dir":"temp"}]',
  "user_projects_owner[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder}",
  "user_projects_owner[is_system_message]": "${model.model.is_system_message}",
  "user_projects_owner[admin_notes]": "${model.model.admin_notes }",
	  
  };  
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"user_projects_owner[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController as_project_owner,
  var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionAsProjectOwnerWidget(model.buttons[i], context,formKey, controller,as_project_owner, postAsProjectOwnerResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController as_project_owner,
  var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditAsProjectOwnerWidget(model.buttons[i], context,formKey, controller,as_project_owner, postAsProjectOwnerResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController as_project_owner,
  var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title ){
    //  final size =MediaQuery.of(context).size;
    double? width = 400;

    return(
        ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.9 * width,
                children:
           RlistButton(context, formKey,controller,as_project_owner, postAsProjectOwnerResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController as_project_owner,
  var postAsProjectOwnerResult, State state, String? sendPath, String? id,  String? title ){
     return(
	 SpeedDial(
                childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible!,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, formKey,controller,as_project_owner, postAsProjectOwnerResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editAcceptedWorker (State state) {
	   return(  StringView(
		value: model.model.accepted_worker_str,
		caption: 'Accepted Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_worker_id,
	  caption: 'Accepted Worker',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.accepted_worker_id_list,
	  nameenum: model.model.accepted_worker_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwner (State state) {
	   return(  StringView(
		value: model.model.owner_str,
		caption: 'Owner',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_id,
	  caption: 'Owner',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.owner_id_list,
	  nameenum: model.model.owner_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_id = val;
		});
	  },
	));*/
	}

	  	    Widget editCategory (State state) {
	   return(  StringView(
		value: model.model.category_str,
		caption: 'Category',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.category_id,
	  caption: 'Category',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.category_id_list,
	  nameenum: model.model.category_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.category_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTitle (State state) {
      return(
	TitleWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Title Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
	));}

	  	    Widget editDescription (State state) {
      return(
	    ArticleWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}

	  	    Widget editShortDescription (State state) {
      return(
	DisplayNameWidget(
		value: model.model.short_description,
		caption: 'Short Description',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.short_description = val;
		  });
		},
    ));}

	  	    Widget editAttachments (State state) {
      return(
	FileWidget(
		value: model.model.attachments[0],
		caption: 'Attachments',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.attachments[0] = val;
		  });
		},
	));} 

	  	    Widget editFinishDays (State state) {
      return(
	NumberWidget(
	  value: model.model.finish_days,
	  caption: 'Finish Days',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.finish_days = val;
		});
	  },
	));}

	  	    Widget editSearchText (State state) {
      return(
	DisplayNameWidget(
		value: model.model.search_text,
		caption: 'Search Text',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.search_text = val;
		  });
		},
    ));}

	  	    Widget editChannels (State state) {
      return(
	
	    InlineTagsWidget(
	  value: model.model.channels_id,
	  caption: 'Channels',
	  hint: ' ',
	  required: true,
	  idtags: model.model.channels_list,
	  nametags: model.model.channels_list_str,
	  getValue: (List<int?>? val) {
		state.setState(() {
		  model.model.channels_id.addAll(val);
		});
	  },
	  removeValue: (int? val) {
		state.setState(() {
		  model.model.channels_id.remove(val!);
		});
	  },
	));}

	  	    Widget editLastBump (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.last_bump,
	  caption: 'Last Bump',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.last_bump = val;
		});
	  },
	));} 

	  	    Widget editSelectDeadline (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.select_deadline,
	  caption: 'Select Deadline',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.select_deadline = val;
		});
	  },
	));} 

	  	    Widget editStartDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.start_date,
	  caption: 'Start Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.start_date = val;
		});
	  },
	));} 

	  	    Widget editFinishDeadline (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.finish_deadline,
	  caption: 'Finish Deadline',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.finish_deadline = val;
		});
	  },
	));} 

	  	    Widget editFinishDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.finish_date,
	  caption: 'Finish Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.finish_date = val;
		});
	  },
	));} 

	  	    Widget editClosedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.closed_date,
	  caption: 'Closed Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.closed_date = val;
		});
	  },
	));} 

	  	    Widget editBidCount (State state) {
      return(
	NumberWidget(
	  value: model.model.bid_count,
	  caption: 'Bid Count',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_count = val;
		});
	  },
	));}

	  	    Widget editProgress (State state) {
      return(
	PercentWidget(
	  value: model.model.progress,
	  caption: 'Progress',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.progress = val;
		});
	  },
	));}

   	    Widget editProjectStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_status_id,
	  caption: 'Project Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.project_status_list,
	  nameenum: model.model.project_status_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_status_id = val;
		});
	  },
	));}

   	    Widget editProjectEnding (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_ending_id,
	  caption: 'Project Ending',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.project_ending_list,
	  nameenum: model.model.project_ending_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_ending_id = val;
		});
	  },
	));}

   	    Widget editProjectType (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_type_id,
	  caption: 'Project Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.project_type_list,
	  nameenum: model.model.project_type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_type_id = val;
		});
	  },
	));}

   	    Widget editProjectClass (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_class_id,
	  caption: 'Project Class',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.project_class_list,
	  nameenum: model.model.project_class_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_class_id = val;
		});
	  },
	));}

	  	    Widget editPublishedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.published_budget,
	  caption: 'Published Budget',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.published_budget = val;
		});
	  },
	));}


	  	    Widget editFeePercent (State state) {
      return(
	NumberWidget(
	  value: model.model.fee_percent,
	  caption: 'Fee Percent',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.fee_percent = val;
		});
	  },
	));}

	  	    Widget editService (State state) {
	   return(  StringView(
		value: model.model.service_str,
		caption: 'Service',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.service_id,
	  caption: 'Service',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.service_id_list,
	  nameenum: model.model.service_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPrivateWorker (State state) {
	   return(  StringView(
		value: model.model.private_worker_str,
		caption: 'Private Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.private_worker_id,
	  caption: 'Private Worker',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.private_worker_id_list,
	  nameenum: model.model.private_worker_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.private_worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editInvitedUsers (State state) {
      return(
	DisplayNameWidget(
		value: model.model.invited_users,
		caption: 'Invited Users',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.invited_users = val;
		  });
		},
    ));}

	  	    Widget editAcceptedBid (State state) {
	   return(  StringView(
		value: model.model.accepted_bid_str,
		caption: 'Accepted Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_bid_id,
	  caption: 'Accepted Bid',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.accepted_bid_id_list,
	  nameenum: model.model.accepted_bid_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.accepted_budget,
	  caption: 'Accepted Budget',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.accepted_budget = val;
		});
	  },
	));}

	  	    Widget editAcceptedWork (State state) {
	   return(  StringView(
		value: model.model.accepted_work_str,
		caption: 'Accepted Work',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_work_id,
	  caption: 'Accepted Work',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.accepted_work_id_list,
	  nameenum: model.model.accepted_work_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_work_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.accepted_date,
	  caption: 'Accepted Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.accepted_date = val;
		});
	  },
	));} 

	  	    Widget editAvailableBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.available_budget,
	  caption: 'Available Budget',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.available_budget = val;
		});
	  },
	));}

	  	    Widget editNeedWeeklyReport (State state) {
      return(
	BooleanWidget(
	  value: model.model.need_weekly_report,
	  caption: 'Need Weekly Report',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.need_weekly_report = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportNeeded (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_needed,
	  caption: 'Weekly Report Needed',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.weekly_report_needed = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportPosted (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_posted,
	  caption: 'Weekly Report Posted',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.weekly_report_posted = val;
		});
	  },
	));} 

	  	    Widget editDeadlinePassedSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_passed_sent,
	  caption: 'Deadline Passed Sent',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.deadline_passed_sent = val;
		});
	  },
	));} 

	  	    Widget editDeadlineApproachingSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_approaching_sent,
	  caption: 'Deadline Approaching sent',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.deadline_approaching_sent = val;
		});
	  },
	));} 

	  	    Widget editRatingForWorker (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_worker,
		caption: 'Rating For Worker',
		hint: 'Isi dengan Title Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.rating_for_worker = val;
		  });
		},
	));}

	  	    Widget editWorkQuality (State state) {
      return(
	    RatingWidget(
	  value: model.model.work_quality,
	  caption: 'Work Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.work_quality = val;
		});
	  },
	));}

	  	    Widget editExpertise (State state) {
      return(
	    RatingWidget(
	  value: model.model.expertise,
	  caption: 'Expertise',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.expertise = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunication (State state) {
      return(
	    RatingWidget(
	  value: model.model.worker_communication,
	  caption: 'Worker Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.worker_communication = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalism (State state) {
      return(
	    RatingWidget(
	  value: model.model.worker_professionalism,
	  caption: 'Worker Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.worker_professionalism = val;
		});
	  },
	));}

	  	    Widget editWorkerRating (State state) {
      return(
	    RatingWidget(
	  value: model.model.worker_rating,
	  caption: 'Worker Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.worker_rating = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_rating_num,
	  caption: 'Worker Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double val) {
		state.setState(() {
		  
	     model.model.worker_rating_num = val;
		});
	  },
	));}

	  	    Widget editWorkerFeedback (State state) {
      return(
	    ArticleWidget(
	  value: model.model.worker_feedback,
	  caption: 'Worker Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.worker_feedback = val;
		});
	  },
	));}

	  	    Widget editRatingForOwner (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_owner,
		caption: 'Rating For Owner',
		hint: 'Isi dengan Title Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.rating_for_owner = val;
		  });
		},
	));}

	  	    Widget editClarity (State state) {
      return(
	    RatingWidget(
	  value: model.model.clarity,
	  caption: 'Clarity',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.clarity = val;
		});
	  },
	));}

	  	    Widget editFriendliness (State state) {
      return(
	    RatingWidget(
	  value: model.model.friendliness,
	  caption: 'Friendliness',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.friendliness = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunication (State state) {
      return(
	    RatingWidget(
	  value: model.model.owner_communication,
	  caption: 'Owner Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.owner_communication = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalism (State state) {
      return(
	    RatingWidget(
	  value: model.model.owner_professionalism,
	  caption: 'Owner Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.owner_professionalism = val;
		});
	  },
	));}

	  	    Widget editOwnerRating (State state) {
      return(
	    RatingWidget(
	  value: model.model.owner_rating,
	  caption: 'Owner Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.owner_rating = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_rating_num,
	  caption: 'Owner Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double val) {
		state.setState(() {
		  
	     model.model.owner_rating_num = val;
		});
	  },
	));}

	  	    Widget editOwnerFeedback (State state) {
      return(
	    ArticleWidget(
	  value: model.model.owner_feedback,
	  caption: 'Owner Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.owner_feedback = val;
		});
	  },
	));}

	  	    Widget editOwnerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.owner_signature_ip,
		caption: 'Owner Signature IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.owner_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editOwnerSignatureDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.owner_signature_date,
	  caption: 'Owner Signature Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.owner_signature_date = val;
		});
	  },
	));} 

	  	    Widget editWorkerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.worker_signature_ip,
		caption: 'Worker Signature IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.worker_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editWorkerSignatureDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.worker_signature_date,
	  caption: 'Worker Signature Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.worker_signature_date = val;
		});
	  },
	));} 

	  	    Widget editOwnerEscrow (State state) {
	   return(  StringView(
		value: model.model.owner_escrow_str,
		caption: 'Owner Escrow',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_escrow_id,
	  caption: 'Owner Escrow',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.owner_escrow_id_list,
	  nameenum: model.model.owner_escrow_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_escrow_id = val;
		});
	  },
	));*/
	}

	  	    Widget editWorkerCredit (State state) {
	   return(  StringView(
		value: model.model.worker_credit_str,
		caption: 'Worker Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_credit_id,
	  caption: 'Worker Credit',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.worker_credit_id_list,
	  nameenum: model.model.worker_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_credit_id = val;
		});
	  },
	));*/
	}

	  	    Widget editArbitration (State state) {
	   return(  StringView(
		value: model.model.arbitration_str,
		caption: 'Arbitration',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.arbitration_id,
	  caption: 'Arbitration',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.arbitration_id_list,
	  nameenum: model.model.arbitration_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.arbitration_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwnerCredit (State state) {
	   return(  StringView(
		value: model.model.owner_credit_str,
		caption: 'Owner Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_credit_id,
	  caption: 'Owner Credit',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.owner_credit_id_list,
	  nameenum: model.model.owner_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_credit_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRegisteredBy (State state) {
	   return(  StringView(
		value: model.model.registered_by_str,
		caption: 'Registered By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.registered_by_id,
	  caption: 'Registered By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.registered_by_id_list,
	  nameenum: model.model.registered_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.registered_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRegisteredDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.registered_date,
	  caption: 'Registered Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.registered_date = val;
		});
	  },
	));} 

	  	    Widget editRegisteredFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.registered_from_ip,
		caption: 'Registered From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.registered_from_ip = val;
		  });
		},
    ));}

	  	    Widget editCanceledBy (State state) {
	   return(  StringView(
		value: model.model.canceled_by_str,
		caption: 'Canceled By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.canceled_by_id,
	  caption: 'Canceled By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.canceled_by_id_list,
	  nameenum: model.model.canceled_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.canceled_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editCanceledDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.canceled_date,
	  caption: 'Canceled Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.canceled_date = val;
		});
	  },
	));} 

	  	    Widget editCanceledFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.canceled_from_ip,
		caption: 'Canceled From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.canceled_from_ip = val;
		  });
		},
    ));}

	  	    Widget editPublishedBy (State state) {
	   return(  StringView(
		value: model.model.published_by_str,
		caption: 'Published By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.published_by_id,
	  caption: 'Published By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.published_by_id_list,
	  nameenum: model.model.published_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.published_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPublishedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.published_date,
	  caption: 'Published Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.published_date = val;
		});
	  },
	));} 

	  	    Widget editPublishedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.published_from_ip,
		caption: 'Published From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_from_ip = val;
		  });
		},
    ));}

	  	    Widget editRejectedBy (State state) {
	   return(  StringView(
		value: model.model.rejected_by_str,
		caption: 'Rejected By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.rejected_by_id,
	  caption: 'Rejected By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.rejected_by_id_list,
	  nameenum: model.model.rejected_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.rejected_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRejectedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.rejected_date,
	  caption: 'Rejected Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.rejected_date = val;
		});
	  },
	));} 

	  	    Widget editRejectedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.rejected_from_ip,
		caption: 'Rejected From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.rejected_from_ip = val;
		  });
		},
    ));}

	  	    Widget editAdminNote (State state) {
      return(
	    ArticleWidget(
	  value: model.model.admin_note,
	  caption: 'Admin Note',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.admin_note = val;
		});
	  },
	));}

	  	    Widget editAnnounced (State state) {
      return(
	BooleanWidget(
	  value: model.model.announced,
	  caption: 'Announced',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.announced = val;
		});
	  },
	));} 

	  	    Widget editYourWishes (State state) {
      return(
	    ArticleWidget(
	  value: model.model.your_wishes,
	  caption: 'Your Wishes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.your_wishes = val;
		});
	  },
	));}

	  	    Widget editExtendDeadlineDays (State state) {
      return(
	NumberWidget(
	  value: model.model.extend_deadline_days,
	  caption: 'Extend Deadline Days',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.extend_deadline_days = val;
		});
	  },
	));}

	  	    Widget editTestimony (State state) {
      return(
	    ArticleWidget(
	  value: model.model.testimony,
	  caption: 'Testimony',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.testimony = val;
		});
	  },
	));}

	  	    Widget editPickUserName (State state) {
      return(
	UsernameWidget(
		value: model.model.pick_user_name,
		caption: 'Pick User Name',
		hint: 'Isi dengan Username Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.pick_user_name = val;
		  });
		}
	));}

	  	    Widget editEnterEmailAddress (State state) {
      return(
	 EmailWidget(
		value: model.model.enter_email_address,
		caption: 'Enter Email Address',
		hint: 'Isi dengan Email Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.enter_email_address = val;
		  });
		},
	));}

	  	    Widget editHandphone (State state) {
      return(
	HandphoneWidget(
		value: model.model.handphone,
		caption: 'Handphone',
		hint: 'Isi dengan Handphone Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.handphone = val;
		  });
		},
	));}

	  	    Widget editBroadcastMessage (State state) {
      return(
	    ArticleWidget(
	  value: model.model.broadcast_message,
	  caption: 'Broadcast Message',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.broadcast_message = val;
		});
	  },
	));}

	  	    Widget editAttachFile (State state) {
      return(
	FileWidget(
		value: model.model.attach_file[0],
		caption: 'Attach File',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.attach_file[0] = val;
		  });
		},
	));} 

	  	    Widget editAutomaticSendToNewBidder (State state) {
      return(
	BooleanWidget(
	  value: model.model.automatic_send_to_new_bidder,
	  caption: 'Automatic Send to New Bidder',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.automatic_send_to_new_bidder = val;
		});
	  },
	));} 

	  	    Widget editIsSystemMessage (State state) {
      return(
	BooleanWidget(
	  value: model.model.is_system_message,
	  caption: 'Is System Message',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.is_system_message = val;
		});
	  },
	));} 

	  	    Widget editAdminNotes (State state) {
      return(
	    ArticleWidget(
	  value: model.model.admin_notes,
	  caption: 'Admin Notes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.admin_notes = val;
		});
	  },
	));}
	
}













  

