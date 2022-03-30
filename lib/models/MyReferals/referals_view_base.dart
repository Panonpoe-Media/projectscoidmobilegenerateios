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
part 'referals_view_base.g.dart';




SpeedDialChild ListButtonReferalsWidget(Button button, BuildContext context){
  
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
class ViewModelReferals {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? user_name;
  DateTime? date_registered;
  DateTime? referer_expires;
  DateTime? last_seen;
  int? current_projects;
  String? current_projects_str;
  int? projects_won;
  String? projects_won_str;
  int? projects_owned;
  String? projects_owned_str;
  int? product_sold;
  String? product_sold_str;
  int? product_bought;
  String? product_bought_str;

	
	  ViewModelReferals(
            this.id,
			this.user_name,
			this.date_registered,
			this.referer_expires,
			this.last_seen,
			this.current_projects,
			this.current_projects_str,
			this.projects_won,
			this.projects_won_str,
			this.projects_owned,
			this.projects_owned_str,
			this.product_sold,
			this.product_sold_str,
			this.product_bought,
			this.product_bought_str,

  );

  
   factory ViewModelReferals.fromJson(Map<String, dynamic> json) => _$ViewModelReferalsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelReferalsToJson(this); 
  
}

@JsonSerializable()
class ReferalsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelReferals? model;
  ReferalsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory ReferalsViewSuperBase.fromJson(Map<String, dynamic> json) => _$ReferalsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReferalsViewSuperBaseToJson(this);
   
}

class ReferalsViewBase{
	var model;
	Map<String, dynamic> json;
	ReferalsViewBase(this.json){
		model = ReferalsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonReferalsWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: model.model.user_name,
		caption: 'User Name',
	));}
		    Widget viewDateRegistered (BuildContext context) {  
	if(model.model.date_registered != null){
	return(  DateTimeView(
		value: model.model.date_registered,
		caption: 'Date Registered',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Date Registered',
		    ));
	}			 
	 } 
		    Widget viewRefererExpires (BuildContext context) {  
	if(model.model.referer_expires != null){
	return(  DateTimeView(
		value: model.model.referer_expires,
		caption: 'Referer Expires',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Referer Expires',
		    ));
	}			 
	 } 
		    Widget viewLastSeen (BuildContext context) {  
	if(model.model.last_seen != null){
	return(  DateTimeView(
		value: model.model.last_seen,
		caption: 'Last Seen',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Last Seen',
		    ));
	}			 
	 } 
		    Widget viewCurrentProjects (BuildContext context) { 
    if(model.model.current_projects != null){
		return(  NumberView(
		value: model.model.current_projects,
		caption: 'Current Projects',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Current Projects',
		));
	}		
     }
		    Widget viewProjectsWon (BuildContext context) { 
    if(model.model.projects_won != null){
		return(  NumberView(
		value: model.model.projects_won,
		caption: 'Projects Won',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Projects Won',
		));
	}		
     }
		    Widget viewProjectsOwned (BuildContext context) { 
    if(model.model.projects_owned != null){
		return(  NumberView(
		value: model.model.projects_owned,
		caption: 'Projects Owned',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Projects Owned',
		));
	}		
     }
		    Widget viewProductSold (BuildContext context) { 
    if(model.model.product_sold != null){
		return(  NumberView(
		value: model.model.product_sold,
		caption: 'Product Sold',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Product Sold',
		));
	}		
     }
		    Widget viewProductBought (BuildContext context) { 
    if(model.model.product_bought != null){
		return(  NumberView(
		value: model.model.product_bought,
		caption: 'Product Bought',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Product Bought',
		));
	}		
     }
  
}









  

