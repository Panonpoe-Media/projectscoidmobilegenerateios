

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
import 'browse_services_item.dart';
import 'browse_services_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/BrowseServices/action.dart';
import 'package:projectscoid/views/route.dart' as rt;
part 'browse_services_base.g.dart';



@JsonSerializable()

class ModelActionPlaceOrderBrowseServices {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? service_id;
	  String? title;
	  String? short_description;
	  int? finish_days;
	  String? finish_days_str;
	  int? seller_id;
	  String? seller_str;
	  String? seller_url;
	  List<int?>? seller_list;
	  List<String?>? seller_list_str;
	  String? selected_options;
	  double? total_price;
	  String? total_price_str;
  String? special_requirements;

	
	  ModelActionPlaceOrderBrowseServices(
            this.id,
			this.service_id,
        this.title,
        this.short_description,
				this.finish_days,
				this.finish_days_str,
				this.seller_id,
				this.seller_str,
				this.seller_url,
				this.seller_list,
				this.seller_list_str,
        this.selected_options,
				this.total_price,
				this.total_price_str,
			this.special_requirements,

  );
    factory ModelActionPlaceOrderBrowseServices.fromJson(Map<String, dynamic> json) => _$ModelActionPlaceOrderBrowseServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPlaceOrderBrowseServicesToJson(this);

}



