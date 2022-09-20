

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
part 'referals_index_item_base.g.dart';

class ItemIndexReferalsBase {
	ItemIndexReferals? item;
	Map<String, dynamic> json;
	ItemIndexReferalsBase(this.json){
		item = ItemIndexReferals.fromJson(json);
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
	
	
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: item!.user_name,
		caption: 'User Name',
	));}
		    Widget viewDateRegistered (BuildContext context) {  
	return(  DateTimeView(
		value: item!.date_registered,
		caption: 'Date Registered',
	));} 
		    Widget viewRefererExpires (BuildContext context) {  
	return(  DateTimeView(
		value: item!.referer_expires,
		caption: 'Referer Expires',
	));} 
		    Widget viewLastSeen (BuildContext context) {  
	return(  DateTimeView(
		value: item!.last_seen,
		caption: 'Last Seen',
	));} 

}


@JsonSerializable()

class ItemIndexReferals{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? user_id;

  String? user_name;
  DateTime? date_registered;
  DateTime? referer_expires;
  DateTime? last_seen;

	
	 ItemIndexReferals(
			this.buttons,
			this.user_id,
			
			this.user_name,
			this.date_registered,
			this.referer_expires,
			this.last_seen,

  );
	

	
  factory ItemIndexReferals.fromJson(Map<String, dynamic> json) => _$ItemIndexReferalsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexReferalsToJson(this);
  

   
  
}












  














  

