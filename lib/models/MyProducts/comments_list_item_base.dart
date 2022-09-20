
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
part 'comments_list_item_base.g.dart';

class ItemCommentsBase {
	var item;
	Map<String, dynamic> json;
	ItemCommentsBase(this.json){
		item = ItemComments.fromJson(json);
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
   Widget viewSellerRating (BuildContext context) {
	return(  RatingView(
		value: item.user_seller_rating,
		caption: 'Seller Rating',
	));}
  Widget viewSellerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.user_seller_ranking,
		caption: 'Seller Ranking',
	)
	);}
  Widget viewKabupaten (BuildContext context) {  
  return(  StringView(
		value: item.user_kabupaten_str,
		caption: 'Kabupaten',
	));}
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

}


@JsonSerializable()

class ItemComments{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? product_post_id;
  String? user_photo_url;
  Photo? user_photo; 
  String? user_user_name;
  int?  user_seller_rating;
  int?  user_seller_ranking;
  String? user_seller_ranking_str;
  int? user_kabupaten_id;
  String? user_kabupaten_str;
  DateTime? post_date;
  String? message;

	
	 ItemComments(
			this.buttons,
			this.product_post_id,			
			this.user_photo_url,
			this.user_photo,
			this.user_seller_ranking,
			this.user_seller_ranking_str,
			this.user_kabupaten_id,
			this.user_kabupaten_str,
			this.post_date,
			this.message,

  );
	

	
  factory ItemComments.fromJson(Map<String, dynamic> json) => _$ItemCommentsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCommentsToJson(this);
  

   
  
}












  

