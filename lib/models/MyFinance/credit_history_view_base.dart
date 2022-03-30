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
part 'credit_history_view_base.g.dart';




SpeedDialChild ListButtonCreditHistoryWidget(Button button, BuildContext context){
  
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
class ViewModelCreditHistory {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  DateTime? date;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
  double? amount;
  String? amount_str;
  double? balance;
  String? balance_str;

	
	  ViewModelCreditHistory(
            this.id,
			this.date,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.title,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );

  
   factory ViewModelCreditHistory.fromJson(Map<String, dynamic> json) => _$ViewModelCreditHistoryFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelCreditHistoryToJson(this); 
  
}

@JsonSerializable()
class CreditHistoryViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelCreditHistory? model;
  CreditHistoryViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory CreditHistoryViewSuperBase.fromJson(Map<String, dynamic> json) => _$CreditHistoryViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$CreditHistoryViewSuperBaseToJson(this);
   
}

class CreditHistoryViewBase{
	var model;
	Map<String, dynamic> json;
	CreditHistoryViewBase(this.json){
		model = CreditHistoryViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonCreditHistoryWidget(model.buttons[i],context));
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
	    Widget viewType (BuildContext context) {
	   return(  StringView(
			value: model.model.type_str,
			caption: 'Type',
		));
		} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.title,
		caption: 'Title',
	));}
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
		    Widget viewBalance (BuildContext context) {  			
    if(model.model.balance != null){
		return(  MoneyView(
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









  