class PlaceOrderBrowseServicesBase{
	var model;
	Map<String, dynamic> json;
	PlaceOrderBrowseServicesBase(this.json){
		model = PlaceOrderBrowseServicesSuperBase.fromJson(this.json);
	}



Widget RButtonActionBrowseServicesWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
 var postBrowseServicesResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPlaceOrder(button!.text!, model
                     					  );
                                  browse_services = new BrowseServicesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.project_title);
										}else if(['AskOwner'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.user_id);
										}else{
										browse_services.deleteAllPlaceOrderBrowseServices('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_services.postPlaceOrderBrowseServicesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseServicesResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
                          AppProvider.getRouter(context)!.pop(context);
                      });
                      }else{
                      final future = browse_services.postPlaceOrderBrowseServices();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseServicesResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
                          AppProvider.getRouter(context)!.pop(context);
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

SpeedDialChild  ButtonActionBrowseServicesWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
 var postBrowseServicesResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPlaceOrder(button!.text!, model
                     					  );
                                  browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.project_title);
										}else if(['AskOwner'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PlaceOrder')){
										browse_services.deleteAllPlaceOrderBrowseServices(this.model.model.user_id);
										}else{
										browse_services.deleteAllPlaceOrderBrowseServices('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_services.postPlaceOrderBrowseServicesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseServicesResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
                          AppProvider.getRouter(context)!.pop(context);
                      });
                      }else{
                      final future = browse_services.postPlaceOrderBrowseServices();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseServicesResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
                          AppProvider.getRouter(context)!.pop(context);
                      });
                      }
                                

                                  } else {}
                            }
                      )

     );
  }

}

	
   Map<String, dynamic> convertFormDataAction(var data, String? triger){
  
   String? action =   'PlaceOrder';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "service[_trigger_]":"$tgr",
  "service[special_requirements]": "${model.model.special_requirements }",
	  
  };  


    return( formData);
  } 	
	
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postPlaceOrderResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(RButtonActionBrowseServicesWidget(model.buttons[i], context,formKey, controller,browse_services, postPlaceOrderResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postPlaceOrderResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionBrowseServicesWidget(model.buttons[i], context,formKey, controller,browse_services, postPlaceOrderResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postPlaceOrderResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postPlaceOrderResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,browse_services, postPlaceOrderResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postPlaceOrderResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,browse_services, postPlaceOrderResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.title,
									caption: 'Title',
								));}
										Widget viewShortDescription (BuildContext context) { 
							    if(model.model.short_description == null || model.model.short_description == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.short_description,
									caption: 'Short Description',
								));
								}			
								
								}
										Widget viewFinishDays (BuildContext context) { 
								return(  NumberView(
									value: model.model.finish_days,
									caption: 'Finish Days',
								));}
										Widget viewSeller (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.seller_str,
									caption: 'Seller',
								));
								 } 
										Widget viewSelectedOptions (BuildContext context) {  
								return(  ArticleView(
									value: model.model.selected_options,
									caption: 'Selected Options',
								));}
										Widget viewTotalPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.total_price,
									caption: 'Total Price',
								));}
										Widget editSpecialRequirements (State state) {
								  return(
								new ArticleWidget(
								  value: model.model.special_requirements,
								  caption: 'Special Requirements',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String? val) {
									state.setState(() {
									  model.model.special_requirements = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class PlaceOrderBrowseServicesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPlaceOrderBrowseServices? model;
  PlaceOrderBrowseServicesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PlaceOrderBrowseServicesSuperBase.fromJson(Map<String, dynamic> json) => _$PlaceOrderBrowseServicesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderBrowseServicesSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelBrowseServices {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? service_id;
  String? service_info;
  int? seller_id;
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? comments;
  String? reviews;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<int?>? tags_list;
  List<String?>? tags_list_str;

  Photo?logo;
  String?  logo_url;
  int? category_id;
  String? category_url;
  String? category_str;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  String? description;
  String? short_description;
  int? finish_days;
  String? finish_days_str;
  double? price;
  String? price_str;
  String? options;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? registered_by_id;
  String? registered_by_url;
  String? registered_by_str;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime? registered_date;
  String? registered_from_ip;
  int? verified_by_id;
  String? verified_by_url;
  String? verified_by_str;
  List<int?>? verified_by_list;
  List<String?>? verified_by_list_str;
  DateTime? verified_date;
  String? verified_from_ip;
  String? verifier_note;
  int? approved_by_id;
  String? approved_by_url;
  String? approved_by_str;
  List<int?>? approved_by_list;
  List<String?>? approved_by_list_str;
  DateTime? approved_date;
  String? approved_from_ip;
  String? approver_note;
  int? published_by_id;
  String? published_by_url;
  String? published_by_str;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime? published_date;
  String? published_from_ip;
  int? rejected_by_id;
  String? rejected_by_url;
  String? rejected_by_str;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime? rejected_date;
  String? rejected_from_ip;
  String? admin_note;
  DateTime? last_bump;
  int? sales_count;
  String? sales_count_str;
  double? sales_amount;
  String? sales_amount_str;
  int? rating;
  int? points;
  String? points_str;
  int? ranking;
  String? ranking_str;
  double? rating_num;
  String? rating_num_str;
  int? rating_sum;
  String? rating_sum_str;
  int? rating_div;
  String? rating_div_str;
  String? selected_options;
  double? total_price;
  String? total_price_str;
  String? special_requirements;

	
	  ModelBrowseServices(
            this.id,
            this.service_id,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.tags_list,
			this.tags_list_str,
			this.logo,
			this.logo_url,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.finish_days,
			this.finish_days_str,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_list,
			this.registered_by_list_str,
			this.verified_by_id,
			this.verified_by_str,
			this.verified_by_list,
			this.verified_by_list_str,
			this.approved_by_id,
			this.approved_by_str,
			this.approved_by_list,
			this.approved_by_list_str,
			this.published_by_id,
			this.published_by_str,
			this.published_by_list,
			this.published_by_list_str,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.sales_count,
			this.sales_count_str,
			this.sales_amount,
			this.sales_amount_str,
			this.points,
			this.points_str,
			this.ranking,
			this.ranking_str,
			this.rating_num,
			this.rating_num_str,
			this.rating_sum,
			this.rating_sum_str,
			this.rating_div,
			this.rating_div_str,
			this.total_price,
			this.total_price_str,

  );
    factory ModelBrowseServices.fromJson(Map<String, dynamic> json) => _$ModelBrowseServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelBrowseServicesToJson(this);

}




class BrowseServicesBase{
	var model;
	Map<String, dynamic> json;
	BrowseServicesBase(this.json){
		model = BrowseServicesSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? logo = '';
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"} ';
		 }
	 }
   
   
      var formData = {
      "browse_services[_trigger_]":"",
   "browse_services[service_id]": "${model.model.service_id }",
  "browse_services[service_info]": "${model.model.service_info }",
  "browse_services[seller_id]": "${model.model.seller_id }",
  "browse_services[comments]": "${model.model.comments }",
  "browse_services[reviews]": "${model.model.reviews }",
  "browse_services[logo]": '$logo',
  "browse_services[logo_lastval]": '{"name":"${model.model.logo.name}","dir":"${model.model.logo.dir}","file":"${model.model.logo.file}","thumb":"${model.model.logo.thumb}"}',
  "browse_services[category_id]": "${model.model.category_id }",
  "browse_services[title]": "${model.model.title }",
  "browse_services[description]": "${model.model.description }",
  "browse_services[short_description]": "${model.model.short_description }",
  "browse_services[finish_days]": "${model.model.finish_days }",
  "browse_services[price]": "${model.model.price}",
  "browse_services[options]": "${model.model.options }",
   "browse_services[status_id]": "${model.model.status_id}",
  "browse_services[registered_by_id]": "${model.model.registered_by_id }",
  "browse_services[registered_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}",
  "browse_services[registered_from_ip]": "${model.model.registered_from_ip }",
  "browse_services[verified_by_id]": "${model.model.verified_by_id }",
  "browse_services[verified_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.verified_date)}",
  "browse_services[verified_from_ip]": "${model.model.verified_from_ip }",
   "browse_services[verifier_note]": "${model.model.verifier_note }",
  "browse_services[approved_by_id]": "${model.model.approved_by_id }",
  "browse_services[approved_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.approved_date)}",
  "browse_services[approved_from_ip]": "${model.model.approved_from_ip }",
   "browse_services[approver_note]": "${model.model.approver_note }",
  "browse_services[published_by_id]": "${model.model.published_by_id }",
  "browse_services[published_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}",
  "browse_services[published_from_ip]": "${model.model.published_from_ip }",
  "browse_services[rejected_by_id]": "${model.model.rejected_by_id }",
  "browse_services[rejected_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}",
  "browse_services[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "browse_services[admin_note]": "${model.model.admin_note }",
  "browse_services[last_bump]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}",
  "browse_services[sales_count]": "${model.model.sales_count }",
  "browse_services[sales_amount]": "${model.model.sales_amount}",
  "browse_services[rating]": "${model.model.rating }",
  "browse_services[points]": "${model.model.points }",
  "browse_services[ranking]": "${model.model.ranking }",
  "browse_services[rating_num]": "${model.model.rating_num}",
  "browse_services[rating_sum]": "${model.model.rating_sum }",
  "browse_services[rating_div]": "${model.model.rating_div }",
  "browse_services[selected_options]": "${model.model.selected_options }",
  "browse_services[total_price]": "${model.model.total_price}",
  "browse_services[special_requirements]": "${model.model.special_requirements }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"browse_services[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postBrowseServicesResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditBrowseServicesWidget(model.buttons[i], context,formKey, controller,browse_services, postBrowseServicesResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
  var postBrowseServicesResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,browse_services, postBrowseServicesResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditBrowseServicesWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
 var postBrowseServicesResult, State state, String? sendPath, String? id,  String? title){
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
                        browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = browse_services.postBrowseServices();
                        future.then((value) {
                        state.setState(() {
                        postBrowseServicesResult = value;
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
   


	  	    Widget editServiceInfo (State state) {
      return(
	TitleWidget(
		value: model.model.service_info,
		caption: 'Service Info',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.service_info = val;
		  });
		},
	));}

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

	  	    Widget editComments (State state) {
      return(
	TitleWidget(
		value: model.model.comments,
		caption: 'Comments',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.comments = val;
		  });
		},
	));}


	  	    Widget editReviews (State state) {
      return(
	TitleWidget(
		value: model.model.reviews,
		caption: 'Reviews',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.reviews = val;
		  });
		},
	));}



	  	    Widget editTags (State state) {
      return(
	
	new InlineTagsWidget(
	  value: model.model.tags_id,
	  caption: 'Tags',
	  hint: ' ',
	  required: false,
	  idtags: model.model.tags_list,
	  nametags: model.model.tags_list_str,
	  getValue: (List<int?>? val) {
    model.model.tags_id.clear();
		state.setState(() {
		  model.model.tags_id.addAll(val);
		});
	  },
	  removeValue: (int? val) {
		state.setState(() {
		  model.model.tags_id.remove(val);
		});
	  },
	));}

	Widget editLogo (State state) {
	if(model.model.logo_url== ''){
		model.model.logo = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.logo,
		caption: 'Logo',
		hint: 'Isi dengan Image Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.logo = val;
			model.model.logo_url = val!.name;
		  });
		},
	));} 

	  	    Widget editCategory (State state) {
	   return(  StringView(
		value: model.model.category_str,
		caption: 'Category',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.category_id,
	  caption: 'Category',
	  hint: 'pilih Model',
	  required: true,
	  idenum: model.model.category_id_list,
	  nameenum: model.model.category_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.category_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTitle (State state) {
      return(
	TitleWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Title Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
	));}

	  	    Widget editDescription (State state) {
      return(
	new ArticleWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}

	  	    Widget editShortDescription (State state) {
      return(
	DisplayNameWidget(
		value: model.model.short_description,
		caption: 'Short Description',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.short_description = val;
		  });
		},
    ));}

	  	    Widget editFinishDays (State state) {
      return(
	NumberWidget(
	  value: model.model.finish_days,
	  caption: 'Finish Days',
	  hint: 'Isi dengan Number Anda',
	  required: true,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.finish_days = val;
		});
	  },
	));}

	  	    Widget editPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.price,
	  caption: 'Price',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min:'50000', 
	  max:'1000000000', 
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.price = val;
		});
	  },
	));}

	 // String? model.model.options;

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

	  	    Widget editRegisteredBy (State state) {
	   return(  StringView(
		value: model.model.registered_by_str,
		caption: 'Registered By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.registered_by_id,
	  caption: 'Registered By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.registered_by_id_list,
	  nameenum: model.model.registered_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.registered_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRegisteredDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.registered_date,
	  caption: 'Registered Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.registered_date = val;
		});
	  },
	));} 

	  	    Widget editRegisteredFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.registered_from_ip,
		caption: 'Registered From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.registered_from_ip = val;
		  });
		},
    ));}

	  	    Widget editVerifiedBy (State state) {
	   return(  StringView(
		value: model.model.verified_by_str,
		caption: 'Verified By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.verified_by_id,
	  caption: 'Verified By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.verified_by_id_list,
	  nameenum: model.model.verified_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.verified_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editVerifiedDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.verified_date,
	  caption: 'Verified Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.verified_date = val;
		});
	  },
	));} 

	  	    Widget editVerifiedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.verified_from_ip,
		caption: 'Verified From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.verified_from_ip = val;
		  });
		},
    ));}

	 	    Widget editVerifierNote (State state) {
      return(
	MultilineWidget(
	  value: model.model.verifier_note,
	  caption: 'Verifier Note',
	  hint: 'Isi dengan Multiline Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.verifier_note = val;
		});
	  },
	));}

	  	    Widget editApprovedBy (State state) {
	   return(  StringView(
		value: model.model.approved_by_str,
		caption: 'Approved By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.approved_by_id,
	  caption: 'Approved By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.approved_by_id_list,
	  nameenum: model.model.approved_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.approved_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editApprovedDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.approved_date,
	  caption: 'Approved Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.approved_date = val;
		});
	  },
	));} 

	  	    Widget editApprovedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.approved_from_ip,
		caption: 'Approved From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.approved_from_ip = val;
		  });
		},
    ));}

	 	    Widget editApproverNote (State state) {
      return(
	MultilineWidget(
	  value: model.model.approver_note,
	  caption: 'Approver Note',
	  hint: 'Isi dengan Multiline Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.approver_note = val;
		});
	  },
	));}

	  	    Widget editPublishedBy (State state) {
	   return(  StringView(
		value: model.model.published_by_str,
		caption: 'Published By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.published_by_id,
	  caption: 'Published By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.published_by_id_list,
	  nameenum: model.model.published_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.published_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPublishedDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.published_date,
	  caption: 'Published Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.published_date = val;
		});
	  },
	));} 

	  	    Widget editPublishedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.published_from_ip,
		caption: 'Published From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_from_ip = val;
		  });
		},
    ));}

	  	    Widget editRejectedBy (State state) {
	   return(  StringView(
		value: model.model.rejected_by_str,
		caption: 'Rejected By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.rejected_by_id,
	  caption: 'Rejected By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.rejected_by_id_list,
	  nameenum: model.model.rejected_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.rejected_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRejectedDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.rejected_date,
	  caption: 'Rejected Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.rejected_date = val;
		});
	  },
	));} 

	  	    Widget editRejectedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.rejected_from_ip,
		caption: 'Rejected From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.rejected_from_ip = val;
		  });
		},
    ));}

	  	    Widget editAdminNote (State state) {
      return(
	new ArticleWidget(
	  value: model.model.admin_note,
	  caption: 'Admin Note',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.admin_note = val;
		});
	  },
	));}

	  	    Widget editLastBump (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.last_bump,
	  caption: 'Last Bump',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.last_bump = val;
		});
	  },
	));} 

	  	    Widget editSalesCount (State state) {
      return(
	NumberWidget(
	  value: model.model.sales_count,
	  caption: 'Sales Count',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.sales_count = val;
		});
	  },
	));}

	  	    Widget editSalesAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.sales_amount,
	  caption: 'Sales Amount',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.sales_amount = val;
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

	  	    Widget editPoints (State state) {
      return(
	NumberWidget(
	  value: model.model.points,
	  caption: 'Points',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.points = val;
		});
	  },
	));}

	  	    Widget editRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.ranking,
	  caption: 'Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.ranking = val;
		});
	  },
	));}

	  	    Widget editRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.rating_num,
	  caption: 'Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.rating_num = val;
		});
	  },
	));}

	  	    Widget editRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.rating_sum,
	  caption: 'Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.rating_sum = val;
		});
	  },
	));}

	  	    Widget editRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.rating_div,
	  caption: 'Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.rating_div = val;
		});
	  },
	));}

	  	    Widget editSelectedOptions (State state) {
      return(
	new ArticleWidget(
	  value: model.model.selected_options,
	  caption: 'Selected Options',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.selected_options = val;
		});
	  },
	));}

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

	  	    Widget editSpecialRequirements (State state) {
      return(
	new ArticleWidget(
	  value: model.model.special_requirements,
	  caption: 'Special Requirements',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.special_requirements = val;
		});
	  },
	));}
	
}


