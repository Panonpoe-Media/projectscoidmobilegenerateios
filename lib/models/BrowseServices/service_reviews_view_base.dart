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
part 'service_reviews_view_base.g.dart';




SpeedDialChild ListButtonServiceReviewsWidget(Button button, BuildContext context){
  
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
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()=>
		  {AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url!)) }
	  ));
  }

}


@JsonSerializable()
class ViewModelServiceReviews {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? project_id;
  int? owner_id;
  String? owner_str;
  String? owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  int? category_id;
  String? category_str;
  String? category_url;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  String? description;
  String? short_description;
  List<FileField?>? attachments;  
  String? attachments_url;
  String? attachments_name;
  int? finish_days;
  String? finish_days_str;
  String? search_text;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
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
  double? budget_range_min;
  String? budget_range_min_str;
  double? budget_range_max;
  String? budget_range_max_str;
  String? budget_range_str;
  int? fee_percent;
  String? fee_percent_str;
  int? service_id;
  String? service_str;
  String? service_url;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? private_worker_id;
  String? private_worker_str;
  String? private_worker_url;
  List<int?>? private_worker_list;
  List<String?>? private_worker_list_str;
  String? invited_users;
  int? accepted_bid_id;
  String? accepted_bid_str;
  String? accepted_bid_url;
  List<int?>? accepted_bid_list;
  List<String?>? accepted_bid_list_str;
  int? accepted_worker_id;
  String? accepted_worker_str;
  String? accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  double? accepted_budget;
  String? accepted_budget_str;
  int? accepted_work_id;
  String? accepted_work_str;
  String? accepted_work_url;
  List<int?>? accepted_work_list;
  List<String?>? accepted_work_list_str;
  DateTime? accepted_date;
  double? available_budget;
  String? available_budget_str;
  bool need_weekly_report;
  bool weekly_report_needed;
  bool weekly_report_posted;
  bool deadline_passed_sent;
  bool deadline_approaching_sent;
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
  String? owner_escrow_str;
  String? owner_escrow_url;
  List<int?>? owner_escrow_list;
  List<String?>? owner_escrow_list_str;
  int? worker_credit_id;
  String? worker_credit_str;
  String? worker_credit_url;
  List<int?>? worker_credit_list;
  List<String?>? worker_credit_list_str;
  int? arbitration_id;
  String? arbitration_str;
  String? arbitration_url;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  int? owner_credit_id;
  String? owner_credit_str;
  String? owner_credit_url;
  List<int?>? owner_credit_list;
  List<String?>? owner_credit_list_str;
  int? registered_by_id;
  String? registered_by_str;
  String? registered_by_url;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime? registered_date;
  String? registered_from_ip;
  int? canceled_by_id;
  String? canceled_by_str;
  String? canceled_by_url;
  List<int?>? canceled_by_list;
  List<String?>? canceled_by_list_str;
  DateTime? canceled_date;
  String? canceled_from_ip;
  int? published_by_id;
  String? published_by_str;
  String? published_by_url;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime? published_date;
  String? published_from_ip;
  int? rejected_by_id;
  String? rejected_by_str;
  String? rejected_by_url;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime? rejected_date;
  String? rejected_from_ip;
  String? admin_note;
  bool announced;
  String? broadcast_message;
  List<FileField?>? attach_file;  
  String? attach_file_url;
  String? attach_file_name;
  bool automatic_send_to_new_bidder;
  bool is_system_message;
  String? admin_notes;

	
	  ViewModelServiceReviews(
            this.id,
            this.project_id,
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.category_id,
			this.category_str,
			this.category_url,
			this.category_list,
			this.category_list_str,
			this.title,
			this.description,
			this.short_description,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.finish_days,
			this.finish_days_str,
			this.search_text,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.last_bump,
			this.select_deadline,
			this.start_date,
			this.finish_deadline,
			this.finish_date,
			this.closed_date,
			this.bid_count,
			this.bid_count_str,
			this.progress,
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
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.fee_percent,
			this.fee_percent_str,
			this.service_id,
			this.service_str,
			this.service_url,
			this.service_list,
			this.service_list_str,
			this.private_worker_id,
			this.private_worker_str,
			this.private_worker_url,
			this.private_worker_list,
			this.private_worker_list_str,
			this.invited_users,
			this.accepted_bid_id,
			this.accepted_bid_str,
			this.accepted_bid_url,
			this.accepted_bid_list,
			this.accepted_bid_list_str,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_url,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.accepted_work_id,
			this.accepted_work_str,
			this.accepted_work_url,
			this.accepted_work_list,
			this.accepted_work_list_str,
			this.accepted_date,
			this.available_budget,
			this.available_budget_str,
			this.need_weekly_report,
			this.weekly_report_needed,
			this.weekly_report_posted,
			this.deadline_passed_sent,
			this.deadline_approaching_sent,
			this.rating_for_worker,
			this.work_quality,
			this.expertise,
			this.worker_communication,
			this.worker_professionalism,
			this.worker_rating,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_feedback,
			this.rating_for_owner,
			this.clarity,
			this.friendliness,
			this.owner_communication,
			this.owner_professionalism,
			this.owner_rating,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_feedback,
			this.owner_signature_ip,
			this.owner_signature_date,
			this.worker_signature_ip,
			this.worker_signature_date,
			this.owner_escrow_id,
			this.owner_escrow_str,
			this.owner_escrow_url,
			this.owner_escrow_list,
			this.owner_escrow_list_str,
			this.worker_credit_id,
			this.worker_credit_str,
			this.worker_credit_url,
			this.worker_credit_list,
			this.worker_credit_list_str,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_url,
			this.arbitration_list,
			this.arbitration_list_str,
			this.owner_credit_id,
			this.owner_credit_str,
			this.owner_credit_url,
			this.owner_credit_list,
			this.owner_credit_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_url,
			this.registered_by_list,
			this.registered_by_list_str,
			this.registered_date,
			this.registered_from_ip,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_url,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.canceled_date,
			this.canceled_from_ip,
			this.published_by_id,
			this.published_by_str,
			this.published_by_url,
			this.published_by_list,
			this.published_by_list_str,
			this.published_date,
			this.published_from_ip,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_url,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.rejected_date,
			this.rejected_from_ip,
			this.admin_note,
			this.announced,
			this.broadcast_message,
			this.attach_file,
			this.attach_file_url,	
            this.attach_file_name,				
			this.automatic_send_to_new_bidder,
			this.is_system_message,
			this.admin_notes,

  );

  
   factory ViewModelServiceReviews.fromJson(Map<String, dynamic> json) => _$ViewModelServiceReviewsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelServiceReviewsToJson(this); 
  
}

