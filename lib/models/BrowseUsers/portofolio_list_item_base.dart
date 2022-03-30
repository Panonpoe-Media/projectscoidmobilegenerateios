
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
part 'portofolio_list_item_base.g.dart';

class ItemPortofolioBase {
	var item;
	Map<String, dynamic> json;
	ItemPortofolioBase(this.json){
		item = ItemPortofolio.fromJson(json);
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
	
	
		    Widget viewLink (BuildContext context) {  
	return(  WebsiteView(
		value: item.link,
		caption: 'Link',
	));}
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: item.image_url,
		caption: 'Image',
	));} 
		    Widget viewYear (BuildContext context) { 
	return(  NumberView(
		value: item.year,
		caption: 'Year',
	));}
		    Widget viewDescription (BuildContext context) {  
	return(  MultilineView(
		value: item.description,
		caption: 'Description',
	));}

}


@JsonSerializable()

class ItemPortofolio{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? portofolio_id;
  String? link;
  String? image_url;
  Photo? image;
  int? year;
  String? year_str;
  String? description;

	
	 ItemPortofolio(
			this.buttons,
			this.portofolio_id,			
			this.link,
			this.image,
			this.image_url,
			this.year,
			this.year_str,
			this.description,

  );
	

	
  factory ItemPortofolio.fromJson(Map<String, dynamic> json) => _$ItemPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPortofolioToJson(this);
  

   
  
}












  

