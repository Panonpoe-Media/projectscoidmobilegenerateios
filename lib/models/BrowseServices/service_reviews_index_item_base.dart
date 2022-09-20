

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
part 'service_reviews_index_item_base.g.dart';

class ItemIndexServiceReviewsBase {
	ItemIndexServiceReviews? item;
	Map<String, dynamic> json;
	ItemIndexServiceReviewsBase(this.json){
		item = ItemIndexServiceReviews.fromJson(json);
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
	
	
		    Widget viewOwner (BuildContext context) {  
	return(  ModelView(
		value: item!.owner_id,
		caption: 'Owner',
		idenum: item!.owner_list,
		nameenum: item!.owner_str,
	));} 
		    Widget viewStartDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.start_date,
		caption: 'Start Date',
	));} 
		    Widget viewWorkerRating (BuildContext context) {  
	return(  RatingView(
		value: item!.worker_rating,
		caption: 'Worker Rating'
	));}
		    Widget viewWorkerFeedback (BuildContext context) {  
	return(  ArticleView(
		value: item!.worker_feedback,
		caption: 'Worker Feedback',
	));}

}


@JsonSerializable()

class ItemIndexServiceReviews{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? project_id;

  int? owner_id;
  String? owner_str;
  String? owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  DateTime? start_date;
  int? worker_rating;
  String? worker_feedback;

	
	 ItemIndexServiceReviews(
			this.buttons,
			this.project_id,
			
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.start_date,
			this.worker_rating,
			this.worker_feedback,

  );
	

	
  factory ItemIndexServiceReviews.fromJson(Map<String, dynamic> json) => _$ItemIndexServiceReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexServiceReviewsToJson(this);
  

   
  
}












  














  

