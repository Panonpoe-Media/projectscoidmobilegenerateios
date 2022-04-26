

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
part 'my_portofolio_item_base.g.dart';
//


class ItemMyPortofolioBase {
	var item;
	Map<String, dynamic> json;
	ItemMyPortofolioBase(this.json){
		item = ItemMyPortofolio.fromJson(json);
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

}


@JsonSerializable()

class ItemMyPortofolio{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  portofolio_id;
  int?year;
  String?  year_str;
  String?  description;
  String?  link;
  String?  image_url;
  Photo? image;

	
	 ItemMyPortofolio(
			this.buttons,
			this.portofolio_id,			
			this.year,
			this.year_str,
			this.description,
			this.link,
			this.image,
			this.image_url,

  );
	

	
  factory ItemMyPortofolio.fromJson(Map<String, dynamic> json) => _$ItemMyPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyPortofolioToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

