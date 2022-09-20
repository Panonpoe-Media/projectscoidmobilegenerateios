

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
part 'points_affiliate_index_item_base.g.dart';

class ItemIndexPointsAffiliateBase {
	ItemIndexPointsAffiliate? item;
	Map<String, dynamic> json;
	ItemIndexPointsAffiliateBase(this.json){
		item = ItemIndexPointsAffiliate.fromJson(json);
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
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item!.title,
		caption: 'Title',
	));}
		    Widget viewAmount (BuildContext context) { 
	return(  NumberView(
		value: item!.amount,
		caption: 'Amount',
	));}
		    Widget viewBalance (BuildContext context) { 
	return(  NumberView(
		value: item!.balance,
		caption: 'Balance',
	));}

}


@JsonSerializable()

class ItemIndexPointsAffiliate{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? point_id;

  DateTime? date;
  String? title;
  int? amount;
  String? amount_str;
  int? balance;
  String? balance_str;

	
	 ItemIndexPointsAffiliate(
			this.buttons,
			this.point_id,
			
			this.date,
			this.title,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );
	

	
  factory ItemIndexPointsAffiliate.fromJson(Map<String, dynamic> json) => _$ItemIndexPointsAffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexPointsAffiliateToJson(this);
  

   
  
}












  














  

