

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
part 'testimonial_item_base.g.dart';
//


class ItemTestimonialBase {
	var item;
	Map<String, dynamic> json;
	ItemTestimonialBase(this.json){
		item = ItemTestimonial.fromJson(json);
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
	
	
		    Widget viewFeedback (BuildContext context) {  
	return(  ArticleView(
		value: item.feedback,
		caption: 'Feedback',
	));}
		    Widget viewUser (BuildContext context) {  
	return(  ModelView(
		value: item.user_id,
		caption: 'User',
		idenum: item.user_list,
		nameenum: item.user_str,
	));} 
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.user_photo_url,
		caption: 'Photo',
	));} 
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewProject (BuildContext context) {  
	return(  ModelView(
		value: item.project_id,
		caption: 'Project',
		idenum: item.project_list,
		nameenum: item.project_str,
	));} 

}


@JsonSerializable()

class ItemTestimonial{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  testimony_id;
  String?  feedback;
  int?user_id;
  String?  user_str;
  String?  user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  String?  user_photo_url;
  Photo? user_photo; 
  DateTime? date;
  int?project_id;
  String?  project_str;
  String?  project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;

	
	 ItemTestimonial(
			this.buttons,
			this.testimony_id,			
			this.feedback,
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.user_photo_url,
			this.user_photo,
			this.date,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,

  );
	

	
  factory ItemTestimonial.fromJson(Map<String, dynamic> json) => _$ItemTestimonialFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTestimonialToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

