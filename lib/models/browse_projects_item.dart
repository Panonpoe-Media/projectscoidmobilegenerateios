
import 'package:projectscoid/models/browse_projects_item_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
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
import 'package:json_annotation/json_annotation.dart';
part 'browse_projects_item.g.dart';
/** AUTOGENERATE OFF **/
class ItemBrowseProjectsBaseRev {
 var item;
 Map<String, dynamic> json;
 ItemBrowseProjectsBaseRev(this.json){
  item = ItemBrowseProjectsRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget> buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item.buttons.length; i++) {
   buttonChildren.add(itemButton( i, context));
  }
 }


 Widget itemButton( int? index, BuildContext context){
  return(
      TextButton(
       child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
       style: ButtonStyle(
        textStyle:
        MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: CurrentTheme.MainAccentColor)),
        backgroundColor:
        MaterialStateProperty.all<Color>(
         CurrentTheme.SecondaryAccentColor,),
       ),
       onPressed: () {
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
       },
      )
  );
 }


 Widget viewPhoto (BuildContext context) {
  return(  ImageView(
   value: item.owner_photo_url,
   caption: 'Photo',
  ));}
 Widget viewUserName (BuildContext context) {
  return(  StringView(
   value:item.owner_user_name,
   caption: 'User Name',
  ));}
 Widget viewKabupaten (BuildContext context) {
  return(  StringView(
   value: item.owner_kabupaten_str,
   caption: 'Kabupaten',
  ));}
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

 Widget viewProjectsOwned (BuildContext context) {
   return(
       NumberView(
         value: item.owner_projects_owned,
         caption: 'Projects Owned',
       )
   );}

 Widget viewOwner (BuildContext context) {
   return(  ModelView(
     value: item.owner_id,
     caption: 'Owner',
     idenum: item.owner_list,
     nameenum: item.owner_str,
   ));}

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
   getValue: (String? val) {
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

}



@JsonSerializable()
class ItemBrowseProjectsRev{

 int?    age;
 int?    cnt;
 int?    page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

 List<ItemButton?>? buttons;
 String? project_id;
 String? owner_photo_url;
 Photo? owner_photo;
 String? owner_user_name;
 int? owner_kabupaten_id;
 String? owner_kabupaten_str;
 String? owner_url;
 int?  owner_owner_rating;
 double?  owner_owner_rating_num;
 String? owner_owner_rating_num_str;
 int?  owner_owner_point;
 String? owner_owner_point_str;
 int?  owner_owner_ranking;
 String? owner_owner_ranking_str;
 int? owner_projects_owned;
 String? title;
 String? short_description;
 List<int?>? channels_id;
 List<String?>?  channels_str;
 List<String?>? channels_url;
 int? project_class_id;
 String? project_class_str;
 List<int?>? project_class_list;
 List<String?>? project_class_list_str;
 String? budget_range;
 double? budget_range_min;
 String? budget_range_min_str;
 double? budget_range_max;
 String? budget_range_max_str;
 String? budget_range_str;
 double? published_budget;
 String? published_budget_str;
 DateTime? published_date;
 DateTime? select_deadline;
 int? finish_days;
 String? finish_days_str;
 int? project_status_id;
 String? project_status_str;
 List<int?>? project_status_list;
 List<String?>? project_status_list_str;
 int? bid_count;
 String? bid_count_str;
 bool? need_weekly_report;


 ItemBrowseProjectsRev(
     this.buttons,
     this.project_id,
     this.owner_photo_url,
     this.owner_photo,
     this.owner_kabupaten_id,
     this.owner_kabupaten_str,
     this.owner_url,
     this.owner_owner_rating_num,
     this.owner_owner_rating_num_str,
     this.owner_owner_point,
     this.owner_owner_point_str,
     this.owner_owner_ranking,
     this.owner_owner_ranking_str,
     this.owner_projects_owned,
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
     this.bid_count,
     this.bid_count_str,
     this.need_weekly_report,

     );



 factory ItemBrowseProjectsRev.fromJson(Map<String, dynamic> json) => _$ItemBrowseProjectsRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemBrowseProjectsRevToJson(this);




}

