

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
part 'products_index_item_base.g.dart';

class ItemIndexProductsBase {
	ItemIndexProducts? item;
	Map<String, dynamic> json;
	ItemIndexProductsBase(this.json){
		item = ItemIndexProducts.fromJson(json);
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
				TextButton(
					child: Text(item!.buttons![index!]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
					style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
		
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

class ItemIndexProducts{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? product_id;

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
  int? sales_count;
  String? sales_count_str;
  int? rating;

	
	 ItemIndexProducts(
			this.buttons,
			this.product_id,
			
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
			this.sales_count,
			this.sales_count_str,
			this.rating,

  );
	

	
  factory ItemIndexProducts.fromJson(Map<String, dynamic> json) => _$ItemIndexProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexProductsToJson(this);
  

   
  
}












  














  

