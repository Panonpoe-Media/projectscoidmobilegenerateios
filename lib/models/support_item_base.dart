

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
part 'support_item_base.g.dart';
//


class ItemSupportBase {
	var item;
	Map<String, dynamic> json;
	ItemSupportBase(this.json){
		item = ItemSupport.fromJson(json);
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
	
	
		    Widget viewYourName (BuildContext context) { 
	return(  DisplayNameView(
		value: item.your_name,
		caption: 'Your Name',
	));}
		    Widget viewEmailAddress (BuildContext context) {  
	return(  EmailView(
		value: item.email_address,
		caption: 'Email Address',
	));}
		    Widget viewQuestion (BuildContext context) {  
	return(  MultilineView(
		value: item.question,
		caption: 'Question',
	));}
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewIpAddress (BuildContext context) { 
	return(  DisplayNameView(
		value: item.ip_address,
		caption: 'IP Address',
	));}
		    Widget viewReplied (BuildContext context) {  
	return(  BooleanView(
		value: item.replied,
		caption: 'Replied',
	));} 
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
		    Widget viewReply (BuildContext context) {  
	return(  MultilineView(
		value: item.reply,
		caption: 'Reply',
	));}
		    Widget viewRepliedBy (BuildContext context) {  
	return(  ModelView(
		value: item.replied_by_id,
		caption: 'Replied By',
		idenum: item.replied_by_list,
		nameenum: item.replied_by_str,
	));} 
		    Widget viewRepliedDate (BuildContext context) {  
	return(  DateView(
		value: item.replied_date,
		caption: 'Replied Date',
	));} 
		    Widget viewRepliedIp (BuildContext context) { 
	return(  DisplayNameView(
		value: item.replied_ip,
		caption: 'Replied IP',
	));}
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: item.captcha,
		caption: 'Captcha',
	));}

}


@JsonSerializable()

class ItemSupport{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  contact_form_id;
  String?  your_name;
  String?  email_address;
  String?  question;
  DateTime? date;
  String?  ip_address;
  bool? replied;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  String?  reply;
  int?replied_by_id;
  String?  replied_by_str;
  String?  replied_by_url;
  List<int?>? replied_by_list;
  List<String?>? replied_by_list_str;
  DateTime? replied_date;
  String?  replied_ip;
  String?  captcha;

	
	 ItemSupport(
			this.buttons,
			this.contact_form_id,			
			this.your_name,
			this.email_address,
			this.question,
			this.date,
			this.ip_address,
			this.replied,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.reply,
			this.replied_by_id,
			this.replied_by_str,
			this.replied_by_url,
			this.replied_by_list,
			this.replied_by_list_str,
			this.replied_date,
			this.replied_ip,
			this.captcha,

  );
	

	
  factory ItemSupport.fromJson(Map<String, dynamic> json) => _$ItemSupportFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSupportToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

