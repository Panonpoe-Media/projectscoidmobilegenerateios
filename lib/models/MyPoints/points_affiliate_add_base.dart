
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
part 'points_affiliate_add_base.g.dart';



SpeedDialChild ButtonEditPointsAffiliateWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController points_affiliate,
 var postPointsAffiliateResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        //AppProvider.getRouter(context).navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        points_affiliate =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = points_affiliate.sendData();
                        future.then((value) {
                        state.setState(() {
                        postPointsAffiliateResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelPointsAffiliate {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?point_id;
   int?user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
   int?type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  DateTime? date;
  String? title;
   int?amount;
  String? amount_str;
   int?balance;
  String? balance_str;

	
	  AddModelPointsAffiliate(
            this.id,
            this.point_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.amount,
			this.amount_str,
			this.balance,
			this.balance_str,

  );
    factory AddModelPointsAffiliate.fromJson(Map<String, dynamic> json) => _$AddModelPointsAffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelPointsAffiliateToJson(this);

}



@JsonSerializable()

class PointsAffiliateSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelPointsAffiliate? model;
  PointsAffiliateSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory PointsAffiliateSuperBase.fromJson(Map<String, dynamic> json) => _$PointsAffiliateSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PointsAffiliateSuperBaseToJson(this);
   
}




class PointsAffiliateAddBase{
	var model;
	Map<String, dynamic> json;
	PointsAffiliateAddBase(this.json){
		model = PointsAffiliateSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "points_affiliate[_trigger_]":"",
  "points_affiliate[user_id]": "${model.model.user_id }",
   "points_affiliate[type_id]": "${model.model.type_id}",
  "points_affiliate[date]": "${model.model.date}",
  "points_affiliate[title]": "${model.model.title }",
  "points_affiliate[amount]": "${model.model.amount }",
  "points_affiliate[balance]": "${model.model.balance }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController points_affiliate,
  var postPointsAffiliateResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditPointsAffiliateWidget(model.buttons[i], context,formKey, controller,points_affiliate, postPointsAffiliateResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController points_affiliate,
  var postPointsAffiliateResult, State state, String? sendPath, String? id,  String? title ){
     return(
	 SpeedDial(
				//marginRight: 18,
				//marginBottom: 20,
				 childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible!,
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
				children:listButton(context, formKey,controller,points_affiliate, postPointsAffiliateResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editUser (State state) {
	   return(  StringView(
		value: model.model.user_str,
		caption: 'User',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.user_id,
	  caption: 'User',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.user_id_list,
	  nameenum: model.model.user_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.user_id = val;
		});
	  },
	));*/
	}

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}

	  	    Widget editDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.date = val;
		});
	  },
	));} 

	  	    Widget editTitle (State state) {
      return(
	DisplayNameWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
    ));}

	  	    Widget editAmount (State state) {
      return(
	NumberWidget(
	  value: model.model.amount,
	  caption: 'Amount',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.amount = val;
		});
	  },
	));}

	  	    Widget editBalance (State state) {
      return(
	NumberWidget(
	  value: model.model.balance,
	  caption: 'Balance',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.balance = val;
		});
	  },
	));}
	
}









  

