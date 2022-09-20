
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
part 'show_conversation_list_item_base.g.dart';

class ItemShowConversationBase {
	var item;
	Map<String, dynamic> json;
	ItemShowConversationBase(this.json){
		item = ItemShowConversation.fromJson(json);
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
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
                    style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewPostDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.post_date,
		caption: 'Post Date',
	));} 
		    Widget viewMessage (BuildContext context) {  
	return(  ArticleView(
		value: item.message,
		caption: 'Message',
	));}
		    Widget viewAttachments (BuildContext context) {  
    if(item.attachments == null){
		  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}			
	if(item.attachments_name != ''){
	  return(  FileViewAtt(
	    ctx: context,
		value: item.attachments_name,
		value1: item.attachments_url,
		caption: 'Attachments',
	));
	}else{
	  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}		
     } 
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.user_photo_url,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item.user_user_name,
		caption: 'User Name',
	));}
   Widget viewOwnerRating (BuildContext context) {
	return(  RatingView(
		value: item.user_owner_rating,
		caption: 'Owner Rating',
	));}
  Widget viewOwnerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.user_owner_point,
		caption: 'Owner Point',
	)
	);}
  Widget viewOwnerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.user_owner_ranking,
		caption: 'Owner Ranking',
	)
	);}
   Widget viewWorkerRating (BuildContext context) {
	return(  RatingView(
		value: item.user_worker_rating,
		caption: 'Worker Rating',
	));}
  Widget viewWorkerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.user_worker_point,
		caption: 'Worker Point',
	)
	);}
  Widget viewWorkerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.user_worker_ranking,
		caption: 'Worker Ranking',
	)
	);}
  Widget viewKabupaten (BuildContext context) {  
  return(  StringView(
		value: item.user_kabupaten_str,
		caption: 'Kabupaten',
	));}

}


@JsonSerializable()

class ItemShowConversation{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? post_id;
  DateTime? post_date;
  String? message;
  String? attachments_name;
  String? attachments_url;
  List<FileField?>? attachments;
  String? user_photo_url;
  Photo? user_photo; 
  String? user_user_name;
  int?  user_owner_rating;
  int?  user_owner_point;
  String? user_owner_point_str;
  int?  user_owner_ranking;
  String? user_owner_ranking_str;
  int?  user_worker_rating;
  int?  user_worker_point;
  String? user_worker_point_str;
  int?  user_worker_ranking;
  String? user_worker_ranking_str;
  int? user_kabupaten_id;
  String? user_kabupaten_str;

	
	 ItemShowConversation(
			this.buttons,
			this.post_id,			
			this.post_date,
			this.message,
			this.attachments_name,
			this.attachments_url,
			this.attachments,
			this.user_photo_url,
			this.user_photo,
			this.user_owner_point,
			this.user_owner_point_str,
			this.user_owner_ranking,
			this.user_owner_ranking_str,
			this.user_worker_point,
			this.user_worker_point_str,
			this.user_worker_ranking,
			this.user_worker_ranking_str,
			this.user_kabupaten_id,
			this.user_kabupaten_str,

  );
	

	
  factory ItemShowConversation.fromJson(Map<String, dynamic> json) => _$ItemShowConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemShowConversationToJson(this);
  

   
  
}












  

