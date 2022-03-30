

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
part 'payment_history_index_item_base.g.dart';

class ItemIndexPaymentHistoryBase {
	ItemIndexPaymentHistory? item;
	Map<String, dynamic> json;
	ItemIndexPaymentHistoryBase(this.json){
		item = ItemIndexPaymentHistory.fromJson(json);
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
	
	
		    Widget viewTransferDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.transfer_date,
		caption: 'Transfer Date',
	));} 
		    Widget viewBank (BuildContext context) {  
	return(  ModelView(
		value: item!.bank_id,
		caption: 'Bank',
		idenum: item!.bank_list,
		nameenum: item!.bank_str,
	));} 
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item!.amount,
		caption: 'Amount',
	));}
		    Widget viewTransferFee (BuildContext context) {  
	return(  MoneyView(
		value: item!.transfer_fee,
		caption: 'Transfer Fee',
	));}
	    Widget viewDirection (BuildContext context) {
      return( 
	 EnumView(
		value: item!.direction_id,
		caption: 'Direction',
		idenum: item!.direction_list,
		nameenum: item!.direction_str,
	));} 
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item!.status_id,
		caption: 'Status',
		idenum: item!.status_list,
		nameenum: item!.status_str,
	));} 

}


@JsonSerializable()

class ItemIndexPaymentHistory{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? payment_id;

  DateTime? transfer_date;
  int? bank_id;
  String? bank_str;
  String? bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  double? amount;
  String? amount_str;
  double? transfer_fee;
  String? transfer_fee_str;
  int? direction_id;
  String? direction_str;
  List<int?>? direction_list;
  List<String?>? direction_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;

	
	 ItemIndexPaymentHistory(
			this.buttons,
			this.payment_id,
			
			this.transfer_date,
			this.bank_id,
			this.bank_str,
			this.bank_url,
			this.bank_list,
			this.bank_list_str,
			this.amount,
			this.amount_str,
			this.transfer_fee,
			this.transfer_fee_str,
			this.direction_id,
			this.direction_str,
			this.direction_list,
			this.direction_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,

  );
	

	
  factory ItemIndexPaymentHistory.fromJson(Map<String, dynamic> json) => _$ItemIndexPaymentHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexPaymentHistoryToJson(this);
  

   
  
}












  














  

