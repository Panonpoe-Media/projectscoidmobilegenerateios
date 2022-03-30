
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
part 'services_list_item_base.g.dart';

class ItemServicesBase {
	var item;
	Map<String, dynamic> json;
	ItemServicesBase(this.json){
		item = ItemServices.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons!.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int? index, BuildContext context){
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
	
	
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: item.logo_url,
		caption: 'Logo',
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.price,
		caption: 'Price',
	));}
		    Widget viewRating (BuildContext context) {  
	return(  RatingView(
		value: item.rating,
		caption: 'Rating'
	));}
		    Widget viewRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.rating_num,
		caption: 'Rating Num',
	));}
		    Widget viewSalesCount (BuildContext context) { 
	return(  NumberView(
		value: item.sales_count,
		caption: 'Sales Count',
	));}
		    Widget viewRanking (BuildContext context) { 
	return(  NumberView(
		value: item.ranking,
		caption: 'Ranking',
	));}
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: item.short_description,
		caption: 'Short Description',
	));}
		    Widget viewFinishDays (BuildContext context) { 
	return(  NumberView(
		value: item.finish_days,
		caption: 'Finish Days',
	));}

}


@JsonSerializable()

class ItemServices{

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
  String? short_description;
  int? finish_days;
  String? finish_days_str;

	
	 ItemServices(
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
			this.short_description,
			this.finish_days,
			this.finish_days_str,

  );
	

	
  factory ItemServices.fromJson(Map<String, dynamic> json) => _$ItemServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemServicesToJson(this);
  

   
  
}












  

