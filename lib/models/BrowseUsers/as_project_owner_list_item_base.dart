
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
part 'as_project_owner_list_item_base.g.dart';

class ItemAsProjectOwnerBase {
	var item;
	Map<String, dynamic> json;
	ItemAsProjectOwnerBase(this.json){
		item = ItemAsProjectOwner.fromJson(json);
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
	
	
		    Widget viewArbitration (BuildContext context) {  
	return(  ModelView(
		value: item.arbitration_id,
		caption: 'Arbitration',
		idenum: item.arbitration_list,
		nameenum: item.arbitration_str,
	));} 
	    Widget viewProjectEnding (BuildContext context) {
      return( 
	 EnumView(
		value: item.project_ending_id,
		caption: 'Project Ending',
		idenum: item.project_ending_list,
		nameenum: item.project_ending_str,
	));} 
		    Widget viewOwnerRating (BuildContext context) {  
	return(  RatingView(
		value: item.owner_rating,
		caption: 'Owner Rating'
	));}
		    Widget viewOwnerFeedback (BuildContext context) {  
	return(  ArticleView(
		value: item.owner_feedback,
		caption: 'Owner Feedback',
	));}
		    Widget viewAcceptedWorker (BuildContext context) {  
	return(  ModelView(
		value: item.accepted_worker_id,
		caption: 'Accepted Worker',
		idenum: item.accepted_worker_list,
		nameenum: item.accepted_worker_str,
	));} 
		    Widget viewFinishDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.finish_date,
		caption: 'Finish Date',
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}

}


@JsonSerializable()

class ItemAsProjectOwner{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? project_id;
  int? arbitration_id;
  String? arbitration_str;
  String? arbitration_url;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  int? project_ending_id;
  String? project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  int? owner_rating;
  String? owner_feedback;
  int? accepted_worker_id;
  String? accepted_worker_str;
  String? accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  DateTime? finish_date;
  String? title;

	
	 ItemAsProjectOwner(
			this.buttons,
			this.project_id,			
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_url,
			this.arbitration_list,
			this.arbitration_list_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.owner_rating,
			this.owner_feedback,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_url,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.finish_date,
			this.title,

  );
	

	
  factory ItemAsProjectOwner.fromJson(Map<String, dynamic> json) => _$ItemAsProjectOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$ItemAsProjectOwnerToJson(this);
  

   
  
}












  

