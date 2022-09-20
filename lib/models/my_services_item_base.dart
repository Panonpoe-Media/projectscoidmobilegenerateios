

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
part 'my_services_item_base.g.dart';
//


class ItemMyServicesBase {
	var item;
	Map<String, dynamic> json;
	ItemMyServicesBase(this.json){
		item = ItemMyServices.fromJson(json);
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
	
	
		    Widget viewSeller (BuildContext context) {  
	return(  ModelView(
		value: item.seller_id,
		caption: 'Seller',
		idenum: item.seller_list,
		nameenum: item.seller_str,
	));} 
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: item.logo_url,
		caption: 'Logo',
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: item.short_description,
		caption: 'Short Description',
	));}
	Widget viewTags (BuildContext context) {  
	return( 	ChannelRouteTagsWidget(
                value: item.tags_id,
                caption: '',
                hint: ' ',
                required: true,
                idroutetags: item.tags_id,
                nameroutetags: item.tags_str,
                urlroutetags: item.tags_url,
                getValue: (String?  val) {
                  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
                },
              ));} 
		    Widget viewPublishedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.published_date,
		caption: 'Published Date',
	));} 
		    Widget viewLastBump (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_bump,
		caption: 'Last Bump',
	));} 
		    Widget viewPrice (BuildContext context) {  
	return(  MoneyView(
		value: item.price,
		caption: 'Price',
	));}
		    Widget viewFinishDays (BuildContext context) { 
	return(  NumberView(
		value: item.finish_days,
		caption: 'Finish Days',
	));}
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
		    Widget viewAdminNote (BuildContext context) {  
	return(  ArticleView(
		value: item.admin_note,
		caption: 'Admin Note',
	));}

}


@JsonSerializable()

class ItemMyServices{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  service_id;
  int?seller_id;
  String?  seller_str;
  String?  seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String?  logo_url;
  Photo? logo;
  String?  title;
  String?  short_description;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  DateTime? published_date;
  DateTime? last_bump;
  double? price;
  String?  price_str;
  int?finish_days;
  String?  finish_days_str;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  String?  admin_note;

	
	 ItemMyServices(
			this.buttons,
			this.service_id,			
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.title,
			this.short_description,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.published_date,
			this.last_bump,
			this.price,
			this.price_str,
			this.finish_days,
			this.finish_days_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.admin_note,

  );
	

	
  factory ItemMyServices.fromJson(Map<String, dynamic> json) => _$ItemMyServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyServicesToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

