

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
import 'my_orders_item.dart';
import 'my_orders_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyOrders/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'my_orders_base.g.dart';



@JsonSerializable()

class ModelActionConfirmPaymentMyOrders {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? order_id;
  int? our_account_id;
  String? our_account_str;
  List<int?>? our_account_list;
  List<String?>? our_account_list_str;
  int? bank_id;
  String? bank_str;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? account_no;
  String? account_name;
  DateTime? transfer_date;
  double? amount;
  String? message;
  String? attachment_url;
  Photo?attachment;

	
	  ModelActionConfirmPaymentMyOrders(
            this.id,
			this.order_id,
			this.our_account_id,
			this.our_account_str,
			this.our_account_list,
			this.our_account_list_str,
			this.bank_id,
			this.bank_str,
			this.bank_list,
			this.bank_list_str,
			this.account_no,
			this.account_name,
			this.transfer_date,
			this.amount,
			this.message,
			this.attachment,
			this.attachment_url,

  );
    factory ModelActionConfirmPaymentMyOrders.fromJson(Map<String, dynamic> json) => _$ModelActionConfirmPaymentMyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionConfirmPaymentMyOrdersToJson(this);

}



class ConfirmPaymentMyOrdersBase{
	var model;
	Map<String, dynamic> json;
            var attachmentlast ;
	ConfirmPaymentMyOrdersBase(this.json){
		model = ConfirmPaymentMyOrdersSuperBase.fromJson(this.json);
     if (model.model.attachment!= null) {
            attachmentlast = Photo(model.model.attachment.name, model.model.attachment.status, model.model.attachment.dir, model.model.attachment.file, model.model.attachment.thumb, model.model.attachment.temp);
     }
	}


Widget RButtonActionMyOrdersWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,

