

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
part 'shortlisted_bids_index_item_base.g.dart';

class ItemIndexShortlistedBidsBase {
	ItemIndexShortlistedBids? item;
	Map<String, dynamic> json;
	ItemIndexShortlistedBidsBase(this.json){
		item = ItemIndexShortlistedBids.fromJson(json);
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
	
	
		    Widget viewWorker (BuildContext context) {  
	return(  ModelView(
		value: item!.worker_id,
		caption: 'Worker',
		idenum: item!.worker_list,
		nameenum: item!.worker_str,
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

}


@JsonSerializable()

class ItemIndexShortlistedBids{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? bid_id;

  int? worker_id;
  String? worker_str;
  String? worker_url;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int? rating;
  int? matching_skills;
  double? amount;
  String? amount_str;

	
	 ItemIndexShortlistedBids(
			this.buttons,
			this.bid_id,
			
			this.worker_id,
			this.worker_str,
			this.worker_url,
			this.worker_list,
			this.worker_list_str,
			this.rating,
			this.matching_skills,
			this.amount,
			this.amount_str,

  );
	

	
  factory ItemIndexShortlistedBids.fromJson(Map<String, dynamic> json) => _$ItemIndexShortlistedBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexShortlistedBidsToJson(this);
  

   
  
}












  














  

