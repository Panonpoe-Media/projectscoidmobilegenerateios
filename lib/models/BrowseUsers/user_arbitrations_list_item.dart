

import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';



import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';

/** AUTOGENERATE OFF **/
class ItemUserArbitrationsRevBase {
 var item;
 Map<String, dynamic> json;
 ItemUserArbitrationsRevBase(this.json){
  item = ItemUserArbitrationsRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget?>? buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item.buttons.length; i++) {
   buttonChildren!.add(itemButton( i, context));
  }
 }


 Widget itemButton( int? index, BuildContext context){
  return(
      TextButton(
       child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
        style: ButtonStyle(
          textStyle:
          MaterialStateProperty.all<TextStyle>(
              const TextStyle(color:  CurrentTheme.MainAccentColor)),
          backgroundColor:
          MaterialStateProperty.all<Color>(
              CurrentTheme.SecondaryAccentColor),
        ),
       onPressed: () {
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
       },
      )
  );
 }


 Widget viewProject (BuildContext context) {
  return(  ModelView(
   value: item.project_id,
   caption: 'Project',
   idenum: item.project_list,
   nameenum: item.project_str,
  ));}
 Widget viewPlaintiff (BuildContext context) {
  return(  ModelView(
   value: item.plaintiff_id,
   caption: 'Plaintiff',
   idenum: item.plaintiff_list,
   nameenum: item.plaintiff_str,
  ));}
 Widget viewRequestedDate (BuildContext context) {
  return(  DateTimeView(
   value: item.requested_date,
   caption: 'Requested Date',
  ));}
 Widget viewPlaintiffDescription (BuildContext context) {
  return(  ArticleView(
   value: item.plaintiff_description,
   caption: 'Plaintiff Description',
  ));}
 Widget viewPlaintiffWishes (BuildContext context) {
  return(  ArticleView(
   value: item.plaintiff_wishes,
   caption: 'Plaintiff Wishes',
  ));}
 Widget viewDefendant (BuildContext context) {
  return(  ModelView(
   value: item.defendant_id,
   caption: 'Defendant',
   idenum: item.defendant_list,
   nameenum: item.defendant_str,
  ));}
 Widget viewDefendantResponseDate (BuildContext context) {
  return(  DateTimeView(
   value: item.defendant_response_date,
   caption: 'Defendant Response Date',
  ));}
 Widget viewDefendantDescription (BuildContext context) {
  return(  ArticleView(
   value: item.defendant_description,
   caption: 'Defendant Description',
  ));}
 Widget viewDefendantWishes (BuildContext context) {
  return(  ArticleView(
   value: item.defendant_wishes,
   caption: 'Defendant Wishes',
  ));}
 Widget viewAnalysis (BuildContext context) {
  return(  ArticleView(
   value: item.analysis,
   caption: 'Analysis',
  ));}
 Widget viewDecidedDate (BuildContext context) {
  return(  DateTimeView(
   value: item.decided_date,
   caption: 'Decided Date',
  ));}
 Widget viewStatus (BuildContext context) {
  return(
      EnumView(
       value: item.status_id,
       caption: 'Status',
       idenum: item.status_list,
       nameenum: item.status_str,
      ));}
 Widget viewType (BuildContext context) {
  return(
      EnumView(
       value: item.type_id,
       caption: 'Type',
       idenum: item.type_list,
       nameenum: item.type_str,
      ));}
 Widget viewOwnerRating (BuildContext context) {
  return(  RatingView(
      value: item.owner_rating,
      caption: 'Owner Rating'
  ));}
 Widget viewOwnerPoint (BuildContext context) {
  return(  NumberView(
   value: item.owner_point,
   caption: 'Owner Point',
  ));}
 Widget viewOwnerAmount (BuildContext context) {
  return(  MoneyView(
   value: item.owner_amount,
   caption: 'Owner Amount',
  ));}
 Widget viewOwnerPercentage (BuildContext context) {
  return(  PercentView(
   value: item.owner_percentage,
   caption: 'Owner Percentage',
  ));}
 Widget viewWorkerRating (BuildContext context) {
  return(  RatingView(
      value: item.worker_rating,
      caption: 'Worker Rating'
  ));}
 Widget viewWorkerPoint (BuildContext context) {
  return(  NumberView(
   value: item.worker_point,
   caption: 'Worker Point',
  ));}
 Widget viewWorkerAmount (BuildContext context) {
  return(  MoneyView(
   value: item.worker_amount,
   caption: 'Worker Amount',
  ));}
 Widget viewWorkerPercentage (BuildContext context) {
  return(  PercentView(
   value: item.worker_percentage,
   caption: 'Worker Percentage',
  ));}

}