 var postMyOrdersResult, State state, String? sendPath, String? id,  String? title){
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
	       RaisedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              textColor: Colors.white,
              splashColor : CurrentTheme.ShadeColor,
              color : Color(0xFF037f51),
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
             RaisedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button!.text!)
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
                      var formData = await convertFormDataConfirmPayment(button!.text!, model
											, attachmentlast 
                     					  );
                                  my_orders = new MyOrdersController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_title);
										}else if(['AskOwner'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.user_id);
										}else{
										my_orders.deleteAllConfirmPaymentMyOrders('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_orders.postConfirmPaymentMyOrdersWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyOrdersResult = value;
                                  });
                                  }).catchError((Error){
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyOrdersListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = my_orders.postConfirmPaymentMyOrders();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyOrdersResult = value;
                                  });
                                  }).catchError((Error){
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyOrdersListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyOrdersWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
 var postMyOrdersResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataConfirmPayment(button!.text!, model
											, attachmentlast 
                     					  );
                                  my_orders = new  MyOrdersController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_title);
										}else if(['AskOwner'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ConfirmPayment')){
										my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.user_id);
										}else{
										my_orders.deleteAllConfirmPaymentMyOrders('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_orders.postConfirmPaymentMyOrdersWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyOrdersResult = value;
                                  });
                                  }).catchError((Error){   
                          AppProvider.getRouter(context)!.pop(context);
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyOrdersListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_orders.postConfirmPaymentMyOrders();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyOrdersResult = value;
                                  });
                                  }).catchError((Error){ 
                          AppProvider.getRouter(context)!.pop(context);
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyOrdersListing(id :  id!)),
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
  
   String? action =   'ConfirmPayment';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? attachment = '';
  String? attachment_last = '';
  if(isEdit && attachmentlast != null){
      attachment_last = '{"name":"${ attachmentlast.name}","dir":"${ attachmentlast.dir}","file":"${ attachmentlast.file}","thumb":"${ attachmentlast.thumb}"}';
   
  }
	if (model.model.attachment!= null) {
		 if (model.model.attachment.temp != null) {
		   attachment = '{"status":"1","name":"${model.model.attachment.name}","temp":"${model.model.attachment.temp}"}';
      		
     }
	 }
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "order[_trigger_]":"$tgr",
  "order[our_account_id]": "${model.model.our_account_id_id }",
  "order[bank_id]": "${model.model.bank_id_id }",
  "order[account_no]": "${model.model.account_no }",
  "order[account_name]": "${model.model.account_name }",
  "order[transfer_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.transfer_date)}",
  "order[amount]": "${model.model.amount }",
   "order[message]": "${model.model.message }",
  "order[attachment]": '$attachment',
  "order[attachment_lastval]": '$attachment_last',
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,

 var postConfirmPaymentResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyOrdersWidget(model.buttons[i], context,formKey, controller,my_orders, postConfirmPaymentResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
  var postConfirmPaymentResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyOrdersWidget(model.buttons[i], context,formKey, controller,my_orders, postConfirmPaymentResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
  var postConfirmPaymentResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
  var postConfirmPaymentResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_orders, postConfirmPaymentResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
  var postConfirmPaymentResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_orders, postConfirmPaymentResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editOurAccount (State state) {
								  return(
								  ModelWidget(
								  value: model.model.our_account_id,
								  caption: 'Our Account',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.our_account_list,
								  nameenum: model.model.our_account_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.our_account_id = val;
									});
								  },
								));}
										Widget editBank (State state) {
								  return(
								  ModelWidget(
								  value: model.model.bank_id,
								  caption: 'Bank',
								  hint: 'pilih Model',
								  required: true,
								  idenum: model.model.bank_list,
								  nameenum: model.model.bank_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.bank_id = val;
									});
								  },
								));}
										Widget editAccountNo (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.account_no,
									caption: 'Account No',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.account_no = val;
									  });
									},
								));}
										Widget editAccountName (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.account_name,
									caption: 'Account Name',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.account_name = val;
									  });
									},
								));}
										Widget editTransferDate (State state) {
								  return(
								new DateTimeWidget(
								  value: model.model.transfer_date,
								  caption: 'Transfer Date',
								  hint: 'isi dengan DateTime? diatas.',
								  required: true,
								  getValue:(DateTime? val) {
									state.setState(() {
									  model.model.transfer_date = val;
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
								MultilineWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'Isi dengan Multiline Anda',
								  required: false,
								  getValue: (String? val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
								Widget editAttachment (State state) {
								if(model.model.attachment_url== '' || model.model.attachment == null ){
									model.model.attachment = new Photo('','0','', '','', '');
									}
								  return(
							  //ImageWidget edit& FileWidget editexperiment validation non from validation.

								ImageWidget(
									value: model.model.attachment,
									caption: 'Attachment(IF_ANY)',
									hint: 'Isi dengan Image Anda',
									required: false,
									getValue: (var val) {
									
									  state.setState(() {
										model.model.attachment = val;
										model.model.attachment_url = val!.name;
									  });
									},
								));} 
 	

}


@JsonSerializable()
class ConfirmPaymentMyOrdersSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionConfirmPaymentMyOrders? model;
  ConfirmPaymentMyOrdersSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory ConfirmPaymentMyOrdersSuperBase.fromJson(Map<String, dynamic> json) => _$ConfirmPaymentMyOrdersSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmPaymentMyOrdersSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyOrders {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? order_id;
  String? track_code;
  int? buyer_id;
  String? buyer_url;
  String? buyer_str;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  DateTime? date;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? payment_method_id;
  String? payment_method_str;
  List<int?>? payment_method_list;
  List<String?>? payment_method_list_str;
  int? buyer_payment_id;
  String? buyer_payment_url;
  String? buyer_payment_str;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  double? total_price;
  String? total_price_str;
  String? coupon;
  double? coupon_value;
  String? coupon_value_str;
  double? used_balance;
  String? used_balance_str;
  double? total_sum;
  String? total_sum_str;
  double? unique_code;
  String? unique_code_str;
  String? table;
  String? notes;
  int? cimb_ref;
  String? cimb_ref_str;
  bool?is_test;

	
	  ModelMyOrders(
            this.id,
            this.order_id,
			this.buyer_id,
			this.buyer_str,
			this.buyer_list,
			this.buyer_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.payment_method_id,
			this.payment_method_str,
			this.payment_method_list,
			this.payment_method_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.total_price,
			this.total_price_str,
			this.coupon_value,
			this.coupon_value_str,
			this.used_balance,
			this.used_balance_str,
			this.total_sum,
			this.total_sum_str,
			this.unique_code,
			this.unique_code_str,
			this.cimb_ref,
			this.cimb_ref_str,

  );
    factory ModelMyOrders.fromJson(Map<String, dynamic> json) => _$ModelMyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyOrdersToJson(this);

}




class MyOrdersBase{
	var model;
	Map<String, dynamic> json;
	MyOrdersBase(this.json){
		model = MyOrdersSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
   
   
      var formData = {
      "my_orders[_trigger_]":"",
   "my_orders[order_id]": "${model.model.order_id }",
  "my_orders[track_code]": "${model.model.track_code }",
  "my_orders[buyer_id]": "${model.model.buyer_id }",
  "my_orders[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}",
   "my_orders[status_id]": "${model.model.status_id}",
   "my_orders[payment_method_id]": "${model.model.payment_method_id}",
  "my_orders[buyer_payment_id]": "${model.model.buyer_payment_id }",
  "my_orders[total_price]": "${model.model.total_price}",
  "my_orders[coupon]": "${model.model.coupon }",
  "my_orders[coupon_value]": "${model.model.coupon_value}",
  "my_orders[used_balance]": "${model.model.used_balance}",
  "my_orders[total_sum]": "${model.model.total_sum}",
  "my_orders[unique_code]": "${model.model.unique_code}",
  "my_orders[table]": "${model.model.table }",
   "my_orders[notes]": "${model.model.notes }",
  "my_orders[cimb_ref]": "${model.model.cimb_ref }",
  "my_orders[is_test]": "${model.model.is_test ? 1 : 0}",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
  var postMyOrdersResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyOrdersWidget(model.buttons[i], context,formKey, controller,my_orders, postMyOrdersResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
  var postMyOrdersResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_orders, postMyOrdersResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyOrdersWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
 var postMyOrdersResult, State state, String? sendPath, String? id,  String? title){
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
                        my_orders = new  MyOrdersController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_orders.postMyOrders();
                        future.then((value) {
                        state.setState(() {
                        postMyOrdersResult = value;
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
   


	  	    Widget editTrackCode (State state) {
      return(
	DisplayNameWidget(
		value: model.model.track_code,
		caption: 'Track Code',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.track_code = val;
		  });
		},
    ));}

	  	    Widget editBuyer (State state) {
	   return(  StringView(
		value: model.model.buyer_str,
		caption: 'Buyer',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.buyer_id,
	  caption: 'Buyer',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.buyer_id_list,
	  nameenum: model.model.buyer_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_id = val;
		});
	  },
	));*/
	}

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

   	    Widget editPaymentMethod (State state) {
      return(
	  EnumWidget(
	  value: model.model.payment_method_id,
	  caption: 'Payment Method',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.payment_method_list,
	  nameenum: model.model.payment_method_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.payment_method_id = val;
		});
	  },
	));}

	  	    Widget editBuyerPayment (State state) {
	   return(  StringView(
		value: model.model.buyer_payment_str,
		caption: 'Buyer Payment',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.buyer_payment_id,
	  caption: 'Buyer Payment',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.buyer_payment_id_list,
	  nameenum: model.model.buyer_payment_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_payment_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTotalPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.total_price,
	  caption: 'Total Price',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.total_price = val;
		});
	  },
	));}

	  	    Widget editCoupon (State state) {
      return(
	DisplayNameWidget(
		value: model.model.coupon,
		caption: 'Coupon',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.coupon = val;
		  });
		},
    ));}

	  	    Widget editCouponValue (State state) {
      return(
	MoneyWidget(
	  value: model.model.coupon_value,
	  caption: 'Coupon Value',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.coupon_value = val;
		});
	  },
	));}

	  	    Widget editUsedBalance (State state) {
      return(
	MoneyWidget(
	  value: model.model.used_balance,
	  caption: 'Used Balance',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.used_balance = val;
		});
	  },
	));}

	  	    Widget editTotalSum (State state) {
      return(
	MoneyWidget(
	  value: model.model.total_sum,
	  caption: 'Total Sum',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.total_sum = val;
		});
	  },
	));}

	  	    Widget editUniqueCode (State state) {
      return(
	MoneyWidget(
	  value: model.model.unique_code,
	  caption: 'Unique Code',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.unique_code = val;
		});
	  },
	));}

	  	    Widget editTable (State state) {
      return(
	DisplayNameWidget(
		value: model.model.table,
		caption: 'Table',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.table = val;
		  });
		},
    ));}

	 	    Widget editNotes (State state) {
      return(
	MultilineWidget(
	  value: model.model.notes,
	  caption: 'Notes',
	  hint: 'Isi dengan Multiline Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.notes = val;
		});
	  },
	));}

	  	    Widget editCimbRef (State state) {
      return(
	NumberWidget(
	  value: model.model.cimb_ref,
	  caption: 'CIMB Ref',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.cimb_ref = val;
		});
	  },
	));}

	  	    Widget editIsTest (State state) {
      return(
	BooleanWidget(
	  value: model.model.is_test,
	  caption: 'Is Test',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.is_test = val;
		});
	  },
	));} 
	
}