/*
ItemBrowseProjectsRev _$ItemBrowseProjectsRevFromJson(Map<String, dynamic> json) {
 return ItemBrowseProjectsRev(
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),
     json['project_id'] as String,
     json['owner_photo_url'] as String,
     json['owner_photo'] == null
         ? null
         : Photo.fromJson(json['owner_photo'] as Map<String, dynamic>),
     json['owner_kabupaten_id'] as int,
     json['owner_kabupaten_str'] as String,
     json['owner_url'] as String,
     (json['owner_owner_rating_num'] as num)?.toDouble(),
     json['owner_owner_rating_num_str'] as String,
     json['owner_owner_point'] as int,
     json['owner_owner_point_str'] as String,

     json['owner_owner_ranking'] as int,
     json['owner_owner_ranking_str'] as String,
     json['owner_projects_owned'] as int,
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
     json['budget_range'] as String,
     (json['budget_range_min'] as num)?.toDouble(),
     json['budget_range_min_str'] as String,
     (json['budget_range_max'] as num)?.toDouble(),
     json['budget_range_max_str'] as String,
     json['budget_range_str'] as String,
     (json['published_budget'] as num)?.toDouble(),
     json['published_budget_str'] as String,
     json['published_date'] == null
         ? null
         : DateTime.parse(json['published_date'] as String),
     json['select_deadline'] == null
         ? null
         : DateTime.parse(json['select_deadline'] as String),
     json['finish_days'] as int,
     json['finish_days_str'] as String,
     json['project_status_id'] as int,
     json['project_status_str'] as String,
     (json['project_status_list'] as List)?.map((e) => e as int)?.toList(),
     (json['project_status_list_str'] as List)
         ?.map((e) => e as String)
         ?.toList(),
     json['bid_count'] as int,
     json['bid_count_str'] as String,

     json['need_weekly_report'] as bool)
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String
  ..owner_user_name = json['owner_user_name'] as String
  ..owner_owner_rating = json['owner_owner_rating'] as int;
}

Map<String, dynamic> _$ItemBrowseProjectsRevToJson(ItemBrowseProjectsRev instance) =>
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
     'owner_photo_url': instance.owner_photo_url,
     'owner_photo': instance.owner_photo,
     'owner_user_name': instance.owner_user_name,
     'owner_kabupaten_id': instance.owner_kabupaten_id,
     'owner_kabupaten_str': instance.owner_kabupaten_str,
      'owner_url': instance.owner_url,
     'owner_owner_rating': instance.owner_owner_rating,
     'owner_owner_rating_num': instance.owner_owner_rating_num,
     'owner_owner_rating_num_str': instance.owner_owner_rating_num_str,
     'owner_owner_point': instance.owner_owner_point,
     'owner_owner_point_str': instance.owner_owner_point_str,
     'owner_owner_ranking': instance.owner_owner_ranking,
     'owner_owner_ranking_str': instance.owner_owner_ranking_str,
     'owner_projects_owned' : instance.owner_projects_owned,
     'title': instance.title,
     'short_description': instance.short_description,
     'channels_id': instance.channels_id,
     'channels_str': instance.channels_str,
     'channels_url': instance.channels_url,
     'project_class_id': instance.project_class_id,
     'project_class_str': instance.project_class_str,
     'project_class_list': instance.project_class_list,
     'project_class_list_str': instance.project_class_list_str,
     'budget_range': instance.budget_range,
     'budget_range_min': instance.budget_range_min,
     'budget_range_min_str': instance.budget_range_min_str,
     'budget_range_max': instance.budget_range_max,
     'budget_range_max_str': instance.budget_range_max_str,
     'budget_range_str': instance.budget_range_str,
     'published_date': instance.published_date?.toIso8601String(),
     'published_budget': instance.published_budget,
     'published_budget_str': instance.published_budget_str,
     'finish_days': instance.finish_days,
     'finish_days_str': instance.finish_days_str,
     'project_status_id': instance.project_status_id,
     'project_status_str': instance.project_status_str,
     'project_status_list': instance.project_status_list,
     'project_status_list_str': instance.project_status_list_str,
     'bid_count': instance.bid_count,
     'bid_count_str': instance.bid_count_str,
     'select_deadline': instance.select_deadline?.toIso8601String(),
     'need_weekly_report': instance.need_weekly_report
    };

 */


class ItemBrowseProjectsModel extends ItemBrowseProjectsBaseRev{
 Map<String, dynamic> json;
  ItemBrowseProjectsModel(Map<String, dynamic> this.json):super(json);
}








  






  

