
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
part 'shortlisted_bids_list_item_base.g.dart';

class ItemShortlistedBidsBase {
	var item;
	Map<String, dynamic> json;
	ItemShortlistedBidsBase(this.json){
		item = ItemShortlistedBids.fromJson(json);
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
		value: item.worker_photo_url,
		caption: 'Photo',
	));} 
    Widget viewUserName (BuildContext context) {  
  return(  StringView(
		value:item.worker_user_name,
		caption: 'User Name',
	));}
  Widget viewWorkerPoint (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_worker_point,
		caption: 'Worker Point',
	)
	);}
  Widget viewWorkerRanking (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_worker_ranking,
		caption: 'Worker Ranking',
	)
	);}
  Widget viewKabupaten (BuildContext context) {  
  return(  StringView(
		value: item.worker_kabupaten_str,
		caption: 'Kabupaten',
	));}
   Widget viewWorkerRating (BuildContext context) {
	return(  RatingView(
		value: item.worker_worker_rating,
		caption: 'Worker Rating',
	));}
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.amount,
		caption: 'Amount',
	));}
	Widget viewMatchingSkills (BuildContext context) {
	return(  PercentView(
		value: item.matching_skills,
		caption: 'Matching Skills',
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

}


@JsonSerializable()

class ItemShortlistedBids{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? bid_id;
  String? worker_photo_url;
  Photo? worker_photo; 
  String? worker_user_name;
  int?  worker_worker_point;
  String? worker_worker_point_str;
  int?  worker_worker_ranking;
  String? worker_worker_ranking_str;
  int? worker_kabupaten_id;
  String? worker_kabupaten_str;
  int?  worker_worker_rating;
  double? amount;
  String? amount_str;
  int? matching_skills;
  String? message;
  String? attachments_name;
  String? attachments_url;
  List<FileField?>? attachments;

	
	 ItemShortlistedBids(
			this.buttons,
			this.bid_id,			
			this.worker_photo_url,
			this.worker_photo,
			this.worker_worker_point,
			this.worker_worker_point_str,
			this.worker_worker_ranking,
			this.worker_worker_ranking_str,
			this.worker_kabupaten_id,
			this.worker_kabupaten_str,
			this.amount,
			this.amount_str,
			this.matching_skills,
			this.message,
			this.attachments_name,
			this.attachments_url,
			this.attachments,

  );
	

	
  factory ItemShortlistedBids.fromJson(Map<String, dynamic> json) => _$ItemShortlistedBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemShortlistedBidsToJson(this);
  

   
  
}












  

