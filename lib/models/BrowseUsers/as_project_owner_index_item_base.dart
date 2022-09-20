

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
part 'as_project_owner_index_item_base.g.dart';

class ItemIndexAsProjectOwnerBase {
	ItemIndexAsProjectOwner? item;
	Map<String, dynamic> json;
	ItemIndexAsProjectOwnerBase(this.json){
		item = ItemIndexAsProjectOwner.fromJson(json);
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
		    Widget viewCategory (BuildContext context) {  
	return(  ModelView(
		value: item!.category_id,
		caption: 'Category',
		idenum: item!.category_list,
		nameenum: item!.category_str,
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item!.title,
		caption: 'Title',
	));}
	    Widget viewProjectClass (BuildContext context) {
      return( 
	 EnumView(
		value: item!.project_class_id,
		caption: 'Project Class',
		idenum: item!.project_class_list,
		nameenum: item!.project_class_str,
	));} 
		    Widget viewBudgetRange (BuildContext context) {  
	return(  RangeView(
		value: item!.budget_range_str,
		caption: 'Budget Range'
	));}
		    Widget viewPublishedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item!.published_date,
		caption: 'Published Date',
	));} 

}


@JsonSerializable()

class ItemIndexAsProjectOwner{

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
  int? category_id;
  String? category_str;
  String? category_url;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  int? project_class_id;
  String? project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
 String? budget_range;
  double? budget_range_min;
  String? budget_range_min_str;
  double? budget_range_max;
  String? budget_range_max_str;
  String? budget_range_str;
  DateTime? published_date;

	
	 ItemIndexAsProjectOwner(
			this.buttons,
			this.project_id,
			
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.category_id,
			this.category_str,
			this.category_url,
			this.category_list,
			this.category_list_str,
			this.title,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.published_date,

  );
	

	
  factory ItemIndexAsProjectOwner.fromJson(Map<String, dynamic> json) => _$ItemIndexAsProjectOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexAsProjectOwnerToJson(this);
  

   
  
}












  














  