class ItemUserArbitrationsRev{

 int?    age;
 int?    cnt;
 int?    page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

// List<ItemButton?>? buttons;
 String? arbitration_id;
 int? project_id;
 String? project_str;
 String? project_url;
// List<int?>? project_list;
 //List<String?>? project_list_str;
 int? plaintiff_id;
 String? plaintiff_str;
 String? plaintiff_url;
// List<int?>? plaintiff_list;
// List<String?>? plaintiff_list_str;
 DateTime? requested_date;
 String? plaintiff_description;
 String? plaintiff_wishes;
 int? defendant_id;
 String? defendant_str;
 String? defendant_url;
// List<int?>? defendant_list;
// List<String?>? defendant_list_str;
 DateTime? defendant_response_date;
 String? defendant_description;
 String? defendant_wishes;
 String? analysis;
 DateTime? decided_date;
 int? status_id;
 String? status_str;
// List<int?>? status_list;
// List<String?>? status_list_str;
 int? type_id;
 String? type_str;
// List<int?>? type_list;
// List<String?>? type_list_str;
 int? owner_rating;
 int? owner_point;
 String? owner_point_str;
 double? owner_amount;
 String? owner_amount_str;
 int? owner_percentage;
 int? worker_rating;
 int? worker_point;
 String? worker_point_str;
 double? worker_amount;
 String? worker_amount_str;
 int? worker_percentage;
 String? plaintiff_avatar;
 String? defendant_avatar;


 ItemUserArbitrationsRev(
   //  this.buttons,
     this.arbitration_id,
     this.project_id,
     this.project_str,
     this.project_url,
   //  this.project_list,
  //   this.project_list_str,
     this.plaintiff_id,
     this.plaintiff_str,
     this.plaintiff_url,
   //  this.plaintiff_list,
   //  this.plaintiff_list_str,
     this.requested_date,
     this.plaintiff_description,
     this.plaintiff_wishes,
     this.defendant_id,
     this.defendant_str,
     this.defendant_url,
   //  this.defendant_list,
   //  this.defendant_list_str,
     this.defendant_response_date,
     this.defendant_description,
     this.defendant_wishes,
     this.analysis,
     this.decided_date,
     this.status_id,
     this.status_str,
 //    this.status_list,
//     this.status_list_str,
     this.type_id,
     this.type_str,
 //    this.type_list,
  //   this.type_list_str,
     this.owner_rating,
     this.owner_point,
     this.owner_point_str,
     this.owner_amount,
     this.owner_amount_str,
     this.owner_percentage,
     this.worker_rating,
     this.worker_point,
     this.worker_point_str,
     this.worker_amount,
     this.worker_amount_str,
     this.worker_percentage,
     this.plaintiff_avatar,
     this.defendant_avatar,

     );



 factory ItemUserArbitrationsRev.fromJson(Map<String, dynamic> json) => _$ItemUserArbitrationsRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemUserArbitrationsRevToJson(this);




}


