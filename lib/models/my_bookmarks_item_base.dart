

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
part 'my_bookmarks_item_base.g.dart';
//


class ItemMyBookmarksBase {
	var item;
	Map<String, dynamic> json;
	ItemMyBookmarksBase(this.json){
		item = ItemMyBookmarks.fromJson(json);
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
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: CurrentTheme.MainAccentColor)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						CurrentTheme.SecondaryAccentColor,),
					),
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewUrl (BuildContext context) {  
	return(  WebsiteView(
		value: item.url,
		caption: 'URL',
	));}
		    Widget viewLogo (BuildContext context) {  
	return(  TitleView(
		value: item.logo,
		caption: 'Logo',
	));}
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}

}


@JsonSerializable()

class ItemMyBookmarks{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  bookmark_id;
  String?  url;
  String?  logo;
  String?  title;

	
	 ItemMyBookmarks(
			this.buttons,
			this.bookmark_id,			
			this.url,
			this.logo,
			this.title,

  );
	

	
  factory ItemMyBookmarks.fromJson(Map<String, dynamic> json) => _$ItemMyBookmarksFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyBookmarksToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

