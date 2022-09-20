
import 'services_list_item_base.dart';
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





class ItemServicesBaseRev {
  var item;
  Map<String, dynamic> json;

  ItemServicesBaseRev(this.json) {
    item = ItemServicesRev.fromJson(json);
  }

  List<Widget?>? listButtonAction(BuildContext context) {
    final List<Widget?>? buttonChildren = <Widget>[
    ];
    for (var i = 0; i < item.buttons.length; i++) {
      buttonChildren!.add(itemButton(i, context));
    }
  }


  Widget itemButton(int index, BuildContext context) {
    return (
        TextButton(
          child: Text(
              item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
          style: ButtonStyle(
            textStyle:
            MaterialStateProperty.all<TextStyle>(
                const TextStyle(color: CurrentTheme.MainAccentColor)),
            backgroundColor:
            MaterialStateProperty.all<Color>(
              CurrentTheme.SecondaryAccentColor,),
          ),
          onPressed: () {
            AppProvider.getRouter(context)!.navigateTo(
                context, urlToRoute(item.buttons[index].url));
          },
        )
    );
  }


  Widget viewLogo(BuildContext context) {
    return (ImageView(
      value: item.logo_url,
      caption: 'Logo',
    ));
  }

  Widget viewTitle(BuildContext context) {
    return (TitleView(
      value: item.title,
      caption: 'Title',
    ));
  }

  Widget viewPrice(BuildContext context) {
    return (MoneyView(
      value: item.price,
      caption: 'Price',
    ));
  }

  Widget viewRating(BuildContext context) {
    return (RatingView(
        value: item.rating,
        caption: 'Rating'
    ));
  }

  Widget viewRatingNum(BuildContext context) {
    return (DoubleView(
      value: item.rating_num,
      caption: 'Rating Num',
    ));
  }

  Widget viewSalesCount(BuildContext context) {
    return (NumberView(
      value: item.sales_count,
      caption: 'Sales Count',
    ));
  }

  Widget viewRanking(BuildContext context) {
    return (NumberView(
      value: item.ranking,
      caption: 'Ranking',
    ));
  }
  Widget viewShortDescription (BuildContext context) {
    return(  DisplayNameView(
      value: item.short_description,
      caption: 'Short Description',
    ));}
  Widget viewFinishDays(BuildContext context) {
    return (NumberView(
      value: item.finish_days,
      caption: 'Finish Days',
    ));
    Widget viewShortDescription(BuildContext context) {
      return (DisplayNameView(
        value: item.short_description,
        caption: 'Short Description',
      ));
    }
  }
}

class ItemServicesRev{

 int?    age;
 int?    cnt;
 int?    page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

 List<ItemButton?>? buttons;
 String? service_id;
 String? logo_url;
 Photo? logo;
 String? title;
 double? price;
 String? price_str;
 int? rating;
 double? rating_num;
 String? rating_num_str;
 int? sales_count;
 String? sales_count_str;
 int? ranking;
 String? ranking_str;
 int? finish_days;
 String? short_description;


 ItemServicesRev(
     this.buttons,
     this.service_id,
     this.logo,
     this.logo_url,
     this.title,
     this.price,
     this.price_str,
     this.rating,
     this.rating_num,
     this.rating_num_str,
     this.sales_count,
     this.sales_count_str,
     this.ranking,
     this.ranking_str,
     this.finish_days,
     this.short_description,

     );



 factory ItemServicesRev.fromJson(Map<String, dynamic> json) => _$ItemServicesRevFromJson(json);

 Map<String, dynamic> toJson() => _$ItemServicesRevToJson(this);


}


ItemServicesRev _$ItemServicesRevFromJson(Map<String, dynamic> json) {
 return ItemServicesRev(
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),
     json['service_id'] as String,
     json['logo'] == null
         ? null
         : Photo.fromJson(json['logo'] as Map<String, dynamic>),
     json['logo_url'] as String,
     json['title'] as String,
     (json['price'] as num)?.toDouble(),
     json['price_str'] as String,
     json['rating'] as int,
     (json['rating_num'] as num)?.toDouble(),
     json['rating_num_str'] as String,
     json['sales_count'] as int,
     json['sales_count_str'] as String,
     json['ranking'] as int,
     json['ranking_str'] as String,
     json['finish_days'] as int,
     json['short_description'] as String)
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String;
}

Map<String, dynamic> _$ItemServicesRevToJson(ItemServicesRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,
     'buttons': instance.buttons,
     'service_id': instance.service_id,
     'logo_url': instance.logo_url,
     'logo': instance.logo,
     'title': instance.title,
     'price': instance.price,
     'price_str': instance.price_str,
     'rating': instance.rating,
     'rating_num': instance.rating_num,
     'rating_num_str': instance.rating_num_str,
     'sales_count': instance.sales_count,
     'sales_count_str': instance.sales_count_str,
     'ranking': instance.ranking,
     'finish_days' : instance.finish_days,
     'ranking_str': instance.ranking_str,
     'short_description': instance.short_description
    };



class ItemServicesModel extends ItemServicesBaseRev{
 Map<String, dynamic> json;
  ItemServicesModel(Map<String, dynamic> this.json):super(json);
}













  

