import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
import '../option_fields.dart';
import '../image_fields.dart';
import '../file_fields.dart';
part 'show_bids_view_base.g.dart';




SpeedDialChild ListButtonShowBidsWidget(Button button, BuildContext context){
  
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0),
                        onTap: ()=>{ showSearchSelectDialog(context: context,
                        caption:button.text,
                        initialitems: button.selections,
                        initvalue: button.selections![0])
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()=>
		  {AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url!)) }
	  ));
  }

}


@JsonSerializable()
class ViewModelShowBids {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? bid_id;
  int? worker_id;
  String? worker_str;
  String? worker_url;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  DateTime? date;
  int? location_id;
  String? location_str;
  String? location_url;
  List<int?>? location_list;
  List<String?>? location_list_str;
  int? rating;
  int? matching_skills;
  double? amount;
  String? amount_str;
  String? message;
  List<FileField?>? attachments;  
  String? attachments_url;
  String? attachments_name;
  bool read_by_owner;
  bool shortlisted;
  String? captcha;

	
	  ViewModelShowBids(
            this.id,
            this.bid_id,
			this.worker_id,
			this.worker_str,
			this.worker_url,
			this.worker_list,
			this.worker_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.date,
			this.location_id,
			this.location_str,
			this.location_url,
			this.location_list,
			this.location_list_str,
			this.rating,
			this.matching_skills,
			this.amount,
			this.amount_str,
			this.message,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.read_by_owner,
			this.shortlisted,
			this.captcha,

  );

  
   factory ViewModelShowBids.fromJson(Map<String, dynamic> json) => _$ViewModelShowBidsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelShowBidsToJson(this); 
  
}

@JsonSerializable()
class ShowBidsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelShowBids? model;
  ShowBidsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory ShowBidsViewSuperBase.fromJson(Map<String, dynamic> json) => _$ShowBidsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ShowBidsViewSuperBaseToJson(this);
   
}

class ShowBidsViewBase{
	var model;
	Map<String, dynamic> json;
	ShowBidsViewBase(this.json){
		model = ShowBidsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonShowBidsWidget(model.buttons[i],context));
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool visible){
     return(
	 SpeedDial(
                childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context)
	    )
	 );
   } 	
	
	
	
	
  
		    Widget viewWorker (BuildContext context) {  
	   return(  StringView(
			value: model.model.worker_str,
			caption: 'Worker',
		));
		} 
		    Widget viewProject (BuildContext context) {  
	   return(  StringView(
			value: model.model.project_str,
			caption: 'Project',
		));
		} 
	    Widget viewStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.status_str,
			caption: 'Status',
		));
		} 
		    Widget viewDate (BuildContext context) {  
	if(model.model.date != null){
	return(  DateTimeView(
		value: model.model.date,
		caption: 'Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Date',
		    ));
	}			 
	 } 
		    Widget viewLocation (BuildContext context) {  
	   return(  StringView(
			value: model.model.location_str,
			caption: 'Location',
		));
		} 
		    Widget viewRating (BuildContext context) {  
	
	if(model.model.rating != null){
		return(  RatingView(
		value: model.model.rating,
		caption: 'Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Rating',
		 ));	
	}
     }
		    Widget viewMatchingSkills (BuildContext context) {

	if(model.model.matching_skills != null){
		return(  PercentView(
		value: model.model.matching_skills,
		caption: 'Matching Skills',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Matching Skills',
		    ));	
	}
     }
		    Widget viewAmount (BuildContext context) {  			
    if(model.model.amount != null){
		return(  MoneyView(
		value: model.model.amount,
		caption: 'Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Amount',
		    ));
	}			
     }
		    Widget viewMessage (BuildContext context) {  
	if(model.model.message != null){
		return(  ArticleView(
		value: model.model.message,
		caption: 'Message',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Message',
		    ));
	}		
     }
		    Widget viewAttachments (BuildContext context) {  
    if(model.model.attachments == null){
		  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}	
	if(model.model.attachments_name != ''){
	  return(  FileView(
		value: model.model.attachments_name,
		value1: model.model.attachments_url,
		caption: 'Attachments',
	));
	}else{
	  return(  StringView(
		value: '',
		caption: 'Attachments',
	));
	}			
    } 
		    Widget viewReadByOwner (BuildContext context) {  

	if(model.model.read_by_owner != null){
		return(  BooleanView(
		value: model.model.read_by_owner,
		caption: 'Read By Owner',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Read By Owner',
		    ));
	}
     } 
		    Widget viewShortlisted (BuildContext context) {  

	if(model.model.shortlisted != null){
		return(  BooleanView(
		value: model.model.shortlisted,
		caption: 'Shortlisted',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Shortlisted',
		    ));
	}
     } 
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: model.model.captcha,
		caption: 'Captcha',
	));}
  
}









  

