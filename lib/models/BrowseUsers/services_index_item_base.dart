

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
part 'services_index_item_base.g.dart';

class ItemIndexServicesBase {
	ItemIndexServices? item;
	Map<String, dynamic> json;
	ItemIndexServicesBase(this.json){
		item = ItemIndexServices.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item!.buttons!.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int? index, BuildContext context){
		return(
				FlatButton(
					child: Text(item!.buttons![index!]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
					textColor: CurrentTheme.MainAccentColor,
					splashColor : CurrentTheme.ShadeColor,
					color : CurrentTheme.SecondaryAccentColor,
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item!.buttons![index!]!.url!));
					},
				)
		);
	}	
	
	
		    Widget viewSeller (BuildContext context) {  
	return(  ModelView(
		value: item!.seller_id,
		caption: 'Seller',
		idenum: item!.seller_list,
		nameenum: item!.seller_str,
	));} 
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: item!.logo_url,
		caption: 'Logo',
	));} 
		    Widget viewCategory (BuildContext context) {  
	return(  ModelView(
		value: item!.category_id,
		caption: 'Category',
		idenum: item!.category_list,
		nameenum: item!.category_str,
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item!.title,
		caption: 'Title',
	));}
		    Widget viewFinishDays (BuildContext context) { 
	return(  NumberView(
		value: item!.finish_days,
		caption: 'Finish Days',
	));}
		    Widget viewPrice (BuildContext context) {  
	return(  MoneyView(
		value: item!.price,
		caption: 'Price',
	));}
		    Widget viewSalesCount (BuildContext context) { 
	return(  NumberView(
		value: item!.sales_count,
		caption: 'Sales Count',
	));}
		    Widget viewRating (BuildContext context) {  
	return(  RatingView(
		value: item!.rating,
		caption: 'Rating'
	));}

}


@JsonSerializable()

class ItemIndexServices{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? service_id;

  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? logo_url;
  Photo? logo;
  int? category_id;
  String? category_str;
  String? category_url;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  int? finish_days;
  String? finish_days_str;
  double? price;
  String? price_str;
  int? sales_count;
  String? sales_count_str;
  int? rating;

	
	 ItemIndexServices(
			this.buttons,
			this.service_id,
			
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.category_id,
			this.category_str,
			this.category_url,
			this.category_list,
			this.category_list_str,
			this.title,
			this.finish_days,
			this.finish_days_str,
			this.price,
			this.price_str,
			this.sales_count,
			this.sales_count_str,
			this.rating,

  );
	

	
  factory ItemIndexServices.fromJson(Map<String, dynamic> json) => _$ItemIndexServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexServicesToJson(this);
  

   
  
}












  














  

