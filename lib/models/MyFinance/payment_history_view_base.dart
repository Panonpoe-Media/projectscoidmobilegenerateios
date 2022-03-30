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
part 'payment_history_view_base.g.dart';




SpeedDialChild ListButtonPaymentHistoryWidget(Button button, BuildContext context){
  
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
class ViewModelPaymentHistory {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  int? bank_id;
  String? bank_str;
  String? bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? account_no;
  String? account_name;
  double? amount;
  String? amount_str;
  double? transfer_fee;
  String? transfer_fee_str;
  int? direction_id;
  String? direction_str;
  List<int?>? direction_list;
  List<String?>? direction_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  DateTime? transfer_date;
  String? message;
  String? attachment_url;
  Photo? attachment;

	
	  ViewModelPaymentHistory(
            this.id,
			this.bank_id,
			this.bank_str,
			this.bank_url,
			this.bank_list,
			this.bank_list_str,
			this.account_no,
			this.account_name,
			this.amount,
			this.amount_str,
			this.transfer_fee,
			this.transfer_fee_str,
			this.direction_id,
			this.direction_str,
			this.direction_list,
			this.direction_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.transfer_date,
			this.message,
			this.attachment,
			this.attachment_url,

  );

  
   factory ViewModelPaymentHistory.fromJson(Map<String, dynamic> json) => _$ViewModelPaymentHistoryFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelPaymentHistoryToJson(this); 
  
}

@JsonSerializable()
class PaymentHistoryViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelPaymentHistory? model;
  PaymentHistoryViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory PaymentHistoryViewSuperBase.fromJson(Map<String, dynamic> json) => _$PaymentHistoryViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentHistoryViewSuperBaseToJson(this);
   
}

class PaymentHistoryViewBase{
	var model;
	Map<String, dynamic> json;
	PaymentHistoryViewBase(this.json){
		model = PaymentHistoryViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonPaymentHistoryWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewBank (BuildContext context) {  
	   return(  StringView(
			value: model.model.bank_str,
			caption: 'Bank',
		));
		} 
		    Widget viewAccountNo (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.account_no,
		caption: 'Account No',
	));}
		    Widget viewAccountName (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.account_name,
		caption: 'Account Name',
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
		    Widget viewTransferFee (BuildContext context) {  			
    if(model.model.transfer_fee != null){
		return(  MoneyView(
		value: model.model.transfer_fee,
		caption: 'Transfer Fee',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Transfer Fee',
		    ));
	}			
     }
	    Widget viewDirection (BuildContext context) {
	   return(  StringView(
			value: model.model.direction_str,
			caption: 'Direction',
		));
		} 
	    Widget viewStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.status_str,
			caption: 'Status',
		));
		} 
		    Widget viewTransferDate (BuildContext context) {  
	if(model.model.transfer_date != null){
	return(  DateTimeView(
		value: model.model.transfer_date,
		caption: 'Transfer Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Transfer Date',
		    ));
	}			 
	 } 
		    Widget viewMessage (BuildContext context) {  
	return(  MultilineView(
		value: model.model.message,
		caption: 'Message',
	));}
		    Widget viewAttachment (BuildContext context) {  
	return(  ImageView(
		value: model.model.attachment_url,
		caption: 'Attachment',
	));} 
  
}









  

