

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
import 'my_products_item.dart';
import 'my_products_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyProducts/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'my_products_base.g.dart';





@JsonSerializable()

class ModelActionAddNewProductMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
  String? logo_url;
  Photo?logo;
  String? title;
  String? description;
   String? deliverable_url;
  String? deliverable_name;
  List<FileField?>? deliverable;
   String? trial_version_url;
  String? trial_version_name;
  List<FileField?>? trial_version;
  double? price;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<int?>? tags_list;
  List<String?>? tags_list_str;


	
	  ModelActionAddNewProductMyProducts(
            this.id,
			this.product_id,
			this.logo,
			this.logo_url,
			this.title,
			this.description,
			this.deliverable,
			this.deliverable_url,
			this.deliverable_name,
			this.trial_version,
			this.trial_version_url,
			this.trial_version_name,
			this.price,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.tags_list,
			this.tags_list_str,

  );
    factory ModelActionAddNewProductMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionAddNewProductMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAddNewProductMyProductsToJson(this);

}



class AddNewProductMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	AddNewProductMyProductsBase(this.json){
		model = AddNewProductMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataAddNewProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllAddNewProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postAddNewProductMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postAddNewProductMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataAddNewProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AddNewProduct')){
										my_products.deleteAllAddNewProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllAddNewProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postAddNewProductMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postAddNewProductMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'AddNewProduct';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
  "product[logo]": '$logo',
  "product[logo_lastval]": '$logo_last',
  "product[title]": "${model.model.title }",
  "product[description]": "${model.model.description }",
  "product[deliverable]": '$deliverable',
  "product[deliverable_lastval]": '$deliverable_last',
  "product[trial_version]": '$trial_version',
  "product[trial_version_lastval]": '$trial_version_last',
  "product[price]": "${model.model.price }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postAddNewProductResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postAddNewProductResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postAddNewProductResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postAddNewProductResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postAddNewProductResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postAddNewProductResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postAddNewProductResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postAddNewProductResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postAddNewProductResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
								Widget editLogo (State state) {
								if(model.model.logo_url== '' || model.model.logo == null ){
									model.model.logo = new Photo('','0','', '','', '');
									}
								  return(
							  //ImageWidget edit& FileWidget editexperiment validation non from validation.

								ImageWidget(
									value: model.model.logo,
									caption: 'Logo(IF_ANY)',
									hint: 'Isi dengan Image Anda',
									required: false,
									getValue: (var val) {
									
									  state.setState(() {
										model.model.logo = val;
										model.model.logo_url = val!.name;
									  });
									},
								));} 
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
										Widget editDeliverable (State state) {
								  return(
								FileWidget(
									value: model.model.deliverable,
									caption: 'Deliverable(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: true,
									getValue: (var val) {
									  state.setState(() {
										model.model.deliverable = val;
									  });
									},
								));} 
										Widget editTrialVersion (State state) {
								  return(
								FileWidget(
									value: model.model.trial_version,
									caption: 'Trial Version(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.trial_version = val;
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


 	

}


@JsonSerializable()
class AddNewProductMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAddNewProductMyProducts? model;
  AddNewProductMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory AddNewProductMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$AddNewProductMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewProductMyProductsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPublishProductMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
	  String? logo_url;
	  Photo?logo;
	  String? title;
	  String? description;
	   String? deliverable_url;
	   String? deliverable_name;
	  List<FileField?>? deliverable;
	   String? trial_version_url;
	   String? trial_version_name;
	  List<FileField?>? trial_version;
	  double? price;
	  String? price_str;
	  List<int?>? tags_id;
	  List<String?>?  tags_str;
	  List<String?>? tags_url;

	
	  ModelActionPublishProductMyProducts(
            this.id,
			this.product_id,
				this.logo,
				this.logo_url,
        this.title,
        this.description,
				this.deliverable,
				this.deliverable_url,
				this.deliverable_name,
				this.trial_version,
				this.trial_version_url,
				this.trial_version_name,
				this.price,
				this.price_str,
				this.tags_id,
				this.tags_str,
				this.tags_url,

  );
    factory ModelActionPublishProductMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionPublishProductMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPublishProductMyProductsToJson(this);

}



class PublishProductMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	PublishProductMyProductsBase(this.json){
		model = PublishProductMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPublishProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllPublishProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postPublishProductMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postPublishProductMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPublishProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PublishProduct')){
										my_products.deleteAllPublishProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllPublishProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postPublishProductMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postPublishProductMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'PublishProduct';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postPublishProductResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postPublishProductResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postPublishProductResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postPublishProductResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postPublishProductResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postPublishProductResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postPublishProductResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postPublishProductResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postPublishProductResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewLogo (BuildContext context) {  
								return(  ImageView(
									value: model.model.logo_url,
									caption: 'Logo',
								));} 
										Widget viewTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.title,
									caption: 'Title',
								));}
										Widget viewDescription (BuildContext context) {  
								return(  ArticleView(
									value: model.model.description,
									caption: 'Description',
								));}
										Widget viewDeliverable (BuildContext context) {  
									if(model.model.deliverable == null){
										  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}			
									if(model.model.deliverable_name != ''){
									  return(  FileView(
										value: model.model.deliverable_name,
										value1: model.model.deliverable_url,
										caption: 'Deliverable',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}
								} 
										Widget viewTrialVersion (BuildContext context) {  
									if(model.model.trial_version == null){
										  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}			
									if(model.model.trial_version_name != ''){
									  return(  FileView(
										value: model.model.trial_version_name,
										value1: model.model.trial_version_url,
										caption: 'Trial Version',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}
								} 
										Widget viewPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.price,
									caption: 'Price',
								));}
							Widget viewTags (BuildContext context) {  
							return( 	ChannelRouteTagsWidget(
										value: model.model.tags_id,
										caption: '',
										hint: ' ',
										required: false,
										idroutetags: model.model.tags_id,
										nameroutetags: model.model.tags_str,
										urlroutetags: model.model.tags_url,
										getValue: (String? val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));} 
 	

}


@JsonSerializable()
class PublishProductMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPublishProductMyProducts? model;
  PublishProductMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PublishProductMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$PublishProductMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PublishProductMyProductsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionEditProductMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
  String? logo_url;
  Photo?logo;
  String? title;
  String? description;
   String? deliverable_url;
  String? deliverable_name;
  List<FileField?>? deliverable;
   String? trial_version_url;
  String? trial_version_name;
  List<FileField?>? trial_version;
  double? price;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<int?>? tags_list;
  List<String?>? tags_list_str;


	
	  ModelActionEditProductMyProducts(
            this.id,
			this.product_id,
			this.logo,
			this.logo_url,
			this.title,
			this.description,
			this.deliverable,
			this.deliverable_url,
			this.deliverable_name,
			this.trial_version,
			this.trial_version_url,
			this.trial_version_name,
			this.price,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.tags_list,
			this.tags_list_str,

  );
    factory ModelActionEditProductMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionEditProductMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionEditProductMyProductsToJson(this);

}



class EditProductMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	EditProductMyProductsBase(this.json){
		model = EditProductMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataEditProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllEditProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postEditProductMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postEditProductMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataEditProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('EditProduct')){
										my_products.deleteAllEditProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllEditProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postEditProductMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postEditProductMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'EditProduct';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
  "product[logo]": '$logo',
  "product[logo_lastval]": '$logo_last',
  "product[title]": "${model.model.title }",
  "product[description]": "${model.model.description }",
  "product[deliverable]": '$deliverable',
  "product[deliverable_lastval]": '$deliverable_last',
  "product[trial_version]": '$trial_version',
  "product[trial_version_lastval]": '$trial_version_last',
  "product[price]": "${model.model.price }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postEditProductResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postEditProductResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postEditProductResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postEditProductResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postEditProductResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postEditProductResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postEditProductResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postEditProductResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postEditProductResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
								Widget editLogo (State state) {
								if(model.model.logo_url== '' || model.model.logo == null ){
									model.model.logo = new Photo('','0','', '','', '');
									}
								  return(
							  //ImageWidget edit& FileWidget editexperiment validation non from validation.

								ImageWidget(
									value: model.model.logo,
									caption: 'Logo(IF_ANY)',
									hint: 'Isi dengan Image Anda',
									required: false,
									getValue: (var val) {
									
									  state.setState(() {
										model.model.logo = val;
										model.model.logo_url = val!.name;
									  });
									},
								));} 
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
										Widget editDeliverable (State state) {
								  return(
								FileWidget(
									value: model.model.deliverable,
									caption: 'Deliverable(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: true,
									getValue: (var val) {
									  state.setState(() {
										model.model.deliverable = val;
									  });
									},
								));} 
										Widget editTrialVersion (State state) {
								  return(
								FileWidget(
									value: model.model.trial_version,
									caption: 'Trial Version(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.trial_version = val;
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


 	

}


@JsonSerializable()
class EditProductMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionEditProductMyProducts? model;
  EditProductMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory EditProductMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$EditProductMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProductMyProductsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionBumpUpMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
	  String? logo_url;
	  Photo?logo;
	  String? title;
	  String? description;
	   String? deliverable_url;
	   String? deliverable_name;
	  List<FileField?>? deliverable;
	   String? trial_version_url;
	   String? trial_version_name;
	  List<FileField?>? trial_version;
	  double? price;
	  String? price_str;
	  List<int?>? tags_id;
	  List<String?>?  tags_str;
	  List<String?>? tags_url;

	
	  ModelActionBumpUpMyProducts(
            this.id,
			this.product_id,
				this.logo,
				this.logo_url,
        this.title,
        this.description,
				this.deliverable,
				this.deliverable_url,
				this.deliverable_name,
				this.trial_version,
				this.trial_version_url,
				this.trial_version_name,
				this.price,
				this.price_str,
				this.tags_id,
				this.tags_str,
				this.tags_url,

  );
    factory ModelActionBumpUpMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionBumpUpMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionBumpUpMyProductsToJson(this);

}



class BumpUpMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	BumpUpMyProductsBase(this.json){
		model = BumpUpMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataBumpUp(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllBumpUpMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postBumpUpMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postBumpUpMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataBumpUp(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('BumpUp')){
										my_products.deleteAllBumpUpMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllBumpUpMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postBumpUpMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postBumpUpMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'BumpUp';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postBumpUpResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postBumpUpResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postBumpUpResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postBumpUpResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postBumpUpResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postBumpUpResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postBumpUpResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postBumpUpResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postBumpUpResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewLogo (BuildContext context) {  
								return(  ImageView(
									value: model.model.logo_url,
									caption: 'Logo',
								));} 
										Widget viewTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.title,
									caption: 'Title',
								));}
										Widget viewDescription (BuildContext context) {  
								return(  ArticleView(
									value: model.model.description,
									caption: 'Description',
								));}
										Widget viewDeliverable (BuildContext context) {  
									if(model.model.deliverable == null){
										  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}			
									if(model.model.deliverable_name != ''){
									  return(  FileView(
										value: model.model.deliverable_name,
										value1: model.model.deliverable_url,
										caption: 'Deliverable',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}
								} 
										Widget viewTrialVersion (BuildContext context) {  
									if(model.model.trial_version == null){
										  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}			
									if(model.model.trial_version_name != ''){
									  return(  FileView(
										value: model.model.trial_version_name,
										value1: model.model.trial_version_url,
										caption: 'Trial Version',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}
								} 
										Widget viewPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.price,
									caption: 'Price',
								));}
							Widget viewTags (BuildContext context) {  
							return( 	ChannelRouteTagsWidget(
										value: model.model.tags_id,
										caption: '',
										hint: ' ',
										required: false,
										idroutetags: model.model.tags_id,
										nameroutetags: model.model.tags_str,
										urlroutetags: model.model.tags_url,
										getValue: (String? val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));} 
 	

}


@JsonSerializable()
class BumpUpMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionBumpUpMyProducts? model;
  BumpUpMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory BumpUpMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$BumpUpMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BumpUpMyProductsSuperBaseToJson(this);
  
 
}


@JsonSerializable()

class ModelActionUnlistMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
	  String? logo_url;
	  Photo?logo;
	  String? title;
	  String? description;
	   String? deliverable_url;
	   String? deliverable_name;
	  List<FileField?>? deliverable;
	   String? trial_version_url;
	   String? trial_version_name;
	  List<FileField?>? trial_version;
	  double? price;
	  String? price_str;
	  List<int?>? tags_id;
	  List<String?>?  tags_str;
	  List<String?>? tags_url;

	
	  ModelActionUnlistMyProducts(
            this.id,
			this.product_id,
				this.logo,
				this.logo_url,
        this.title,
        this.description,
				this.deliverable,
				this.deliverable_url,
				this.deliverable_name,
				this.trial_version,
				this.trial_version_url,
				this.trial_version_name,
				this.price,
				this.price_str,
				this.tags_id,
				this.tags_str,
				this.tags_url,

  );
    factory ModelActionUnlistMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionUnlistMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionUnlistMyProductsToJson(this);

}



class UnlistMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	UnlistMyProductsBase(this.json){
		model = UnlistMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataUnlist(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllUnlistMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postUnlistMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postUnlistMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataUnlist(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Unlist')){
										my_products.deleteAllUnlistMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllUnlistMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postUnlistMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postUnlistMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'Unlist';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postUnlistResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postUnlistResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postUnlistResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postUnlistResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postUnlistResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postUnlistResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postUnlistResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postUnlistResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postUnlistResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewLogo (BuildContext context) {  
								return(  ImageView(
									value: model.model.logo_url,
									caption: 'Logo',
								));} 
										Widget viewTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.title,
									caption: 'Title',
								));}
										Widget viewDescription (BuildContext context) {  
								return(  ArticleView(
									value: model.model.description,
									caption: 'Description',
								));}
										Widget viewDeliverable (BuildContext context) {  
									if(model.model.deliverable == null){
										  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}			
									if(model.model.deliverable_name != ''){
									  return(  FileView(
										value: model.model.deliverable_name,
										value1: model.model.deliverable_url,
										caption: 'Deliverable',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}
								} 
										Widget viewTrialVersion (BuildContext context) {  
									if(model.model.trial_version == null){
										  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}			
									if(model.model.trial_version_name != ''){
									  return(  FileView(
										value: model.model.trial_version_name,
										value1: model.model.trial_version_url,
										caption: 'Trial Version',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}
								} 
										Widget viewPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.price,
									caption: 'Price',
								));}
							Widget viewTags (BuildContext context) {  
							return( 	ChannelRouteTagsWidget(
										value: model.model.tags_id,
										caption: '',
										hint: ' ',
										required: false,
										idroutetags: model.model.tags_id,
										nameroutetags: model.model.tags_str,
										urlroutetags: model.model.tags_url,
										getValue: (String? val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));} 
 	

}


@JsonSerializable()
class UnlistMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionUnlistMyProducts? model;
  UnlistMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory UnlistMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$UnlistMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$UnlistMyProductsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionReactivateProductMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? product_id;
	  String? logo_url;
	  Photo?logo;
	  String? title;
	  String? description;
	   String? deliverable_url;
	   String? deliverable_name;
	  List<FileField?>? deliverable;
	   String? trial_version_url;
	   String? trial_version_name;
	  List<FileField?>? trial_version;
	  double? price;
	  String? price_str;
	  List<int?>? tags_id;
	  List<String?>?  tags_str;
	  List<String?>? tags_url;

	
	  ModelActionReactivateProductMyProducts(
            this.id,
			this.product_id,
				this.logo,
				this.logo_url,
        this.title,
        this.description,
				this.deliverable,
				this.deliverable_url,
				this.deliverable_name,
				this.trial_version,
				this.trial_version_url,
				this.trial_version_name,
				this.price,
				this.price_str,
				this.tags_id,
				this.tags_str,
				this.tags_url,

  );
    factory ModelActionReactivateProductMyProducts.fromJson(Map<String, dynamic> json) => _$ModelActionReactivateProductMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionReactivateProductMyProductsToJson(this);

}



class ReactivateProductMyProductsBase{
	var model;
	Map<String, dynamic> json;
            var logolast ;
            var deliverablelast ;   
            var trial_versionlast ;   
	ReactivateProductMyProductsBase(this.json){
		model = ReactivateProductMyProductsSuperBase.fromJson(this.json);
     if (model.model.logo!= null) {
            logolast = Photo(model.model.logo.name, model.model.logo.status, model.model.logo.dir, model.model.logo.file, model.model.logo.thumb, model.model.logo.temp);
     }
       if (model.model.deliverable!= null) {
            deliverablelast  = FileField(model.model.deliverable[0].status, model.model.deliverable[0].name, model.model.deliverable[0].size, model.model.deliverable[0].created, 
            model.model.deliverable[0].modified, model.model.deliverable[0].temp, model.model.deliverable[0].remote, model.model.deliverable[0].dir, model.model.deliverable[0].date ) ;
       }
       if (model.model.trial_version!= null) {
            trial_versionlast  = FileField(model.model.trial_version[0].status, model.model.trial_version[0].name, model.model.trial_version[0].size, model.model.trial_version[0].created, 
            model.model.trial_version[0].modified, model.model.trial_version[0].temp, model.model.trial_version[0].remote, model.model.trial_version[0].dir, model.model.trial_version[0].date ) ;
       }
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataReactivateProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllReactivateProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postReactivateProductMyProductsWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = my_products.postReactivateProductMyProducts();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error)async{
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
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataReactivateProduct(button!.text!, model
											, logolast 
											,  deliverablelast   
											,  trial_versionlast   
                     					  );
                                  my_products = new  MyProductsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ReactivateProduct')){
										my_products.deleteAllReactivateProductMyProducts(this.model.model.user_id);
										}else{
										my_products.deleteAllReactivateProductMyProducts('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_products.postReactivateProductMyProductsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_products.postReactivateProductMyProducts();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyProductsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProductsListing(id :  id!)),
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
  
   String? action =   'ReactivateProduct';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? logo = '';
  String? logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
	String? deliverable = '';
  String? deliverable_last = '';
   if(isEdit && deliverablelast != null){
         deliverable_last = '[{"name":"${ deliverablelast.name}","size":${ deliverablelast.size.toString()},"created":${ deliverablelast.created.toString()},"modified":${ deliverablelast.modified.toString()},"temp":"${ deliverablelast.temp}","remote":"","dir":"${ deliverablelast.dir}"}]';

       }
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
	     
  	}
	}
	String? trial_version = '';
  String? trial_version_last = '';
   if(isEdit && trial_versionlast != null){
         trial_version_last = '[{"name":"${ trial_versionlast.name}","size":${ trial_versionlast.size.toString()},"created":${ trial_versionlast.created.toString()},"modified":${ trial_versionlast.modified.toString()},"temp":"${ trial_versionlast.temp}","remote":"","dir":"${ trial_versionlast.dir}"}]';

       }
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
	     
  	}
	}
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "product[_trigger_]":"$tgr",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"product[tags][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,

 var postReactivateProductResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postReactivateProductResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postReactivateProductResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postReactivateProductResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postReactivateProductResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postReactivateProductResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_products, postReactivateProductResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postReactivateProductResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_products, postReactivateProductResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewLogo (BuildContext context) {  
								return(  ImageView(
									value: model.model.logo_url,
									caption: 'Logo',
								));} 
										Widget viewTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.title,
									caption: 'Title',
								));}
										Widget viewDescription (BuildContext context) {  
								return(  ArticleView(
									value: model.model.description,
									caption: 'Description',
								));}
										Widget viewDeliverable (BuildContext context) {  
									if(model.model.deliverable == null){
										  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}			
									if(model.model.deliverable_name != ''){
									  return(  FileView(
										value: model.model.deliverable_name,
										value1: model.model.deliverable_url,
										caption: 'Deliverable',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Deliverable',
									));
									}
								} 
										Widget viewTrialVersion (BuildContext context) {  
									if(model.model.trial_version == null){
										  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}			
									if(model.model.trial_version_name != ''){
									  return(  FileView(
										value: model.model.trial_version_name,
										value1: model.model.trial_version_url,
										caption: 'Trial Version',
									));
									}else{
									  return(  StringView(
										value: '',
										caption: 'Trial Version',
									));
									}
								} 
										Widget viewPrice (BuildContext context) {  
								return(  MoneyView(
									value: model.model.price,
									caption: 'Price',
								));}
							Widget viewTags (BuildContext context) {  
							return( 	ChannelRouteTagsWidget(
										value: model.model.tags_id,
										caption: '',
										hint: ' ',
										required: false,
										idroutetags: model.model.tags_id,
										nameroutetags: model.model.tags_str,
										urlroutetags: model.model.tags_url,
										getValue: (String? val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));} 
 	

}


