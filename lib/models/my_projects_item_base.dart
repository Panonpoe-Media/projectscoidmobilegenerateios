

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'my_projects_item_base.g.dart';



class ItemMyProjectsBase {
	var item;
	Map<String, dynamic> json;
	ItemMyProjectsBase(this.json){
		item = ItemMyProjects.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
		}
	}


	Widget itemButton( int?index, BuildContext context){
		return(
				FlatButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					textColor: CurrentTheme.MainAccentColor,
					splashColor : CurrentTheme.ShadeColor,
					color : CurrentTheme.SecondaryAccentColor,
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewOwner (BuildContext context) {  
	return(  ModelView(
		value: item.owner_id,
		caption: 'Owner',
		idenum: item.owner_list,
		nameenum: item.owner_str,
	));} 
		    Widget viewAcceptedWorker (BuildContext context) {  
	return(  ModelView(
		value: item.accepted_worker_id,
		caption: 'Accepted Worker',
		idenum: item.accepted_worker_list,
		nameenum: item.accepted_worker_str,
	));} 
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.accepted_worker_photo_url,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item.accepted_worker_user_name,
		caption: 'User Name',
	));}
  Widget viewKabupaten (BuildContext context) {  
  return(  StringView(
		value: item.accepted_worker_kabupaten_str,
		caption: 'Kabupaten',
	));}
   Widget viewWorkerRating (BuildContext context) {
	return(  RatingView(
		value: item.accepted_worker_worker_rating,
		caption: 'Worker Rating',
	));}
  Widget viewWorkerRatingNum (BuildContext context) {  
  return(  DoubleView(
	  value: item.accepted_worker_worker_rating_num,
		caption: 'Worker Rating Num',
	));}

  Widget viewWorkerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.accepted_worker_worker_point,
		caption: 'Worker Point',
	)
	);}
  Widget viewWorkerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.accepted_worker_worker_ranking,
		caption: 'Worker Ranking',
	)
	);}
   Widget viewOwnerRating (BuildContext context) {
	return(  RatingView(
		value: item.owner_owner_rating,
		caption: 'Owner Rating',
	));}
  Widget viewOwnerRatingNum (BuildContext context) {  
  return(  DoubleView(
	  value: item.owner_owner_rating_num,
		caption: 'Owner Rating Num',
	));}

  Widget viewOwnerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.owner_owner_point,
		caption: 'Owner Point',
	)
	);}
  Widget viewOwnerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.owner_owner_ranking,
		caption: 'Owner Ranking',
	)
	);}
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: item.short_description,
		caption: 'Short Description',
	));}
	Widget viewChannels (BuildContext context) {  
	return( 	ChannelRouteTagsWidget(
                value: item.channels_id,
                caption: '',
                hint: ' ',
                required: true,
                idroutetags: item.channels_id,
                nameroutetags: item.channels_str,
                urlroutetags: item.channels_url,
                getValue: (String?  val) {
                  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
                },
              ));} 
	    Widget viewProjectClass (BuildContext context) {
      return( 
	 EnumView(
		value: item.project_class_id,
		caption: 'Project Class',
		idenum: item.project_class_list,
		nameenum: item.project_class_str,
	));} 
		    Widget viewBudgetRange (BuildContext context) {  
	return(  RangeView(
		value: item.budget_range_str,
		caption: 'Budget Range'
	));}
		    Widget viewPublishedBudget (BuildContext context) {  
	return(  MoneyView(
		value: item.published_budget,
		caption: 'Published Budget',
	));}
		    Widget viewPublishedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.published_date,
		caption: 'Published Date',
	));} 
		    Widget viewSelectDeadline (BuildContext context) {  
	return(  DateTimeView(
		value: item.select_deadline,
		caption: 'Select Deadline',
	));} 
		    Widget viewFinishDays (BuildContext context) { 
	return(  NumberView(
		value: item.finish_days,
		caption: 'Finish Days',
	));}
	    Widget viewProjectStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.project_status_id,
		caption: 'Project Status',
		idenum: item.project_status_list,
		nameenum: item.project_status_str,
	));} 
	    Widget viewProjectEnding (BuildContext context) {
      return( 
	 EnumView(
		value: item.project_ending_id,
		caption: 'Project Ending',
		idenum: item.project_ending_list,
		nameenum: item.project_ending_str,
	));} 
		    Widget viewBidCount (BuildContext context) { 
	return(  NumberView(
		value: item.bid_count,
		caption: 'Bid Count',
	));}
		    Widget viewNeedWeeklyReport (BuildContext context) {  
	return(  BooleanView(
		value: item.need_weekly_report,
		caption: 'Need Weekly Report',
	));} 
		    Widget viewWeeklyReportNeeded (BuildContext context) {  
	return(  BooleanView(
		value: item.weekly_report_needed,
		caption: 'Weekly Report Needed',
	));} 
		    Widget viewWeeklyReportPosted (BuildContext context) {  
	return(  BooleanView(
		value: item.weekly_report_posted,
		caption: 'Weekly Report Posted',
	));} 
		    Widget viewStartDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.start_date,
		caption: 'Start Date',
	));} 
		    Widget viewFinishDeadline (BuildContext context) {  
	return(  DateTimeView(
		value: item.finish_deadline,
		caption: 'Finish Deadline',
	));} 
		    Widget viewFinishDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.finish_date,
		caption: 'Finish Date',
	));} 
		    Widget viewClosedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.closed_date,
		caption: 'Closed Date',
	));} 
		    Widget viewAcceptedBudget (BuildContext context) {  
	return(  MoneyView(
		value: item.accepted_budget,
		caption: 'Accepted Budget',
	));}
	Widget viewProgress (BuildContext context) {
	return(  PercentView(
		value: item.progress,
		caption: 'Progress',
	));}
		    Widget viewArbitration (BuildContext context) {  
	return(  ModelView(
		value: item.arbitration_id,
		caption: 'Arbitration',
		idenum: item.arbitration_list,
		nameenum: item.arbitration_str,
	));} 
		    Widget viewLastBump (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_bump,
		caption: 'Last Bump',
	));} 

}


