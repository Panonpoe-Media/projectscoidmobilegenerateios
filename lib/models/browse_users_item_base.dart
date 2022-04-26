

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
part 'browse_users_item_base.g.dart';
//


class ItemBrowseUsersBase {
	var item;
	Map<String, dynamic> json;
	ItemBrowseUsersBase(this.json){
		item = ItemBrowseUsers.fromJson(json);
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
	
	
		    Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.photo_url,
		caption: 'Photo',
	));} 
		    Widget viewOnline (BuildContext context) {  
	return(  BooleanView(
		value: item.online,
		caption: 'Online',
	));} 
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: item.user_name,
		caption: 'User Name',
	));}
		    Widget viewWorkerRating (BuildContext context) {  
	return(  RatingView(
		value: item.worker_rating,
		caption: 'Worker Rating'
	));}
		    Widget viewWorkerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.worker_rating_num,
		caption: 'Worker Rating Num',
	));}
		    Widget viewWorkerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.worker_point,
		caption: 'Worker Point',
	));}
		    Widget viewWorkerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.worker_ranking,
		caption: 'Worker Ranking',
	));}
		    Widget viewProjectsCompleted (BuildContext context) { 
	return(  NumberView(
		value: item.projects_completed,
		caption: 'Projects Completed',
	));}
		    Widget viewOwnerRating (BuildContext context) {  
	return(  RatingView(
		value: item.owner_rating,
		caption: 'Owner Rating'
	));}
		    Widget viewOwnerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.owner_rating_num,
		caption: 'Owner Rating Num',
	));}
		    Widget viewOwnerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.owner_point,
		caption: 'Owner Point',
	));}
		    Widget viewOwnerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.owner_ranking,
		caption: 'Owner Ranking',
	));}
		    Widget viewProjectsOwned (BuildContext context) { 
	return(  NumberView(
		value: item.projects_owned,
		caption: 'Projects Owned',
	));}
		    Widget viewSellerRating (BuildContext context) {  
	return(  RatingView(
		value: item.seller_rating,
		caption: 'Seller Rating'
	));}
		    Widget viewSellerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.seller_rating_num,
		caption: 'Seller Rating Num',
	));}
		    Widget viewSellerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.seller_point,
		caption: 'Seller Point',
	));}
		    Widget viewSellerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.seller_ranking,
		caption: 'Seller Ranking',
	));}
		    Widget viewProductSold (BuildContext context) { 
	return(  NumberView(
		value: item.product_sold,
		caption: 'Product Sold',
	));}
		    Widget viewAffiliateRating (BuildContext context) {  
	return(  RatingView(
		value: item.affiliate_rating,
		caption: 'Affiliate Rating'
	));}
		    Widget viewAffiliateRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.affiliate_rating_num,
		caption: 'Affiliate Rating Num',
	));}
		    Widget viewAffiliatePoint (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_point,
		caption: 'Affiliate Point',
	));}
		    Widget viewAffiliateRanking (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_ranking,
		caption: 'Affiliate Ranking',
	));}
		    Widget viewReferedUsers (BuildContext context) { 
	return(  NumberView(
		value: item.refered_users,
		caption: 'Refered Users',
	));}
		    Widget viewSelfIntroduction (BuildContext context) {  
	return(  ArticleView(
		value: item.self_introduction,
		caption: 'Self Introduction',
	));}
	Widget viewSkills (BuildContext context) {  
	return( 	ChannelRouteTagsWidget(
                value: item.skills_id,
                caption: '',
                hint: ' ',
                required: true,
                idroutetags: item.skills_id,
                nameroutetags: item.skills_str,
                urlroutetags: item.skills_url,
                getValue: (String?  val) {
                  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
                },
              ));} 

}


@JsonSerializable()

class ItemBrowseUsers{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  user_id;
  String?  photo_url;
  Photo? photo;
  bool? online;
  String?  user_name;
  int?worker_rating;
  double? worker_rating_num;
  String?  worker_rating_num_str;
  int?worker_point;
  String?  worker_point_str;
  int?worker_ranking;
  String?  worker_ranking_str;
  int?projects_completed;
  String?  projects_completed_str;
  int?owner_rating;
  double? owner_rating_num;
  String?  owner_rating_num_str;
  int?owner_point;
  String?  owner_point_str;
  int?owner_ranking;
  String?  owner_ranking_str;
  int?projects_owned;
  String?  projects_owned_str;
  int?seller_rating;
  double? seller_rating_num;
  String?  seller_rating_num_str;
  int?seller_point;
  String?  seller_point_str;
  int?seller_ranking;
  String?  seller_ranking_str;
  int?product_sold;
  String?  product_sold_str;
  int?affiliate_rating;
  double? affiliate_rating_num;
  String?  affiliate_rating_num_str;
  int?affiliate_point;
  String?  affiliate_point_str;
  int?affiliate_ranking;
  String?  affiliate_ranking_str;
  int?refered_users;
  String?  refered_users_str;
  String?  self_introduction;
  List<int?>? skills_id;
  List<String?>?  skills_str;
  List<String?>? skills_url;

	
	 ItemBrowseUsers(
			this.buttons,
			this.user_id,			
			this.photo,
			this.photo_url,
			this.online,
			this.user_name,
			this.worker_rating,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_point,
			this.worker_point_str,
			this.worker_ranking,
			this.worker_ranking_str,
			this.projects_completed,
			this.projects_completed_str,
			this.owner_rating,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_point,
			this.owner_point_str,
			this.owner_ranking,
			this.owner_ranking_str,
			this.projects_owned,
			this.projects_owned_str,
			this.seller_rating,
			this.seller_rating_num,
			this.seller_rating_num_str,
			this.seller_point,
			this.seller_point_str,
			this.seller_ranking,
			this.seller_ranking_str,
			this.product_sold,
			this.product_sold_str,
			this.affiliate_rating,
			this.affiliate_rating_num,
			this.affiliate_rating_num_str,
			this.affiliate_point,
			this.affiliate_point_str,
			this.affiliate_ranking,
			this.affiliate_ranking_str,
			this.refered_users,
			this.refered_users_str,
			this.self_introduction,
			this.skills_id,
			this.skills_str,
			this.skills_url,

  );
	

	
  factory ItemBrowseUsers.fromJson(Map<String, dynamic> json) => _$ItemBrowseUsersFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBrowseUsersToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

