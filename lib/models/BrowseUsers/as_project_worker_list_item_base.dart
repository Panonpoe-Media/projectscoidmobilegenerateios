
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
part 'as_project_worker_list_item_base.g.dart';

class ItemAsProjectWorkerBase {
	var item;
	Map<String, dynamic> json;
	ItemAsProjectWorkerBase(this.json){
		item = ItemAsProjectWorker.fromJson(json);
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
		    Widget viewWorkerRating (BuildContext context) {  
	return(  RatingView(
		value: item.worker_rating,
		caption: 'Worker Rating'
	));}
		    Widget viewWorkerFeedback (BuildContext context) {  
	return(  ArticleView(
		value: item.worker_feedback,
		caption: 'Worker Feedback',
	));}
		    Widget viewOwner (BuildContext context) {  
	return(  ModelView(
		value: item.owner_id,
		caption: 'Owner',
		idenum: item.owner_list,
		nameenum: item.owner_str,
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

class ItemAsProjectWorker{

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
  int? worker_rating;
  String? worker_feedback;
  int? owner_id;
  String? owner_str;
  String? owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  DateTime? finish_date;
  String? title;

	
	 ItemAsProjectWorker(
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
			this.worker_rating,
			this.worker_feedback,
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.finish_date,
			this.title,

  );
	

	
  factory ItemAsProjectWorker.fromJson(Map<String, dynamic> json) => _$ItemAsProjectWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$ItemAsProjectWorkerToJson(this);
  

   
  
}












  

