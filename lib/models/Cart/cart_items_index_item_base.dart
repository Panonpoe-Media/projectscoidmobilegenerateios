

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
part 'cart_items_index_item_base.g.dart';

class ItemIndexCartItemsBase {
	ItemIndexCartItems? item;
	Map<String, dynamic> json;
	ItemIndexCartItemsBase(this.json){
		item = ItemIndexCartItems.fromJson(json);
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
	
	
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item!.title,
		caption: 'Title',
	));}
		    Widget viewItemPrice (BuildContext context) {  
	return(  MoneyView(
		value: item!.item_price,
		caption: 'Item Price',
	));}
		    Widget viewQuantity (BuildContext context) { 
	return(  NumberView(
		value: item!.quantity,
		caption: 'Quantity',
	));}
		    Widget viewTotalPrice (BuildContext context) {  
	return(  MoneyView(
		value: item!.total_price,
		caption: 'Total Price',
	));}

}


@JsonSerializable()

class ItemIndexCartItems{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? cart_id;

  String? title;
  double? item_price;
  String? item_price_str;
  int? quantity;
  String? quantity_str;
  double? total_price;
  String? total_price_str;

	
	 ItemIndexCartItems(
			this.buttons,
			this.cart_id,
			
			this.title,
			this.item_price,
			this.item_price_str,
			this.quantity,
			this.quantity_str,
			this.total_price,
			this.total_price_str,

  );
	

	
  factory ItemIndexCartItems.fromJson(Map<String, dynamic> json) => _$ItemIndexCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexCartItemsToJson(this);
  

   
  
}












  














  