@JsonSerializable()

class ItemMyProjects{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  project_id;
  int?owner_id;
  String?  owner_str;
  String?  owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  int?accepted_worker_id;
  String?  accepted_worker_str;
  String?  accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  String?  accepted_worker_photo_url;
  Photo? accepted_worker_photo; 
  String?  accepted_worker_user_name;
  int?accepted_worker_kabupaten_id;
  String?  accepted_worker_kabupaten_str;
  int? accepted_worker_worker_rating;
  double?  accepted_worker_worker_rating_num;
  String?  accepted_worker_worker_rating_num_str;
  int? accepted_worker_worker_point;
  String?  accepted_worker_worker_point_str;
  int? accepted_worker_worker_ranking;
  String?  accepted_worker_worker_ranking_str;
  int? owner_owner_rating;
  double?  owner_owner_rating_num;
  String?  owner_owner_rating_num_str;
  int? owner_owner_point;
  String?  owner_owner_point_str;
  int? owner_owner_ranking;
  String?  owner_owner_ranking_str;
  String?  title;
  String?  short_description;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  int?project_class_id;
  String?  project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
 String?  budget_range;
  double? budget_range_min;
  String?  budget_range_min_str;
  double? budget_range_max;
  String?  budget_range_max_str;
  String?  budget_range_str;
  double? published_budget;
  String?  published_budget_str;
  DateTime? published_date;
  DateTime? select_deadline;
  int?finish_days;
  String?  finish_days_str;
  int?project_status_id;
  String?  project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int?project_ending_id;
  String?  project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  int?bid_count;
  String?  bid_count_str;
  bool? need_weekly_report;
  bool? weekly_report_needed;
  bool? weekly_report_posted;
  DateTime? start_date;
  DateTime? finish_deadline;
  DateTime? finish_date;
  DateTime? closed_date;
  double? accepted_budget;
  String?  accepted_budget_str;
  int?progress;
  int?arbitration_id;
  String?  arbitration_str;
  String?  arbitration_url;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  DateTime? last_bump;

	
	 ItemMyProjects(
			this.buttons,
			this.project_id,			
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_url,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.accepted_worker_photo_url,
			this.accepted_worker_photo,
			this.accepted_worker_kabupaten_id,
			this.accepted_worker_kabupaten_str,
			this.accepted_worker_worker_rating_num,
			this.accepted_worker_worker_rating_num_str,
			this.accepted_worker_worker_point,
			this.accepted_worker_worker_point_str,
			this.accepted_worker_worker_ranking,
			this.accepted_worker_worker_ranking_str,
			this.owner_owner_rating_num,
			this.owner_owner_rating_num_str,
			this.owner_owner_point,
			this.owner_owner_point_str,
			this.owner_owner_ranking,
			this.owner_owner_ranking_str,
			this.title,
			this.short_description,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.published_budget,
			this.published_budget_str,
			this.published_date,
			this.select_deadline,
			this.finish_days,
			this.finish_days_str,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.bid_count,
			this.bid_count_str,
			this.need_weekly_report,
			this.weekly_report_needed,
			this.weekly_report_posted,
			this.start_date,
			this.finish_deadline,
			this.finish_date,
			this.closed_date,
			this.accepted_budget,
			this.accepted_budget_str,
			this.progress,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_url,
			this.arbitration_list,
			this.arbitration_list_str,
			this.last_bump,

  );
	

	
  factory ItemMyProjects.fromJson(Map<String, dynamic> json) => _$ItemMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyProjectsToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

