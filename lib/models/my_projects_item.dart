
import 'package:projectscoid/models/my_projects_item_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'my_projects_item.dart';
//import 'my_projects_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_projects_item.g.dart';
/** AUTOGENERATE OFF **/


class ItemMyProjectsBaseRev {
 ItemMyProjectsRev? item;
 Map<String, dynamic> json;
 ItemMyProjectsBaseRev(this.json){
  item = ItemMyProjectsRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget> buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item!.buttons!.length; i++) {
   buttonChildren.add(itemButton( i, context));
  }
 }


 Widget itemButton( int index, BuildContext context){
  return(
      FlatButton(
       child: Text(item!.buttons![index]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
       textColor: CurrentTheme.MainAccentColor,
       splashColor : CurrentTheme.ShadeColor,
       color : CurrentTheme.SecondaryAccentColor,
       onPressed: () {
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item!.buttons![index]!.url!));
       },
      )
  );
 }


 Widget viewOwner (BuildContext context) {
  return(  ModelView(
   value: item!.owner_id,
   caption: 'Owner',
   idenum: item!.owner_list,
   nameenum: item!.owner_str,
  ));}
 Widget viewAcceptedWorker (BuildContext context) {
  return(  ModelView(
   value: item!.accepted_worker_id,
   caption: 'Accepted Worker',
   idenum: item!.accepted_worker_list,
   nameenum: item!.accepted_worker_str,
  ));}
 Widget viewPhoto (BuildContext context) {
  return(  ImageView(
   value: item!.accepted_worker_photo_url,
   caption: 'Photo',
  ));}
 Widget viewUserName (BuildContext context) {
  return(  StringView(
   value:item!.accepted_worker_user_name,
   caption: 'User Name',
  ));}
 Widget viewKabupaten (BuildContext context) {
  return(  StringView(
   value: item!.accepted_worker_kabupaten_str,
   caption: 'Kabupaten',
  ));}
 Widget viewWorkerRating (BuildContext context) {
  return(  RatingView(
   value: item!.accepted_worker_worker_rating,
   caption: 'Worker Rating',
  ));}
 Widget viewWorkerRatingNum (BuildContext context) {
  return(  DoubleView(
   value: item!.accepted_worker_worker_rating_num,
   caption: 'Worker Rating Num',
  ));}

 Widget viewWorkerPoint (BuildContext context) {
  return(
      NumberView(
       value: item!.accepted_worker_worker_point,
       caption: 'Worker Point',
      )
  );}
 Widget viewWorkerRanking (BuildContext context) {
  return(
      NumberView(
       value: item!.accepted_worker_worker_ranking,
       caption: 'Worker Ranking',
      )
  );}
 Widget viewOwnerRating (BuildContext context) {
  return(  RatingView(
   value: item!.owner_owner_rating,
   caption: 'Owner Rating',
  ));}
 Widget viewOwnerRatingNum (BuildContext context) {
  return(  DoubleView(
   value: item!.owner_owner_rating_num,
   caption: 'Owner Rating Num',
  ));}

 Widget viewOwnerPoint (BuildContext context) {
  return(
      NumberView(
       value: item!.owner_owner_point,
       caption: 'Owner Point',
      )
  );}
 Widget viewOwnerRanking (BuildContext context) {
  return(
      NumberView(
       value: item!.owner_owner_ranking,
       caption: 'Owner Ranking',
      )
  );}
 Widget viewTitle (BuildContext context) {
  return(  TitleView(
   value: item!.title,
   caption: 'Title',
  ));}
 Widget viewShortDescription (BuildContext context) {
  return(  DisplayNameView(
   value: item!.short_description,
   caption: 'Short Description',
  ));}
 Widget viewChannels (BuildContext context) {
  return( 	ChannelRouteTagsWidget(
   value: item!.channels_id,
   caption: '',
   hint: ' ',
   required: true,
   idroutetags: item!.channels_id,
   nameroutetags: item!.channels_str,
   urlroutetags: item!.channels_url,
   getValue: (String? val) {
    AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
   },
  ));}


 Widget viewProjectClass (BuildContext context) {
  return(
      EnumView(
       value: item!.project_class_id,
       caption: 'Project Class',
       idenum: item!.project_class_list,
       nameenum: item!.project_class_str,
      ));}
 Widget viewPublishedDate (BuildContext context) {
  return(  DateTimeView(
   value: item!.published_date,
   caption: 'Published Date',
  ));}
 Widget viewPublishedBudget (BuildContext context) {
  return(  MoneyView(
   value: item!.published_budget,
   caption: 'Published Budget',
  ));}
 Widget viewFinishDays (BuildContext context) {
  return(  NumberView(
   value: item!.finish_days,
   caption: 'Finish Days',
  ));}
 Widget viewProjectStatus (BuildContext context) {
  return(
      EnumView(
       value: item!.project_status_id,
       caption: 'Project Status',
       idenum: item!.project_status_list,
       nameenum: item!.project_status_str,
      ));}
 Widget viewBudgetRange (BuildContext context) {
  return(  RangeView(
      value: item!.budget_range_str,
      caption: 'Budget Range'
  ));}
 Widget viewProjectEnding (BuildContext context) {
  return(
      EnumView(
       value: item!.project_ending_id,
       caption: 'Project Ending',
       idenum: item!.project_ending_list,
       nameenum: item!.project_ending_str,
      ));}
 Widget viewBidCount (BuildContext context) {
  return(  NumberView(
   value: item!.bid_count,
   caption: 'Bid Count',
  ));}
 Widget viewSelectDeadline (BuildContext context) {
  return(  DateTimeView(
   value: item!.select_deadline,
   caption: 'Select Deadline',
  ));}
 Widget viewNeedWeeklyReport (BuildContext context) {
  return(  BooleanView(
   value: item!.need_weekly_report,
   caption: 'Need Weekly Report',
  ));}
 Widget viewWeeklyReportNeeded (BuildContext context) {
  return(  BooleanView(
   value: item!.weekly_report_needed,
   caption: 'Weekly Report Needed',
  ));}
 Widget viewWeeklyReportPosted (BuildContext context) {
  return(  BooleanView(
   value: item!.weekly_report_posted,
   caption: 'Weekly Report Posted',
  ));}
 Widget viewStartDate (BuildContext context) {
  return(  DateTimeView(
   value: item!.start_date,
   caption: 'Start Date',
  ));}
 Widget viewFinishDeadline (BuildContext context) {
  return(  DateTimeView(
   value: item!.finish_deadline,
   caption: 'Finish Deadline',
  ));}
 Widget viewFinishDate (BuildContext context) {
  return(  DateTimeView(
   value: item!.finish_date,
   caption: 'Finish Date',
  ));}
 Widget viewClosedDate (BuildContext context) {
  return(  DateTimeView(
   value: item!.closed_date,
   caption: 'Closed Date',
  ));}
 Widget viewAcceptedBudget (BuildContext context) {
  return(  MoneyView(
   value: item!.accepted_budget,
   caption: 'Accepted Budget',
  ));}
 Widget viewProgress (BuildContext context) {
  return(  PercentView(
   value: item!.progress,
   caption: 'Progress',
  ));}
 Widget viewArbitration (BuildContext context) {
  return(  ModelView(
   value: item!.arbitration_id,
   caption: 'Arbitration',
   idenum: item!.arbitration_list,
   nameenum: item!.arbitration_str,
  ));}
 Widget viewLastBump (BuildContext context) {
  return(  DateTimeView(
   value: item!.last_bump,
   caption: 'Last Bump',
  ));}

}



