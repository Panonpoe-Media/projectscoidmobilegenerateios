

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'my_bids_item_base.g.dart';
//


class ItemMyBidsBase {
	var item;
	Map<String, dynamic> json;
	ItemMyBidsBase(this.json){
		item = ItemMyBids.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
		}
	}


	Widget itemButton( int?index, BuildContext context){
		return(
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: CurrentTheme.MainAccentColor)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						CurrentTheme.SecondaryAccentColor,),
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
  Widget viewProjectStatus (BuildContext context) {  
  return(  StringView(
		value: item.project_project_status_str,
		caption: 'Project Status',
	));}
		    Widget viewWorker (BuildContext context) {  
	return(  ModelView(
		value: item.worker_id,
		caption: 'Worker',
		idenum: item.worker_list,
		nameenum: item.worker_str,
	));} 
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
		    Widget viewShortlisted (BuildContext context) {  
	return(  BooleanView(
		value: item.shortlisted,
		caption: 'Shortlisted',
	));} 
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.amount,
		caption: 'Amount',
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
	  return(  FileViewRev(
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

class ItemMyBids{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  bid_id;
  int?project_id;
  String?  project_str;
  String?  project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int?project_project_status_id;
  String?  project_project_status_str;
  int?worker_id;
  String?  worker_str;
  String?  worker_url;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int?status_id;
  String?  status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  bool? shortlisted;
  DateTime? date;
  double? amount;
  String?  amount_str;
  String?  message;
  String?  attachments_name;
  String?  attachments_url;
  List<FileField?>? attachments;

	
	 ItemMyBids(
			this.buttons,
			this.bid_id,			
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.project_project_status_id,
			this.project_project_status_str,
			this.worker_id,
			this.worker_str,
			this.worker_url,
			this.worker_list,
			this.worker_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.shortlisted,
			this.date,
			this.amount,
			this.amount_str,
			this.message,
			this.attachments_name,
			this.attachments_url,
			this.attachments,

  );
	

	
  factory ItemMyBids.fromJson(Map<String, dynamic> json) => _$ItemMyBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyBidsToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

