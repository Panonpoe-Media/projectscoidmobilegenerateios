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
part 'comments_view_base.g.dart';




SpeedDialChild ListButtonCommentsWidget(Button button, BuildContext context){
  
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
class ViewModelComments {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? product_post_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? product_id;
  String? product_str;
  String? product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
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
  String? message;
  List<FileField?>? attachments;  
  String? attachments_url;
  String? attachments_name;
  bool read_by_seller;
  bool read_by_buyer;
  String? captcha;

	
	  ViewModelComments(
            this.id,
            this.product_post_id,
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
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
			this.message,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.read_by_seller,
			this.read_by_buyer,
			this.captcha,

  );

  
   factory ViewModelComments.fromJson(Map<String, dynamic> json) => _$ViewModelCommentsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelCommentsToJson(this); 
  
}

@JsonSerializable()
class CommentsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelComments? model;
  CommentsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory CommentsViewSuperBase.fromJson(Map<String, dynamic> json) => _$CommentsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsViewSuperBaseToJson(this);
   
}

class CommentsViewBase{
	var model;
	Map<String, dynamic> json;
	CommentsViewBase(this.json){
		model = CommentsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonCommentsWidget(model.buttons[i],context));
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
		    Widget viewProduct (BuildContext context) {  
	   return(  StringView(
			value: model.model.product_str,
			caption: 'Product',
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
		    Widget viewReadBySeller (BuildContext context) {  

	if(model.model.read_by_seller != null){
		return(  BooleanView(
		value: model.model.read_by_seller,
		caption: 'Read By Seller',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Read By Seller',
		    ));
	}
     } 
		    Widget viewReadByBuyer (BuildContext context) {  

	if(model.model.read_by_buyer != null){
		return(  BooleanView(
		value: model.model.read_by_buyer,
		caption: 'Read By Buyer',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Read By Buyer',
		    ));
	}
     } 
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: model.model.captcha,
		caption: 'Captcha',
	));}
  
}









  

