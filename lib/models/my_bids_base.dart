

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'my_bids_item.dart';
import 'my_bids_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyBids/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'my_bids_base.g.dart';




@JsonSerializable()

class ModelActionCancelBidMyBids {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? bid_id;
	  int? project_id;
	  String? project_str;
	  String? project_url;
	  List<int?>? project_list;
	  List<String?>? project_list_str;
	  DateTime? date;
	  double? amount;
	  String? amount_str;
	  String? message;
	   String? attachments_url;
	   String? attachments_name;
	  List<FileField?>? attachments;
  String? captcha;

	
	  ModelActionCancelBidMyBids(
            this.id,
			this.bid_id,
				this.project_id,
				this.project_str,
				this.project_url,
				this.project_list,
				this.project_list_str,
        this.date,
				this.amount,
				this.amount_str,
        this.message,
				this.attachments,
				this.attachments_url,
				this.attachments_name,
			this.captcha,

  );
    factory ModelActionCancelBidMyBids.fromJson(Map<String, dynamic> json) => _$ModelActionCancelBidMyBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionCancelBidMyBidsToJson(this);

}



class CancelBidMyBidsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	CancelBidMyBidsBase(this.json){
		model = CancelBidMyBidsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}


Widget RButtonActionMyBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,

 var postMyBidsResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400;
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
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: Colors.white)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						const Color(0xFF037f51)),
					),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button!.text!,
                    initialitems: button.selections,
                    initvalue: button!.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button!.text!)
                             ],
                            ),
				style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
					overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
				  ),
              //textColor: button.color == 'green'? Colors.white : Colors.black,
              //color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              //splashColor :  CurrentTheme.ShadeColor,
              //shape: RoundedRectangleBorder(
              //    side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
               //   ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataCancelBid(button!.text!, model
											,  attachmentslast   
                     					  );
                                  my_bids = new MyBidsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.user_id);
										}else{
										my_bids.deleteAllCancelBidMyBids('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_bids.postCancelBidMyBidsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBidsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBidsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = my_bids.postCancelBidMyBids();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBidsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBidsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{


                                    }


                      });
                      }
                                

                                  } else {}
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionMyBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,
 var postMyBidsResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
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
	     
          SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text == 'Order by ...' ?  button.text : 'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button!.text!,
                                initialitems: button.selections,
                                initvalue: button!.selections![0]);
                        },
                      )

	);  
  }else{
	return(	
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataCancelBid(button!.text!, model
											,  attachmentslast   
                     					  );
                                  my_bids = new  MyBidsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('CancelBid')){
										my_bids.deleteAllCancelBidMyBids(this.model.model.user_id);
										}else{
										my_bids.deleteAllCancelBidMyBids('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_bids.postCancelBidMyBidsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBidsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBidsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_bids.postCancelBidMyBids();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBidsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBidsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }
                                

                                  } else {}
                            }
                      )

     );
  }

}

	
   Map<String, dynamic> convertFormDataAction(var data, String? triger){
  
   String? action =   'CancelBid';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? attachments = '';
  String? attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "bid[_trigger_]":"$tgr",
  "bid[captcha]": "${model.model.captcha }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,

 var postCancelBidResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyBidsWidget(model.buttons[i], context,formKey, controller,my_bids, postCancelBidResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,
  var postCancelBidResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyBidsWidget(model.buttons[i], context,formKey, controller,my_bids, postCancelBidResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBidsController my_bids,
  var postCancelBidResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBidsController my_bids,
  var postCancelBidResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_bids, postCancelBidResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBidsController my_bids,
  var postCancelBidResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_bids, postCancelBidResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewProject (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.project_str,
									caption: 'Project',
								));
								 } 
										Widget viewDate (BuildContext context) {  
								return(  DateTimeView(
									value: model.model.date,
									caption: 'Date',
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
										Widget editCaptcha (State state) {
								  return(
								new CaptchaWidget(
								  value: model.model.captcha,
								  caption: 'Captcha',
								  hint: '',
								  required: true,
								  getValue:(String? val) {
									state.setState(() {
									  model.model.captcha = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class CancelBidMyBidsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionCancelBidMyBids? model;
  CancelBidMyBidsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory CancelBidMyBidsSuperBase.fromJson(Map<String, dynamic> json) => _$CancelBidMyBidsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelBidMyBidsSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyBids {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? bid_id;
  int? project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  DateTime? date;
  int? worker_id;
  String? worker_url;
  String? worker_str;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int? location_id;
  String? location_url;
  String? location_str;
  List<int?>? location_list;
  List<String?>? location_list_str;
  int? rating;
  int? matching_skills;
  double? amount;
  String? amount_str;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool?read_by_owner;
  bool?shortlisted;
  String? captcha;
  String? project_title;
  String? project_owner;
  String? description;
  String? published_budget;
   String? budget_range;
   double? budget_range_min;
   String? budget_range_min_str;
   double? budget_range_max;
   String? budget_range_max_str;
   String? budget_range_str;

	
	  ModelMyBids(
            this.id,
            this.bid_id,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.worker_id,
			this.worker_str,
			this.worker_list,
			this.worker_list_str,
			this.location_id,
			this.location_str,
			this.location_list,
			this.location_list_str,
			this.amount,
			this.amount_str,
			this.attachments,
			this.attachments_name,
			this.budget_range,
			this.budget_range_min,
			this.budget_range_min_str,
			this.budget_range_max,
			this.budget_range_max_str,
      this.budget_range_str,

  );
    factory ModelMyBids.fromJson(Map<String, dynamic> json) => _$ModelMyBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyBidsToJson(this);

}




class MyBidsBase{
	var model;
	Map<String, dynamic> json;
	MyBidsBase(this.json){
		model = MyBidsSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? attachments = '';
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
		}
	}
   
   
      var formData = {
      "my_bids[_trigger_]":"",
   "my_bids[bid_id]": "${model.model.bid_id }",
  "my_bids[project_id]": "${model.model.project_id }",
   "my_bids[status_id]": "${model.model.status_id}",
  "my_bids[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}",
  "my_bids[worker_id]": "${model.model.worker_id }",
  "my_bids[location_id]": "${model.model.location_id }",
  "my_bids[rating]": "${model.model.rating }",
  "my_bids[matching_skills]": "${model.model.matching_skills }",
  "my_bids[amount]": "${model.model.amount}",
  "my_bids[message]": "${model.model.message }",
  "my_bids[attachments]": '$attachments',
  "my_bids[attachments_lastval]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "my_bids[read_by_owner]": "${model.model.read_by_owner ? 1 : 0}",
  "my_bids[shortlisted]": "${model.model.shortlisted ? 1 : 0}",
  "my_bids[captcha]": "${model.model.captcha }",
  "my_bids[project_title]": "${model.model.project_title }",
  "my_bids[project_owner]": "${model.model.project_owner }",
  "my_bids[description]": "${model.model.description }",
  "my_bids[published_budget]": "${model.model.published_budget }",
  "my_bids[budget_range]": "${model.model.budget_range }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,
  var postMyBidsResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyBidsWidget(model.buttons[i], context,formKey, controller,my_bids, postMyBidsResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBidsController my_bids,
  var postMyBidsResult, State state, String? sendPath, String? id,  String? title ){
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
				overlayColor: CurrentTheme.MainAccentColor,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.SecondaryColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, formKey,controller,my_bids, postMyBidsResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBidsController my_bids,
 var postMyBidsResult, State state, String? sendPath, String? id,  String? title){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button!.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
						var formData = await convertFormDataEdit(model);
                        my_bids = new  MyBidsController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_bids.postMyBids();
                        future.then((value) {
                        state.setState(() {
                        postMyBidsResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
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
   


	  	    Widget editProject (State state) {
	   return(  StringView(
		value: model.model.project_str,
		caption: 'Project',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.project_id,
	  caption: 'Project',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.project_id_list,
	  nameenum: model.model.project_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_id = val;
		});
	  },
	));*/
	}

   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

	  	    Widget editDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.date = val;
		});
	  },
	));} 

	  	    Widget editWorker (State state) {
	   return(  StringView(
		value: model.model.worker_str,
		caption: 'Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_id,
	  caption: 'Worker',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.worker_id_list,
	  nameenum: model.model.worker_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editLocation (State state) {
	   return(  StringView(
		value: model.model.location_str,
		caption: 'Location',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.location_id,
	  caption: 'Location',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.location_id_list,
	  nameenum: model.model.location_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.location_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.rating,
	  caption: 'Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.rating = val;
		});
	  },
	));}

	  	    Widget editMatchingSkills (State state) {
      return(
	PercentWidget(
	  value: model.model.matching_skills,
	  caption: 'Matching Skills',
	  hint: 'Isi dengan double? Anda',
	  required: false,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
	  
		state.setState(() {
		  model.model.matching_skills = val;
		});
	  },
	));}

	  	    Widget editAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.amount,
	  caption: 'Amount',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.amount = val;
		});
	  },
	));}

	  	    Widget editMessage (State state) {
      return(
	new ArticleWidget(
	  value: model.model.message,
	  caption: 'Message',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.message = val;
		});
	  },
	));}

	  	    Widget editAttachments (State state) {
	 if(model.model.attachments== null){
		FileField? file = new FileField('', '',0,0,0, '', '', '','' );
		model.model.attachments = [file];
		}
      return(
	FileWidget(
		value: model.model.attachments[0],
		caption: 'Attachments',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.attachments[0] = val;
		  });
		},
	));} 

	  	    Widget editReadByOwner (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_owner,
	  caption: 'Read By Owner',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.read_by_owner = val;
		});
	  },
	));} 

	  	    Widget editShortlisted (State state) {
      return(
	BooleanWidget(
	  value: model.model.shortlisted,
	  caption: 'Shortlisted',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.shortlisted = val;
		});
	  },
	));} 

	  	    Widget editCaptcha (State state) {
      return(
	new CaptchaWidget(
	  value: model.model.captcha,
	  caption: 'Captcha',
	  hint: '',
	  required: true,
	  getValue:(String? val) {
	  
		state.setState(() {
		  model.model.captcha = val;
		});
	  },
	));}

	  	    Widget editProjectTitle (State state) {
      return(
	TitleWidget(
		value: model.model.project_title,
		caption: 'Project Title',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.project_title = val;
		  });
		},
	));}

	  	    Widget editProjectOwner (State state) {
      return(
	DisplayNameWidget(
		value: model.model.project_owner,
		caption: 'Project Owner',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.project_owner = val;
		  });
		},
    ));}

	  	    Widget editDescription (State state) {
      return(
	DisplayNameWidget(
		value: model.model.description,
		caption: 'Description',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.description = val;
		  });
		},
    ));}

	  	    Widget editPublishedBudget (State state) {
      return(
	DisplayNameWidget(
		value: model.model.published_budget,
		caption: 'Published Budget',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_budget = val;
		  });
		},
    ));}

	  	    Widget editBudgetRange (State state) {
      return(   
        new RangeWidget( 
          value: model.model.budget_range,
          valuemin: model.model.budget_range_min,
          valuemax: model.model.budget_range_max,
          caption: 'Range Budget',
          hint: 'Isi dengan Range penawaran Anda',
          required:false,
         min: '0',
         max: '100000000000',

          getValue1: (double? val) {
            state.setState(() {
              model.model.budget_range_min = val;
            });
          },
          getValue2: (double? val) {
            state.setState(() {
              model.model.budget_range_max = val;
            });
          },
          getValue: (String? val) {
            state.setState(() {
              model.model.budget_range = val;
            });
          },
        )
      );} 
	
}


