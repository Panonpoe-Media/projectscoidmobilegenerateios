
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'home_item_base.g.dart';




class ItemHomeBase {
	ItemHome? item;
	Map<String, dynamic> json;
	ItemHomeBase(this.json){
		item = ItemHome.fromJson(json);
	}	
	

	
   Widget viewUserPhoto (BuildContext context) {  
	return(  ImageView(
		value: item!.user_photo!,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item!.user_name!,
		caption: 'User Name',
	));}


	Widget viewUrl (BuildContext context) {  
	return(  TitleView(
		value: item!.url!,
		caption: 'Link',
	));}
		    Widget viewMessage (BuildContext context) { 
	return(  DisplayNameView(
		value: item!.message!,
		caption: 'Message',
	));}

		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.date!,
		caption: 'Date',
	));} 


}


@JsonSerializable()

class ItemHome{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  String? user_photo;
  String? user_name;
  String? url;
  DateTime? date;
  String? message;
  String? notification_id;
	
	 ItemHome(
	 this.user_photo,
	 this.user_name,
	 this.url,
	 this.date,
	 this.message,
	 this.notification_id
  );
	

	
  factory ItemHome.fromJson(Map<String, dynamic> json) => _$ItemHomeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHomeToJson(this);
  

   
  
}












  