ItemUserArbitrationsRev _$ItemUserArbitrationsRevFromJson(Map<String, dynamic> json) {
 return ItemUserArbitrationsRev(
  //   (json['buttons'] as List)
  //       ?.map((e) =>
  //   e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
  //       ?.toList(),
     json['arbitration_id'] as String?,
     json['project_id'] as int?,
     json['project_str'] as String?,
     json['project_url'] as String?,
  //   (json['project_list'] as List)?.map((e) => e as int)?.toList(),
 //    (json['project_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['plaintiff_id'] as int?,
     json['plaintiff_str'] as String?,
     json['plaintiff_url'] as String?,
  //   (json['plaintiff_list'] as List)?.map((e) => e as int)?.toList(),
   //  (json['plaintiff_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['requested_date'] == null
         ? null
         : DateTime.parse(json['requested_date'] as String),
     json['plaintiff_description'] as String?,
     json['plaintiff_wishes'] as String?,
     json['defendant_id'] as int?,
     json['defendant_str'] as String?,
     json['defendant_url'] as String?,
   //  (json['defendant_list'] as List)?.map((e) => e as int)?.toList(),
  //   (json['defendant_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['defendant_response_date'] == null
         ? null
         : DateTime.parse(json['defendant_response_date'] as String),
     json['defendant_description'] as String?,
     json['defendant_wishes'] as String?,
     json['analysis'] as String?,
     json['decided_date'] == null
         ? null
         : DateTime.parse(json['decided_date'] as String),
     json['status_id'] as int?,
     json['status_str'] as String?,
 //    (json['status_list'] as List)?.map((e) => e as int)?.toList(),
 //    (json['status_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['type_id'] as int?,
     json['type_str'] as String?,
 //    (json['type_list'] as List)?.map((e) => e as int)?.toList(),
 //    (json['type_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['owner_rating'] as int?,
     json['owner_point'] as int?,
     json['owner_point_str'] as String?,
     (json['owner_amount'] as num)?.toDouble(),
     json['owner_amount_str'] as String?,
     json['owner_percentage'] as int?,
     json['worker_rating'] as int?,
     json['worker_point'] as int?,
     json['worker_point_str'] as String?,
     (json['worker_amount'] as num)?.toDouble(),
     json['worker_amount_str'] as String?,
     json['worker_percentage'] as int?,
     json['plaintiff_avatar'] as String?,
     json['defendant_avatar'] as String?
 )
  ..age = json['age'] as int?
  ..cnt = json['cnt'] as int?
  ..page = json['page'] as int?
  ..id = json['id'] as String?
  ..ttl = json['ttl'] as String?
  ..pht = json['pht'] as String?
  ..sbttl = json['sbttl'] as String?;
}

Map<String, dynamic> _$ItemUserArbitrationsRevToJson(
    ItemUserArbitrationsRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,
   //  'buttons': instance.buttons,
     'arbitration_id': instance.arbitration_id,
     'project_id': instance.project_id,
     'project_str': instance.project_str,
     'project_url': instance.project_url,
  //   'project_list': instance.project_list,
   //  'project_list_str': instance.project_list_str,
     'plaintiff_id': instance.plaintiff_id,
     'plaintiff_str': instance.plaintiff_str,
     'plaintiff_url': instance.plaintiff_url,
  //   'plaintiff_list': instance.plaintiff_list,
  //   'plaintiff_list_str': instance.plaintiff_list_str,
     'requested_date': instance.requested_date?.toIso8601String(),
     'plaintiff_description': instance.plaintiff_description,
     'plaintiff_wishes': instance.plaintiff_wishes,
     'defendant_id': instance.defendant_id,
     'defendant_str': instance.defendant_str,
     'defendant_url': instance.defendant_url,
   //  'defendant_list': instance.defendant_list,
   //  'defendant_list_str': instance.defendant_list_str,
     'defendant_response_date':
     instance.defendant_response_date?.toIso8601String(),
     'defendant_description': instance.defendant_description,
     'defendant_wishes': instance.defendant_wishes,
     'analysis': instance.analysis,
     'decided_date': instance.decided_date?.toIso8601String(),
     'status_id': instance.status_id,
     'status_str': instance.status_str,
  //   'status_list': instance.status_list,
  //   'status_list_str': instance.status_list_str,
     'type_id': instance.type_id,
     'type_str': instance.type_str,
  //   'type_list': instance.type_list,
  //   'type_list_str': instance.type_list_str,
     'owner_rating': instance.owner_rating,
     'owner_point': instance.owner_point,
     'owner_point_str': instance.owner_point_str,
     'owner_amount': instance.owner_amount,
     'owner_amount_str': instance.owner_amount_str,
     'owner_percentage': instance.owner_percentage,
     'worker_rating': instance.worker_rating,
     'worker_point': instance.worker_point,
     'worker_point_str': instance.worker_point_str,
     'worker_amount': instance.worker_amount,
     'worker_amount_str': instance.worker_amount_str,
     'worker_percentage': instance.worker_percentage,
     'project_url': instance.plaintiff_avatar,
     'defendant_avatar': instance.defendant_avatar,
      'plaintiff_avatar': instance.plaintiff_avatar
    };


class ItemUserArbitrationsModel extends ItemUserArbitrationsRevBase{
 Map<String, dynamic> json;
  ItemUserArbitrationsModel(Map<String, dynamic> this.json):super(json);
}













  

