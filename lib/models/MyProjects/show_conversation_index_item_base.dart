

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
part 'show_conversation_index_item_base.g.dart';

class ItemIndexShowConversationBase {
	ItemIndexShowConversation? item;
	Map<String, dynamic> json;
	ItemIndexShowConversationBase(this.json){
		item = ItemIndexShowConversation.fromJson(json);
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
				TextButton(
					child: Text(item!.buttons![index!]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
					style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
		
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
	    Widget viewPostType (BuildContext context) {
      return( 
	 EnumView(
		value: item!.post_type_id,
		caption: 'Post Type',
		idenum: item!.post_type_list,
		nameenum: item!.post_type_str,
	));} 
		    Widget viewPostDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.post_date,
		caption: 'Post Date',
	));} 
		    Widget viewBidAmount (BuildContext context) {  
	return(  MoneyView(
		value: item!.bid_amount,
		caption: 'Bid Amount',
	));}
		    Widget viewMessage (BuildContext context) {  
	return(  ArticleView(
		value: item!.message,
		caption: 'Message',
	));}

}


@JsonSerializable()

class ItemIndexShowConversation{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? post_id;

  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? post_type_id;
  String? post_type_str;
  List<int?>? post_type_list;
  List<String?>? post_type_list_str;
  DateTime? post_date;
  double? bid_amount;
  String? bid_amount_str;
  String? message;

	
	 ItemIndexShowConversation(
			this.buttons,
			this.post_id,
			
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.post_type_id,
			this.post_type_str,
			this.post_type_list,
			this.post_type_list_str,
			this.post_date,
			this.bid_amount,
			this.bid_amount_str,
			this.message,

  );
	

	
  factory ItemIndexShowConversation.fromJson(Map<String, dynamic> json) => _$ItemIndexShowConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexShowConversationToJson(this);
  

   
  
}












  














  

