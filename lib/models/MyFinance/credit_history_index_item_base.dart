

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
part 'credit_history_index_item_base.g.dart';

class ItemIndexCreditHistoryBase {
	ItemIndexCreditHistory? item;
	Map<String, dynamic> json;
	ItemIndexCreditHistoryBase(this.json){
		item = ItemIndexCreditHistory.fromJson(json);
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
	
	
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.date,
		caption: 'Date',
	));} 
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item!.type_id,
		caption: 'Type',
		idenum: item!.type_list,
		nameenum: item!.type_str,
	));} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item!.title,
		caption: 'Title',
	));}
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item!.amount,
		caption: 'Amount',
	));}
		    Widget viewBalance (BuildContext context) {  
	return(  MoneyView(
		value: item!.balance,
		caption: 'Balance',
	));}

}


@JsonSerializable()

class ItemIndexCreditHistory{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? credit_id;

  DateTime? date;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
  double? amount;
  String? amount_str;
  double? balance;
  String? balance_str;

	
	 ItemIndexCreditHistory(
			this.buttons,
			this.credit_id,
			
			this.date,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.title,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );
	

	
  factory ItemIndexCreditHistory.fromJson(Map<String, dynamic> json) => _$ItemIndexCreditHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexCreditHistoryToJson(this);
  

   
  
}












  














  

