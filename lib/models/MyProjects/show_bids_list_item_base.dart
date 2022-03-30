
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
/** AUTOGENERATE OFF **/

part 'show_bids_list_item_base.g.dart';

class ItemShowBidsBase {
	var item;
	Map<String, dynamic> json;
	ItemShowBidsBase(this.json){
		item = ItemShowBids.fromJson(json);
	}	
	
	List<Widget?>? listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int index, BuildContext context){
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
	
	
   Widget viewPhoto(BuildContext context) {
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
  Widget viewWorkerRatingNum (BuildContext context) {  
  return(  DoubleView(
	  value: item.worker_worker_rating_num,
		caption: 'Worker Rating Num',
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
  Widget viewCurrentProjects (BuildContext context) {  
  return( 
	NumberView(
		value: item.worker_current_projects,
		caption: 'Current Projects',
	)
	);}
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

class ItemShowBids{

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
  double?  worker_worker_rating_num;
  String? worker_worker_rating_num_str;
  double? amount;
  String? amount_str;
  int? matching_skills;
  int?  worker_current_projects;
  String? worker_current_projects_str;
	String? worker_projects_won_str;
	String? worker_completion_rate_str;
  String? message;
  String? attachments_name;
  String? attachments_url;
  List<FileField?>? attachments;

	
	 ItemShowBids(
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
			this.worker_worker_rating_num,
			this.worker_worker_rating_num_str,
			this.amount,
			this.amount_str,
			this.matching_skills,
			this.worker_current_projects,
			this.worker_current_projects_str,
			 this.worker_projects_won_str,
			 this.worker_completion_rate_str,

			 this.message,
			this.attachments_name,
			this.attachments_url,
			this.attachments,

  );
	

	
  factory ItemShowBids.fromJson(Map<String, dynamic> json) => _$ItemShowBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemShowBidsToJson(this);
  

   
  
}












  