@JsonSerializable()
class ServiceReviewsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelServiceReviews? model;
  ServiceReviewsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory ServiceReviewsViewSuperBase.fromJson(Map<String, dynamic> json) => _$ServiceReviewsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceReviewsViewSuperBaseToJson(this);
   
}

class ServiceReviewsViewBase{
	var model;
	Map<String, dynamic> json;
	ServiceReviewsViewBase(this.json){
		model = ServiceReviewsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonServiceReviewsWidget(model.buttons[i],context));
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool visible){
     return(
	 SpeedDial(
                childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
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
				children:listButton(context)
	    )
	 );
   } 	
	
	
	
	
  
		    Widget viewOwner (BuildContext context) {  
	   return(  StringView(
			value: model.model.owner_str,
			caption: 'Owner',
		));
		} 
		    Widget viewCategory (BuildContext context) {  
	   return(  StringView(
			value: model.model.category_str,
			caption: 'Category',
		));
		} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: model.model.title,
		caption: 'Title',
	));}
		    Widget viewDescription (BuildContext context) {  
	if(model.model.description != null){
		return(  ArticleView(
		value: model.model.description,
		caption: 'Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Description',
		    ));
	}		
     }
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.short_description,
		caption: 'Short Description',
	));}
		    Widget viewAttachments (BuildContext context) {  
    if(model.model.attachments == null){
		  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}	
	if(model.model.attachments_name != ''){
	  return(  FileView(
		value: model.model.attachments_name,
		value1: model.model.attachments_url,
		caption: 'Attachments',
	));
	}else{
	  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}			
    } 
		    Widget viewFinishDays (BuildContext context) { 
    if(model.model.finish_days != null){
		return(  NumberView(
		value: model.model.finish_days,
		caption: 'Finish Days',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Finish Days',
		));
	}		
     }
		    Widget viewSearchText (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.search_text,
		caption: 'Search Text',
	));}
	Widget viewChannels (BuildContext context) {  
	if(model.model.channels_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
						urlroutetags: model.model.channels_url,
						getValue:  (String? val) {
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
					  ));
	
    }	
			  } 
		    Widget viewLastBump (BuildContext context) {  
	if(model.model.last_bump != null){
	return(  DateTimeView(
		value: model.model.last_bump,
		caption: 'Last Bump',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Last Bump',
		    ));
	}			 
	 } 
		    Widget viewSelectDeadline (BuildContext context) {  
	if(model.model.select_deadline != null){
	return(  DateTimeView(
		value: model.model.select_deadline,
		caption: 'Select Deadline',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Select Deadline',
		    ));
	}			 
	 } 
		    Widget viewStartDate (BuildContext context) {  
	if(model.model.start_date != null){
	return(  DateTimeView(
		value: model.model.start_date,
		caption: 'Start Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Start Date',
		    ));
	}			 
	 } 
		    Widget viewFinishDeadline (BuildContext context) {  
	if(model.model.finish_deadline != null){
	return(  DateTimeView(
		value: model.model.finish_deadline,
		caption: 'Finish Deadline',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Finish Deadline',
		    ));
	}			 
	 } 
		    Widget viewFinishDate (BuildContext context) {  
	if(model.model.finish_date != null){
	return(  DateTimeView(
		value: model.model.finish_date,
		caption: 'Finish Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Finish Date',
		    ));
	}			 
	 } 
		    Widget viewClosedDate (BuildContext context) {  
	if(model.model.closed_date != null){
	return(  DateTimeView(
		value: model.model.closed_date,
		caption: 'Closed Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Closed Date',
		    ));
	}			 
	 } 
		    Widget viewBidCount (BuildContext context) { 
    if(model.model.bid_count != null){
		return(  NumberView(
		value: model.model.bid_count,
		caption: 'Bid Count',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Bid Count',
		));
	}		
     }
		    Widget viewProgress (BuildContext context) {

	if(model.model.progress != null){
		return(  PercentView(
		value: model.model.progress,
		caption: 'Progress',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Progress',
		    ));	
	}
     }
	    Widget viewProjectStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.project_status_str,
			caption: 'Project Status',
		));
		} 
	    Widget viewProjectEnding (BuildContext context) {
	   return(  StringView(
			value: model.model.project_ending_str,
			caption: 'Project Ending',
		));
		} 
	    Widget viewProjectType (BuildContext context) {
	   return(  StringView(
			value: model.model.project_type_str,
			caption: 'Project Type',
		));
		} 
	    Widget viewProjectClass (BuildContext context) {
	   return(  StringView(
			value: model.model.project_class_str,
			caption: 'Project Class',
		));
		} 
		    Widget viewPublishedBudget (BuildContext context) {  			
    if(model.model.published_budget != null){
		return(  MoneyView(
		value: model.model.published_budget,
		caption: 'Published Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Published Budget',
		    ));
	}			
     }
		    Widget viewBudgetRange (BuildContext context) {  
	if(model.model.budget_range != null){
		return(  StringView(
		value: model.model.budget_range_str,
		caption: 'Budget Range',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Budget Range',
		    ));
	}		
     }
		    Widget viewFeePercent (BuildContext context) { 
    if(model.model.fee_percent != null){
		return(  NumberView(
		value: model.model.fee_percent,
		caption: 'Fee Percent',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Fee Percent',
		));
	}		
     }
		    Widget viewService (BuildContext context) {  
	   return(  StringView(
			value: model.model.service_str,
			caption: 'Service',
		));
		} 
		    Widget viewPrivateWorker (BuildContext context) {  
	   return(  StringView(
			value: model.model.private_worker_str,
			caption: 'Private Worker',
		));
		} 
		    Widget viewInvitedUsers (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.invited_users,
		caption: 'Invited Users',
	));}
		    Widget viewAcceptedBid (BuildContext context) {  
	   return(  StringView(
			value: model.model.accepted_bid_str,
			caption: 'Accepted Bid',
		));
		} 
		    Widget viewAcceptedWorker (BuildContext context) {  
	   return(  StringView(
			value: model.model.accepted_worker_str,
			caption: 'Accepted Worker',
		));
		} 
		    Widget viewAcceptedBudget (BuildContext context) {  			
    if(model.model.accepted_budget != null){
		return(  MoneyView(
		value: model.model.accepted_budget,
		caption: 'Accepted Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Accepted Budget',
		    ));
	}			
     }
		    Widget viewAcceptedWork (BuildContext context) {  
	   return(  StringView(
			value: model.model.accepted_work_str,
			caption: 'Accepted Work',
		));
		} 
		    Widget viewAcceptedDate (BuildContext context) {  
	if(model.model.accepted_date != null){
	return(  DateTimeView(
		value: model.model.accepted_date,
		caption: 'Accepted Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Accepted Date',
		    ));
	}			 
	 } 
		    Widget viewAvailableBudget (BuildContext context) {  			
    if(model.model.available_budget != null){
		return(  MoneyView(
		value: model.model.available_budget,
		caption: 'Available Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Available Budget',
		    ));
	}			
     }
		    Widget viewNeedWeeklyReport (BuildContext context) {  

	if(model.model.need_weekly_report != null){
		return(  BooleanView(
		value: model.model.need_weekly_report,
		caption: 'Need Weekly Report',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Need Weekly Report',
		    ));
	}
     } 
		    Widget viewWeeklyReportNeeded (BuildContext context) {  

	if(model.model.weekly_report_needed != null){
		return(  BooleanView(
		value: model.model.weekly_report_needed,
		caption: 'Weekly Report Needed',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Weekly Report Needed',
		    ));
	}
     } 
		    Widget viewWeeklyReportPosted (BuildContext context) {  

	if(model.model.weekly_report_posted != null){
		return(  BooleanView(
		value: model.model.weekly_report_posted,
		caption: 'Weekly Report Posted',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Weekly Report Posted',
		    ));
	}
     } 
		    Widget viewDeadlinePassedSent (BuildContext context) {  

	if(model.model.deadline_passed_sent != null){
		return(  BooleanView(
		value: model.model.deadline_passed_sent,
		caption: 'Deadline Passed Sent',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Deadline Passed Sent',
		    ));
	}
     } 
		    Widget viewDeadlineApproachingSent (BuildContext context) {  

	if(model.model.deadline_approaching_sent != null){
		return(  BooleanView(
		value: model.model.deadline_approaching_sent,
		caption: 'Deadline Approaching sent',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Deadline Approaching sent',
		    ));
	}
     } 
		    Widget viewRatingForWorker (BuildContext context) {  
	return(  TitleView(
		value: model.model.rating_for_worker,
		caption: 'Rating For Worker',
	));}
		    Widget viewWorkQuality (BuildContext context) {  
	
	if(model.model.work_quality != null){
		return(  RatingView(
		value: model.model.work_quality,
		caption: 'Work Quality'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Work Quality',
		 ));	
	}
     }
		    Widget viewExpertise (BuildContext context) {  
	
	if(model.model.expertise != null){
		return(  RatingView(
		value: model.model.expertise,
		caption: 'Expertise'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Expertise',
		 ));	
	}
     }
		    Widget viewWorkerCommunication (BuildContext context) {  
	
	if(model.model.worker_communication != null){
		return(  RatingView(
		value: model.model.worker_communication,
		caption: 'Worker Communication'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Worker Communication',
		 ));	
	}
     }
		    Widget viewWorkerProfessionalism (BuildContext context) {  
	
	if(model.model.worker_professionalism != null){
		return(  RatingView(
		value: model.model.worker_professionalism,
		caption: 'Worker Professionalism'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Worker Professionalism',
		 ));	
	}
     }
		    Widget viewWorkerRating (BuildContext context) {  
	
	if(model.model.worker_rating != null){
		return(  RatingView(
		value: model.model.worker_rating,
		caption: 'Worker Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Worker Rating',
		 ));	
	}
     }
		    Widget viewWorkerRatingNum (BuildContext context) {  
	   if(model.model.worker_rating_num != null){
	   	   	return(  DoubleView(
		    value: model.model.worker_rating_num,
			caption: 'Worker Rating Num',
		));
	   }else{
	   	   return(  StringView(
			value: '',
			caption: 'Worker Rating Num',
		    ));
	   }
      }
		    Widget viewWorkerFeedback (BuildContext context) {  
	if(model.model.worker_feedback != null){
		return(  ArticleView(
		value: model.model.worker_feedback,
		caption: 'Worker Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Worker Feedback',
		    ));
	}		
     }
		    Widget viewRatingForOwner (BuildContext context) {  
	return(  TitleView(
		value: model.model.rating_for_owner,
		caption: 'Rating For Owner',
	));}
		    Widget viewClarity (BuildContext context) {  
	
	if(model.model.clarity != null){
		return(  RatingView(
		value: model.model.clarity,
		caption: 'Clarity'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Clarity',
		 ));	
	}
     }
		    Widget viewFriendliness (BuildContext context) {  
	
	if(model.model.friendliness != null){
		return(  RatingView(
		value: model.model.friendliness,
		caption: 'Friendliness'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Friendliness',
		 ));	
	}
     }
		    Widget viewOwnerCommunication (BuildContext context) {  
	
	if(model.model.owner_communication != null){
		return(  RatingView(
		value: model.model.owner_communication,
		caption: 'Owner Communication'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Owner Communication',
		 ));	
	}
     }
		    Widget viewOwnerProfessionalism (BuildContext context) {  
	
	if(model.model.owner_professionalism != null){
		return(  RatingView(
		value: model.model.owner_professionalism,
		caption: 'Owner Professionalism'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Owner Professionalism',
		 ));	
	}
     }
		    Widget viewOwnerRating (BuildContext context) {  
	
	if(model.model.owner_rating != null){
		return(  RatingView(
		value: model.model.owner_rating,
		caption: 'Owner Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Owner Rating',
		 ));	
	}
     }
		    Widget viewOwnerRatingNum (BuildContext context) {  
	   if(model.model.owner_rating_num != null){
	   	   	return(  DoubleView(
		    value: model.model.owner_rating_num,
			caption: 'Owner Rating Num',
		));
	   }else{
	   	   return(  StringView(
			value: '',
			caption: 'Owner Rating Num',
		    ));
	   }
      }
		    Widget viewOwnerFeedback (BuildContext context) {  
	if(model.model.owner_feedback != null){
		return(  ArticleView(
		value: model.model.owner_feedback,
		caption: 'Owner Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Owner Feedback',
		    ));
	}		
     }
		    Widget viewOwnerSignatureIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.owner_signature_ip,
		caption: 'Owner Signature IP',
	));}
		    Widget viewOwnerSignatureDate (BuildContext context) {  
	if(model.model.owner_signature_date != null){
	return(  DateTimeView(
		value: model.model.owner_signature_date,
		caption: 'Owner Signature Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Owner Signature Date',
		    ));
	}			 
	 } 
		    Widget viewWorkerSignatureIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.worker_signature_ip,
		caption: 'Worker Signature IP',
	));}
		    Widget viewWorkerSignatureDate (BuildContext context) {  
	if(model.model.worker_signature_date != null){
	return(  DateTimeView(
		value: model.model.worker_signature_date,
		caption: 'Worker Signature Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Worker Signature Date',
		    ));
	}			 
	 } 
		    Widget viewOwnerEscrow (BuildContext context) {  
	   return(  StringView(
			value: model.model.owner_escrow_str,
			caption: 'Owner Escrow',
		));
		} 
		    Widget viewWorkerCredit (BuildContext context) {  
	   return(  StringView(
			value: model.model.worker_credit_str,
			caption: 'Worker Credit',
		));
		} 
		    Widget viewArbitration (BuildContext context) {  
	   return(  StringView(
			value: model.model.arbitration_str,
			caption: 'Arbitration',
		));
		} 
		    Widget viewOwnerCredit (BuildContext context) {  
	   return(  StringView(
			value: model.model.owner_credit_str,
			caption: 'Owner Credit',
		));
		} 
		    Widget viewRegisteredBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.registered_by_str,
			caption: 'Registered By',
		));
		} 
		    Widget viewRegisteredDate (BuildContext context) {  
	if(model.model.registered_date != null){
	return(  DateTimeView(
		value: model.model.registered_date,
		caption: 'Registered Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Registered Date',
		    ));
	}			 
	 } 
		    Widget viewRegisteredFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.registered_from_ip,
		caption: 'Registered From IP',
	));}
		    Widget viewCanceledBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.canceled_by_str,
			caption: 'Canceled By',
		));
		} 
		    Widget viewCanceledDate (BuildContext context) {  
	if(model.model.canceled_date != null){
	return(  DateTimeView(
		value: model.model.canceled_date,
		caption: 'Canceled Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Canceled Date',
		    ));
	}			 
	 } 
		    Widget viewCanceledFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.canceled_from_ip,
		caption: 'Canceled From IP',
	));}
		    Widget viewPublishedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.published_by_str,
			caption: 'Published By',
		));
		} 
		    Widget viewPublishedDate (BuildContext context) {  
	if(model.model.published_date != null){
	return(  DateTimeView(
		value: model.model.published_date,
		caption: 'Published Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Published Date',
		    ));
	}			 
	 } 
		    Widget viewPublishedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.published_from_ip,
		caption: 'Published From IP',
	));}
		    Widget viewRejectedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.rejected_by_str,
			caption: 'Rejected By',
		));
		} 
		    Widget viewRejectedDate (BuildContext context) {  
	if(model.model.rejected_date != null){
	return(  DateTimeView(
		value: model.model.rejected_date,
		caption: 'Rejected Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Rejected Date',
		    ));
	}			 
	 } 
		    Widget viewRejectedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.rejected_from_ip,
		caption: 'Rejected From IP',
	));}
		    Widget viewAdminNote (BuildContext context) {  
	if(model.model.admin_note != null){
		return(  ArticleView(
		value: model.model.admin_note,
		caption: 'Admin Note',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Admin Note',
		    ));
	}		
     }
		    Widget viewAnnounced (BuildContext context) {  

	if(model.model.announced != null){
		return(  BooleanView(
		value: model.model.announced,
		caption: 'Announced',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Announced',
		    ));
	}
     } 
		    Widget viewBroadcastMessage (BuildContext context) {  
	if(model.model.broadcast_message != null){
		return(  ArticleView(
		value: model.model.broadcast_message,
		caption: 'Broadcast Message',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Broadcast Message',
		    ));
	}		
     }
		    Widget viewAttachFile (BuildContext context) {  
    if(model.model.attach_file == null){
		  return(  StringView(
		value: '',
		caption: 'Attach File',
	));
	}	
	if(model.model.attach_file_name != ''){
	  return(  FileView(
		value: model.model.attach_file_name,
		value1: model.model.attach_file_url,
		caption: 'Attach File',
	));
	}else{
	  return(  StringView(
		value: '',
		caption: 'Attach File',
	));
	}			
    } 
		    Widget viewAutomaticSendToNewBidder (BuildContext context) {  

	if(model.model.automatic_send_to_new_bidder != null){
		return(  BooleanView(
		value: model.model.automatic_send_to_new_bidder,
		caption: 'Automatic Send to New Bidder',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Automatic Send to New Bidder',
		    ));
	}
     } 
		    Widget viewIsSystemMessage (BuildContext context) {  

	if(model.model.is_system_message != null){
		return(  BooleanView(
		value: model.model.is_system_message,
		caption: 'Is System Message',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Is System Message',
		    ));
	}
     } 
		    Widget viewAdminNotes (BuildContext context) {  
	if(model.model.admin_notes != null){
		return(  ArticleView(
		value: model.model.admin_notes,
		caption: 'Admin Notes',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Admin Notes',
		    ));
	}		
     }
  
}









  