@JsonSerializable()

class MyOrdersSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyOrders? model;
  MyOrdersSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyOrdersSuperBase.fromJson(Map<String, dynamic> json) => _$MyOrdersSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyOrders {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? track_code;
  DateTime? date;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? payment_method_id;
  String? payment_method_str;
  List<int?>? payment_method_list;
  List<String?>? payment_method_list_str;
  double? total_price;
  String? total_price_str;
  double? used_balance;
  String? used_balance_str;
  double? total_sum;
  String? total_sum_str;
  String? table;

	//
	  ViewModelMyOrders(
            this.id,
			this.track_code,
			this.date,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.payment_method_id,
			this.payment_method_str,
			this.payment_method_list,
			this.payment_method_list_str,
			this.total_price,
			this.total_price_str,
			this.used_balance,
			this.used_balance_str,
			this.total_sum,
			this.total_sum_str,
			this.table,

  );

  
   factory ViewModelMyOrders.fromJson(Map<String, dynamic> json) => _$ViewModelMyOrdersFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyOrdersToJson(this); 
  
}


class MyOrdersViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyOrdersViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewMyOrdersWidget(model.buttons[i],context,  formKey, controller, my_orders,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyOrdersWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
  State state, String? sendPath, String? id,  String? title, bool?account){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search!),
                        backgroundColor: Colors.green,
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
		 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
		if (button.icon == 'fa fa-send'){
		  ic = Icons.send;
		} 
    
    if(button!.url!.contains('user/my_purchases/download/')){
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        my_orders = new  MyOrdersController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_orders.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postMyOrdersResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
                        });
                        }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);	
						});

                       
                  }
		  }
	  ));
	  }else{
	     	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: (){
		  
		  if(account!){	   
			AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! ));
		  }else{
		    AppProvider.getRouter(context)!.navigateTo(context,'/login/1');
		   }
		  }
	  ));
	  }
	  
  }

}  
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyOrdersController my_orders,
    State state, String? sendPath, String? id,  String? title, bool? account){
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
				children:listButton(context, visible!, formKey, controller, my_orders,
                                    state, sendPath, id!,  title!, account! )
	    )
	 );
   } 	
	
	PreferredSizeWidget  appBar(BuildContext context, String? idHash){
	  return(
	      AppBar(
		   iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),
			title: Text('', style : TextStyle( color: Colors.white, )),
		  )
	  );
	}

   	Widget body (BuildContext context, ScrollController controller, bool?account, GlobalKey<ScaffoldState> ss, State state) {
		return(Container(width: 0.0, height: 0.0,color: Colors.white ));	
	}

	Widget view (BuildContext context, ScrollController controller, bool?account) {


	  viewChildren!.clear();
	  
	  if(this.model.meta.before_title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_title),
	  ));}
	  if(this.model.meta.title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.title),
	  ));}
	  if(this.model.meta.after_title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_title),
	  ));}
	  if(this.model.meta.warning != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.warning.message,
		             style: {
							"html": Style(
							  backgroundColor: CurrentTheme.WarningColor,
							   ),
							},
					),
	  ));}

	  if(this.model.meta.before_content != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_content),
	  ));}	  

	 	  
	   viewChildren!.add(viewTrackCode(context)); 
	   viewChildren!.add(viewDate(context)); 
	   viewChildren!.add(viewStatus(context)); 
	   viewChildren!.add(viewPaymentMethod(context)); 
	   viewChildren!.add(viewTotalPrice(context)); 
	   viewChildren!.add(viewUsedBalance(context)); 
	   viewChildren!.add(viewTotalSum(context)); 
	   viewChildren!.add(viewTable(context)); 

	 //
	if(this.model.meta.after_content != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_content),
	  ));}	 
   return(  SingleChildScrollView(
                     controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
				  
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					 					  
                       children: viewChildren!
                  ) 
     ));
	} 

 
		    Widget viewTrackCode (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.track_code,
		caption: 'Track Code',
	));}
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
	    Widget viewStatus (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.status_id,
			caption: 'Status',
			idenum: model.model.status_list,
			nameenum: model.model.status_str,
		));} 
	    Widget viewPaymentMethod (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.payment_method_id,
			caption: 'Payment Method',
			idenum: model.model.payment_method_list,
			nameenum: model.model.payment_method_str,
		));} 
		    Widget viewTotalPrice (BuildContext context) {  			
    if(model.model.total_price != null){
		return(  MoneyView(
		value: model.model.total_price,
		caption: 'Total Price',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Total Price',
		    ));
	}			
     }
		    Widget viewUsedBalance (BuildContext context) {  			
    if(model.model.used_balance != null){
		return(  MoneyView(
		value: model.model.used_balance,
		caption: 'Used Balance',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Used Balance',
		    ));
	}			
     }
		    Widget viewTotalSum (BuildContext context) {  			
    if(model.model.total_sum != null){
		return(  MoneyView(
		value: model.model.total_sum,
		caption: 'Total Sum',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Total Sum',
		    ));
	}			
     }
		    Widget viewTable (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.table,
		caption: 'Table',
	));}
  
}