@JsonSerializable()
class ReactivateProductMyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionReactivateProductMyProducts? model;
  ReactivateProductMyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory ReactivateProductMyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$ReactivateProductMyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ReactivateProductMyProductsSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? product_id;
  int? seller_id;
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
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
  String? deliverable_name;
  List<FileField?>? deliverable;
  String? trial_version_name;
  List<FileField?>? trial_version;
  double? price;
  String? price_str;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<int?>? tags_list;
  List<String?>? tags_list_str;

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

	
	  ModelMyProducts(
            this.id,
            this.product_id,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.deliverable,
			this.deliverable_name,
			this.trial_version,
			this.trial_version_name,
			this.price,
			this.price_str,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.tags_list,
			this.tags_list_str,
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

  );
    factory ModelMyProducts.fromJson(Map<String, dynamic> json) => _$ModelMyProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyProductsToJson(this);

}




class MyProductsBase{
	var model;
	Map<String, dynamic> json;
	MyProductsBase(this.json){
		model = MyProductsSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? logo = '';
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"} ';
		 }
	 }
	String? deliverable = '';
	if (model.model.deliverable!= null) {
		if (model.model.deliverable[0].temp != '') {
			deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
		}
	}
	String? trial_version = '';
	if (model.model.trial_version!= null) {
		if (model.model.trial_version[0].temp != '') {
			trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
		}
	}
   
   
      var formData = {
      "my_products[_trigger_]":"",
   "my_products[product_id]": "${model.model.product_id }",
  "my_products[seller_id]": "${model.model.seller_id }",
  "my_products[logo]": '$logo',
  "my_products[logo_lastval]": '{"name":"${model.model.logo.name}","dir":"${model.model.logo.dir}","file":"${model.model.logo.file}","thumb":"${model.model.logo.thumb}"}',
  "my_products[category_id]": "${model.model.category_id }",
  "my_products[title]": "${model.model.title }",
  "my_products[description]": "${model.model.description }",
  "my_products[short_description]": "${model.model.short_description }",
  "my_products[deliverable]": '$deliverable',
  "my_products[deliverable_lastval]": '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size.toString()},"created":${model.model.deliverable[0].date.toString()},"modified":${model.model.deliverable[0].date.toString()},"temp":"${model.model.deliverable[0].temp}","remote":"","dir":"temp"}]',
  "my_products[trial_version]": '$trial_version',
  "my_products[trial_version_lastval]": '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size.toString()},"created":${model.model.trial_version[0].date.toString()},"modified":${model.model.trial_version[0].date.toString()},"temp":"${model.model.trial_version[0].temp}","remote":"","dir":"temp"}]',
  "my_products[price]": "${model.model.price}",
   "my_products[status_id]": "${model.model.status_id}",
  "my_products[registered_by_id]": "${model.model.registered_by_id }",
  "my_products[registered_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}",
  "my_products[registered_from_ip]": "${model.model.registered_from_ip }",
  "my_products[verified_by_id]": "${model.model.verified_by_id }",
  "my_products[verified_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.verified_date)}",
  "my_products[verified_from_ip]": "${model.model.verified_from_ip }",
   "my_products[verifier_note]": "${model.model.verifier_note }",
  "my_products[approved_by_id]": "${model.model.approved_by_id }",
  "my_products[approved_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.approved_date)}",
  "my_products[approved_from_ip]": "${model.model.approved_from_ip }",
   "my_products[approver_note]": "${model.model.approver_note }",
  "my_products[published_by_id]": "${model.model.published_by_id }",
  "my_products[published_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}",
  "my_products[published_from_ip]": "${model.model.published_from_ip }",
  "my_products[rejected_by_id]": "${model.model.rejected_by_id }",
  "my_products[rejected_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}",
  "my_products[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "my_products[admin_note]": "${model.model.admin_note }",
  "my_products[last_bump]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}",
  "my_products[sales_count]": "${model.model.sales_count }",
  "my_products[sales_amount]": "${model.model.sales_amount}",
  "my_products[rating]": "${model.model.rating }",
  "my_products[points]": "${model.model.points }",
  "my_products[ranking]": "${model.model.ranking }",
  "my_products[rating_num]": "${model.model.rating_num}",
  "my_products[rating_sum]": "${model.model.rating_sum }",
  "my_products[rating_div]": "${model.model.rating_div }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"my_products[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
  var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyProductsWidget(model.buttons[i], context,formKey, controller,my_products, postMyProductsResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
  var postMyProductsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_products, postMyProductsResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
 var postMyProductsResult, State state, String? sendPath, String? id,  String? title){
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
                        my_products = new  MyProductsController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_products.postMyProducts();
                        future.then((value) {
                        state.setState(() {
                        postMyProductsResult = value;
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

	  	    Widget editDeliverable (State state) {
	 if(model.model.deliverable== null){
		FileField? file = new FileField('', '',0,0,0, '', '', '','' );
		model.model.deliverable = [file];
		}
      return(
	FileWidget(
		value: model.model.deliverable[0],
		caption: 'Deliverable',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.deliverable[0] = val;
		  });
		},
	));} 

	  	    Widget editTrialVersion (State state) {
	 if(model.model.trial_version== null){
		FileField? file = new FileField('', '',0,0,0, '', '', '','' );
		model.model.trial_version = [file];
		}
      return(
	FileWidget(
		value: model.model.trial_version[0],
		caption: 'Trial Version',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.trial_version[0] = val;
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
	
}


@JsonSerializable()

class MyProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyProducts? model;
  MyProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyProductsSuperBase.fromJson(Map<String, dynamic> json) => _$MyProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyProductsSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyProducts {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? logo_url;
  Photo?logo;
  String? title;
  String? description;
  String? short_description;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<FileField?>? deliverable;  
  String? deliverable_url;
  String? deliverable_name;
  List<FileField?>? trial_version;  
  String? trial_version_url;
  String? trial_version_name;
  DateTime? registered_date;
  DateTime? published_date;
  DateTime? last_bump;
  double? price;
  String? price_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? sales_count;
  String? sales_count_str;
  double? sales_amount;
  String? sales_amount_str;
  int? rating;
  int? points;
  String? points_str;
  int? ranking;
  String? ranking_str;
  String? admin_note;

	//
	  ViewModelMyProducts(
            this.id,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.title,
			this.description,
			this.short_description,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.deliverable,
			this.deliverable_url,	
            this.deliverable_name,				
			this.trial_version,
			this.trial_version_url,	
            this.trial_version_name,				
			this.registered_date,
			this.published_date,
			this.last_bump,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.sales_count,
			this.sales_count_str,
			this.sales_amount,
			this.sales_amount_str,
			this.rating,
			this.points,
			this.points_str,
			this.ranking,
			this.ranking_str,
			this.admin_note,

  );

  
   factory ViewModelMyProducts.fromJson(Map<String, dynamic> json) => _$ViewModelMyProductsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyProductsToJson(this); 
  
}


class MyProductsViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyProductsViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewMyProductsWidget(model.buttons[i],context,  formKey, controller, my_products,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProductsController my_products,
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
                        
                        my_products = new  MyProductsController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_products.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postMyProductsResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyProductsController my_products,
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
				children:listButton(context, visible!, formKey, controller, my_products,
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

	Widget view (BuildContext context, ScrollController controller, bool?account, bool _isBannerAdReady,  _bannerAd) {


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
	   viewChildren!.add(viewLogo(context)); 
	   viewChildren!.add(viewTitle(context)); 
	   viewChildren!.add(viewDescription(context)); 
	   viewChildren!.add(viewShortDescription(context)); 
	   viewChildren!.add(viewTags(context)); 
	   viewChildren!.add(viewDeliverable(context)); 
	   viewChildren!.add(viewTrialVersion(context)); 
	   viewChildren!.add(viewRegisteredDate(context)); 
	   viewChildren!.add(viewPublishedDate(context)); 
	   viewChildren!.add(viewLastBump(context)); 
	   viewChildren!.add(viewPrice(context)); 
	   viewChildren!.add(viewStatus(context)); 
	   viewChildren!.add(viewSalesCount(context)); 
	   viewChildren!.add(viewSalesAmount(context)); 
	   viewChildren!.add(viewRating(context)); 
	   viewChildren!.add(viewPoints(context)); 
	   viewChildren!.add(viewRanking(context)); 
	   viewChildren!.add(viewAdminNote(context)); 
	  
	  viewChildren!.add(
	  
				  Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
					  if (_isBannerAdReady)
						const SizedBox(
						  height: 10,
						),
					  if (_isBannerAdReady)
						Center(
						  child: Container(
							width: _bannerAd.size.width.toDouble(),
							height: _bannerAd.size.height.toDouble(),
							child: AdWidget(ad: _bannerAd),
						  ),
						),


					  if (_isBannerAdReady)
						const SizedBox(
						  height: 10,
						),
						const SizedBox(
						  height: 10,
						),
					],
				  )
				 ); 

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
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: model.model.logo_url,
		caption: 'Logo',
	));} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: model.model.title,
		caption: 'Title',
	));}
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
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.short_description,
		caption: 'Short Description',
	));}
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
		    Widget viewDeliverable (BuildContext context) {  
			if(model.model.deliverable == null){
				  return(  StringView(
				value: '',
				caption: 'Deliverable',
			));
			}			
			if(model.model.deliverable_name != ''){
			  return(  FileView(
				value: model.model.deliverable_name,
				value1: model.model.deliverable_url,
				caption: 'Deliverable',
			));
			}else{
			  return(  StringView(
				value: '',
				caption: 'Deliverable',
			));
			}
			
    } 
		    Widget viewTrialVersion (BuildContext context) {  
			if(model.model.trial_version == null){
				  return(  StringView(
				value: '',
				caption: 'Trial Version',
			));
			}			
			if(model.model.trial_version_name != ''){
			  return(  FileView(
				value: model.model.trial_version_name,
				value1: model.model.trial_version_url,
				caption: 'Trial Version',
			));
			}else{
			  return(  StringView(
				value: '',
				caption: 'Trial Version',
			));
			}
			
    } 
		    Widget viewRegisteredDate (BuildContext context) {  
	if(model.model.registered_date != null){
	return(  DateTimeView(
		value: model.model.registered_date,
		caption: 'Registered Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Registered Date',
		    ));
	}			 
	 } 
		    Widget viewPublishedDate (BuildContext context) {  
	if(model.model.published_date != null){
	return(  DateTimeView(
		value: model.model.published_date,
		caption: 'Published Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Published Date',
		    ));
	}			 
	 } 
		    Widget viewLastBump (BuildContext context) {  
	if(model.model.last_bump != null){
	return(  DateTimeView(
		value: model.model.last_bump,
		caption: 'Last Bump',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Last Bump',
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
		    Widget viewSalesAmount (BuildContext context) {  			
    if(model.model.sales_amount != null){
		return(  MoneyView(
		value: model.model.sales_amount,
		caption: 'Sales Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Sales Amount',
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
		    Widget viewPoints (BuildContext context) { 
    if(model.model.points != null){
		return(  NumberView(
		value: model.model.points,
		caption: 'Points',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Points',
		));
	}		
     }
		    Widget viewRanking (BuildContext context) { 
    if(model.model.ranking != null){
		return(  NumberView(
		value: model.model.ranking,
		caption: 'Ranking',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Ranking',
		));
	}		
     }
		    Widget viewAdminNote (BuildContext context) {  
	if(model.model.admin_note != null){
		return(  ArticleView(
		value: model.model.admin_note,
		caption: 'Admin Note',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Admin Note',
		    ));
	}		
     }
  
}


@JsonSerializable()
class MyProductsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyProducts? model;
  MyProductsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory MyProductsViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyProductsViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyProductsViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyProductsListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyProductsListingBase(this.json){
		items = MyProductsListingItems.fromJson(this.json);
		tools = MyProductsListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyProductsModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyProductsModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyProductsModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyProductsModel item,ItemMyProductsModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyProductsModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyProductsWidget(tools.buttons[i],context, account));
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





class MyProductsListingItems{
  List<ItemMyProductsModel?>? items;
  MyProductsListingItems(
      this.items,
      );

  factory MyProductsListingItems.fromJson(Map<String, dynamic> json) {
  	return MyProductsListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyProductsModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyProductsListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyProducts?>? items;
	MyProductsListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyProductsListingTools.fromJson(Map<String, dynamic> json) => _$MyProductsListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyProductsListingToolsToJson(this);

}




class ItemMyProductsCard extends StatelessWidget {
  const ItemMyProductsCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyProductsModel? destination;
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
                child: ItemMyProductsContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyProductsContent extends StatelessWidget {
  const ItemMyProductsContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyProductsModel? destination;

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
		  buttonChildren!.add(itemMyProductsButton(destination,i , context));
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
	   children!.add(destination!.viewLogo(context)); 
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewShortDescription(context)); 
	   children!.add(destination!.viewTags(context)); 
	   children!.add(destination!.viewPrice(context)); 
	   children!.add(destination!.viewPublishedDate(context)); 
	   children!.add(destination!.viewLastBump(context)); 
	   children!.add(destination!.viewStatus(context)); 
	   children!.add(destination!.viewAdminNote(context)); 
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

Widget itemMyProductsButton(ItemMyProductsModel? destination, int? index, BuildContext context){
  MyProductsController my_products; 
  
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
                        
                        my_products = new  MyProductsController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_products.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyProductsResult = value;
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



class ItemMyProductsWidget extends StatelessWidget {

	final ItemMyProductsModel?  item;
	final String? search;
	const  ItemMyProductsWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyProductsWidget(Button button, BuildContext context, bool?account){
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






  






  