@JsonSerializable()
class ItemMyProjectsRev{

 int?   age;
 int?   cnt;
 int?   page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

 List<ItemButton?>? buttons;
 String? project_id;
 int?owner_id;
 String? owner_str;
 String? owner_url;
 List<int?>? owner_list;
 List<String?>? owner_list_str;
 int?accepted_worker_id;
 String? accepted_worker_str;
 String? accepted_worker_url;
 List<int?>? accepted_worker_list;
 List<String?>? accepted_worker_list_str;
 String? accepted_worker_photo_url;
 Photo? accepted_worker_photo;
 String? accepted_worker_user_name;
 int?accepted_worker_kabupaten_id;
 String? accepted_worker_kabupaten_str;
 int? accepted_worker_worker_rating;
 double?  accepted_worker_worker_rating_num;
 String? accepted_worker_worker_rating_num_str;
 int? accepted_worker_worker_point;
 String? accepted_worker_worker_point_str;
 int? accepted_worker_worker_ranking;
 String? accepted_worker_worker_ranking_str;
 String? owner_photo_url;
 int? owner_owner_rating;
 double?  owner_owner_rating_num;
 String? owner_owner_rating_num_str;
 int? owner_owner_point;
 String? owner_owner_point_str;
 int? owner_owner_ranking;
 String? owner_owner_ranking_str;
 String? title;
 String? short_description;
 List<int?>? channels_id;
 List<String?>?  channels_str;
 List<String?>? channels_url;
 int?project_class_id;
 String? project_class_str;
 List<int?>? project_class_list;
 List<String?>? project_class_list_str;
 DateTime? published_date;
 String? budget_range;
 double? budget_range_min;
 String? budget_range_min_str;
 double? budget_range_max;
 String? budget_range_max_str;
 String? budget_range_str;
 double? published_budget;
 String? published_budget_str;
 int?finish_days;
 String? finish_days_str;
 int?project_status_id;
 String? project_status_str;
 List<int?>? project_status_list;
 List<String?>? project_status_list_str;
 int?project_ending_id;
 String? project_ending_str;
 List<int?>? project_ending_list;
 List<String?>? project_ending_list_str;
 int?bid_count;
 String? bid_count_str;
 DateTime? select_deadline;
 bool? need_weekly_report;
 bool? weekly_report_needed;
 bool? weekly_report_posted;
 DateTime? start_date;
 DateTime? finish_deadline;
 DateTime? finish_date;
 DateTime? closed_date;
 double? accepted_budget;
 String? accepted_budget_str;
 int?progress;
 int?arbitration_id;
 String? arbitration_str;
 String? arbitration_url;
 List<int?>? arbitration_list;
 List<String?>? arbitration_list_str;
 DateTime? last_bump;


