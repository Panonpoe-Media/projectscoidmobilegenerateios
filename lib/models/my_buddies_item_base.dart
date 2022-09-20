

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
part 'my_buddies_item_base.g.dart';
//


class ItemMyBuddiesBase {
	var item;
	Map<String, dynamic> json;
	ItemMyBuddiesBase(this.json){
		item = ItemMyBuddies.fromJson(json);
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
	
	
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.fav_photo_url,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item.fav_user_name,
		caption: 'User Name',
	));}
    Widget viewDisplayName (BuildContext context) {  
  return(  StringView(
		value:item.fav_display_name,
		caption: 'Display Name',
	));}
  Widget viewCountry (BuildContext context) {  
  return(  StringView(
		value: item.fav_country_str,
		caption: 'Country',
	));}
  Widget viewProvinsi (BuildContext context) {  
  return(  StringView(
		value: item.fav_provinsi_str,
		caption: 'Provinsi',
	));}
  Widget viewKabupaten (BuildContext context) {  
  return(  StringView(
		value: item.fav_kabupaten_str,
		caption: 'Kabupaten',
	));}
    Widget viewWebsite (BuildContext context) {  
  return(  StringView(
		value:item.fav_website,
		caption: 'Website',
	));}
    Widget viewSelfIntroduction (BuildContext context) {  
  return(  StringView(
		value:item.fav_self_introduction,
		caption: 'Self Introduction',
	));}
  Widget viewWorkerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_worker_ranking,
		caption: 'Worker Ranking',
	)
	);}
  Widget viewWorkerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_worker_point,
		caption: 'Worker Point',
	)
	);}
   Widget viewWorkerRating (BuildContext context) {
	return(  RatingView(
		value: item.fav_worker_rating,
		caption: 'Worker Rating',
	));}
  Widget viewOwnerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_owner_ranking,
		caption: 'Owner Ranking',
	)
	);}
  Widget viewOwnerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_owner_point,
		caption: 'Owner Point',
	)
	);}
   Widget viewOwnerRating (BuildContext context) {
	return(  RatingView(
		value: item.fav_owner_rating,
		caption: 'Owner Rating',
	));}
  Widget viewSellerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_seller_ranking,
		caption: 'Seller Ranking',
	)
	);}
  Widget viewSellerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.fav_seller_point,
		caption: 'Seller Point',
	)
	);}
   Widget viewSellerRating (BuildContext context) {
	return(  RatingView(
		value: item.fav_seller_rating,
		caption: 'Seller Rating',
	));}

}


@JsonSerializable()

class ItemMyBuddies{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  buddy_id;
  String?  fav_photo_url;
  Photo? fav_photo; 
  String?  fav_user_name;
  String?  fav_display_name;
  int?fav_country_id;
  String?  fav_country_str;
  int?fav_provinsi_id;
  String?  fav_provinsi_str;
  int?fav_kabupaten_id;
  String?  fav_kabupaten_str;
  String?  fav_website;
  String?  fav_self_introduction;
  int? fav_worker_ranking;
  String?  fav_worker_ranking_str;
  int? fav_worker_point;
  String?  fav_worker_point_str;
  int? fav_worker_rating;
  int? fav_owner_ranking;
  String?  fav_owner_ranking_str;
  int? fav_owner_point;
  String?  fav_owner_point_str;
  int? fav_owner_rating;
  int? fav_seller_ranking;
  String?  fav_seller_ranking_str;
  int? fav_seller_point;
  String?  fav_seller_point_str;
  int? fav_seller_rating;

	
	 ItemMyBuddies(
			this.buttons,
			this.buddy_id,			
			this.fav_photo_url,
			this.fav_photo,
			this.fav_country_id,
			this.fav_country_str,
			this.fav_provinsi_id,
			this.fav_provinsi_str,
			this.fav_kabupaten_id,
			this.fav_kabupaten_str,
			this.fav_worker_ranking,
			this.fav_worker_ranking_str,
			this.fav_worker_point,
			this.fav_worker_point_str,
			this.fav_owner_ranking,
			this.fav_owner_ranking_str,
			this.fav_owner_point,
			this.fav_owner_point_str,
			this.fav_seller_ranking,
			this.fav_seller_ranking_str,
			this.fav_seller_point,
			this.fav_seller_point_str,

  );
	

	
  factory ItemMyBuddies.fromJson(Map<String, dynamic> json) => _$ItemMyBuddiesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyBuddiesToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

