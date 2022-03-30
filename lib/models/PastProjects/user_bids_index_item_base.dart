

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
part 'user_bids_index_item_base.g.dart';

class ItemIndexUserBidsBase {
	ItemIndexUserBids? item;
	Map<String, dynamic> json;
	ItemIndexUserBidsBase(this.json){
		item = ItemIndexUserBids.fromJson(json);
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
				FlatButton(
					child: Text(item!.buttons![index!]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
					textColor: CurrentTheme.MainAccentColor,
					splashColor : CurrentTheme.ShadeColor,
					color : CurrentTheme.SecondaryAccentColor,
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item!.buttons![index!]!.url!));
					},
				)
		);
	}	
	
	
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.date,
		caption: 'Date',
	));} 
		    Widget viewWorker (BuildContext context) {  
	return(  ModelView(
		value: item!.worker_id,
		caption: 'Worker',
		idenum: item!.worker_list,
		nameenum: item!.worker_str,
	));} 
		    Widget viewLocation (BuildContext context) {  
	return(  ModelView(
		value: item!.location_id,
		caption: 'Location',
		idenum: item!.location_list,
		nameenum: item!.location_str,
	));} 
		    Widget viewRating (BuildContext context) {  
	return(  RatingView(
		value: item!.rating,
		caption: 'Rating'
	));}
	Widget viewMatchingSkills (BuildContext context) {
	return(  PercentView(
		value: item!.matching_skills,
		caption: 'Matching Skills',
	));}
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item!.amount,
		caption: 'Amount',
	));}
		    Widget viewShortlisted (BuildContext context) {  
	return(  BooleanView(
		value: item!.shortlisted,
		caption: 'Shortlisted',
	));} 

}


@JsonSerializable()

class ItemIndexUserBids{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? bid_id;

  DateTime? date;
  int? worker_id;
  String? worker_str;
  String? worker_url;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int? location_id;
  String? location_str;
  String? location_url;
  List<int?>? location_list;
  List<String?>? location_list_str;
  int? rating;
  int? matching_skills;
  double? amount;
  String? amount_str;
  bool? shortlisted;

	
	 ItemIndexUserBids(
			this.buttons,
			this.bid_id,
			
			this.date,
			this.worker_id,
			this.worker_str,
			this.worker_url,
			this.worker_list,
			this.worker_list_str,
			this.location_id,
			this.location_str,
			this.location_url,
			this.location_list,
			this.location_list_str,
			this.rating,
			this.matching_skills,
			this.amount,
			this.amount_str,
			this.shortlisted,

  );
	

	
  factory ItemIndexUserBids.fromJson(Map<String, dynamic> json) => _$ItemIndexUserBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexUserBidsToJson(this);
  

   
  
}












  














  