@JsonSerializable()

class BrowseServicesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelBrowseServices? model;
  BrowseServicesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory BrowseServicesSuperBase.fromJson(Map<String, dynamic> json) => _$BrowseServicesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BrowseServicesSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelBrowseServices {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? description;
  int? finish_days;
  String? finish_days_str;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
   //Screenshots screenshots;
  double? price;
  String? price_str;
  List<OptionField?>? options;  
  String? logo_url;
  Photo?logo;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? seller_photo_url;
  Photo?seller_photo; 
  String? seller_user_name;
  int? seller_kabupaten_id;
  String? seller_kabupaten_str;
  int?  seller_seller_rating;
  double?  seller_seller_rating_num;
  String? seller_seller_rating_num_str;
  int?  seller_seller_ranking;
  String? seller_seller_ranking_str;
  String? seller_date_registered;
  String? seller_last_seen;
  double?  seller_online_hours;
  String? seller_online_hours_str;
  int?  seller_projects_won;
  String? seller_projects_won_str;
  int?  seller_projects_completed;
  String? seller_projects_completed_str;
  int?  seller_projects_arbitrated;
  String? seller_projects_arbitrated_str;
  int?  seller_projects_won_in_arbitration;
  String? seller_projects_won_in_arbitration_str;
  int?  seller_projects_lost_in_arbitration;
  String? seller_projects_lost_in_arbitration_str;
  int?  seller_current_projects;
  String? seller_current_projects_str;
  int? sales_count;
  String? sales_count_str;
  int? rating;
   //ServiceReviews service_reviews;
   //ServiceComments service_comments;

	//
	  ViewModelBrowseServices(
            this.id,
			this.description,
			this.finish_days,
			this.finish_days_str,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.price,
			this.price_str,
			this.options,
			this.logo,
			this.logo_url,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.seller_photo_url,
			this.seller_photo,
			this.seller_kabupaten_id,
			this.seller_kabupaten_str,
			this.seller_seller_rating_num,
			this.seller_seller_rating_num_str,
			this.seller_seller_ranking,
			this.seller_seller_ranking_str,
			this.seller_online_hours,
			this.seller_online_hours_str,
			this.seller_projects_won,
			this.seller_projects_won_str,
			this.seller_projects_completed,
			this.seller_projects_completed_str,
			this.seller_projects_arbitrated,
			this.seller_projects_arbitrated_str,
			this.seller_projects_won_in_arbitration,
			this.seller_projects_won_in_arbitration_str,
			this.seller_projects_lost_in_arbitration,
			this.seller_projects_lost_in_arbitration_str,
			this.seller_current_projects,
			this.seller_current_projects_str,
			this.sales_count,
			this.sales_count_str,
			this.rating,

  );

  
   factory ViewModelBrowseServices.fromJson(Map<String, dynamic> json) => _$ViewModelBrowseServicesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelBrowseServicesToJson(this); 
  
}


class BrowseServicesViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	BrowseServicesViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewBrowseServicesWidget(model.buttons[i],context,  formKey, controller, browse_services,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewBrowseServicesWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseServicesController browse_services,
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
                        
                        browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = browse_services.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postBrowseServicesResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseServicesController browse_services,
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
				children:listButton(context, visible!, formKey, controller, browse_services,
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

	 	  
	   viewChildren!.add(viewDescription(context)); 
	   viewChildren!.add(viewFinishDays(context)); 
	   viewChildren!.add(viewTags(context)); 
		
	   viewChildren!.add(viewPrice(context)); 
    viewChildren!.add(viewOptions(context)); 
	   viewChildren!.add(viewLogo(context)); 
	   viewChildren!.add(viewSeller(context)); 
	   viewChildren!.add(viewPhoto(context));
	   viewChildren!.add(viewUserName(context));
	   viewChildren!.add(viewKabupaten(context));
	   viewChildren!.add(viewSellerRating(context));
	   viewChildren!.add(viewSellerRatingNum(context));
	   viewChildren!.add(viewSellerRanking(context));
	   viewChildren!.add(viewDateRegistered(context));
	   viewChildren!.add(viewLastSeen(context));
	   viewChildren!.add(viewOnlineHours(context));
	   viewChildren!.add(viewProjectsWon(context));
	   viewChildren!.add(viewProjectsCompleted(context));
	   viewChildren!.add(viewProjectsArbitrated(context));
	   viewChildren!.add(viewProjectsWonInArbitration(context));
	   viewChildren!.add(viewProjectsLostInArbitration(context));
	   viewChildren!.add(viewCurrentProjects(context));
	   viewChildren!.add(viewSalesCount(context)); 
	   viewChildren!.add(viewRating(context)); 
		
		

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

 
		    Widget viewDescription (BuildContext context) {  
	if(model.model.description != null){
		return(  ArticleView(
		value: model.model.description,
		caption: 'Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Description',
		    ));
	}		
     }
		    Widget viewFinishDays (BuildContext context) { 
    if(model.model.finish_days != null){
		return(  NumberView(
		value: model.model.finish_days,
		caption: 'Finish Days',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Finish Days',
		));
	}		
     }
	Widget viewTags (BuildContext context) {  
	if(model.model.tags_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.tags_id,
						caption: '',
						hint: ' ',
						required: false,
						idroutetags: model.model.tags_id,
						nameroutetags: model.model.tags_str,
						urlroutetags: model.model.tags_url,
						getValue: (String? val) {
						 // Navigator.pushReplacementNamed(context, "/projectscoid");
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.tags_id,
						caption: '',
						hint: ' ',
						required: false,
						idroutetags: model.model.tags_id,
						nameroutetags: model.model.tags_str,
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
    Widget viewOptions (BuildContext context) {  
          
          if(model.model.options != null){
            return(   OptionView(
                  value: model.model.options,
                  caption: 'Options',
                ));
          }else{
            return(  StringView(
            value: '',
            caption: 'Options',
            ));	
          }
     }
	 // String? model.model.options;
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: model.model.logo_url,
		caption: 'Logo',
	));} 
				Widget viewSeller (BuildContext context) {  
		return(  ModelView(
			value: model.model.seller_id,
			caption: 'Seller',
			idenum: model.model.seller_list,
			nameenum: model.model.seller_str,
		));} 
	  Widget viewPhoto (BuildContext context) {  
		return(  ImageView(
			value: model.model.seller_photo_url,
			caption: 'Photo',
		));} 
		Widget viewUserName (BuildContext context) {  
	    return(  StringView(
			value: model.model.seller_user_name,
			caption: 'User Name',
		));}
	  Widget viewKabupaten (BuildContext context) {  
	  return(  StringView(
			value: model.model.seller_kabupaten_str,
			caption: 'Kabupaten',
		));}
	   Widget viewSellerRating (BuildContext context) {
	   if(model.model.seller_seller_rating != null){
	   		return(  RatingView(
			value: model.model.seller_seller_rating,
			caption: 'Seller Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Seller Rating',
		 ));
	   }
        }
	  Widget viewSellerRatingNum (BuildContext context) {  
	   if(model.model.seller_seller_rating_num != null){
	   	  return(  StringView(
			value: model.model.seller_seller_rating_num.toString(),
			caption: 'Seller Rating Num',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_seller_rating_num_str,
			caption: 'Seller Rating Num',
		));
	   }
        }
	  Widget viewSellerRanking (BuildContext context) {  
	   if(model.model.seller_seller_ranking != null){
	   	  return(  StringView(
			value: model.model.seller_seller_ranking.toString(),
			caption: 'Seller Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_seller_ranking_str,
			caption: 'Seller Ranking',
		));
	   }
        }
		Widget viewDateRegistered (BuildContext context) {  
	    return(  StringView(
			value: model.model.seller_date_registered,
			caption: 'Date Registered',
		));}
		Widget viewLastSeen (BuildContext context) {  
	    return(  StringView(
			value: model.model.seller_last_seen,
			caption: 'Last Seen',
		));}
	  Widget viewOnlineHours (BuildContext context) {  
	   if(model.model.seller_online_hours != null){
	   	  return(  StringView(
			value: model.model.seller_online_hours.toString(),
			caption: 'Online Hours',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_online_hours_str,
			caption: 'Online Hours',
		));
	   }
        }
	  Widget viewProjectsWon (BuildContext context) {  
	   if(model.model.seller_projects_won != null){
	   	  return(  StringView(
			value: model.model.seller_projects_won.toString(),
			caption: 'Projects Won',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_projects_won_str,
			caption: 'Projects Won',
		));
	   }
        }
	  Widget viewProjectsCompleted (BuildContext context) {  
	   if(model.model.seller_projects_completed != null){
	   	  return(  StringView(
			value: model.model.seller_projects_completed.toString(),
			caption: 'Projects Completed',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_projects_completed_str,
			caption: 'Projects Completed',
		));
	   }
        }
	  Widget viewProjectsArbitrated (BuildContext context) {  
	   if(model.model.seller_projects_arbitrated != null){
	   	  return(  StringView(
			value: model.model.seller_projects_arbitrated.toString(),
			caption: 'Projects Arbitrated',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_projects_arbitrated_str,
			caption: 'Projects Arbitrated',
		));
	   }
        }
	  Widget viewProjectsWonInArbitration (BuildContext context) {  
	   if(model.model.seller_projects_won_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.seller_projects_won_in_arbitration.toString(),
			caption: 'Projects Won in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_projects_won_in_arbitration_str,
			caption: 'Projects Won in Arbitration',
		));
	   }
        }
	  Widget viewProjectsLostInArbitration (BuildContext context) {  
	   if(model.model.seller_projects_lost_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.seller_projects_lost_in_arbitration.toString(),
			caption: 'Projects Lost in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_projects_lost_in_arbitration_str,
			caption: 'Projects Lost in Arbitration',
		));
	   }
        }
	  Widget viewCurrentProjects (BuildContext context) {  
	   if(model.model.seller_current_projects != null){
	   	  return(  StringView(
			value: model.model.seller_current_projects.toString(),
			caption: 'Current Projects',
		));
	   } else{
	       return(  StringView(
			value: model.model.seller_current_projects_str,
			caption: 'Current Projects',
		));
	   }
        }
		    Widget viewSalesCount (BuildContext context) { 
    if(model.model.sales_count != null){
		return(  NumberView(
		value: model.model.sales_count,
		caption: 'Sales Count',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Sales Count',
		));
	}		
     }
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
  
}


