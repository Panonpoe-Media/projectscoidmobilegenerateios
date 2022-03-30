
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
part 'sales_list_item_base.g.dart';

class ItemSalesBase {
	var item;
	Map<String, dynamic> json;
	ItemSalesBase(this.json){
		item = ItemSales.fromJson(json);
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
	
	
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewBuyer (BuildContext context) {  
	return(  ModelView(
		value: item.buyer_id,
		caption: 'Buyer',
		idenum: item.buyer_list,
		nameenum: item.buyer_str,
	));} 
		    Widget viewPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.price,
		caption: 'Price',
	));}
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
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

}


@JsonSerializable()

class ItemSales{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? order_item_id;
  DateTime? date;
  int? buyer_id;
  String? buyer_str;
  String? buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  double? price;
  String? price_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? rating;
  String? testimony;

	
	 ItemSales(
			this.buttons,
			this.order_item_id,			
			this.date,
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.rating,
			this.testimony,

  );
	

	
  factory ItemSales.fromJson(Map<String, dynamic> json) => _$ItemSalesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSalesToJson(this);
  

   
  
}












  

