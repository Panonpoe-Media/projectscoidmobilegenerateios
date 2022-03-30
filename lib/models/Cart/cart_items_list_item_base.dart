
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
part 'cart_items_list_item_base.g.dart';

class ItemCartItemsBase {
	var item;
	Map<String, dynamic> json;
	ItemCartItemsBase(this.json){
		item = ItemCartItems.fromJson(json);
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
	
	
		    Widget viewUser (BuildContext context) {  
	return(  ModelView(
		value: item.user_id,
		caption: 'User',
		idenum: item.user_list,
		nameenum: item.user_str,
	));} 
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item.type_id,
		caption: 'Type',
		idenum: item.type_list,
		nameenum: item.type_str,
	));} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewProduct (BuildContext context) {  
	return(  ModelView(
		value: item.product_id,
		caption: 'Product',
		idenum: item.product_list,
		nameenum: item.product_str,
	));} 
		    Widget viewProject (BuildContext context) {  
	return(  ModelView(
		value: item.project_id,
		caption: 'Project',
		idenum: item.project_list,
		nameenum: item.project_str,
	));} 
		    Widget viewService (BuildContext context) {  
	return(  ModelView(
		value: item.service_id,
		caption: 'Service',
		idenum: item.service_list,
		nameenum: item.service_str,
	));} 
		    Widget viewBid (BuildContext context) {  
	return(  ModelView(
		value: item.bid_id,
		caption: 'Bid',
		idenum: item.bid_list,
		nameenum: item.bid_str,
	));} 
		    Widget viewIklan (BuildContext context) {  
	return(  ModelView(
		value: item.iklan_id,
		caption: 'Iklan',
		idenum: item.iklan_list,
		nameenum: item.iklan_str,
	));} 
		    Widget viewSeller (BuildContext context) {  
	return(  ModelView(
		value: item.seller_id,
		caption: 'Seller',
		idenum: item.seller_list,
		nameenum: item.seller_str,
	));} 
		    Widget viewItemPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.item_price,
		caption: 'Item Price',
	));}
		    Widget viewQuantity (BuildContext context) { 
	return(  NumberView(
		value: item.quantity,
		caption: 'Quantity',
	));}
		    Widget viewTotalPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.total_price,
		caption: 'Total Price',
	));}

}


@JsonSerializable()

class ItemCartItems{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? cart_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
  int? product_id;
  String? product_str;
  String? product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_str;
  String? service_url;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_str;
  String? bid_url;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_str;
  String? iklan_url;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  double? item_price;
  String? item_price_str;
  int? quantity;
  String? quantity_str;
  double? total_price;
  String? total_price_str;

	
	 ItemCartItems(
			this.buttons,
			this.cart_id,			
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.title,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_url,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_url,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_url,
			this.iklan_list,
			this.iklan_list_str,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.item_price,
			this.item_price_str,
			this.quantity,
			this.quantity_str,
			this.total_price,
			this.total_price_str,

  );
	

	
  factory ItemCartItems.fromJson(Map<String, dynamic> json) => _$ItemCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCartItemsToJson(this);
  

   
  
}












  

