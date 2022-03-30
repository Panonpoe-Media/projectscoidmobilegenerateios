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
part 'show_files_view_base.g.dart';




SpeedDialChild ListButtonShowFilesWidget(Button button, BuildContext context){
  
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
class ViewModelShowFiles {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? post_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? thread_id;
  String? thread_str;
  String? thread_url;
  List<int?>? thread_list;
  List<String?>? thread_list_str;
  int? post_type_id;
  String? post_type_str;
  List<int?>? post_type_list;
  List<String?>? post_type_list_str;
  DateTime? post_date;
  double? bid_amount;
  String? bid_amount_str;
  String? message;
  List<FileField?>? attachments;  
  String? attachments_url;
  String? attachments_name;
  bool read_by_owner;
  bool read_by_worker;

	
	  ViewModelShowFiles(
            this.id,
            this.post_id,
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.thread_id,
			this.thread_str,
			this.thread_url,
			this.thread_list,
			this.thread_list_str,
			this.post_type_id,
			this.post_type_str,
			this.post_type_list,
			this.post_type_list_str,
			this.post_date,
			this.bid_amount,
			this.bid_amount_str,
			this.message,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.read_by_owner,
			this.read_by_worker,

  );

  
   factory ViewModelShowFiles.fromJson(Map<String, dynamic> json) => _$ViewModelShowFilesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelShowFilesToJson(this); 
  
}

@JsonSerializable()
class ShowFilesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelShowFiles? model;
  ShowFilesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory ShowFilesViewSuperBase.fromJson(Map<String, dynamic> json) => _$ShowFilesViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ShowFilesViewSuperBaseToJson(this);
   
}

class ShowFilesViewBase{
	var model;
	Map<String, dynamic> json;
	ShowFilesViewBase(this.json){
		model = ShowFilesViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonShowFilesWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewUser (BuildContext context) {  
	   return(  StringView(
			value: model.model.user_str,
			caption: 'User',
		));
		} 
		    Widget viewProject (BuildContext context) {  
	   return(  StringView(
			value: model.model.project_str,
			caption: 'Project',
		));
		} 
		    Widget viewThread (BuildContext context) {  
	   return(  StringView(
			value: model.model.thread_str,
			caption: 'Thread',
		));
		} 
	    Widget viewPostType (BuildContext context) {
	   return(  StringView(
			value: model.model.post_type_str,
			caption: 'Post Type',
		));
		} 
		    Widget viewPostDate (BuildContext context) {  
	if(model.model.post_date != null){
	return(  DateTimeView(
		value: model.model.post_date,
		caption: 'Post Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Post Date',
		    ));
	}			 
	 } 
		    Widget viewBidAmount (BuildContext context) {  			
    if(model.model.bid_amount != null){
		return(  MoneyView(
		value: model.model.bid_amount,
		caption: 'Bid Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Bid Amount',
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
		    Widget viewReadByWorker (BuildContext context) {  

	if(model.model.read_by_worker != null){
		return(  BooleanView(
		value: model.model.read_by_worker,
		caption: 'Read By Worker',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Read By Worker',
		    ));
	}
     } 
  
}









  

