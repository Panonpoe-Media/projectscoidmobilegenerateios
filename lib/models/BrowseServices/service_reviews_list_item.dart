
import 'service_reviews_list_item_base.dart';
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
class ItemServiceReviewsModel extends ItemServiceReviewsRevBase{
 Map<String, dynamic> json;
  ItemServiceReviewsModel(Map<String, dynamic> this.json):super(json);
}


class ItemServiceReviewsRevBase {
 var item;
 Map<String, dynamic> json;
 ItemServiceReviewsRevBase(this.json){
  item = ItemServiceReviewsRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget?>? buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item.buttons.length; i++) {
   buttonChildren!.add(itemButton( i, context));
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


 Widget viewWorkerRating (BuildContext context) {
  return(  RatingView(
      value: item.worker_rating,
      caption: 'Worker Rating'
  ));}
 Widget viewWorkerFeedback (BuildContext context) {
  return(  ArticleView(
   value: item.worker_feedback,
   caption: 'Worker Feedback',
  ));}
 Widget viewOwner (BuildContext context) {
  return(  ModelView(
   value: item.owner_id,
   caption: 'Owner',
   idenum: item.owner_list,
   nameenum: item.owner_str,
  ));}
 Widget viewPhoto (BuildContext context) {
   return(  ImageView(
     value: item.owner_photo_url,
     caption: 'Photo',
   ));}

 Widget viewStartDate (BuildContext context) {
  return(  DateTimeView(
   value: item.start_date,
   caption: 'Start Date',
  ));}

}




class ItemServiceReviewsRev{

 int?   age;
 int?   cnt;
 int?   page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

 List<ItemButton?>? buttons;
 String? project_id;
 int?worker_rating;
 String? owner_photo_url;
 String? worker_feedback;
 int?owner_id;
 String? owner_str;
 String? owner_url;
 List<int?>? owner_list;
 List<String?>? owner_list_str;
 DateTime? start_date;


 ItemServiceReviewsRev(
     this.buttons,
     this.project_id,
     this.worker_rating,
     this.owner_photo_url,
     this.worker_feedback,
     this.owner_id,
     this.owner_str,
     this.owner_url,
     this.owner_list,
     this.owner_list_str,
     this.start_date,

     );



 factory ItemServiceReviewsRev.fromJson(Map<String, dynamic> json) => _$ItemServiceReviewsRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemServiceReviewsRevToJson(this);




}


ItemServiceReviewsRev _$ItemServiceReviewsRevFromJson(Map<String, dynamic> json) {
 return ItemServiceReviewsRev(
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),
     json['project_id'] as String,
     json['worker_rating'] as int,
     json['owner_photo_url'] as String,
     json['worker_feedback'] as String,
     json['owner_id'] as int,
     json['owner_str'] as String,
     json['owner_url'] as String,
     (json['owner_list'] as List)?.map((e) => e as int)?.toList(),
     (json['owner_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['start_date'] == null
         ? null
         : DateTime.parse(json['start_date'] as String))
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String;
}

Map<String, dynamic> _$ItemServiceReviewsRevToJson(ItemServiceReviewsRev instance) =>
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
     'worker_rating': instance.worker_rating,
     'owner_photo_url': instance.owner_photo_url,
     'worker_feedback': instance.worker_feedback,
     'owner_id': instance.owner_id,
     'owner_str': instance.owner_str,
     'owner_url': instance.owner_url,
     'owner_list': instance.owner_list,
     'owner_list_str': instance.owner_list_str,
     'start_date': instance.start_date?.toIso8601String()
    };











  

