

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
part 'my_orders_item_base.g.dart';
//


class ItemMyOrdersBase {
	var item;
	Map<String, dynamic> json;
	ItemMyOrdersBase(this.json){
		item = ItemMyOrders.fromJson(json);
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
	
	
		    Widget viewTrackCode (BuildContext context) { 
	return(  DisplayNameView(
		value: item.track_code,
		caption: 'Track Code',
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
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
	    Widget viewPaymentMethod (BuildContext context) {
      return( 
	 EnumView(
		value: item.payment_method_id,
		caption: 'Payment Method',
		idenum: item.payment_method_list,
		nameenum: item.payment_method_str,
	));} 
		    Widget viewBuyerPayment (BuildContext context) {  
	return(  ModelView(
		value: item.buyer_payment_id,
		caption: 'Buyer Payment',
		idenum: item.buyer_payment_list,
		nameenum: item.buyer_payment_str,
	));} 
		    Widget viewTotalPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.total_price,
		caption: 'Total Price',
	));}
		    Widget viewCoupon (BuildContext context) { 
	return(  DisplayNameView(
		value: item.coupon,
		caption: 'Coupon',
	));}
		    Widget viewCouponValue (BuildContext context) {  
	return(  MoneyView(
		value: item.coupon_value,
		caption: 'Coupon Value',
	));}
		    Widget viewUsedBalance (BuildContext context) {  
	return(  MoneyView(
		value: item.used_balance,
		caption: 'Used Balance',
	));}
		    Widget viewTotalSum (BuildContext context) {  
	return(  MoneyView(
		value: item.total_sum,
		caption: 'Total Sum',
	));}
		    Widget viewUniqueCode (BuildContext context) {  
	return(  MoneyView(
		value: item.unique_code,
		caption: 'Unique Code',
	));}
		    Widget viewNotes (BuildContext context) {  
	return(  MultilineView(
		value: item.notes,
		caption: 'Notes',
	));}
		    Widget viewCimbRef (BuildContext context) { 
	return(  NumberView(
		value: item.cimb_ref,
		caption: 'CIMB Ref',
	));}
		    Widget viewIsTest (BuildContext context) {  
	return(  BooleanView(
		value: item.is_test,
		caption: 'Is Test',
	));} 

}


@JsonSerializable()

class ItemMyOrders{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  order_id;
  String?  track_code;
  int?buyer_id;
  String?  buyer_str;
  String?  buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  DateTime? date;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int?payment_method_id;
  String?  payment_method_str;
  List<int?>? payment_method_list;
  List<String?>? payment_method_list_str;
  int?buyer_payment_id;
  String?  buyer_payment_str;
  String?  buyer_payment_url;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  double? total_price;
  String?  total_price_str;
  String?  coupon;
  double? coupon_value;
  String?  coupon_value_str;
  double? used_balance;
  String?  used_balance_str;
  double? total_sum;
  String?  total_sum_str;
  double? unique_code;
  String?  unique_code_str;
  String?  notes;
  int?cimb_ref;
  String?  cimb_ref_str;
  bool? is_test;

	
	 ItemMyOrders(
			this.buttons,
			this.order_id,			
			this.track_code,
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.date,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.payment_method_id,
			this.payment_method_str,
			this.payment_method_list,
			this.payment_method_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_url,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.total_price,
			this.total_price_str,
			this.coupon,
			this.coupon_value,
			this.coupon_value_str,
			this.used_balance,
			this.used_balance_str,
			this.total_sum,
			this.total_sum_str,
			this.unique_code,
			this.unique_code_str,
			this.notes,
			this.cimb_ref,
			this.cimb_ref_str,
			this.is_test,

  );
	

	
  factory ItemMyOrders.fromJson(Map<String, dynamic> json) => _$ItemMyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyOrdersToJson(this);
  

   
  
}



////////////////////////////////////////////////
///






class ItemIndexMyOrdersBase {
	var item;
	Map<String, dynamic> json;
	ItemIndexMyOrdersBase(this.json){
		item = ItemIndexMyOrders.fromJson(json);
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
		    Widget viewTrackCode (BuildContext context) { 
        return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.track_code),
        ));} 

  Widget viewHeaderTrackCode () {
      return(
        Text('Track Code')
       );
      }
    
	    Widget viewPaymentMethod (BuildContext context) {
      return( 
          GestureDetector(
          onTap: (){
            
          },
          child: HtmlWidget(item.payment_method_str),
        ));} 
  Widget viewHeaderPaymentMethod () {
      return(
        Text('Payment Method')
       );
      }
		    Widget viewTotalPrice (BuildContext context) {  
	return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.total_price_str),
        ));}
  Widget viewHeaderTotalPrice () {
      return(
        Text('Total Price')
       );
      }
		    Widget viewUsedBalance (BuildContext context) {  
	return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.used_balance_str),
        ));}
  Widget viewHeaderUsedBalance () {
      return(
        Text('Used Balance')
       );
      }
		    Widget viewTotalSum (BuildContext context) {  
	return( 
          GestureDetector(
          onTap: (){
            
          },
          child: Text(item.total_sum_str),
        ));}
  Widget viewHeaderTotalSum () {
      return(
        Text('Total Sum')
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

class ItemIndexMyOrders{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  order_id;
  DateTime? date;
  String?  track_code;
  int?payment_method_id;
  String?  payment_method_str;
  List<int?>? payment_method_list;
  List<String?>? payment_method_list_str;
  double? total_price;
  String?  total_price_str;
  double? used_balance;
  String?  used_balance_str;
  double? total_sum;
  String?  total_sum_str;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;

	
	 ItemIndexMyOrders(
			this.buttons,
			this.order_id,			
			this.date,
			this.track_code,
			this.payment_method_id,
			this.payment_method_str,
			this.payment_method_list,
			this.payment_method_list_str,
			this.total_price,
			this.total_price_str,
			this.used_balance,
			this.used_balance_str,
			this.total_sum,
			this.total_sum_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,

  );
	

	
  factory ItemIndexMyOrders.fromJson(Map<String, dynamic> json) => _$ItemIndexMyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexMyOrdersToJson(this);
  

   
  
}

///
////////////////////////////////////////////////





  






  

