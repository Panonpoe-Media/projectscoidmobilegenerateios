

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
part 'cerita_sukses_item_base.g.dart';



class ItemCeritaSuksesBase {
	var item;
	Map<String, dynamic> json;
	ItemCeritaSuksesBase(this.json){
		item = ItemCeritaSukses.fromJson(json);
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
	
	
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewAuthor (BuildContext context) {  
	return(  ModelView(
		value: item.author_id,
		caption: 'Author',
		idenum: item.author_list,
		nameenum: item.author_str,
	));} 
		    Widget viewPublishedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.published_date,
		caption: 'Published Date',
	));} 
		    Widget viewTeaser (BuildContext context) {  
	return(  MultilineView(
		value: item.teaser,
		caption: 'Teaser',
	));}
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: item.image_url,
		caption: 'Image',
	));} 

}


@JsonSerializable()

class ItemCeritaSukses{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  article_id;
  String?  title;
  int?author_id;
  String?  author_str;
  String?  author_url;
  List<int?>? author_list;
  List<String?>? author_list_str;
  DateTime? published_date;
  String?  teaser;
  String?  image_url;
  Photo? image;

	
	 ItemCeritaSukses(
			this.buttons,
			this.article_id,			
			this.title,
			this.author_id,
			this.author_str,
			this.author_url,
			this.author_list,
			this.author_list_str,
			this.published_date,
			this.teaser,
			this.image,
			this.image_url,

  );
	

	
  factory ItemCeritaSukses.fromJson(Map<String, dynamic> json) => _$ItemCeritaSuksesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCeritaSuksesToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

