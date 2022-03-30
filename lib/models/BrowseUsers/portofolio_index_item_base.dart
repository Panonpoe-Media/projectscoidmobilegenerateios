

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
part 'portofolio_index_item_base.g.dart';

class ItemIndexPortofolioBase {
	ItemIndexPortofolio? item;
	Map<String, dynamic> json;
	ItemIndexPortofolioBase(this.json){
		item = ItemIndexPortofolio.fromJson(json);
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
	
	
		    Widget viewUser (BuildContext context) {  
	return(  ModelView(
		value: item!.user_id,
		caption: 'User',
		idenum: item!.user_list,
		nameenum: item!.user_str,
	));} 
		    Widget viewYear (BuildContext context) { 
	return(  NumberView(
		value: item!.year,
		caption: 'Year',
	));}
		    Widget viewDescription (BuildContext context) {  
	return(  MultilineView(
		value: item!.description,
		caption: 'Description',
	));}
		    Widget viewLink (BuildContext context) {  
	return(  WebsiteView(
		value: item!.link,
		caption: 'Link',
	));}

}


@JsonSerializable()

class ItemIndexPortofolio{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? portofolio_id;

  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? year;
  String? year_str;
  String? description;
  String? link;

	
	 ItemIndexPortofolio(
			this.buttons,
			this.portofolio_id,
			
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.year,
			this.year_str,
			this.description,
			this.link,

  );
	

	
  factory ItemIndexPortofolio.fromJson(Map<String, dynamic> json) => _$ItemIndexPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexPortofolioToJson(this);
  

   
  
}












  














  

