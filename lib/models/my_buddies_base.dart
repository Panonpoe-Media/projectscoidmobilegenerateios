

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
import 'my_buddies_item.dart';
import 'my_buddies_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyBuddies/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'my_buddies_base.g.dart';



@JsonSerializable()

class ModelActionRemoveMyBuddies {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? buddy_id;
  int? user_id;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? fav_id;
  String? fav_str;
  List<int?>? fav_list;
  List<String?>? fav_list_str;

	
	  ModelActionRemoveMyBuddies(
            this.id,
			this.buddy_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.fav_id,
			this.fav_str,
			this.fav_list,
			this.fav_list_str,

  );
    factory ModelActionRemoveMyBuddies.fromJson(Map<String, dynamic> json) => _$ModelActionRemoveMyBuddiesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRemoveMyBuddiesToJson(this);

}



class RemoveMyBuddiesBase{
	var model;
	Map<String, dynamic> json;
	RemoveMyBuddiesBase(this.json){
		model = RemoveMyBuddiesSuperBase.fromJson(this.json);
	}


Widget RButtonActionMyBuddiesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,

 var postMyBuddiesResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataRemove(button!.text!, model
                     					  );
                                  my_buddies = new MyBuddiesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.project_title);
										}else if(['AskOwner'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.user_id);
										}else{
										my_buddies.deleteAllRemoveMyBuddies('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_buddies.postRemoveMyBuddiesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBuddiesResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBuddiesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = my_buddies.postRemoveMyBuddies();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBuddiesResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBuddiesListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyBuddiesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,
 var postMyBuddiesResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataRemove(button!.text!, model
                     					  );
                                  my_buddies = new  MyBuddiesController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.project_title);
										}else if(['AskOwner'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Remove')){
										my_buddies.deleteAllRemoveMyBuddies(this.model.model.user_id);
										}else{
										my_buddies.deleteAllRemoveMyBuddies('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_buddies.postRemoveMyBuddiesWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBuddiesResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBuddiesListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_buddies.postRemoveMyBuddies();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyBuddiesResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyBuddiesListing(id :  id!)),
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
  
   String? action =   'Remove';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "buddy[_trigger_]":"$tgr",
  "buddy[user_id]": "${model.model.user_id_id }",
  "buddy[fav_id]": "${model.model.fav_id_id }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,

 var postRemoveResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyBuddiesWidget(model.buttons[i], context,formKey, controller,my_buddies, postRemoveResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postRemoveResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyBuddiesWidget(model.buttons[i], context,formKey, controller,my_buddies, postRemoveResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postRemoveResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postRemoveResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_buddies, postRemoveResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postRemoveResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_buddies, postRemoveResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editUser (State state) {
								  return(
								  ModelWidget(
								  value: model.model.user_id,
								  caption: 'User',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.user_list,
								  nameenum: model.model.user_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.user_id = val;
									});
								  },
								));}
										Widget editFav (State state) {
								  return(
								  ModelWidget(
								  value: model.model.fav_id,
								  caption: 'Fav',
								  hint: 'pilih Model',
								  required: false,
								  idenum: model.model.fav_list,
								  nameenum: model.model.fav_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.fav_id = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class RemoveMyBuddiesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRemoveMyBuddies? model;
  RemoveMyBuddiesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory RemoveMyBuddiesSuperBase.fromJson(Map<String, dynamic> json) => _$RemoveMyBuddiesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveMyBuddiesSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyBuddies {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? buddy_id;
  int? user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? fav_id;
  String? fav_url;
  String? fav_str;
  List<int?>? fav_list;
  List<String?>? fav_list_str;

	
	  ModelMyBuddies(
            this.id,
            this.buddy_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.fav_id,
			this.fav_str,
			this.fav_list,
			this.fav_list_str,

  );
    factory ModelMyBuddies.fromJson(Map<String, dynamic> json) => _$ModelMyBuddiesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyBuddiesToJson(this);

}




class MyBuddiesBase{
	var model;
	Map<String, dynamic> json;
	MyBuddiesBase(this.json){
		model = MyBuddiesSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
   
   
      var formData = {
      "my_buddies[_trigger_]":"",
   "my_buddies[buddy_id]": "${model.model.buddy_id }",
  "my_buddies[user_id]": "${model.model.user_id }",
  "my_buddies[fav_id]": "${model.model.fav_id }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postMyBuddiesResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyBuddiesWidget(model.buttons[i], context,formKey, controller,my_buddies, postMyBuddiesResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
  var postMyBuddiesResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_buddies, postMyBuddiesResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyBuddiesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,
 var postMyBuddiesResult, State state, String? sendPath, String? id,  String? title){
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
                        my_buddies = new  MyBuddiesController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_buddies.postMyBuddies();
                        future.then((value) {
                        state.setState(() {
                        postMyBuddiesResult = value;
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
	  required: false,
	  idenum: model.model.user_id_list,
	  nameenum: model.model.user_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.user_id = val;
		});
	  },
	));*/
	}

	  	    Widget editFav (State state) {
	   return(  StringView(
		value: model.model.fav_str,
		caption: 'Fav',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.fav_id,
	  caption: 'Fav',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.fav_id_list,
	  nameenum: model.model.fav_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.fav_id = val;
		});
	  },
	));*/
	}
	
}


@JsonSerializable()

class MyBuddiesSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyBuddies? model;
  MyBuddiesSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyBuddiesSuperBase.fromJson(Map<String, dynamic> json) => _$MyBuddiesSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyBuddiesSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyBuddies {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? fav_photo_url;
  Photo?fav_photo; 
  String? fav_user_name;
  String? fav_display_name;
  int? fav_country_id;
  String? fav_country_str;
  int? fav_provinsi_id;
  String? fav_provinsi_str;
  int? fav_kabupaten_id;
  String? fav_kabupaten_str;
  String? fav_website;
  String? fav_self_introduction;
  int?  fav_worker_ranking;
  String? fav_worker_ranking_str;
  int?  fav_worker_point;
  String? fav_worker_point_str;
  int?  fav_worker_rating;
  int?  fav_owner_ranking;
  String? fav_owner_ranking_str;
  int?  fav_owner_point;
  String? fav_owner_point_str;
  int?  fav_owner_rating;
  int?  fav_seller_ranking;
  String? fav_seller_ranking_str;
  int?  fav_seller_point;
  String? fav_seller_point_str;
  int?  fav_seller_rating;
  int?  fav_projects_won;
  String? fav_projects_won_str;
  double?  fav_projects_won_cumulative;
  String? fav_projects_won_cumulative_str;
  int?  fav_projects_owned;
  String? fav_projects_owned_str;
  double?  fav_projects_owned_cumulative;
  String? fav_projects_owned_cumulative_str;
  int?  fav_projects_noaction;
  String? fav_projects_noaction_str;
  int?  fav_projects_canceled;
  String? fav_projects_canceled_str;
  int?  fav_missed_payment;
  String? fav_missed_payment_str;
  int?  fav_projects_completed;
  String? fav_projects_completed_str;
  int?  fav_projects_arbitrated;
  String? fav_projects_arbitrated_str;
  int?  fav_projects_won_in_arbitration;
  String? fav_projects_won_in_arbitration_str;
  int?  fav_projects_lost_in_arbitration;
  String? fav_projects_lost_in_arbitration_str;
  int?  fav_current_projects;
  String? fav_current_projects_str;
  int?  fav_missed_weekly_report;
  String? fav_missed_weekly_report_str;
  int?  fav_product_sold;
  String? fav_product_sold_str;
  double?  fav_product_sold_cumulative;
  String? fav_product_sold_cumulative_str;
  int?  fav_product_bought;
  String? fav_product_bought_str;
  double?  fav_product_bought_cumulative;
  String? fav_product_bought_cumulative_str;

	//
	  ViewModelMyBuddies(
            this.id,
			this.fav_photo_url,
			this.fav_photo,
			this.fav_country_id,
			this.fav_country_str,
			this.fav_provinsi_id,
			this.fav_provinsi_str,
			this.fav_kabupaten_id,
			this.fav_kabupaten_str,
			this.fav_worker_ranking,
			this.fav_worker_ranking_str,
			this.fav_worker_point,
			this.fav_worker_point_str,
			this.fav_owner_ranking,
			this.fav_owner_ranking_str,
			this.fav_owner_point,
			this.fav_owner_point_str,
			this.fav_seller_ranking,
			this.fav_seller_ranking_str,
			this.fav_seller_point,
			this.fav_seller_point_str,
			this.fav_projects_won,
			this.fav_projects_won_str,
			this.fav_projects_won_cumulative,
			this.fav_projects_won_cumulative_str,
			this.fav_projects_owned,
			this.fav_projects_owned_str,
			this.fav_projects_owned_cumulative,
			this.fav_projects_owned_cumulative_str,
			this.fav_projects_noaction,
			this.fav_projects_noaction_str,
			this.fav_projects_canceled,
			this.fav_projects_canceled_str,
			this.fav_missed_payment,
			this.fav_missed_payment_str,
			this.fav_projects_completed,
			this.fav_projects_completed_str,
			this.fav_projects_arbitrated,
			this.fav_projects_arbitrated_str,
			this.fav_projects_won_in_arbitration,
			this.fav_projects_won_in_arbitration_str,
			this.fav_projects_lost_in_arbitration,
			this.fav_projects_lost_in_arbitration_str,
			this.fav_current_projects,
			this.fav_current_projects_str,
			this.fav_missed_weekly_report,
			this.fav_missed_weekly_report_str,
			this.fav_product_sold,
			this.fav_product_sold_str,
			this.fav_product_sold_cumulative,
			this.fav_product_sold_cumulative_str,
			this.fav_product_bought,
			this.fav_product_bought_str,
			this.fav_product_bought_cumulative,
			this.fav_product_bought_cumulative_str,

  );

  
   factory ViewModelMyBuddies.fromJson(Map<String, dynamic> json) => _$ViewModelMyBuddiesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyBuddiesToJson(this); 
  
}


class MyBuddiesViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyBuddiesViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewMyBuddiesWidget(model.buttons[i],context,  formKey, controller, my_buddies,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyBuddiesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyBuddiesController my_buddies,
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
                        
                        my_buddies = new  MyBuddiesController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_buddies.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postMyBuddiesResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBuddiesController my_buddies,
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
				children:listButton(context, visible!, formKey, controller, my_buddies,
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

	 	  
	   viewChildren!.add(viewPhoto(context));
	   viewChildren!.add(viewUserName(context));
	   viewChildren!.add(viewDisplayName(context));
	   viewChildren!.add(viewCountry(context));
	   viewChildren!.add(viewProvinsi(context));
	   viewChildren!.add(viewKabupaten(context));
	   viewChildren!.add(viewWebsite(context));
	   viewChildren!.add(viewSelfIntroduction(context));
	   viewChildren!.add(viewWorkerRanking(context));
	   viewChildren!.add(viewWorkerPoint(context));
	   viewChildren!.add(viewWorkerRating(context));
	   viewChildren!.add(viewOwnerRanking(context));
	   viewChildren!.add(viewOwnerPoint(context));
	   viewChildren!.add(viewOwnerRating(context));
	   viewChildren!.add(viewSellerRanking(context));
	   viewChildren!.add(viewSellerPoint(context));
	   viewChildren!.add(viewSellerRating(context));
	   viewChildren!.add(viewProjectsWon(context));
	   viewChildren!.add(viewProjectsWonCumulative(context));
	   viewChildren!.add(viewProjectsOwned(context));
	   viewChildren!.add(viewProjectsOwnedCumulative(context));
	   viewChildren!.add(viewProjectsNoAction(context));
	   viewChildren!.add(viewProjectsCanceled(context));
	   viewChildren!.add(viewMissedPayment(context));
	   viewChildren!.add(viewProjectsCompleted(context));
	   viewChildren!.add(viewProjectsArbitrated(context));
	   viewChildren!.add(viewProjectsWonInArbitration(context));
	   viewChildren!.add(viewProjectsLostInArbitration(context));
	   viewChildren!.add(viewCurrentProjects(context));
	   viewChildren!.add(viewMissedWeeklyReport(context));
	   viewChildren!.add(viewProductSold(context));
	   viewChildren!.add(viewProductSoldCumulative(context));
	   viewChildren!.add(viewProductBought(context));
	   viewChildren!.add(viewProductBoughtCumulative(context));

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

 
	  Widget viewPhoto (BuildContext context) {  
		return(  ImageView(
			value: model.model.fav_photo_url,
			caption: 'Photo',
		));} 
		Widget viewUserName (BuildContext context) {  
	    return(  StringView(
			value: model.model.fav_user_name,
			caption: 'User Name',
		));}
		Widget viewDisplayName (BuildContext context) {  
	    return(  StringView(
			value: model.model.fav_display_name,
			caption: 'Display Name',
		));}
	  Widget viewCountry (BuildContext context) {  
	  return(  StringView(
			value: model.model.fav_country_str,
			caption: 'Country',
		));}
	  Widget viewProvinsi (BuildContext context) {  
	  return(  StringView(
			value: model.model.fav_provinsi_str,
			caption: 'Provinsi',
		));}
	  Widget viewKabupaten (BuildContext context) {  
	  return(  StringView(
			value: model.model.fav_kabupaten_str,
			caption: 'Kabupaten',
		));}
		Widget viewWebsite (BuildContext context) {  
	    return(  StringView(
			value: model.model.fav_website,
			caption: 'Website',
		));}
		Widget viewSelfIntroduction (BuildContext context) {  
	    return(  StringView(
			value: model.model.fav_self_introduction,
			caption: 'Self Introduction',
		));}
	  Widget viewWorkerRanking (BuildContext context) {  
	   if(model.model.fav_worker_ranking != null){
	   	  return(  StringView(
			value: model.model.fav_worker_ranking.toString(),
			caption: 'Worker Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_worker_ranking_str,
			caption: 'Worker Ranking',
		));
	   }
        }
	  Widget viewWorkerPoint (BuildContext context) {  
	   if(model.model.fav_worker_point != null){
	   	  return(  StringView(
			value: model.model.fav_worker_point.toString(),
			caption: 'Worker Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_worker_point_str,
			caption: 'Worker Point',
		));
	   }
        }
	   Widget viewWorkerRating (BuildContext context) {
	   if(model.model.fav_worker_rating != null){
	   		return(  RatingView(
			value: model.model.fav_worker_rating,
			caption: 'Worker Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Worker Rating',
		 ));
	   }
        }
	  Widget viewOwnerRanking (BuildContext context) {  
	   if(model.model.fav_owner_ranking != null){
	   	  return(  StringView(
			value: model.model.fav_owner_ranking.toString(),
			caption: 'Owner Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_owner_ranking_str,
			caption: 'Owner Ranking',
		));
	   }
        }
	  Widget viewOwnerPoint (BuildContext context) {  
	   if(model.model.fav_owner_point != null){
	   	  return(  StringView(
			value: model.model.fav_owner_point.toString(),
			caption: 'Owner Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_owner_point_str,
			caption: 'Owner Point',
		));
	   }
        }
	   Widget viewOwnerRating (BuildContext context) {
	   if(model.model.fav_owner_rating != null){
	   		return(  RatingView(
			value: model.model.fav_owner_rating,
			caption: 'Owner Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Owner Rating',
		 ));
	   }
        }
	  Widget viewSellerRanking (BuildContext context) {  
	   if(model.model.fav_seller_ranking != null){
	   	  return(  StringView(
			value: model.model.fav_seller_ranking.toString(),
			caption: 'Seller Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_seller_ranking_str,
			caption: 'Seller Ranking',
		));
	   }
        }
	  Widget viewSellerPoint (BuildContext context) {  
	   if(model.model.fav_seller_point != null){
	   	  return(  StringView(
			value: model.model.fav_seller_point.toString(),
			caption: 'Seller Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_seller_point_str,
			caption: 'Seller Point',
		));
	   }
        }
	   Widget viewSellerRating (BuildContext context) {
	   if(model.model.fav_seller_rating != null){
	   		return(  RatingView(
			value: model.model.fav_seller_rating,
			caption: 'Seller Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Seller Rating',
		 ));
	   }
        }
	  Widget viewProjectsWon (BuildContext context) {  
	   if(model.model.fav_projects_won != null){
	   	  return(  StringView(
			value: model.model.fav_projects_won.toString(),
			caption: 'Projects Won',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_won_str,
			caption: 'Projects Won',
		));
	   }
        }
	  Widget viewProjectsWonCumulative (BuildContext context) {  
	   if(model.model.fav_projects_won_cumulative != null){
	   	  return(  StringView(
			value: model.model.fav_projects_won_cumulative.toString(),
			caption: 'Projects Won Cumulative',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_won_cumulative_str,
			caption: 'Projects Won Cumulative',
		));
	   }
        }
	  Widget viewProjectsOwned (BuildContext context) {  
	   if(model.model.fav_projects_owned != null){
	   	  return(  StringView(
			value: model.model.fav_projects_owned.toString(),
			caption: 'Projects Owned',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_owned_str,
			caption: 'Projects Owned',
		));
	   }
        }
	  Widget viewProjectsOwnedCumulative (BuildContext context) {  
	   if(model.model.fav_projects_owned_cumulative != null){
	   	  return(  StringView(
			value: model.model.fav_projects_owned_cumulative.toString(),
			caption: 'Projects Owned Cumulative',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_owned_cumulative_str,
			caption: 'Projects Owned Cumulative',
		));
	   }
        }
	  Widget viewProjectsNoAction (BuildContext context) {  
	   if(model.model.fav_projects_noaction != null){
	   	  return(  StringView(
			value: model.model.fav_projects_noaction.toString(),
			caption: 'Projects No-Action',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_noaction_str,
			caption: 'Projects No-Action',
		));
	   }
        }
	  Widget viewProjectsCanceled (BuildContext context) {  
	   if(model.model.fav_projects_canceled != null){
	   	  return(  StringView(
			value: model.model.fav_projects_canceled.toString(),
			caption: 'Projects Canceled',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_canceled_str,
			caption: 'Projects Canceled',
		));
	   }
        }
	  Widget viewMissedPayment (BuildContext context) {  
	   if(model.model.fav_missed_payment != null){
	   	  return(  StringView(
			value: model.model.fav_missed_payment.toString(),
			caption: 'Missed Payment',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_missed_payment_str,
			caption: 'Missed Payment',
		));
	   }
        }
	  Widget viewProjectsCompleted (BuildContext context) {  
	   if(model.model.fav_projects_completed != null){
	   	  return(  StringView(
			value: model.model.fav_projects_completed.toString(),
			caption: 'Projects Completed',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_completed_str,
			caption: 'Projects Completed',
		));
	   }
        }
	  Widget viewProjectsArbitrated (BuildContext context) {  
	   if(model.model.fav_projects_arbitrated != null){
	   	  return(  StringView(
			value: model.model.fav_projects_arbitrated.toString(),
			caption: 'Projects Arbitrated',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_arbitrated_str,
			caption: 'Projects Arbitrated',
		));
	   }
        }
	  Widget viewProjectsWonInArbitration (BuildContext context) {  
	   if(model.model.fav_projects_won_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.fav_projects_won_in_arbitration.toString(),
			caption: 'Projects Won in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_won_in_arbitration_str,
			caption: 'Projects Won in Arbitration',
		));
	   }
        }
	  Widget viewProjectsLostInArbitration (BuildContext context) {  
	   if(model.model.fav_projects_lost_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.fav_projects_lost_in_arbitration.toString(),
			caption: 'Projects Lost in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_projects_lost_in_arbitration_str,
			caption: 'Projects Lost in Arbitration',
		));
	   }
        }
	  Widget viewCurrentProjects (BuildContext context) {  
	   if(model.model.fav_current_projects != null){
	   	  return(  StringView(
			value: model.model.fav_current_projects.toString(),
			caption: 'Current Projects',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_current_projects_str,
			caption: 'Current Projects',
		));
	   }
        }
	  Widget viewMissedWeeklyReport (BuildContext context) {  
	   if(model.model.fav_missed_weekly_report != null){
	   	  return(  StringView(
			value: model.model.fav_missed_weekly_report.toString(),
			caption: 'Missed Weekly Report',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_missed_weekly_report_str,
			caption: 'Missed Weekly Report',
		));
	   }
        }
	  Widget viewProductSold (BuildContext context) {  
	   if(model.model.fav_product_sold != null){
	   	  return(  StringView(
			value: model.model.fav_product_sold.toString(),
			caption: 'Product Sold',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_product_sold_str,
			caption: 'Product Sold',
		));
	   }
        }
	  Widget viewProductSoldCumulative (BuildContext context) {  
	   if(model.model.fav_product_sold_cumulative != null){
	   	  return(  StringView(
			value: model.model.fav_product_sold_cumulative.toString(),
			caption: 'Product Sold Cumulative',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_product_sold_cumulative_str,
			caption: 'Product Sold Cumulative',
		));
	   }
        }
	  Widget viewProductBought (BuildContext context) {  
	   if(model.model.fav_product_bought != null){
	   	  return(  StringView(
			value: model.model.fav_product_bought.toString(),
			caption: 'Product Bought',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_product_bought_str,
			caption: 'Product Bought',
		));
	   }
        }
	  Widget viewProductBoughtCumulative (BuildContext context) {  
	   if(model.model.fav_product_bought_cumulative != null){
	   	  return(  StringView(
			value: model.model.fav_product_bought_cumulative.toString(),
			caption: 'Product Bought Cumulative',
		));
	   } else{
	       return(  StringView(
			value: model.model.fav_product_bought_cumulative_str,
			caption: 'Product Bought Cumulative',
		));
	   }
        }
  
}


