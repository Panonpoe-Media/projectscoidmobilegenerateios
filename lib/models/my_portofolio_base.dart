

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
import 'my_portofolio_item.dart';
import 'my_portofolio_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyPortofolio/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'my_portofolio_base.g.dart';



@JsonSerializable()

class ModelActionAddPortofolioMyPortofolio {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? portofolio_id;
  int? year;
  String? description;
  String? link;
  String? image_url;
  Photo?image;

	
	  ModelActionAddPortofolioMyPortofolio(
            this.id,
			this.portofolio_id,
			this.year,
			this.description,
			this.link,
			this.image,
			this.image_url,

  );
    factory ModelActionAddPortofolioMyPortofolio.fromJson(Map<String, dynamic> json) => _$ModelActionAddPortofolioMyPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAddPortofolioMyPortofolioToJson(this);

}



class AddPortofolioMyPortofolioBase{
	var model;
	Map<String, dynamic> json;
            var imagelast ;
	AddPortofolioMyPortofolioBase(this.json){
		model = AddPortofolioMyPortofolioSuperBase.fromJson(this.json);
     if (model.model.image!= null) {
            imagelast = Photo(model.model.image.name, model.model.image.status, model.model.image.dir, model.model.image.file, model.model.image.thumb, model.model.image.temp);
     }
	}


Widget RButtonActionMyPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,