 ItemMyProjectsRev(
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
     this.owner_photo_url,
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
     this.published_date,
     this.budget_range,
     this.budget_range_min,
     this.budget_range_min_str,
     this.budget_range_max,
     this.budget_range_max_str,
     this.budget_range_str,
     this.published_budget,
     this.published_budget_str,
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
     this.select_deadline,
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



 factory ItemMyProjectsRev.fromJson(Map<String, dynamic> json) => _$ItemMyProjectsRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemMyProjectsRevToJson(this);
}
/*
ItemMyProjectsRev _$ItemMyProjectsRevFromJson(Map<String, dynamic> json) {
 return ItemMyProjectsRev(
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),
     json['project_id'] as String,
     json['owner_id'] as int,
     json['owner_str'] as String,
     json['owner_url'] as String,
     (json['owner_list'] as List)?.map((e) => e as int)?.toList(),
     (json['owner_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['accepted_worker_id'] as int,
     json['accepted_worker_str'] as String,
     json['accepted_worker_url'] as String,
     (json['accepted_worker_list'] as List)?.map((e) => e as int)?.toList(),
     (json['accepted_worker_list_str'] as List)
         ?.map((e) => e as String)
         ?.toList(),
     json['accepted_worker_photo_url'] as String,
     json['accepted_worker_photo'] == null
         ? null
         : Photo.fromJson(
         json['accepted_worker_photo'] as Map<String, dynamic>),
     json['accepted_worker_kabupaten_id'] as int,
     json['accepted_worker_kabupaten_str'] as String,
     (json['accepted_worker_worker_rating_num'] as num)?.toDouble(),
     json['accepted_worker_worker_rating_num_str'] as String,
     json['accepted_worker_worker_point'] as int,
     json['accepted_worker_worker_point_str'] as String,
     json['accepted_worker_worker_ranking'] as int,
     json['accepted_worker_worker_ranking_str'] as String,
     json['owner_photo_url'] as String,
     (json['owner_owner_rating_num'] as num)?.toDouble(),
     json['owner_owner_rating_num_str'] as String,
     json['owner_owner_point'] as int,
     json['owner_owner_point_str'] as String,
     json['owner_owner_ranking'] as int,
     json['owner_owner_ranking_str'] as String,
     json['title'] as String,
     json['short_description'] as String,
     (json['channels_id'] as List)?.map((e) => e as int)?.toList(),
     (json['channels_str'] as List)?.map((e) => e as String)?.toList(),
     (json['channels_url'] as List)?.map((e) => e as String)?.toList(),

     json['project_class_id'] as int,
     json['project_class_str'] as String,
     (json['project_class_list'] as List)?.map((e) => e as int)?.toList(),
     (json['project_class_list_str'] as List)
         ?.map((e) => e as String)
         ?.toList(),
     json['published_date'] == null
         ? null
         : DateTime.parse(json['published_date'] as String),
     json['budget_range'] as String,
     (json['budget_range_min'] as num)?.toDouble(),
     json['budget_range_min_str'] as String,
     (json['budget_range_max'] as num)?.toDouble(),
     json['budget_range_max_str'] as String,
     json['budget_range_str'] as String,
     (json['published_budget'] as num)?.toDouble(),
     json['published_budget_str'] as String,
     json['finish_days'] as int,
     json['finish_days_str'] as String,
     json['project_status_id'] as int,
     json['project_status_str'] as String,
     (json['project_status_list'] as List)?.map((e) => e as int)?.toList(),
     (json['project_status_list_str'] as List)
         ?.map((e) => e as String)
         ?.toList(),
     json['project_ending_id'] as int,
     json['project_ending_str'] as String,
     (json['project_ending_list'] as List)?.map((e) => e as int)?.toList(),
     (json['project_ending_list_str'] as List)
         ?.map((e) => e as String)
         ?.toList(),
     json['bid_count'] as int,
     json['bid_count_str'] as String,
     json['select_deadline'] == null
         ? null
         : DateTime.parse(json['select_deadline'] as String),
     json['need_weekly_report'] as bool,
     json['weekly_report_needed'] as bool,
     json['weekly_report_posted'] as bool,
     json['start_date'] == null
         ? null
         : DateTime.parse(json['start_date'] as String),
     json['finish_deadline'] == null
         ? null
         : DateTime.parse(json['finish_deadline'] as String),
     json['finish_date'] == null
         ? null
         : DateTime.parse(json['finish_date'] as String),
     json['closed_date'] == null
         ? null
         : DateTime.parse(json['closed_date'] as String),
     (json['accepted_budget'] as num)?.toDouble(),
     json['accepted_budget_str'] as String,
     json['progress'] as int,
     json['arbitration_id'] as int,
     json['arbitration_str'] as String,
     json['arbitration_url'] as String,
     (json['arbitration_list'] as List)?.map((e) => e as int)?.toList(),
     (json['arbitration_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['last_bump'] == null
         ? null
         : DateTime.parse(json['last_bump'] as String))
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String
  ..accepted_worker_user_name = json['accepted_worker_user_name'] as String
  ..accepted_worker_worker_rating =
  json['accepted_worker_worker_rating'] as int
  ..owner_owner_rating = json['owner_owner_rating'] as int;
}

Map<String, dynamic> _$ItemMyProjectsRevToJson(ItemMyProjectsRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,
     'buttons': instance.buttons,
     'project_id': instance.project_id,
     'owner_id': instance.owner_id,
     'owner_str': instance.owner_str,
     'owner_url': instance.owner_url,
     'owner_list': instance.owner_list,
     'owner_list_str': instance.owner_list_str,
     'accepted_worker_id': instance.accepted_worker_id,
     'accepted_worker_str': instance.accepted_worker_str,
     'accepted_worker_url': instance.accepted_worker_url,
     'accepted_worker_list': instance.accepted_worker_list,
     'accepted_worker_list_str': instance.accepted_worker_list_str,
     'accepted_worker_photo_url': instance.accepted_worker_photo_url,
     'accepted_worker_photo': instance.accepted_worker_photo,
     'accepted_worker_user_name': instance.accepted_worker_user_name,
     'accepted_worker_kabupaten_id': instance.accepted_worker_kabupaten_id,
     'accepted_worker_kabupaten_str': instance.accepted_worker_kabupaten_str,
     'accepted_worker_worker_rating': instance.accepted_worker_worker_rating,
     'accepted_worker_worker_rating_num':
     instance.accepted_worker_worker_rating_num,
     'accepted_worker_worker_rating_num_str':
     instance.accepted_worker_worker_rating_num_str,
     'accepted_worker_worker_point': instance.accepted_worker_worker_point,
     'accepted_worker_worker_point_str':
     instance.accepted_worker_worker_point_str,
     'accepted_worker_worker_ranking': instance.accepted_worker_worker_ranking,
     'accepted_worker_worker_ranking_str':
     instance.accepted_worker_worker_ranking_str,
     'owner_photo_url': instance.owner_photo_url,
     'owner_owner_rating': instance.owner_owner_rating,
     'owner_owner_rating_num': instance.owner_owner_rating_num,
     'owner_owner_rating_num_str': instance.owner_owner_rating_num_str,
     'owner_owner_point': instance.owner_owner_point,
     'owner_owner_point_str': instance.owner_owner_point_str,
     'owner_owner_ranking': instance.owner_owner_ranking,
     'owner_owner_ranking_str': instance.owner_owner_ranking_str,
     'title': instance.title,
     'short_description': instance.short_description,
     'channels_id': instance.channels_id,
     'channels_str': instance.channels_str,
     'channels_url': instance.channels_url,
     'project_class_id': instance.project_class_id,
     'project_class_str': instance.project_class_str,
     'project_class_list': instance.project_class_list,
     'project_class_list_str': instance.project_class_list_str,
     'published_date': instance.published_date?.toIso8601String(),
     'published_budget': instance.published_budget,
     'published_budget_str': instance.published_budget_str,
     'finish_days': instance.finish_days,
     'finish_days_str': instance.finish_days_str,
     'project_status_id': instance.project_status_id,
     'project_status_str': instance.project_status_str,
     'project_status_list': instance.project_status_list,
     'project_status_list_str': instance.project_status_list_str,
     'project_ending_id': instance.project_ending_id,
     'project_ending_str': instance.project_ending_str,
     'project_ending_list': instance.project_ending_list,
     'project_ending_list_str': instance.project_ending_list_str,
     'bid_count': instance.bid_count,
     'bid_count_str': instance.bid_count_str,
     'select_deadline': instance.select_deadline?.toIso8601String(),
     'need_weekly_report': instance.need_weekly_report,
     'weekly_report_needed': instance.weekly_report_needed,
     'weekly_report_posted': instance.weekly_report_posted,
     'start_date': instance.start_date?.toIso8601String(),
     'finish_deadline': instance.finish_deadline?.toIso8601String(),
     'finish_date': instance.finish_date?.toIso8601String(),
     'closed_date': instance.closed_date?.toIso8601String(),
     'accepted_budget': instance.accepted_budget,
     'accepted_budget_str': instance.accepted_budget_str,
     'progress': instance.progress,
     'arbitration_id': instance.arbitration_id,
     'arbitration_str': instance.arbitration_str,
     'arbitration_url': instance.arbitration_url,
     'arbitration_list': instance.arbitration_list,
     'arbitration_list_str': instance.arbitration_list_str,
     'last_bump': instance.last_bump?.toIso8601String()
    };

 */

class ItemMyProjectsModel extends ItemMyProjectsBaseRev{
 Map<String, dynamic> json;
  ItemMyProjectsModel(Map<String, dynamic> this.json):super(json);
}








  






  

