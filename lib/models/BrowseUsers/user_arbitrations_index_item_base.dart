

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
part 'user_arbitrations_index_item_base.g.dart';

class ItemIndexUserArbitrationsBase {
	ItemIndexUserArbitrations? item;
	Map<String, dynamic> json;
	ItemIndexUserArbitrationsBase(this.json){
		item = ItemIndexUserArbitrations.fromJson(json);
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
	
	
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item!.status_id,
		caption: 'Status',
		idenum: item!.status_list,
		nameenum: item!.status_str,
	));} 
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item!.type_id,
		caption: 'Type',
		idenum: item!.type_list,
		nameenum: item!.type_str,
	));} 
		    Widget viewRequestedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.requested_date,
		caption: 'Requested Date',
	));} 

}


@JsonSerializable()

class ItemIndexUserArbitrations{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? arbitration_id;

  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  DateTime? requested_date;

	
	 ItemIndexUserArbitrations(
			this.buttons,
			this.arbitration_id,
			
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.requested_date,

  );
	

	
  factory ItemIndexUserArbitrations.fromJson(Map<String, dynamic> json) => _$ItemIndexUserArbitrationsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexUserArbitrationsToJson(this);
  

   
  
}












  














  