 var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataAddPortofolio(button!.text!, model
											, imagelast 
                     					  );
                                  my_portofolio = new MyPortofolioController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.project_title);
										}else if(['AskOwner'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.user_id);
										}else{
										my_portofolio.deleteAllAddPortofolioMyPortofolio('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_portofolio.postAddPortofolioMyPortofolioWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = my_portofolio.postAddPortofolioMyPortofolio();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
 var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataAddPortofolio(button!.text!, model
											, imagelast 
                     					  );
                                  my_portofolio = new  MyPortofolioController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.project_title);
										}else if(['AskOwner'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AddPortofolio')){
										my_portofolio.deleteAllAddPortofolioMyPortofolio(this.model.model.user_id);
										}else{
										my_portofolio.deleteAllAddPortofolioMyPortofolio('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_portofolio.postAddPortofolioMyPortofolioWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_portofolio.postAddPortofolioMyPortofolio();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
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
  
   String? action =   'AddPortofolio';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? image = '';
  String? image_last = '';
  if(isEdit && imagelast != null){
      image_last = '{"name":"${ imagelast.name}","dir":"${ imagelast.dir}","file":"${ imagelast.file}","thumb":"${ imagelast.thumb}"}';
   
  }
	if (model.model.image!= null) {
		 if (model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"}';
      		
     }
	 }
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "portofolio[_trigger_]":"$tgr",
  "portofolio[year]": "${model.model.year }",
   "portofolio[description]": "${model.model.description }",
  "portofolio[link]": "${model.model.link }",
  "portofolio[image]": '$image',
  "portofolio[image_lastval]": '$image_last',
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,

 var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyPortofolioWidget(model.buttons[i], context,formKey, controller,my_portofolio, postAddPortofolioResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyPortofolioWidget(model.buttons[i], context,formKey, controller,my_portofolio, postAddPortofolioResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_portofolio, postAddPortofolioResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_portofolio, postAddPortofolioResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editYear (State state) {
								  return(
								NumberWidget(
								  value: model.model.year,
								  caption: 'Year',
								  hint: 'Isi dengan Number Anda',
								  required: true,
								  min: '0',
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.year = val;
									});
								  },
								));}
										Widget editDescription (State state) {
								  return(
								MultilineWidget(
								  value: model.model.description,
								  caption: 'Description',
								  hint: 'Isi dengan Multiline Anda',
								  required: true,
								  getValue: (String? val) {
									state.setState(() {
									  model.model.description = val;
									});
								  },
								));}
										Widget editLink (State state) {
								  return(
								 WebsiteWidget(
									value: model.model.link,
									caption: 'Link',
									hint: 'Isi dengan Website Anda',
									required: false,
									getValue: (String? val) {
									  state.setState(() {
										model.model.link = val;
									  });
									},
								));}
								Widget editImage (State state) {
								if(model.model.image_url== '' || model.model.image == null ){
									model.model.image = new Photo('','0','', '','', '');
									}
								  return(
							  //ImageWidget edit& FileWidget editexperiment validation non from validation.

								ImageWidget(
									value: model.model.image,
									caption: 'Image(IF_ANY)',
									hint: 'Isi dengan Image Anda',
									required: true,
									getValue: (var val) {
									
									  state.setState(() {
										model.model.image = val;
										model.model.image_url = val!.name;
									  });
									},
								));} 
 	

}


@JsonSerializable()
class AddPortofolioMyPortofolioSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAddPortofolioMyPortofolio? model;
  AddPortofolioMyPortofolioSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory AddPortofolioMyPortofolioSuperBase.fromJson(Map<String, dynamic> json) => _$AddPortofolioMyPortofolioSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AddPortofolioMyPortofolioSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionEditMyPortofolio {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? portofolio_id;
  int? year;
  String? description;
  String? link;
  String? image_url;
  Photo?image;

	
	  ModelActionEditMyPortofolio(
            this.id,
			this.portofolio_id,
			this.year,
			this.description,
			this.link,
			this.image,
			this.image_url,

  );
    factory ModelActionEditMyPortofolio.fromJson(Map<String, dynamic> json) => _$ModelActionEditMyPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionEditMyPortofolioToJson(this);

}



class EditMyPortofolioBase{
	var model;
	Map<String, dynamic> json;
            var imagelast ;
	EditMyPortofolioBase(this.json){
		model = EditMyPortofolioSuperBase.fromJson(this.json);
     if (model.model.image!= null) {
            imagelast = Photo(model.model.image.name, model.model.image.status, model.model.image.dir, model.model.image.file, model.model.image.thumb, model.model.image.temp);
     }
	}


Widget RButtonActionMyPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,

 var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataEdit(button!.text!, model
											, imagelast 
                     					  );
                                  my_portofolio = new MyPortofolioController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.project_title);
										}else if(['AskOwner'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.user_id);
										}else{
										my_portofolio.deleteAllEditMyPortofolio('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_portofolio.postEditMyPortofolioWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = my_portofolio.postEditMyPortofolio();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
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

SpeedDialChild  ButtonActionMyPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
 var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataEdit(button!.text!, model
											, imagelast 
                     					  );
                                  my_portofolio = new  MyPortofolioController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.project_title);
										}else if(['AskOwner'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Edit')){
										my_portofolio.deleteAllEditMyPortofolio(this.model.model.user_id);
										}else{
										my_portofolio.deleteAllEditMyPortofolio('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_portofolio.postEditMyPortofolioWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_portofolio.postEditMyPortofolio();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyPortofolioResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyPortofolioListing(id :  id!)),
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
  
   String? action =   'Edit';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String? image = '';
  String? image_last = '';
  if(isEdit && imagelast != null){
      image_last = '{"name":"${ imagelast.name}","dir":"${ imagelast.dir}","file":"${ imagelast.file}","thumb":"${ imagelast.thumb}"}';
   
  }
	if (model.model.image!= null) {
		 if (model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"}';
      		
     }
	 }
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "portofolio[_trigger_]":"$tgr",
  "portofolio[year]": "${model.model.year }",
   "portofolio[description]": "${model.model.description }",
  "portofolio[link]": "${model.model.link }",
  "portofolio[image]": '$image',
  "portofolio[image_lastval]": '$image_last',
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,

 var postEditResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyPortofolioWidget(model.buttons[i], context,formKey, controller,my_portofolio, postEditResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postEditResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyPortofolioWidget(model.buttons[i], context,formKey, controller,my_portofolio, postEditResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postEditResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postEditResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,my_portofolio, postEditResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postEditResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_portofolio, postEditResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editYear (State state) {
								  return(
								NumberWidget(
								  value: model.model.year,
								  caption: 'Year',
								  hint: 'Isi dengan Number Anda',
								  required: true,
								  min: '0',
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.year = val;
									});
								  },
								));}
										Widget editDescription (State state) {
								  return(
								MultilineWidget(
								  value: model.model.description,
								  caption: 'Description',
								  hint: 'Isi dengan Multiline Anda',
								  required: true,
								  getValue: (String? val) {
									state.setState(() {
									  model.model.description = val;
									});
								  },
								));}
										Widget editLink (State state) {
								  return(
								 WebsiteWidget(
									value: model.model.link,
									caption: 'Link',
									hint: 'Isi dengan Website Anda',
									required: false,
									getValue: (String? val) {
									  state.setState(() {
										model.model.link = val;
									  });
									},
								));}
								Widget editImage (State state) {
								if(model.model.image_url== '' || model.model.image == null ){
									model.model.image = new Photo('','0','', '','', '');
									}
								  return(
							  //ImageWidget edit& FileWidget editexperiment validation non from validation.

								ImageWidget(
									value: model.model.image,
									caption: 'Image(IF_ANY)',
									hint: 'Isi dengan Image Anda',
									required: true,
									getValue: (var val) {
									
									  state.setState(() {
										model.model.image = val;
										model.model.image_url = val!.name;
									  });
									},
								));} 
 	

}


@JsonSerializable()
class EditMyPortofolioSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionEditMyPortofolio? model;
  EditMyPortofolioSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory EditMyPortofolioSuperBase.fromJson(Map<String, dynamic> json) => _$EditMyPortofolioSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$EditMyPortofolioSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyPortofolio {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? portofolio_id;
  int? user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? year;
  String? year_str;
  String? description;
  String? link;
  Photo?image;
  String?  image_url;

	
	  ModelMyPortofolio(
            this.id,
            this.portofolio_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.year,
			this.year_str,
			this.image,
			this.image_url,

  );
    factory ModelMyPortofolio.fromJson(Map<String, dynamic> json) => _$ModelMyPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyPortofolioToJson(this);

}




class MyPortofolioBase{
	var model;
	Map<String, dynamic> json;
	MyPortofolioBase(this.json){
		model = MyPortofolioSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? image = '';
	if (model.model.image!= null) {
		 if (model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"} ';
		 }
	 }
   
   
      var formData = {
      "my_portofolio[_trigger_]":"",
   "my_portofolio[portofolio_id]": "${model.model.portofolio_id }",
  "my_portofolio[user_id]": "${model.model.user_id }",
  "my_portofolio[year]": "${model.model.year }",
   "my_portofolio[description]": "${model.model.description }",
  "my_portofolio[link]": "${model.model.link }",
  "my_portofolio[image]": '$image',
  "my_portofolio[image_lastval]": '{"name":"${model.model.image.name}","dir":"${model.model.image.dir}","file":"${model.model.image.file}","thumb":"${model.model.image.thumb}"}',
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyPortofolioWidget(model.buttons[i], context,formKey, controller,my_portofolio, postMyPortofolioResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyPortofolioController my_portofolio,
  var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_portofolio, postMyPortofolioResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPortofolioController my_portofolio,
 var postMyPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                        my_portofolio = new  MyPortofolioController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_portofolio.postMyPortofolio();
                        future.then((value) {
                        state.setState(() {
                        postMyPortofolioResult = value;
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

	  	    Widget editYear (State state) {
      return(
	NumberWidget(
	  value: model.model.year,
	  caption: 'Year',
	  hint: 'Isi dengan Number Anda',
	  required: true,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.year = val;
		});
	  },
	));}

	 	    Widget editDescription (State state) {
      return(
	MultilineWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'Isi dengan Multiline Anda',
	  required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}

	  	    Widget editLink (State state) {
      return(
	 WebsiteWidget(
		value: model.model.link,
		caption: 'Link',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.link = val;
		  });
		},
	));}

	Widget editImage (State state) {
	if(model.model.image_url== ''){
		model.model.image = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.image,
		caption: 'Image',
		hint: 'Isi dengan Image Anda',
		required: true,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.image = val;
			model.model.image_url = val!.name;
		  });
		},
	));} 
	
}


