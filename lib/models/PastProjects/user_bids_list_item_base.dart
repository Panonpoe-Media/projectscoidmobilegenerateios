
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
part 'user_bids_list_item_base.g.dart';

class ItemUserBidsBase {
	var item;
	Map<String, dynamic> json;
	ItemUserBidsBase(this.json){
		item = ItemUserBids.fromJson(json);
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
	
	
    Widget viewUserId (BuildContext context) {  
  return(  StringView(
		value:item.worker_user_id,
		caption: 'User ID',
	));}
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.worker_photo_url,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item.worker_user_name,
		caption: 'User Name',
	));}
   Widget viewWorkerRating (BuildContext context) {
	return(  RatingView(
		value: item.worker_worker_rating,
		caption: 'Worker Rating',
	));}
  Widget viewWorkerRatingNum (BuildContext context) {  
  return(  DoubleView(
	  value: item.worker_worker_rating_num,
		caption: 'Worker Rating Num',
	));}

    Widget viewLastSeen (BuildContext context) {  
  return(  StringView(
		value:item.worker_last_seen,
		caption: 'Last Seen',
	));}
  Widget viewProjectsWon (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_projects_won,
		caption: 'Projects Won',
	)
	);}
  Widget viewProjectsCompleted (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_projects_completed,
		caption: 'Projects Completed',
	)
	);}
  Widget viewProjectsArbitrated (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_projects_arbitrated,
		caption: 'Projects Arbitrated',
	)
	);}
  Widget viewProjectsWonInArbitration (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_projects_won_in_arbitration,
		caption: 'Projects Won in Arbitration',
	)
	);}
  Widget viewProjectsLostInArbitration (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_projects_lost_in_arbitration,
		caption: 'Projects Lost in Arbitration',
	)
	);}

}


@JsonSerializable()

class ItemUserBids{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? bid_id;
  String? worker_user_id;
  String? worker_photo_url;
  Photo? worker_photo; 
  String? worker_user_name;
  int?  worker_worker_rating;
  double?  worker_worker_rating_num;
  String? worker_worker_rating_num_str;
  String? worker_last_seen;
  int?  worker_projects_won;
  String? worker_projects_won_str;
  int?  worker_projects_completed;
  String? worker_projects_completed_str;
  int?  worker_projects_arbitrated;
  String? worker_projects_arbitrated_str;
  int?  worker_projects_won_in_arbitration;
  String? worker_projects_won_in_arbitration_str;
  int?  worker_projects_lost_in_arbitration;
  String? worker_projects_lost_in_arbitration_str;

	
	 ItemUserBids(
			this.buttons,
			this.bid_id,			
			this.worker_photo_url,
			this.worker_photo,
			this.worker_worker_rating_num,
			this.worker_worker_rating_num_str,
			this.worker_projects_won,
			this.worker_projects_won_str,
			this.worker_projects_completed,
			this.worker_projects_completed_str,
			this.worker_projects_arbitrated,
			this.worker_projects_arbitrated_str,
			this.worker_projects_won_in_arbitration,
			this.worker_projects_won_in_arbitration_str,
			this.worker_projects_lost_in_arbitration,
			this.worker_projects_lost_in_arbitration_str,

  );
	

	
  factory ItemUserBids.fromJson(Map<String, dynamic> json) => _$ItemUserBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUserBidsToJson(this);
  

   
  
}












  

