

import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:json_annotation/json_annotation.dart';
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






class ItemAsProjectOwnerRevBase {
 var item;
 Map<String, dynamic> json;
 ItemAsProjectOwnerRevBase(this.json){
  item = ItemAsProjectOwnerRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget?>? buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item.buttons.length; i++) {
   buttonChildren!.add(itemButton( i, context));
  }
 }


 Widget itemButton( int?  index, BuildContext context){
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


 Widget viewArbitration (BuildContext context) {
  return(  ModelView(
   value: item.arbitration_id,
   caption: 'Arbitration',
   idenum: item.arbitration_list,
   nameenum: item.arbitration_str,
  ));}
 Widget viewProjectEnding (BuildContext context) {
  return(
      EnumView(
       value: item.project_ending_id,
       caption: 'Project Ending',
       idenum: item.project_ending_list,
       nameenum: item.project_ending_str,
      ));}
 Widget viewOwnerRating (BuildContext context) {
  return(  RatingView(
      value: item.owner_rating,
      caption: 'Owner Rating'
  ));}
 Widget viewOwnerFeedback (BuildContext context) {
  return(  ArticleView(
   value: item.owner_feedback,
   caption: 'Owner Feedback',
  ));}
 Widget viewAcceptedWorker (BuildContext context) {
  return(  ModelView(
   value: item.accepted_worker_id,
   caption: 'Accepted Worker',
   idenum: item.accepted_worker_list,
   nameenum: item.accepted_worker_str,
  ));}
 Widget viewFinishDate (BuildContext context) {
  return(  DateTimeView(
   value: item.finish_date,
   caption: 'Finish Date',
  ));}
 Widget viewTitle (BuildContext context) {
  return(  TitleView(
   value: item.title,
   caption: 'Title',
  ));}

}




class ItemAsProjectOwnerRev{

 int?     age;
 int?     cnt;
 int?     page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

// List<ItemButton?>? buttons;
 String? project_id;
 int?  arbitration_id;
 String? arbitration_str;
 String? arbitration_url;
// List<int?>? arbitration_list;
// List<String?>? arbitration_list_str;
 int?  project_ending_id;
 String? project_ending_str;
// List<int?>? project_ending_list;
 //List<String?>? project_ending_list_str;
 int?  owner_rating;
 String? owner_feedback;
 int?  accepted_worker_id;

 String? accepted_worker_str;
 String? accepted_worker_url;
// List<int?>? accepted_worker_list;
// List<String?>? accepted_worker_list_str;
 DateTime? finish_date;
 String? title;
 String? project_url;
 String? accepted_worker_avatar;



 ItemAsProjectOwnerRev(

    // this.buttons,
     this.project_id,
     this.arbitration_id,
     this.arbitration_str,
     this.arbitration_url,
   //  this.arbitration_list,
   //  this.arbitration_list_str,
     this.project_ending_id,
     this.project_ending_str,
   //  this.project_ending_list,
    // this.project_ending_list_str,
     this.owner_rating,
     this.owner_feedback,
     this.accepted_worker_id,

     this.accepted_worker_str,
     this.accepted_worker_url,
    // this.accepted_worker_list,
    // this.accepted_worker_list_str,
     this.finish_date,
     this.title,
     this.project_url,
     this.accepted_worker_avatar,



     );



 factory ItemAsProjectOwnerRev.fromJson(Map<String, dynamic> json) => _$ItemAsProjectOwnerRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemAsProjectOwnerRevToJson(this);




}



ItemAsProjectOwnerRev _$ItemAsProjectOwnerRevFromJson(Map<String, dynamic> json) {

  var dt = (json['finish_date'] ?? '') ;
  if(dt.contains('\/')){
    dt =  dt.replaceAll(' WIB', '').replaceAll('WIB', '');
    var dtsp =  dt.split(' ');
    var dtsp2 = dtsp[0].split('\/');
    dt = '${dtsp2[2]}-${dtsp2[1]}-${dtsp2[0]} ${dtsp[1]}';

  }
 return ItemAsProjectOwnerRev(
/*
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),

 */
     json['project_id'] as String?,
     json['arbitration_id'] as int?,
     json['arbitration_str'] as String?,
     json['arbitration_url'] as String?,
   //  (json['arbitration_list'] as List)?.map((e) => e as int)?.toList(),
    // (json['arbitration_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['project_ending_id'] as int?,
     json['project_ending_str'] as String?,
  //   (json['project_ending_list'] as List)?.map((e) => e as int)?.toList(),
   //  (json['project_ending_list_str'] as List)
   //      ?.map((e) => e as String)
  //       ?.toList(),
     json['owner_rating'] as int?,
     json['owner_feedback'] as String?,
     json['accepted_worker_id'] as int?,

     json['accepted_worker_str'] as String?,
     json['accepted_worker_url'] as String?,
  //   (json['accepted_worker_list'] as List)?.map((e) => e as int)?.toList(),
   //  (json['accepted_worker_list_str'] as List)
    //     ?.map((e) => e as String)
    //     ?.toList(),
     json['finish_date'] == null
         ? null
         : DateTime.parse(dt),
     /*

     json['finish_date'] == null
         ? null
         : DateTime.parse(json['finish_date'] as String),
      */


     json['title'] as String?,
     json['project_url'] as String?,
     json['accepted_worker_avatar'] as String?

      )

  ..age = json['age'] as int?
  ..cnt = json['cnt'] as int?
  ..page = json['page'] as int?
  ..id = json['id'] as String?
  ..ttl = json['ttl'] as String?
  ..pht = json['pht'] as String?
  ..sbttl = json['sbttl'] as String?;
}

Map<String, dynamic> _$ItemAsProjectOwnerRevToJson(ItemAsProjectOwnerRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,

   //  'buttons': instance.buttons,
     'project_id': instance.project_id,
     'arbitration_id': instance.arbitration_id,
     'arbitration_str': instance.arbitration_str,
     'arbitration_url': instance.arbitration_url,
   //  'arbitration_list': instance.arbitration_list,
   //  'arbitration_list_str': instance.arbitration_list_str,
     'project_ending_id': instance.project_ending_id,
     'project_ending_str': instance.project_ending_str,
   //  'project_ending_list': instance.project_ending_list,
    // 'project_ending_list_str': instance.project_ending_list_str,
     'owner_rating': instance.owner_rating,
     'owner_feedback': instance.owner_feedback,
     'accepted_worker_id': instance.accepted_worker_id,

     'accepted_worker_str': instance.accepted_worker_str,
     'accepted_worker_url': instance.accepted_worker_url,
   //  'accepted_worker_list': instance.accepted_worker_list,
   //  'accepted_worker_list_str': instance.accepted_worker_list_str,
     'finish_date': instance.finish_date?.toIso8601String(),
     'title': instance.title,
     'project_url': instance.project_url,
     'accepted_worker_avatar': instance.accepted_worker_avatar


    };













class ItemAsProjectOwnerModel extends ItemAsProjectOwnerRevBase{
 Map<String, dynamic> json;
  ItemAsProjectOwnerModel(Map<String, dynamic> this.json):super(json);
}













  