@JsonSerializable()

class MyBidsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyBids? model;
  MyBidsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyBidsSuperBase.fromJson(Map<String, dynamic> json) => _$MyBidsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyBidsSuperBaseToJson(this);
   
}






    ///////////////////////////////////////////////////

class MyBidsListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyBidsListingBase(this.json){
		items = MyBidsListingItems.fromJson(this.json);
		tools = MyBidsListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyBidsModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBidsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyBidsModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBidsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyBidsModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBidsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyBidsModel item,ItemMyBidsModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBidsCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyBidsModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBidsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyBidsWidget(tools.buttons[i],context, account));
   // }  
    }

       return(
	        buttonChildren 
	   );
   } 
     SpeedDial	 Buttons(BuildContext context, bool?visible, bool?account, Function open){
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
				overlayColor: CurrentTheme.MainAccentColor,
				overlayOpacity: 0.5,
				onOpen: (){open(true);},
				onClose: (){open(false);},
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.SecondaryColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, account)
	    )
	 );
   } 
   
   
   
   
   
}





class MyBidsListingItems{
  List<ItemMyBidsModel?>? items;
  MyBidsListingItems(
      this.items,
      );

  factory MyBidsListingItems.fromJson(Map<String, dynamic> json) {
  	return MyBidsListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyBidsModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyBidsListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyBids?>? items;
	MyBidsListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyBidsListingTools.fromJson(Map<String, dynamic> json) => _$MyBidsListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyBidsListingToolsToJson(this);

}




class ItemMyBidsCard extends StatelessWidget {
  const ItemMyBidsCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyBidsModel? destination;
  final String? search;
  final ShapeBorder? shape;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            Container(
             // height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: ItemMyBidsContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyBidsContent extends StatelessWidget {
  const ItemMyBidsContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyBidsModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle?titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle?descriptionStyle = theme.textTheme.headline5;

    final List<Widget>buttonChildren = <Widget>[
    ];
	  if (destination!.item.buttons != null) {
		for(var i = 0; i < destination!.item.buttons.length; i++)
		{
		  buttonChildren!.add(itemMyBidsButton(destination,i , context));
		}
    }
	
    final List<Widget> children = [

    ];
	 /* children!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child: Html(data: "<h3>Header</h3>"),
	  ));
	  */
	   children!.add(destination!.viewProject(context)); 
	   children!.add(destination!.viewProjectStatus(context));
	   children!.add(destination!.viewWorker(context)); 
	   children!.add(destination!.viewStatus(context)); 
	   children!.add(destination!.viewShortlisted(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewAmount(context)); 
	   children!.add(destination!.viewMessage(context)); 
	   children!.add(destination!.viewAttachments(context)); 
      /*    children!.add(Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: "<h3>footer</h3>"),
                           )
     ); */


  if (destination!.item.buttons != null) {
        if(buttonChildren!.length > 4){
		if(buttonChildren!.length == 5){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren!.length == 6){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren!.length == 7){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  ]
			),
		  ),
		);
		}
				if(buttonChildren!.length == 8){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  buttonChildren[7],
			  ]
			),
		  ),
		);
		}
		}else{
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: buttonChildren
			),
		  ),
		);
      }
	}	
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children!,
    );
  }
}

