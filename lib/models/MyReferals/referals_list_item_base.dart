
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
part 'referals_list_item_base.g.dart';

class ItemReferalsBase {
	var item;
	Map<String, dynamic> json;
	ItemReferalsBase(this.json){
		item = ItemReferals.fromJson(json);
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
	
	
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: item.user_name,
		caption: 'User Name',
	));}
		    Widget viewDateRegistered (BuildContext context) {  
	return(  DateTimeView(
		value: item.date_registered,
		caption: 'Date Registered',
	));} 
		    Widget viewRefererExpires (BuildContext context) {  
	return(  DateTimeView(
		value: item.referer_expires,
		caption: 'Referer Expires',
	));} 
		    Widget viewLastSeen (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_seen,
		caption: 'Last Seen',
	));} 
		    Widget viewCurrentProjects (BuildContext context) { 
	return(  NumberView(
		value: item.current_projects,
		caption: 'Current Projects',
	));}
		    Widget viewProjectsWon (BuildContext context) { 
	return(  NumberView(
		value: item.projects_won,
		caption: 'Projects Won',
	));}
		    Widget viewProjectsOwned (BuildContext context) { 
	return(  NumberView(
		value: item.projects_owned,
		caption: 'Projects Owned',
	));}
		    Widget viewProductSold (BuildContext context) { 
	return(  NumberView(
		value: item.product_sold,
		caption: 'Product Sold',
	));}
		    Widget viewProductBought (BuildContext context) { 
	return(  NumberView(
		value: item.product_bought,
		caption: 'Product Bought',
	));}

}


@JsonSerializable()

class ItemReferals{

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
  int? current_projects;
  String? current_projects_str;
  int? projects_won;
  String? projects_won_str;
  int? projects_owned;
  String? projects_owned_str;
  int? product_sold;
  String? product_sold_str;
  int? product_bought;
  String? product_bought_str;

	
	 ItemReferals(
			this.buttons,
			this.user_id,			
			this.user_name,
			this.date_registered,
			this.referer_expires,
			this.last_seen,
			this.current_projects,
			this.current_projects_str,
			this.projects_won,
			this.projects_won_str,
			this.projects_owned,
			this.projects_owned_str,
			this.product_sold,
			this.product_sold_str,
			this.product_bought,
			this.product_bought_str,

  );
	

	
  factory ItemReferals.fromJson(Map<String, dynamic> json) => _$ItemReferalsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemReferalsToJson(this);
  

   
  
}












  