@JsonSerializable()

class MyPortofolioSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyPortofolio? model;
  MyPortofolioSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyPortofolioSuperBase.fromJson(Map<String, dynamic> json) => _$MyPortofolioSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyPortofolioSuperBaseToJson(this);
   
}






    ///////////////////////////////////////////////////

class MyPortofolioListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyPortofolioListingBase(this.json){
		items = MyPortofolioListingItems.fromJson(this.json);
		tools = MyPortofolioListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyPortofolioModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPortofolioCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyPortofolioModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPortofolioCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyPortofolioModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPortofolioCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyPortofolioModel item,ItemMyPortofolioModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPortofolioCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyPortofolioModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyPortofolioCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyPortofolioWidget(tools.buttons[i],context, account));
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





class MyPortofolioListingItems{
  List<ItemMyPortofolioModel?>? items;
  MyPortofolioListingItems(
      this.items,
      );

  factory MyPortofolioListingItems.fromJson(Map<String, dynamic> json) {
  	return MyPortofolioListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyPortofolioModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyPortofolioListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyPortofolio?>? items;
	MyPortofolioListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyPortofolioListingTools.fromJson(Map<String, dynamic> json) => _$MyPortofolioListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyPortofolioListingToolsToJson(this);

}




class ItemMyPortofolioCard extends StatelessWidget {
  const ItemMyPortofolioCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyPortofolioModel? destination;
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
                child: ItemMyPortofolioContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyPortofolioContent extends StatelessWidget {
  const ItemMyPortofolioContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyPortofolioModel? destination;

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
		  buttonChildren!.add(itemMyPortofolioButton(destination,i , context));
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
	   children!.add(destination!.viewYear(context)); 
	   children!.add(destination!.viewDescription(context)); 
	   children!.add(destination!.viewLink(context)); 
	   children!.add(destination!.viewImage(context)); 
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

Widget itemMyPortofolioButton(ItemMyPortofolioModel? destination, int? index, BuildContext context){
  MyPortofolioController my_portofolio; 
  
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
                        
                        my_portofolio = new  MyPortofolioController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_portofolio.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyPortofolioResult = value;
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



class ItemMyPortofolioWidget extends StatelessWidget {

	final ItemMyPortofolioModel?  item;
	final String? search;
	const  ItemMyPortofolioWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyPortofolioWidget(Button button, BuildContext context, bool?account){
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






  






  

