
import 'product_reviews_list_item_base.dart';
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
class ItemProductReviewsModel extends ItemProductReviewsBaseRev{
 Map<String, dynamic> json;
  ItemProductReviewsModel(Map<String, dynamic> this.json):super(json);
}


class ItemProductReviewsBaseRev {
 var item;
 Map<String, dynamic> json;
 ItemProductReviewsBaseRev(this.json){
  item = ItemProductReviewsRev.fromJson(json);
 }

 List<Widget?>?  listButtonAction(BuildContext context) {
  final List<Widget?>? buttonChildren = <Widget>[
  ];
  for (var i = 0; i < item.buttons.length; i++) {
   buttonChildren!.add(itemButton( i, context));
  }
 }


 Widget itemButton( int index, BuildContext context){
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


 Widget viewRating (BuildContext context) {
  return(  RatingView(
      value: item.rating,
      caption: 'Rating'
  ));}
 Widget viewTestimony (BuildContext context) {
  return(  ArticleView(
   value: item.testimony,
   caption: 'Testimony',
  ));}

 Widget viewPhoto (BuildContext context) {
   return(  ImageView(
     value: item.buyer_photo_url,
     caption: 'Photo',
   ));}

 Widget viewBuyer (BuildContext context) {
  return(  ModelView(
   value: item.buyer_id,
   caption: 'Buyer',
   idenum: item.buyer_list,
   nameenum: item.buyer_str,
  ));}
 Widget viewDate (BuildContext context) {
  return(  DateTimeView(
   value: item.date,
   caption: 'Date',
  ));}

}




class ItemProductReviewsRev{

 int?    age;
 int?    cnt;
 int?    page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;
/*
 List<ItemButton?>? buttons;
 String? order_item_id;
 int? rating;
 String? testimony;
 int? buyer_id;

 */

 String? buyer_str;
 String? buyer_url;
 String? buyer_photo_url;
 List<int?>? buyer_list;
 List<String?>? buyer_list_str;
 DateTime? date;



 ItemProductReviewsRev(
     /*
     this.buttons,
     this.order_item_id,
     this.rating,
     this.testimony,
     this.buyer_id,

      */

     this.buyer_str,
     this.buyer_url,
     this.buyer_photo_url,
     this.buyer_list,
     this.buyer_list_str,
     this.date,



     );



 factory ItemProductReviewsRev.fromJson(Map<String, dynamic> json) => _$ItemProductReviewsRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemProductReviewsRevToJson(this);




}


ItemProductReviewsRev _$ItemProductReviewsRevFromJson(Map<String, dynamic> json) {
 return ItemProductReviewsRev(
   /*
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),

     json['order_item_id'] as String?,
     json['rating'] as int?,
     json['testimony'] as String?,
     json['buyer_id'] as int?,

      */

     json['buyer_str'] as String?,
     json['buyer_url'] as String?,
     json['buyer_photo_url'] as String?,
     (json['buyer_list'] as List)?.map((e) => e as int)?.toList(),
     (json['buyer_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['date'] == null ? null : DateTime.parse(json['date'] as String)

     )

  ..age = json['age'] as int?
  ..cnt = json['cnt'] as int?
  ..page = json['page'] as int?
  ..id = json['id'] as String?
  ..ttl = json['ttl'] as String?
  ..pht = json['pht'] as String?
  ..sbttl = json['sbttl'] as String?;
}

Map<String, dynamic> _$ItemProductReviewsRevToJson(ItemProductReviewsRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,
      /*
     'buttons': instance.buttons,
     'order_item_id': instance.order_item_id,
     'rating': instance.rating,
     'testimony': instance.testimony,
     'buyer_id': instance.buyer_id,

       */


     'buyer_str': instance.buyer_str,
     'buyer_url': instance.buyer_url,
     'buyer_photo_url': instance.buyer_photo_url,
     'buyer_list': instance.buyer_list,
     'buyer_list_str': instance.buyer_list_str,
     'date': instance.date?.toIso8601String()


    };












  

