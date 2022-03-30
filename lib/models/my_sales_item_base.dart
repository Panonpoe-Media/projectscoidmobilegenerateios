

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'my_sales_item_base.g.dart';



class ItemMySalesBase {
	var item;
	Map<String, dynamic> json;
	ItemMySalesBase(this.json){
		item = ItemMySales.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
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
	
	
		    Widget viewBuyer (BuildContext context) {  
	return(  ModelView(
		value: item.buyer_id,
		caption: 'Buyer',
		idenum: item.buyer_list,
		nameenum: item.buyer_str,
	));} 
		    Widget viewProduct (BuildContext context) {  
	return(  ModelView(
		value: item.product_id,
		caption: 'Product',
		idenum: item.product_list,
		nameenum: item.product_str,
	));} 
		    Widget viewOrder (BuildContext context) {  
	return(  ModelView(
		value: item.order_id,
		caption: 'Order',
		idenum: item.order_list,
		nameenum: item.order_str,
	));} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item.title,
		caption: 'Title',
	));}
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item.type_id,
		caption: 'Type',
		idenum: item.type_list,
		nameenum: item.type_str,
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
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
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
		    Widget viewBuyerPayment (BuildContext context) {  
	return(  ModelView(
		value: item.buyer_payment_id,
		caption: 'Buyer Payment',
		idenum: item.buyer_payment_list,
		nameenum: item.buyer_payment_str,
	));} 
		    Widget viewSellerCredit (BuildContext context) {  
	return(  ModelView(
		value: item.seller_credit_id,
		caption: 'Seller Credit',
		idenum: item.seller_credit_list,
		nameenum: item.seller_credit_str,
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

class ItemMySales{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  order_item_id;
  int?buyer_id;
  String?  buyer_str;
  String?  buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int?product_id;
  String?  product_str;
  String?  product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int?order_id;
  String?  order_str;
  String?  order_url;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String?  title;
  int?type_id;
  String?  type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int?project_id;
  String?  project_str;
  String?  project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int?service_id;
  String?  service_str;
  String?  service_url;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int?bid_id;
  String?  bid_str;
  String?  bid_url;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int?iklan_id;
  String?  iklan_str;
  String?  iklan_url;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  DateTime? date;
  double? price;
  String?  price_str;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int?buyer_payment_id;
  String?  buyer_payment_str;
  String?  buyer_payment_url;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int?seller_credit_id;
  String?  seller_credit_str;
  String?  seller_credit_url;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int?rating;
  String?  testimony;

	
	 ItemMySales(
			this.buttons,
			this.order_item_id,			
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.order_id,
			this.order_str,
			this.order_url,
			this.order_list,
			this.order_list_str,
			this.title,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
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
			this.date,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_url,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_url,
			this.seller_credit_list,
			this.seller_credit_list_str,
			this.rating,
			this.testimony,

  );
	

	
  factory ItemMySales.fromJson(Map<String, dynamic> json) => _$ItemMySalesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMySalesToJson(this);
  

   
  
}



////////////////////////////////////////////////
///






class ItemIndexMySalesBase {
	var item;
	Map<String, dynamic> json;
	ItemIndexMySalesBase(this.json){
		item = ItemIndexMySales.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
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
	
 Widget viewHeaderNumber () {
      return( 
        Text('No')
	 );} 	
Widget viewIndexNumber (BuildContext context, int?index) {
  return( 
    Text('${index.toString()}')
);} 	
		    Widget viewBuyer (BuildContext context) {  
        return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.buyer_str),
        ));} 
  Widget viewHeaderBuyer () {
      return(
        Text('Buyer')
       );
      }
		    Widget viewProduct (BuildContext context) {  
        return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.product_str),
        ));} 
  Widget viewHeaderProduct () {
      return(
        Text('Product')
       );
      }
		    Widget viewTitle (BuildContext context) { 
        return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.title),
        ));} 

  Widget viewHeaderTitle () {
      return(
        Text('Title')
       );
      }
		    Widget viewDate (BuildContext context) {  
	return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.date.toString()),
        ));} 
  Widget viewHeaderDate () {
      return(
        Text('Date')
       );
      }
		    Widget viewPrice (BuildContext context) {  
	return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.price_str),
        ));}
  Widget viewHeaderPrice () {
      return(
        Text('Price')
       );
      }
    
	    Widget viewStatus (BuildContext context) {
      return( 
          GestureDetector(
          onTap: (){
            
          },
          child: HtmlWidget(item.status_str),
        ));} 
  Widget viewHeaderStatus () {
      return(
        Text('Status')
       );
      }

}




@JsonSerializable()

class ItemIndexMySales{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  order_item_id;
  int?buyer_id;
  String?  buyer_str;
  String?  buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int?product_id;
  String?  product_str;
  String?  product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  String?  title;
  DateTime? date;
  double? price;
  String?  price_str;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;

	
	 ItemIndexMySales(
			this.buttons,
			this.order_item_id,			
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.title,
			this.date,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,

  );
	

	
  factory ItemIndexMySales.fromJson(Map<String, dynamic> json) => _$ItemIndexMySalesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexMySalesToJson(this);
  

   
  
}

///
////////////////////////////////////////////////





  






  

