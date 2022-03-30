
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
part 'show_bids_add_to_shortlist_base.g.dart';



@JsonSerializable()

class ModelActionAddToShortlistShowBids {
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
	    String? attachments_url;
	   String? attachments_name;
	  List<FileField?>? attachments;
		  bool?  shortlisted;
		  String? published_budget;

	
	  ModelActionAddToShortlistShowBids(
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
        this.shortlisted,
        this.published_budget,

  );
    factory ModelActionAddToShortlistShowBids.fromJson(Map<String, dynamic> json) => _$ModelActionAddToShortlistShowBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAddToShortlistShowBidsToJson(this);

}

@JsonSerializable()
class AddToShortlistShowBidsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAddToShortlistShowBids? model;
  AddToShortlistShowBidsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory AddToShortlistShowBidsSuperBase.fromJson(Map<String, dynamic> json) => _$AddToShortlistShowBidsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToShortlistShowBidsSuperBaseToJson(this);
  
 
}

class AddToShortlistShowBidsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	AddToShortlistShowBidsBase(this.json){
		model = AddToShortlistShowBidsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}




Widget RButtonActionShowBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController show_bids,
 var postShowBidsResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400; //size.width;
  if (button.color == 'green'){
    cl = Colors.green;
  }
  if (button.color == 'yellow'){
    cl = Colors.yellow;
  }
  if (button.color == 'blue'){
    cl = Colors.blue;
  }
  if (button.color == 'red'){
    cl = Colors.red;
  }
  if (button.color == 'orange'){
    cl = Colors.orange;
  }
  if (button.color == 'grey'){
    cl = Colors.grey;
  }
  if (button.color == 'black'){
    cl = Colors.black;
  }
  if (button.color == 'brown'){
    cl = Colors.brown;
  }
  if (button.icon == 'fa fa-briefcase'){
    ic = Icons.work;
  }
  if (button.icon == 'fa fa-plus'){
    ic = Icons.add;
  }
  if (button.icon == 'fa fa-list-alt'){
    ic = Icons.list;
  }

  if (button.icon == 'fa fa-credit-card'){
    ic = Icons.credit_card;
  }
  if (button.icon == 'fa fa-paypal'){
    ic = Icons.account_balance_wallet;
  }
  if (button.icon == 'fa fa-bank'){
    ic = Icons.account_balance;
  }
  if (button.icon == 'fa fa-dollar'){
    ic = Icons.attach_money;
  }
  if (button.icon == 'fa fa-user'){
    ic = Icons.person;
  }
  if (button.icon == 'fa fa-edit'){
    ic = Icons.edit;
  }
  if (button.icon == 'fa fa-picture-o'){
    ic = Icons.picture_in_picture;
  }
  if (button.icon == 'fa fa-asterisk'){
    ic = Icons.ac_unit;
  }
  if (button.icon == 'fa fa-envelope-o'){
    ic = Icons.local_post_office;
  }
  if (button.icon == 'fa fa-mobile'){
    ic = Icons.phone_iphone;
  }
      if (button.icon == 'fa fa-bullhorn'){
      ic = Icons.wifi_tethering;
    }

    if (button.icon == 'fa fa-arrow-circle-down'){
      ic = Icons.arrow_downward;
    }
    if (button.icon == 'fa fa-comment'){
      ic = Icons.comment;
    }
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
	  
  if(button.type == 'custom_filter'){
    return (
	       RaisedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
              textColor: Colors.white,
              splashColor : CurrentTheme.ShadeColor,
              color : Color(0xFF037f51),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button.text,
                    initialitems: button.selections,
                    initvalue: button.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             RaisedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
							   Text(button.text!),
                             ],
                            ),
              textColor: button.color == 'green'? Colors.white : Colors.black,
              color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              splashColor :  CurrentTheme.ShadeColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                   controller.animateTo(controller.position.minScrollExtent,
									duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
									if (formKey.currentState.validate()) {
									//Map<String, dynamic> res = model.toJson();
									//print('json result == $res');
									var formData = await convertFormDataAction(model);
									show_bids = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = show_bids.sendData();
									future.then((value) {
									state.setState(() {
									postShowBidsResult = value;
									});
                                  }).catchError((Error){
										  AppProvider.getRouter(context)!.pop(context);
                      });
                      
                                

                                  } else {}
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild ButtonActionShowBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
 var postShowBidsResult, State state, String? sendPath, String? id,  String? title){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
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
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
						var formData = await convertFormDataAction(model);
                        show_bids = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = show_bids.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShowBidsResult = value;
                        });
                        }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);
						});

                        } else {}
                  }
		  }
	  ));
  }

}
	//ShowBids
   Map<String, dynamic> convertFormDataAction(var data){
  String? action =   'AddToShortlist';
   bool?  isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachments = '';
  String? attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
   
     String? tgr =   'add_to_shortlist';
         var formData = {"bid[_trigger_]":"$tgr"};
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
  var postAddToShortlistResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionShowBidsWidget(model.buttons[i], context,formKey, controller,show_bids, postAddToShortlistResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
  var postAddToShortlistResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionShowBidsWidget(model.buttons[i], context,formKey, controller,show_bids, postAddToShortlistResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_bids,
  var postAddToShortlistResult, State state, String? sendPath, String? id,  String? title ){
     // final size =MediaQuery.of(context).size;
    double? width = 400;

    return(
        ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.9 * width,
                children:
           RlistButton(context, formKey,controller,show_bids, postAddToShortlistResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_bids,
  var postAddToShortlistResult, State state, String? sendPath, String? id,  String? title ){
     return(
	 SpeedDial(
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
				children:listButton(context, formKey,controller,show_bids, postAddToShortlistResult, state, sendPath, id,  title )
	    )
	 );
   } 
	
   
				Widget viewWorker (BuildContext context) {  
		return(  ModelView(
			value: model.model.worker_id,
			caption: 'Worker',
			idenum: model.model.worker_list?? [],
			nameenum: model.model.worker_list_str ?? model.model.worker_str ,
		));} 
				Widget viewProject (BuildContext context) {  
		return(  ModelView(
			value: model.model.project_id,
			caption: 'Project',
			idenum: model.model.project_list?? [],
			nameenum: model.model.project_list_str ?? model.model.project_str ,
		));} 
			Widget viewStatus (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.status_id,
			caption: 'Status',
			idenum: model.model.status_list?? [],
			nameenum: model.model.status_list_str?? model.model.status_str,
		));} 
				Widget viewDate (BuildContext context) {  
		return(  DateTimeView(
			value: model.model.date,
			caption: 'Date',
		));} 
				Widget viewLocation (BuildContext context) {  
		return(  ModelView(
			value: model.model.location_id,
			caption: 'Location',
			idenum: model.model.location_list?? [],
			nameenum: model.model.location_list_str ?? model.model.location_str ,
		));} 
				Widget viewRating (BuildContext context) {  
		return(  RatingView(
			value: model.model.rating,
			caption: 'Rating'
		));}
				Widget viewMatchingSkills (BuildContext context) {
		return(  PercentView(
			value: model.model.matching_skills,
			caption: 'Matching Skills',
		));}
				Widget viewAmount (BuildContext context) {  
		return(  MoneyView(
			value: model.model.amount,
			caption: 'Amount',
		));}
				Widget viewMessage (BuildContext context) {  
		return(  ArticleView(
			value: model.model.message,
			caption: 'Message',
		));}
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
				Widget viewPublishedBudget (BuildContext context) { 
		return(  DisplayNameView(
			value: model.model.published_budget,
			caption: 'Published Budget',
		));}

}
















  