@JsonSerializable()
class MyOrdersViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyOrders? model;
  MyOrdersViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory MyOrdersViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyOrdersViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyOrdersViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyOrdersListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyOrdersListingBase(this.json){
		items = MyOrdersListingItems.fromJson(this.json);
		tools = MyOrdersListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyOrdersModel item,String? search, bool?account) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyOrdersCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyOrdersModel item,String? search, int? index, bool?account, String? id) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyOrdersCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyOrdersModel item,String? search, int? index, bool?account) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyOrdersCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyOrdersModel item,ItemMyOrdersModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyOrdersCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyOrdersModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyOrdersCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyOrdersWidget(tools.buttons[i],context, account));
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





class MyOrdersListingItems{
  List<ItemMyOrdersModel?>? items;
  MyOrdersListingItems(
      this.items,
      );

  factory MyOrdersListingItems.fromJson(Map<String, dynamic> json) {
  	return MyOrdersListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyOrdersModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyOrdersListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyOrders?>? items;
	MyOrdersListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyOrdersListingTools.fromJson(Map<String, dynamic> json) => _$MyOrdersListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyOrdersListingToolsToJson(this);

}




class ItemMyOrdersCard extends StatelessWidget {
  const ItemMyOrdersCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyOrdersModel? destination;
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
                child: ItemMyOrdersContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyOrdersContent extends StatelessWidget {
  const ItemMyOrdersContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyOrdersModel? destination;

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
		  buttonChildren!.add(itemMyOrdersButton(destination,i , context));
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
	   children!.add(destination!.viewTrackCode(context)); 
	   children!.add(destination!.viewBuyer(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewStatus(context)); 
	   children!.add(destination!.viewPaymentMethod(context)); 
	   children!.add(destination!.viewBuyerPayment(context)); 
	   children!.add(destination!.viewTotalPrice(context)); 
	   children!.add(destination!.viewCoupon(context)); 
	   children!.add(destination!.viewCouponValue(context)); 
	   children!.add(destination!.viewUsedBalance(context)); 
	   children!.add(destination!.viewTotalSum(context)); 
	   children!.add(destination!.viewUniqueCode(context)); 
	   children!.add(destination!.viewNotes(context)); 
	   children!.add(destination!.viewCimbRef(context)); 
	   children!.add(destination!.viewIsTest(context)); 
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

Widget itemMyOrdersButton(ItemMyOrdersModel? destination, int? index, BuildContext context){
  MyOrdersController my_orders; 
  
   if(destination!.item.buttons[index].url.contains('user/my_purchases/download/')){
		return(	FlatButton(
			  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
			  textColor: CurrentTheme.MainAccentColor,
			  splashColor : CurrentTheme.ShadeColor,
			  color : CurrentTheme.SecondaryAccentColor,
			  onPressed: () {
		  {
                       // controller.animateTo(controller.position.minScrollExtent,
                       // duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        my_orders = new  MyOrdersController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_orders.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyOrdersResult = value;
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
				FlatButton(
				  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
				  textColor: CurrentTheme.MainAccentColor,
				  splashColor : CurrentTheme.ShadeColor,
				  color : CurrentTheme.SecondaryAccentColor,
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



class ItemMyOrdersWidget extends StatelessWidget {

	final ItemMyOrdersModel?  item;
	final String? search;
	const  ItemMyOrdersWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyOrdersWidget(Button button, BuildContext context, bool?account){
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


class MyOrdersIndexBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyOrdersIndexBase(this.json){
		items = MyOrdersIndexItems.fromJson(this.json);
		tools = MyOrdersIndexTools.fromJson(this.json);
	}
	

  
 List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children!.add(_getTitleItemWidget('No',50));
    children!.add(_getTitleItemWidget('Date',140));
      
    children!.add(_getTitleItemWidget('Track Code',140));
      
    children!.add(_getTitleItemWidget('Payment Method',140));
      
    children!.add(_getTitleItemWidget('Total Price',140));
      
    children!.add(_getTitleItemWidget('Used Balance',140));
      
    children!.add(_getTitleItemWidget('Total Sum',140));
      
    children!.add(_getTitleItemWidget('Status',140));
      
    return children;
  }
 
  Widget _generateFirstColumnRow(BuildContext context, int? index) {
    return Container(
      child: Text((index! + 1 + (tools.paging?.current_page-1) * 24).toString()),
      width: 50,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


Widget _getTitleItemWidget(String? label, double? width) {
    return Container(
      child: Text(label!, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


  Widget _generateRightHandSideColumnRow(BuildContext context, int? index) {
     final List<Widget> children = [];
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewDate(context)
    ));
    
   // children!.add(items.items[index].viewDate(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewTrackCode(context)
    ));
    
   // children!.add(items.items[index].viewTrackCode(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewPaymentMethod(context)
    ));
    
   // children!.add(items.items[index].viewPaymentMethod(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewTotalPrice(context)
    ));
    
   // children!.add(items.items[index].viewTotalPrice(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewUsedBalance(context)
    ));
    
   // children!.add(items.items[index].viewUsedBalance(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewTotalSum(context)
    ));
    
   // children!.add(items.items[index].viewTotalSum(context));
   //children!.add(Text('helooo'));
      
    
    children!.add(Container(
      width: 140,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: items.items[index].viewStatus(context)
    ));
    
   // children!.add(items.items[index].viewStatus(context));
   //children!.add(Text('helooo'));
      
    return Row(
      children: children
      
    );
  }
 



 Widget viewTable (BuildContext context) {
    return(
        Container(
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 50,
            rightHandSideColumnWidth: 1200,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: items.items.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor:  Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
          ),
          height: 80 + double.parse(items.items.length.toString()) * 80 ,
        )
    );
  }



  Widget viewItem (ItemIndexMyOrdersModel item,String? search, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyOrdersIndexCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	int? rowCount(){
    int  count = 0;
	   count = count + 1 ;
	   count = count + 1 ;
	   count = count + 1 ;
	   count = count + 1 ;
	   count = count + 1 ;
	   count = count + 1 ;
	   count = count + 1 ;
    count = count + 1 ;
    return count;
  }

	  Widget viewItemIndex (ItemIndexMyOrdersModel item,String? search, int? index, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyOrdersIndexCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
    if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyOrdersWidget(tools.buttons[i],context, account));
    }  
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


class ItemMyOrdersIndexCard extends StatelessWidget {
  const ItemMyOrdersIndexCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemIndexMyOrdersModel? destination;
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
                child: ItemMyOrdersIndexContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyOrdersIndexContent extends StatelessWidget {
  const ItemMyOrdersIndexContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemIndexMyOrdersModel? destination;

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
		  buttonChildren!.add(itemIndexMyOrdersButton(destination,i , context));
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
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewTrackCode(context)); 
	   children!.add(destination!.viewPaymentMethod(context)); 
	   children!.add(destination!.viewTotalPrice(context)); 
	   children!.add(destination!.viewUsedBalance(context)); 
	   children!.add(destination!.viewTotalSum(context)); 
	   children!.add(destination!.viewStatus(context)); 
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

Widget itemIndexMyOrdersButton(ItemIndexMyOrdersModel? destination, int? index, BuildContext context){
  MyOrdersController my_orders; 
  
   if(destination!.item.buttons[index].url.contains('user/my_purchases/download/')){
		return(	FlatButton(
			  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
			  textColor: CurrentTheme.MainAccentColor,
			  splashColor : CurrentTheme.ShadeColor,
			  color : CurrentTheme.SecondaryAccentColor,
			  onPressed: () {
		  {
                       // controller.animateTo(controller.position.minScrollExtent,
                       // duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        my_orders = new  MyOrdersController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_orders.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyOrdersResult = value;
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
				FlatButton(
				  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
				  textColor: CurrentTheme.MainAccentColor,
				  splashColor : CurrentTheme.ShadeColor,
				  color : CurrentTheme.SecondaryAccentColor,
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


class MyOrdersIndexItems{
  List<ItemIndexMyOrdersModel?>? items;
  MyOrdersIndexItems(
      this.items,
      );

  factory MyOrdersIndexItems.fromJson(Map<String, dynamic> json) {
  	return MyOrdersIndexItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemIndexMyOrdersModel(e as Map<String, dynamic>))
						?.toList());
	}
}

@JsonSerializable()
class MyOrdersIndexTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemIndexMyOrders?>? items;
	MyOrdersIndexTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyOrdersIndexTools.fromJson(Map<String, dynamic> json) => _$MyOrdersIndexToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyOrdersIndexToolsToJson(this);

}


///
////////////////////////////////////////////////






  






  

