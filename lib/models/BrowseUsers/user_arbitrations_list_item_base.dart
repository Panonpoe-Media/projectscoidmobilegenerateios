
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
part 'user_arbitrations_list_item_base.g.dart';

/** AUTOGENERATE OFF **/
class ItemUserArbitrationsBase {
	var item;
	Map<String, dynamic> json;
	ItemUserArbitrationsBase(this.json){
		item = ItemUserArbitrations.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
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
								const TextStyle(color: CurrentTheme.MainAccentColor)),
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
	
	
		    Widget viewProject (BuildContext context) {  
	return(  ModelView(
		value: item.project_id,
		caption: 'Project',
		idenum: item.project_list,
		nameenum: item.project_str,
	));} 
		    Widget viewPlaintiff (BuildContext context) {  
	return(  ModelView(
		value: item.plaintiff_id,
		caption: 'Plaintiff',
		idenum: item.plaintiff_list,
		nameenum: item.plaintiff_str,
	));} 
		    Widget viewRequestedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.requested_date,
		caption: 'Requested Date',
	));} 
		    Widget viewPlaintiffDescription (BuildContext context) {  
	return(  ArticleView(
		value: item.plaintiff_description,
		caption: 'Plaintiff Description',
	));}
		    Widget viewPlaintiffWishes (BuildContext context) {  
	return(  ArticleView(
		value: item.plaintiff_wishes,
		caption: 'Plaintiff Wishes',
	));}
		    Widget viewDefendant (BuildContext context) {  
	return(  ModelView(
		value: item.defendant_id,
		caption: 'Defendant',
		idenum: item.defendant_list,
		nameenum: item.defendant_str,
	));} 
		    Widget viewDefendantResponseDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.defendant_response_date,
		caption: 'Defendant Response Date',
	));} 
		    Widget viewDefendantDescription (BuildContext context) {  
	return(  ArticleView(
		value: item.defendant_description,
		caption: 'Defendant Description',
	));}
		    Widget viewDefendantWishes (BuildContext context) {  
	return(  ArticleView(
		value: item.defendant_wishes,
		caption: 'Defendant Wishes',
	));}
		    Widget viewAnalysis (BuildContext context) {  
	return(  ArticleView(
		value: item.analysis,
		caption: 'Analysis',
	));}
		    Widget viewDecidedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.decided_date,
		caption: 'Decided Date',
	));} 
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item.type_id,
		caption: 'Type',
		idenum: item.type_list,
		nameenum: item.type_str,
	));} 
		    Widget viewOwnerRating (BuildContext context) {  
	return(  RatingView(
		value: item.owner_rating,
		caption: 'Owner Rating'
	));}
		    Widget viewOwnerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.owner_point,
		caption: 'Owner Point',
	));}
		    Widget viewOwnerAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.owner_amount,
		caption: 'Owner Amount',
	));}
	Widget viewOwnerPercentage (BuildContext context) {
	return(  PercentView(
		value: item.owner_percentage,
		caption: 'Owner Percentage',
	));}
		    Widget viewWorkerRating (BuildContext context) {  
	return(  RatingView(
		value: item.worker_rating,
		caption: 'Worker Rating'
	));}
		    Widget viewWorkerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.worker_point,
		caption: 'Worker Point',
	));}
		    Widget viewWorkerAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.worker_amount,
		caption: 'Worker Amount',
	));}
	Widget viewWorkerPercentage (BuildContext context) {
	return(  PercentView(
		value: item.worker_percentage,
		caption: 'Worker Percentage',
	));}

}


@JsonSerializable()

class ItemUserArbitrations{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? arbitration_id;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? plaintiff_id;
  String? plaintiff_str;
  String? plaintiff_url;
  List<int?>? plaintiff_list;
  List<String?>? plaintiff_list_str;
  DateTime? requested_date;
  String? plaintiff_description;
  String? plaintiff_wishes;
  int? defendant_id;
  String? defendant_str;
  String? defendant_url;
  List<int?>? defendant_list;
  List<String?>? defendant_list_str;
  DateTime? defendant_response_date;
  String? defendant_description;
  String? defendant_wishes;
  String? analysis;
  DateTime? decided_date;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? owner_rating;
  int? owner_point;
  String? owner_point_str;
  double? owner_amount;
  String? owner_amount_str;
  int? owner_percentage;
  int? worker_rating;
  int? worker_point;
  String? worker_point_str;
  double? worker_amount;
  String? worker_amount_str;
  int? worker_percentage;
	String? plaintiff_avatar;
	String? defendant_avatar;

	
	 ItemUserArbitrations(
			this.buttons,
			this.arbitration_id,			
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.plaintiff_id,
			this.plaintiff_str,
			this.plaintiff_url,
			this.plaintiff_list,
			this.plaintiff_list_str,
			this.requested_date,
			this.plaintiff_description,
			this.plaintiff_wishes,
			this.defendant_id,
			this.defendant_str,
			this.defendant_url,
			this.defendant_list,
			this.defendant_list_str,
			this.defendant_response_date,
			this.defendant_description,
			this.defendant_wishes,
			this.analysis,
			this.decided_date,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.owner_rating,
			this.owner_point,
			this.owner_point_str,
			this.owner_amount,
			this.owner_amount_str,
			this.owner_percentage,
			this.worker_rating,
			this.worker_point,
			this.worker_point_str,
			this.worker_amount,
			this.worker_amount_str,
			this.worker_percentage,
			 this.plaintiff_avatar,
			 this.defendant_avatar,

  );
	

	
  factory ItemUserArbitrations.fromJson(Map<String, dynamic> json) => _$ItemUserArbitrationsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUserArbitrationsToJson(this);
  

   
  
}












  

