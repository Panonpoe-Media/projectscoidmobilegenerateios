

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
import 'my_purchases_item.dart';
import 'my_purchases_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyPurchases/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'my_purchases_base.g.dart';



@JsonSerializable()

class ModelActionDownloadMyPurchases {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? order_item_id;
  int? seller_id;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? order_id;
  String? order_str;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String? title;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? product_id;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_str;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_str;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  DateTime? date;
  double? price;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? buyer_id;
  String? buyer_str;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int? buyer_payment_id;
  String? buyer_payment_str;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int? seller_credit_id;
  String? seller_credit_str;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int? rating;
  String? testimony;

	
	  ModelActionDownloadMyPurchases(
            this.id,
			this.order_item_id,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.order_id,
			this.order_str,
			this.order_list,
			this.order_list_str,
			this.title,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_list,
			this.iklan_list_str,
			this.date,
			this.price,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.buyer_id,
			this.buyer_str,
			this.buyer_list,
			this.buyer_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_list,
			this.seller_credit_list_str,
			this.rating,
			this.testimony,

  );
    factory ModelActionDownloadMyPurchases.fromJson(Map<String, dynamic> json) => _$ModelActionDownloadMyPurchasesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionDownloadMyPurchasesToJson(this);

}



class DownloadMyPurchasesBase{
	var model;
	Map<String, dynamic> json;
	DownloadMyPurchasesBase(this.json){
		model = DownloadMyPurchasesSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Widget RButtonActionMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,

 var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
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
						cl),
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
					MaterialStateProperty.all<Color>(cl),
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
                      var formData = await convertFormDataDownload(button!.text!, model
                     					  );
                                  my_purchases = new MyPurchasesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.project_title);
										}else if(['AskOwner'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.user_id);
										}else{
										my_purchases.deleteAllDownloadMyPurchases('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_purchases.postDownloadMyPurchasesWithID();
                                  future.then((value) {
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){
						  if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }			  
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_purchases.postDownloadMyPurchases();
                                  future.then((value) {
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){
						if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


                      });
                      }
                                

                                  } else {
								  _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
								  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
 var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataDownload(button!.text!, model
                     					  );
                                  my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.project_title);
										}else if(['AskOwner'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Download')){
										my_purchases.deleteAllDownloadMyPurchases(this.model.model.user_id);
										}else{
										my_purchases.deleteAllDownloadMyPurchases('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_purchases.postDownloadMyPurchasesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_purchases.postDownloadMyPurchases();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
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
  
   String? action =   'Download';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "order_item[_trigger_]":"$tgr",
  "order_item[seller_id]": "${model.model.seller_id_id }",
  "order_item[order_id]": "${model.model.order_id_id }",
  "order_item[title]": "${model.model.title }",
   "order_item[type_id]": "${model.model.type_id_id }",
  "order_item[product_id]": "${model.model.product_id_id }",
  "order_item[project_id]": "${model.model.project_id_id }",
  "order_item[service_id]": "${model.model.service_id_id }",
  "order_item[bid_id]": "${model.model.bid_id_id }",
  "order_item[iklan_id]": "${model.model.iklan_id_id }",
  "order_item[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}",
  "order_item[price]": "${model.model.price }",
   "order_item[status_id]": "${model.model.status_id_id }",
  "order_item[buyer_id]": "${model.model.buyer_id_id }",
  "order_item[buyer_payment_id]": "${model.model.buyer_payment_id_id }",
  "order_item[seller_credit_id]": "${model.model.seller_credit_id_id }",
  "order_item[rating]": "${model.model.rating }",
  "order_item[testimony]": "${model.model.testimony }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,

 var postDownloadResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyPurchasesWidget(model.buttons[i], context,formKey, controller,my_purchases, postDownloadResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postDownloadResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyPurchasesWidget(model.buttons[i], context,formKey, controller,my_purchases, postDownloadResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postDownloadResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postDownloadResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_purchases, postDownloadResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postDownloadResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_purchases, postDownloadResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editSeller (State state) {
								  return(
								  ModelWidget(
								  value: model.model.seller_id,
								  caption: 'Seller',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.seller_list,
								  nameenum: model.model.seller_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.seller_id = val;
									});
								  },
								));}
										Widget editOrder (State state) {
								  return(
								  ModelWidget(
								  value: model.model.order_id,
								  caption: 'Order',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.order_list,
								  nameenum: model.model.order_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.order_id = val;
									});
								  },
								));}
										Widget editTitle (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.title,
									caption: 'Title',
									hint: 'Isi dengan Website Anda',
									required: false,
									getValue: (String? val) {
									  state.setState(() {
										model.model.title = val;
									  });
									},
								));}
									Widget editType (State state) {
								  return(
								  EnumWidget(
								  value: model.model.type_id,
								  caption: 'Type',
								  hint: 'pilih Enum',
								  required: false,
								  idenum: model.model.type_list,
								  nameenum: model.model.type_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.type_id = val;
									});
								  },
								));}
										Widget editProduct (State state) {
								  return(
								  ModelWidget(
								  value: model.model.product_id,
								  caption: 'Product',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.product_list,
								  nameenum: model.model.product_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.product_id = val;
									});
								  },
								));}
										Widget editProject (State state) {
								  return(
								  ModelWidget(
								  value: model.model.project_id,
								  caption: 'Project',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.project_list,
								  nameenum: model.model.project_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.project_id = val;
									});
								  },
								));}
										Widget editService (State state) {
								  return(
								  ModelWidget(
								  value: model.model.service_id,
								  caption: 'Service',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.service_list,
								  nameenum: model.model.service_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.service_id = val;
									});
								  },
								));}
										Widget editBid (State state) {
								  return(
								  ModelWidget(
								  value: model.model.bid_id,
								  caption: 'Bid',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.bid_list,
								  nameenum: model.model.bid_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.bid_id = val;
									});
								  },
								));}
										Widget editIklan (State state) {
								  return(
								  ModelWidget(
								  value: model.model.iklan_id,
								  caption: 'Iklan',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.iklan_list,
								  nameenum: model.model.iklan_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.iklan_id = val;
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
									state.setState(() {
									  model.model.date = val;
									});
								  },
								));} 
										Widget editPrice (State state) {
								  return(
								MoneyWidget(
								  value: model.model.price,
								  caption: 'Price',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double? val) {
									state.setState(() {
									  model.model.price = val;
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
									state.setState(() {
									  model.model.status_id = val;
									});
								  },
								));}
										Widget editBuyer (State state) {
								  return(
								  ModelWidget(
								  value: model.model.buyer_id,
								  caption: 'Buyer',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.buyer_list,
								  nameenum: model.model.buyer_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.buyer_id = val;
									});
								  },
								));}
										Widget editBuyerPayment (State state) {
								  return(
								  ModelWidget(
								  value: model.model.buyer_payment_id,
								  caption: 'Buyer Payment',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.buyer_payment_list,
								  nameenum: model.model.buyer_payment_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.buyer_payment_id = val;
									});
								  },
								));}
										Widget editSellerCredit (State state) {
								  return(
								  ModelWidget(
								  value: model.model.seller_credit_id,
								  caption: 'Seller Credit',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.seller_credit_list,
								  nameenum: model.model.seller_credit_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.seller_credit_id = val;
									});
								  },
								));}
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
										Widget editTestimony (State state) {
								  return(
								new ArticleWidget(
								  value: model.model.testimony,
								  caption: 'Testimony',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String? val) {
									state.setState(() {
									  model.model.testimony = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class DownloadMyPurchasesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionDownloadMyPurchases? model;
  DownloadMyPurchasesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory DownloadMyPurchasesSuperBase.fromJson(Map<String, dynamic> json) => _$DownloadMyPurchasesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadMyPurchasesSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionRateProductMyPurchases {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? order_item_id;
	  int? product_id;
	  String? product_str;
	  String? product_url;
	  List<int?>? product_list;
	  List<String?>? product_list_str;
	  int? seller_id;
	  String? seller_str;
	  String? seller_url;
	  List<int?>? seller_list;
	  List<String?>? seller_list_str;
	  DateTime? date;
	  double? price;
	  String? price_str;
  int? rating;
  String? testimony;

	
	  ModelActionRateProductMyPurchases(
            this.id,
			this.order_item_id,
				this.product_id,
				this.product_str,
				this.product_url,
				this.product_list,
				this.product_list_str,
				this.seller_id,
				this.seller_str,
				this.seller_url,
				this.seller_list,
				this.seller_list_str,
        this.date,
				this.price,
				this.price_str,
			this.rating,
			this.testimony,

  );
    factory ModelActionRateProductMyPurchases.fromJson(Map<String, dynamic> json) => _$ModelActionRateProductMyPurchasesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRateProductMyPurchasesToJson(this);

}



class RateProductMyPurchasesBase{
	var model;
	Map<String, dynamic> json;
	RateProductMyPurchasesBase(this.json){
		model = RateProductMyPurchasesSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Widget RButtonActionMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,

 var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
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
						cl),
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
					MaterialStateProperty.all<Color>(cl),
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
                      var formData = await convertFormDataRateProduct(button!.text!, model
                     					  );
                                  my_purchases = new MyPurchasesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.user_id);
										}else{
										my_purchases.deleteAllRateProductMyPurchases('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_purchases.postRateProductMyPurchasesWithID();
                                  future.then((value) {
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){
						  if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }			  
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_purchases.postRateProductMyPurchases();
                                  future.then((value) {
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){
						if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


                      });
                      }
                                

                                  } else {
								  _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
								  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
 var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataRateProduct(button!.text!, model
                     					  );
                                  my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('RateProduct')){
										my_purchases.deleteAllRateProductMyPurchases(this.model.model.user_id);
										}else{
										my_purchases.deleteAllRateProductMyPurchases('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_purchases.postRateProductMyPurchasesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_purchases.postRateProductMyPurchases();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPurchasesResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPurchasesListing(id :  id!)),
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
  
   String? action =   'RateProduct';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "order_item[_trigger_]":"$tgr",
  "order_item[rating]": "${model.model.rating }",
  "order_item[testimony]": "${model.model.testimony }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,

 var postRateProductResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyPurchasesWidget(model.buttons[i], context,formKey, controller,my_purchases, postRateProductResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postRateProductResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyPurchasesWidget(model.buttons[i], context,formKey, controller,my_purchases, postRateProductResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postRateProductResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postRateProductResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_purchases, postRateProductResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postRateProductResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_purchases, postRateProductResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewProduct (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.product_str,
									caption: 'Product',
								));
								 } 
										Widget viewSeller (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.seller_str,
									caption: 'Seller',
								));
								 } 
										Widget viewDate (BuildContext context) {  
								return(  DateTimeView(
									value: model.model.date,
									caption: 'Date',
								));} 
										Widget viewPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.price,
									caption: 'Price',
								));}
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
										Widget editTestimony (State state) {
								  return(
								new ArticleWidget(
								  value: model.model.testimony,
								  caption: 'Testimony',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String? val) {
									state.setState(() {
									  model.model.testimony = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class RateProductMyPurchasesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRateProductMyPurchases? model;
  RateProductMyPurchasesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory RateProductMyPurchasesSuperBase.fromJson(Map<String, dynamic> json) => _$RateProductMyPurchasesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RateProductMyPurchasesSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyPurchases {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? order_item_id;
  int? seller_id;
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? order_id;
  String? order_url;
  String? order_str;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String? title;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? product_id;
  String? product_url;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_url;
  String? bid_str;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_url;
  String? iklan_str;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  DateTime? date;
  double? price;
  String? price_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? buyer_id;
  String? buyer_url;
  String? buyer_str;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int? buyer_payment_id;
  String? buyer_payment_url;
  String? buyer_payment_str;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int? seller_credit_id;
  String? seller_credit_url;
  String? seller_credit_str;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int? rating;
  String? testimony;

	
	  ModelMyPurchases(
            this.id,
            this.order_item_id,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.order_id,
			this.order_str,
			this.order_list,
			this.order_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_list,
			this.iklan_list_str,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.buyer_id,
			this.buyer_str,
			this.buyer_list,
			this.buyer_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_list,
			this.seller_credit_list_str,

  );
    factory ModelMyPurchases.fromJson(Map<String, dynamic> json) => _$ModelMyPurchasesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyPurchasesToJson(this);

}




class MyPurchasesBase{
	var model;
	Map<String, dynamic> json;
	MyPurchasesBase(this.json){
		model = MyPurchasesSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
   
   
      var formData = {
      "my_purchases[_trigger_]":"",
   "my_purchases[order_item_id]": "${model.model.order_item_id }",
  "my_purchases[seller_id]": "${model.model.seller_id }",
  "my_purchases[order_id]": "${model.model.order_id }",
  "my_purchases[title]": "${model.model.title }",
   "my_purchases[type_id]": "${model.model.type_id}",
  "my_purchases[product_id]": "${model.model.product_id }",
  "my_purchases[project_id]": "${model.model.project_id }",
  "my_purchases[service_id]": "${model.model.service_id }",
  "my_purchases[bid_id]": "${model.model.bid_id }",
  "my_purchases[iklan_id]": "${model.model.iklan_id }",
  "my_purchases[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}",
  "my_purchases[price]": "${model.model.price}",
   "my_purchases[status_id]": "${model.model.status_id}",
  "my_purchases[buyer_id]": "${model.model.buyer_id }",
  "my_purchases[buyer_payment_id]": "${model.model.buyer_payment_id }",
  "my_purchases[seller_credit_id]": "${model.model.seller_credit_id }",
  "my_purchases[rating]": "${model.model.rating }",
  "my_purchases[testimony]": "${model.model.testimony }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyPurchasesWidget(model.buttons[i], context,formKey, controller,my_purchases, postMyPurchasesResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
  var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_purchases, postMyPurchasesResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
 var postMyPurchasesResult, State state, String? sendPath, String? id,  String? title){
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
                        my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_purchases.postMyPurchases();
                        future.then((value) {
                        state.setState(() {
                        postMyPurchasesResult = value;
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
   


	  	    Widget editSeller (State state) {
	   return(  StringView(
		value: model.model.seller_str,
		caption: 'Seller',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.seller_id,
	  caption: 'Seller',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.seller_id_list,
	  nameenum: model.model.seller_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOrder (State state) {
	   return(  StringView(
		value: model.model.order_str,
		caption: 'Order',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.order_id,
	  caption: 'Order',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.order_id_list,
	  nameenum: model.model.order_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.order_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTitle (State state) {
      return(
	DisplayNameWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
    ));}

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}

	  	    Widget editProduct (State state) {
	   return(  StringView(
		value: model.model.product_str,
		caption: 'Product',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.product_id,
	  caption: 'Product',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.product_id_list,
	  nameenum: model.model.product_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_id = val;
		});
	  },
	));*/
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

	  	    Widget editService (State state) {
	   return(  StringView(
		value: model.model.service_str,
		caption: 'Service',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.service_id,
	  caption: 'Service',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.service_id_list,
	  nameenum: model.model.service_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	  	    Widget editBid (State state) {
	   return(  StringView(
		value: model.model.bid_str,
		caption: 'Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.bid_id,
	  caption: 'Bid',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.bid_id_list,
	  nameenum: model.model.bid_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editIklan (State state) {
	   return(  StringView(
		value: model.model.iklan_str,
		caption: 'Iklan',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.iklan_id,
	  caption: 'Iklan',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.iklan_id_list,
	  nameenum: model.model.iklan_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.iklan_id = val;
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

	  	    Widget editPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.price,
	  caption: 'Price',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.price = val;
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

	  	    Widget editSellerCredit (State state) {
	   return(  StringView(
		value: model.model.seller_credit_str,
		caption: 'Seller Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.seller_credit_id,
	  caption: 'Seller Credit',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.seller_credit_id_list,
	  nameenum: model.model.seller_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_credit_id = val;
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

	  	    Widget editTestimony (State state) {
      return(
	new ArticleWidget(
	  value: model.model.testimony,
	  caption: 'Testimony',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.testimony = val;
		});
	  },
	));}
	
}


@JsonSerializable()

class MyPurchasesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyPurchases? model;
  MyPurchasesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyPurchasesSuperBase.fromJson(Map<String, dynamic> json) => _$MyPurchasesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyPurchasesSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyPurchases {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? order_item_id;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? order_id;
  String? order_str;
  String? order_url;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String? title;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? product_id;
  String? product_str;
  String? product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_str;
  String? service_url;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_str;
  String? bid_url;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_str;
  String? iklan_url;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  DateTime? date;
  double? price;
  String? price_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? buyer_id;
  String? buyer_str;
  String? buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int? buyer_payment_id;
  String? buyer_payment_str;
  String? buyer_payment_url;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int? seller_credit_id;
  String? seller_credit_str;
  String? seller_credit_url;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int? rating;
  String? testimony;

	//
	  ViewModelMyPurchases(
            this.id,
            this.order_item_id,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.order_id,
			this.order_str,
			this.order_url,
			this.order_list,
			this.order_list_str,
			this.title,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_url,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_url,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_url,
			this.iklan_list,
			this.iklan_list_str,
			this.date,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_url,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_url,
			this.seller_credit_list,
			this.seller_credit_list_str,
			this.rating,
			this.testimony,

  );

  
   factory ViewModelMyPurchases.fromJson(Map<String, dynamic> json) => _$ViewModelMyPurchasesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyPurchasesToJson(this); 
  
}


class MyPurchasesViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyPurchasesViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewMyPurchasesWidget(model.buttons[i],context,  formKey, controller, my_purchases,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
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
                        
                        my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_purchases.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postMyPurchasesResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPurchasesController my_purchases,
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
				children:listButton(context, visible!, formKey, controller, my_purchases,
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

	 	  
	   viewChildren!.add(viewSeller(context)); 
	   viewChildren!.add(viewOrder(context)); 
	   viewChildren!.add(viewTitle(context)); 
	   viewChildren!.add(viewType(context)); 
	   viewChildren!.add(viewProduct(context)); 
	   viewChildren!.add(viewProject(context)); 
	   viewChildren!.add(viewService(context)); 
	   viewChildren!.add(viewBid(context)); 
	   viewChildren!.add(viewIklan(context)); 
	   viewChildren!.add(viewDate(context)); 
	   viewChildren!.add(viewPrice(context)); 
	   viewChildren!.add(viewStatus(context)); 
	   viewChildren!.add(viewBuyer(context)); 
	   viewChildren!.add(viewBuyerPayment(context)); 
	   viewChildren!.add(viewSellerCredit(context)); 
	   viewChildren!.add(viewRating(context)); 
	   viewChildren!.add(viewTestimony(context)); 

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

 
				Widget viewSeller (BuildContext context) {  
		return(  ModelView(
			value: model.model.seller_id,
			caption: 'Seller',
			idenum: model.model.seller_list,
			nameenum: model.model.seller_str,
		));} 
				Widget viewOrder (BuildContext context) {  
		return(  ModelView(
			value: model.model.order_id,
			caption: 'Order',
			idenum: model.model.order_list,
			nameenum: model.model.order_str,
		));} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.title,
		caption: 'Title',
	));}
	    Widget viewType (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.type_id,
			caption: 'Type',
			idenum: model.model.type_list,
			nameenum: model.model.type_str,
		));} 
				Widget viewProduct (BuildContext context) {  
		return(  ModelView(
			value: model.model.product_id,
			caption: 'Product',
			idenum: model.model.product_list,
			nameenum: model.model.product_str,
		));} 
				Widget viewProject (BuildContext context) {  
		return(  ModelView(
			value: model.model.project_id,
			caption: 'Project',
			idenum: model.model.project_list,
			nameenum: model.model.project_str,
		));} 
				Widget viewService (BuildContext context) {  
		return(  ModelView(
			value: model.model.service_id,
			caption: 'Service',
			idenum: model.model.service_list,
			nameenum: model.model.service_str,
		));} 
				Widget viewBid (BuildContext context) {  
		return(  ModelView(
			value: model.model.bid_id,
			caption: 'Bid',
			idenum: model.model.bid_list,
			nameenum: model.model.bid_str,
		));} 
				Widget viewIklan (BuildContext context) {  
		return(  ModelView(
			value: model.model.iklan_id,
			caption: 'Iklan',
			idenum: model.model.iklan_list,
			nameenum: model.model.iklan_str,
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
		    Widget viewPrice (BuildContext context) {  			
    if(model.model.price != null){
		return(  MoneyView(
		value: model.model.price,
		caption: 'Price',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Price',
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
				Widget viewBuyer (BuildContext context) {  
		return(  ModelView(
			value: model.model.buyer_id,
			caption: 'Buyer',
			idenum: model.model.buyer_list,
			nameenum: model.model.buyer_str,
		));} 
				Widget viewBuyerPayment (BuildContext context) {  
		return(  ModelView(
			value: model.model.buyer_payment_id,
			caption: 'Buyer Payment',
			idenum: model.model.buyer_payment_list,
			nameenum: model.model.buyer_payment_str,
		));} 
				Widget viewSellerCredit (BuildContext context) {  
		return(  ModelView(
			value: model.model.seller_credit_id,
			caption: 'Seller Credit',
			idenum: model.model.seller_credit_list,
			nameenum: model.model.seller_credit_str,
		));} 
		    Widget viewRating (BuildContext context) {  
	
	if(model.model.rating != null){
		return(  RatingView(
		value: model.model.rating,
		caption: 'Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Rating',
		 ));	
	}
     }
		    Widget viewTestimony (BuildContext context) {  
	if(model.model.testimony != null){
		return(  ArticleView(
		value: model.model.testimony,
		caption: 'Testimony',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Testimony',
		    ));
	}		
     }
  
}


@JsonSerializable()
class MyPurchasesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyPurchases? model;
  MyPurchasesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory MyPurchasesViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyPurchasesViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyPurchasesViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyPurchasesListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyPurchasesListingBase(this.json){
		items = MyPurchasesListingItems.fromJson(this.json);
		tools = MyPurchasesListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyPurchasesModel item,String? search, bool?account) {
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
	totalHeight = totalHeight + 4 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPurchasesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyPurchasesModel item,String? search, int? index, bool?account, String? id) {
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
	totalHeight = totalHeight + 4 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPurchasesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyPurchasesModel item,String? search, int? index, bool?account) {
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
	totalHeight = totalHeight + 4 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPurchasesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyPurchasesModel item,ItemMyPurchasesModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPurchasesCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyPurchasesModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	totalHeight = totalHeight + 4 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPurchasesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyPurchasesWidget(tools.buttons[i],context, account));
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





class MyPurchasesListingItems{
  List<ItemMyPurchasesModel?>? items;
  MyPurchasesListingItems(
      this.items,
      );

  factory MyPurchasesListingItems.fromJson(Map<String, dynamic> json) {
  	return MyPurchasesListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyPurchasesModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyPurchasesListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyPurchases?>? items;
	MyPurchasesListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyPurchasesListingTools.fromJson(Map<String, dynamic> json) => _$MyPurchasesListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyPurchasesListingToolsToJson(this);

}




class ItemMyPurchasesCard extends StatelessWidget {
  const ItemMyPurchasesCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyPurchasesModel? destination;
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
                child: ItemMyPurchasesContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyPurchasesContent extends StatelessWidget {
  const ItemMyPurchasesContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyPurchasesModel? destination;

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
		  buttonChildren!.add(itemMyPurchasesButton(destination,i , context));
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
	   children!.add(destination!.viewSeller(context)); 
	   children!.add(destination!.viewOrder(context)); 
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewType(context)); 
	   children!.add(destination!.viewProduct(context)); 
	   children!.add(destination!.viewProject(context)); 
	   children!.add(destination!.viewService(context)); 
	   children!.add(destination!.viewBid(context)); 
	   children!.add(destination!.viewIklan(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewPrice(context)); 
	   children!.add(destination!.viewStatus(context)); 
	   children!.add(destination!.viewBuyer(context)); 
	   children!.add(destination!.viewBuyerPayment(context)); 
	   children!.add(destination!.viewSellerCredit(context)); 
	   children!.add(destination!.viewRating(context)); 
	   children!.add(destination!.viewTestimony(context)); 
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

Widget itemMyPurchasesButton(ItemMyPurchasesModel? destination, int? index, BuildContext context){
  MyPurchasesController my_purchases; 
  
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
                        
                        my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_purchases.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyPurchasesResult = value;
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



class ItemMyPurchasesWidget extends StatelessWidget {

	final ItemMyPurchasesModel?  item;
	final String? search;
	const  ItemMyPurchasesWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyPurchasesWidget(Button button, BuildContext context, bool?account){
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


class MyPurchasesIndexBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyPurchasesIndexBase(this.json){
		items = MyPurchasesIndexItems.fromJson(this.json);
		tools = MyPurchasesIndexTools.fromJson(this.json);
	}
	

  
 List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children!.add(_getTitleItemWidget('No',50));
    children!.add(_getTitleItemWidget('Seller',140));
      
    children!.add(_getTitleItemWidget('Title',350));
      
    children!.add(_getTitleItemWidget('Date',140));
      
    children!.add(_getTitleItemWidget('Price',140));
      
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
      child: items.items[index].viewSeller(context)
    ));
    
   // children!.add(items.items[index].viewSeller(context));
   //children!.add(Text('helooo'));
      
    children!.add(
       Container(
          child: HtmlWidget(items.items[index].item.title,
            onTapUrl: (url) async{
              if(url.contains('projects.co.id')){


                if(url.contains(new RegExp(r'[0-9]'))){
                  if(url.contains('show_conversation')){
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(url+ '/' ));
                  }else{
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(url )).catchError((onError){

                      AppProvider.getRouter(context)!.pop(context);
                    });
                  }

                }else{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute(url + '/listing/'));
                }


              }else
              {

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }


              }

                throw 'Could not launch ';
            },
                ),
          width: 350,
          height: 56,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
    );
      
    
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
      child: items.items[index].viewPrice(context)
    ));
    
   // children!.add(items.items[index].viewPrice(context));
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



  Widget viewItem (ItemIndexMyPurchasesModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyPurchasesIndexCard(destination :item, search : search!, shape : shape!, height : height!)
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
    return count;
  }

	  Widget viewItemIndex (ItemIndexMyPurchasesModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyPurchasesIndexCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
    if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyPurchasesWidget(tools.buttons[i],context, account));
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


class ItemMyPurchasesIndexCard extends StatelessWidget {
  const ItemMyPurchasesIndexCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemIndexMyPurchasesModel? destination;
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
                child: ItemMyPurchasesIndexContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyPurchasesIndexContent extends StatelessWidget {
  const ItemMyPurchasesIndexContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemIndexMyPurchasesModel? destination;

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
		  buttonChildren!.add(itemIndexMyPurchasesButton(destination,i , context));
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
	   children!.add(destination!.viewSeller(context)); 
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewPrice(context)); 
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

Widget itemIndexMyPurchasesButton(ItemIndexMyPurchasesModel? destination, int? index, BuildContext context){
  MyPurchasesController my_purchases; 
  
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
                        
                        my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_purchases.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyPurchasesResult = value;
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


class MyPurchasesIndexItems{
  List<ItemIndexMyPurchasesModel?>? items;
  MyPurchasesIndexItems(
      this.items,
      );

  factory MyPurchasesIndexItems.fromJson(Map<String, dynamic> json) {
  	return MyPurchasesIndexItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemIndexMyPurchasesModel(e as Map<String, dynamic>))
						?.toList());
	}
}

@JsonSerializable()
class MyPurchasesIndexTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemIndexMyPurchases?>? items;
	MyPurchasesIndexTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyPurchasesIndexTools.fromJson(Map<String, dynamic> json) => _$MyPurchasesIndexToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyPurchasesIndexToolsToJson(this);

}


///
////////////////////////////////////////////////






  






  