Widget itemMyBidsButton(ItemMyBidsModel? destination, int? index, BuildContext context){
  MyBidsController my_bids; 
  
   if(destination!.item.buttons[index].url.contains('user/my_purchases/download/')){
		return(	TextButton(
			  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
			  style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
			  onPressed: () {
		  {
                       // controller.animateTo(controller.position.minScrollExtent,
                       // duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        my_bids = new  MyBidsController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_bids.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyBidsResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
                       // });
                        }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);	
						});

                       
                  }
		  }
	  ));
	  }else{
			  return(
				TextButton(
				  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
	               style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
				  onPressed: () {
					print('${destination!.item.buttons[index].url}');
					if(destination!.item.buttons[index].url.contains('show_conversation')){
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item.buttons[index].url + '/' ));
					}else{
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item.buttons[index].url ));
					}

				  },
				)
			  );
  }
}



class ItemMyBidsWidget extends StatelessWidget {

	final ItemMyBidsModel?  item;
	final String? search;
	const  ItemMyBidsWidget({Key? key, @required this.item, this.search}) : super(key: key);


	@override
	Widget build(BuildContext context) {
		return Visibility (
			// visible: (this.search == '' || this.browse_projects.item.title.contains(this.search!) || this.browse_projects.items.items.article.contains(this.search!)),
			visible: (this.search == '' || allModelWords(jsonEncode(this.item!.item!.toJson())).contains(this.search!)),
			child: ListTile(
				leading:  Container(
					height: 50.0,
					width : 50.0,
					child:

					ClipRRect(
						borderRadius: BorderRadius.circular(50),
						child: Image.network( this.item!.item!.pht!,
						),
					),

				),
				title: Text(this.item!.item!.ttl!),
				isThreeLine: true,
				subtitle: Html(
						data:item!.item!.sbttl! ,
						//style: TextStyle(fontSize: 16, color: CurrentTheme.ShadeColor),
						//defaultTextStyle: TextStyle(color: CurrentTheme.DisableTextColor)
						style: {
								"html": Style(
								 color: CurrentTheme.DisableTextColor
								),
					   }
				),
				dense: true,
				onTap: () 
				{ AppProvider.getRouter(context)!.navigateTo(
						context,
						"/public/browse_projects/view/" + this.item!.item!.id! + "/" +
								// this.browse_projects.title.replaceAll(' ', '-'))},
								"title");},
			),
		);
	}
}


SpeedDialChild ListButtonMyBidsWidget(Button button, BuildContext context, bool?account){
    var cl;
	var ic;
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
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search!),
                        backgroundColor: Colors.green,
                        label: button.text == 'Order by ...' ?  button.text :'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){
                        
						showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button!.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()
		  {
		     if (account!){
           if(button!.url!.contains('/listing') || button!.url!.contains('/index')){
			          AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! + '/')) ;
           }else{
             	 AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! + '//')) ;
           }
			 }else{
			   AppProvider.getRouter(context)!.navigateTo(context, '/login/1') ;
			 } 
		  
		  }
	  ));
  }

}



/////////////////////////////////


///
////////////////////////////////////////////////






  






  