@JsonSerializable()
class MyBuddiesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyBuddies? model;
  MyBuddiesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory MyBuddiesViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyBuddiesViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyBuddiesViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyBuddiesListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyBuddiesListingBase(this.json){
		items = MyBuddiesListingItems.fromJson(this.json);
		tools = MyBuddiesListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyBuddiesModel item,String? search, bool?account) {
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
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBuddiesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyBuddiesModel item,String? search, int? index, bool?account, String? id) {
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
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBuddiesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyBuddiesModel item,String? search, int? index, bool?account) {
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
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBuddiesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyBuddiesModel item,ItemMyBuddiesModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBuddiesCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyBuddiesModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	    totalHeight = totalHeight + 2 ;
	    totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyBuddiesCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyBuddiesWidget(tools.buttons[i],context, account));
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





class MyBuddiesListingItems{
  List<ItemMyBuddiesModel?>? items;
  MyBuddiesListingItems(
      this.items,
      );

  factory MyBuddiesListingItems.fromJson(Map<String, dynamic> json) {
  	return MyBuddiesListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyBuddiesModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyBuddiesListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyBuddies?>? items;
	MyBuddiesListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyBuddiesListingTools.fromJson(Map<String, dynamic> json) => _$MyBuddiesListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyBuddiesListingToolsToJson(this);

}




class ItemMyBuddiesCard extends StatelessWidget {
  const ItemMyBuddiesCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyBuddiesModel? destination;
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
                child: ItemMyBuddiesContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyBuddiesContent extends StatelessWidget {
  const ItemMyBuddiesContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyBuddiesModel? destination;

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
		  buttonChildren!.add(itemMyBuddiesButton(destination,i , context));
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
	   children!.add(destination!.viewPhoto(context));
	   children!.add(destination!.viewUserName(context));
	   children!.add(destination!.viewDisplayName(context));
	   children!.add(destination!.viewCountry(context));
	   children!.add(destination!.viewProvinsi(context));
	   children!.add(destination!.viewKabupaten(context));
	   children!.add(destination!.viewWebsite(context));
	   children!.add(destination!.viewSelfIntroduction(context));
	   children!.add(destination!.viewWorkerRanking(context));
	   children!.add(destination!.viewWorkerPoint(context));
	   children!.add(destination!.viewWorkerRating(context));
	   children!.add(destination!.viewOwnerRanking(context));
	   children!.add(destination!.viewOwnerPoint(context));
	   children!.add(destination!.viewOwnerRating(context));
	   children!.add(destination!.viewSellerRanking(context));
	   children!.add(destination!.viewSellerPoint(context));
	   children!.add(destination!.viewSellerRating(context));
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

Widget itemMyBuddiesButton(ItemMyBuddiesModel? destination, int? index, BuildContext context){
  MyBuddiesController my_buddies; 
  
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
                        
                        my_buddies = new  MyBuddiesController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_buddies.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyBuddiesResult = value;
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



class ItemMyBuddiesWidget extends StatelessWidget {

	final ItemMyBuddiesModel?  item;
	final String? search;
	const  ItemMyBuddiesWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyBuddiesWidget(Button button, BuildContext context, bool?account){
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






  






  

