
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
part 'products_list_item_base.g.dart';

class ItemProductsBase {
	var item;
	Map<String, dynamic> json;
	ItemProductsBase(this.json){
		item = ItemProducts.fromJson(json);
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

}


@JsonSerializable()

class ItemProducts{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? product_id;
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

	
	 ItemProducts(
			this.buttons,
			this.product_id,			
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

  );
	

	
  factory ItemProducts.fromJson(Map<String, dynamic> json) => _$ItemProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProductsToJson(this);
  

   
  
}












  

