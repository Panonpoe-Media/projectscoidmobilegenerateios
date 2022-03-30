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
part 'points_pesta_view_base.g.dart';




SpeedDialChild ListButtonPointsPestaWidget(Button button, BuildContext context){
  
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
class ViewModelPointsPesta {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? point_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  DateTime? date;
  String? title;
  int? amount;
  String? amount_str;
  int? balance;
  String? balance_str;

	
	  ViewModelPointsPesta(
            this.id,
            this.point_id,
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.date,
			this.title,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );

  
   factory ViewModelPointsPesta.fromJson(Map<String, dynamic> json) => _$ViewModelPointsPestaFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelPointsPestaToJson(this); 
  
}

@JsonSerializable()
class PointsPestaViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelPointsPesta? model;
  PointsPestaViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory PointsPestaViewSuperBase.fromJson(Map<String, dynamic> json) => _$PointsPestaViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$PointsPestaViewSuperBaseToJson(this);
   
}

class PointsPestaViewBase{
	var model;
	Map<String, dynamic> json;
	PointsPestaViewBase(this.json){
		model = PointsPestaViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonPointsPestaWidget(model.buttons[i],context));
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
	    Widget viewType (BuildContext context) {
	   return(  StringView(
			value: model.model.type_str,
			caption: 'Type',
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
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.title,
		caption: 'Title',
	));}
		    Widget viewAmount (BuildContext context) { 
    if(model.model.amount != null){
		return(  NumberView(
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
		    Widget viewBalance (BuildContext context) { 
    if(model.model.balance != null){
		return(  NumberView(
		value: model.model.balance,
		caption: 'Balance',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Balance',
		));
	}		
     }
  
}









  