@JsonSerializable()
class BrowseServicesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseServices? model;
  BrowseServicesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory BrowseServicesViewSuperBase.fromJson(Map<String, dynamic> json) => _$BrowseServicesViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$BrowseServicesViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class BrowseServicesListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	BrowseServicesListingBase(this.json){
		items = BrowseServicesListingItems.fromJson(this.json);
		tools = BrowseServicesListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemBrowseServicesModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseServicesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemBrowseServicesModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseServicesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemBrowseServicesModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseServicesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemBrowseServicesModel item,ItemBrowseServicesModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseServicesCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemBrowseServicesModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseServicesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonBrowseServicesWidget(tools.buttons[i],context, account));
   // }  
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, bool?account){
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
				children:listButton(context, account)
	    )
	 );
   } 
   
   
   
   
   
}





class BrowseServicesListingItems{
  List<ItemBrowseServicesModel?>? items;
  BrowseServicesListingItems(
      this.items,
      );

  factory BrowseServicesListingItems.fromJson(Map<String, dynamic> json) {
  	return BrowseServicesListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemBrowseServicesModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class BrowseServicesListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemBrowseServices?>? items;
	BrowseServicesListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory BrowseServicesListingTools.fromJson(Map<String, dynamic> json) => _$BrowseServicesListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$BrowseServicesListingToolsToJson(this);

}




class ItemBrowseServicesCard extends StatelessWidget {
  const ItemBrowseServicesCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemBrowseServicesModel? destination;
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
                child: ItemBrowseServicesContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBrowseServicesContent extends StatelessWidget {
  const ItemBrowseServicesContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemBrowseServicesModel? destination;

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
		  buttonChildren!.add(itemBrowseServicesButton(destination,i , context));
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
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewRating(context)); 
	   children!.add(destination!.viewRatingNum(context)); 
	   children!.add(destination!.viewSalesCount(context)); 
	   children!.add(destination!.viewPrice(context)); 
	   children!.add(destination!.viewFinishDays(context)); 
	   children!.add(destination!.viewSeller(context)); 
	   children!.add(destination!.viewSellerRating(context));
	   children!.add(destination!.viewSellerRanking(context));
	   children!.add(destination!.viewProductSold(context));
	   children!.add(destination!.viewShortDescription(context)); 
	   children!.add(destination!.viewTags(context)); 
	   children!.add(destination!.viewLogo(context)); 
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

Widget itemBrowseServicesButton(ItemBrowseServicesModel? destination, int? index, BuildContext context){
  BrowseServicesController browse_services; 
  
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
                        
                        browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = browse_services.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postBrowseServicesResult = value;
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



class ItemBrowseServicesWidget extends StatelessWidget {

	final ItemBrowseServicesModel?  item;
	final String? search;
	const  ItemBrowseServicesWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonBrowseServicesWidget(Button button, BuildContext context, bool?account){
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


///
////////////////////////////////////////////////






  






  

