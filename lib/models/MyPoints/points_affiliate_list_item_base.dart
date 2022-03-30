
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
part 'points_affiliate_list_item_base.g.dart';

class ItemPointsAffiliateBase {
	var item;
	Map<String, dynamic> json;
	ItemPointsAffiliateBase(this.json){
		item = ItemPointsAffiliate.fromJson(json);
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
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewAmount (BuildContext context) { 
	return(  NumberView(
		value: item.amount,
		caption: 'Amount',
	));}
		    Widget viewBalance (BuildContext context) { 
	return(  NumberView(
		value: item.balance,
		caption: 'Balance',
	));}

}


@JsonSerializable()

class ItemPointsAffiliate{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? point_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  DateTime? date;
  String? title;
  int? amount;
  String? amount_str;
  int? balance;
  String? balance_str;

	
	 ItemPointsAffiliate(
			this.buttons,
			this.point_id,			
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.date,
			this.title,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );
	

	
  factory ItemPointsAffiliate.fromJson(Map<String, dynamic> json) => _$ItemPointsAffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPointsAffiliateToJson(this);
  

   
  
}












  

