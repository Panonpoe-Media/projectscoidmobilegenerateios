

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
import 'support_item.dart';
import 'support_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/Support/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'support_base.g.dart';



@JsonSerializable()

class ModelActionContactFormSupport {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? contact_form_id;
  String? your_name;
  String? email_address;
  String? question;
  String? captcha;

	
	  ModelActionContactFormSupport(
            this.id,
			this.contact_form_id,
			this.your_name,
			this.email_address,
			this.question,
			this.captcha,

  );
    factory ModelActionContactFormSupport.fromJson(Map<String, dynamic> json) => _$ModelActionContactFormSupportFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionContactFormSupportToJson(this);

}



class ContactFormSupportBase{
	var model;
	Map<String, dynamic> json;
	ContactFormSupportBase(this.json){
		model = ContactFormSupportSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Widget RButtonActionSupportWidget(Button button, BuildContext context,var formKey, ScrollController controller, SupportController support,

 var postSupportResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataContactForm(button!.text!, model
                     					  );
                                  support = new SupportController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.project_title);
										}else if(['AskOwner'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.user_id);
										}else{
										support.deleteAllContactFormSupport('');
										}
                      if(sendPath!.contains('%s')){
                      final future = support.postContactFormSupportWithID();
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
                                  postSupportResult = value;
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
										MaterialPageRoute(builder: (context) => rt.PublicSupportListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = support.postContactFormSupport();
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
                                  postSupportResult = value;
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
										MaterialPageRoute(builder: (context) => rt.PublicSupportListing(id :  id!)),
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

SpeedDialChild  ButtonActionSupportWidget(Button button, BuildContext context,var formKey, ScrollController controller, SupportController support,
 var postSupportResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataContactForm(button!.text!, model
                     					  );
                                  support = new  SupportController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.project_title);
										}else if(['AskOwner'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ContactForm')){
										support.deleteAllContactFormSupport(this.model.model.user_id);
										}else{
										support.deleteAllContactFormSupport('');
										}
                      if(sendPath!.contains('%s')){
                      final future = support.postContactFormSupportWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postSupportResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicSupportListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = support.postContactFormSupport();
                                  future.then((value) {
                                  state.setState(() {
                                  postSupportResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicSupportListing(id :  id!)),
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
  
   String? action =   'ContactForm';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "contact_form[_trigger_]":"$tgr",
  "contact_form[your_name]": "${model.model.your_name }",
  "contact_form[email_address]": "${model.model.email_address }",
   "contact_form[question]": "${model.model.question }",
  "contact_form[captcha]": "${model.model.captcha }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SupportController support,

 var postContactFormResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionSupportWidget(model.buttons[i], context,formKey, controller,support, postContactFormResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SupportController support,
  var postContactFormResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionSupportWidget(model.buttons[i], context,formKey, controller,support, postContactFormResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
  var postContactFormResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
  var postContactFormResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,support, postContactFormResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
  var postContactFormResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,support, postContactFormResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editYourName (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.your_name,
									caption: 'Your Name',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.your_name = val;
									  });
									},
								));}
										Widget editEmailAddress (State state) {
								  return(
								 EmailWidget(
									value: model.model.email_address,
									caption: 'Email Address',
									hint: 'Isi dengan Email Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.email_address = val;
									  });
									},
								));}
										Widget editQuestion (State state) {
								  return(
								MultilineWidget(
								  value: model.model.question,
								  caption: 'Question',
								  hint: 'Isi dengan Multiline Anda',
								  required: true,
								  getValue: (String? val) {
									state.setState(() {
									  model.model.question = val;
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
 	

}


@JsonSerializable()
class ContactFormSupportSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionContactFormSupport? model;
  ContactFormSupportSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory ContactFormSupportSuperBase.fromJson(Map<String, dynamic> json) => _$ContactFormSupportSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactFormSupportSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelSupport {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? contact_form_id;
  String? your_name;
  String? email_address;
  String? question;
  DateTime? date;
  String? ip_address;
  bool?replied;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  String? reply;
  int? replied_by_id;
  String? replied_by_url;
  String? replied_by_str;
  List<int?>? replied_by_list;
  List<String?>? replied_by_list_str;
  DateTime? replied_date;
  String? replied_ip;
  String? captcha;

	
	  ModelSupport(
            this.id,
            this.contact_form_id,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.replied_by_id,
			this.replied_by_str,
			this.replied_by_list,
			this.replied_by_list_str,

  );
    factory ModelSupport.fromJson(Map<String, dynamic> json) => _$ModelSupportFromJson(json);

  Map<String, dynamic> toJson() => _$ModelSupportToJson(this);

}




class SupportBase{
	var model;
	Map<String, dynamic> json;
	SupportBase(this.json){
		model = SupportSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
   
   
      var formData = {
      "support[_trigger_]":"",
   "support[contact_form_id]": "${model.model.contact_form_id }",
  "support[your_name]": "${model.model.your_name }",
  "support[email_address]": "${model.model.email_address }",
   "support[question]": "${model.model.question }",
  "support[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}",
  "support[ip_address]": "${model.model.ip_address }",
  "support[replied]": "${model.model.replied ? 1 : 0}",
   "support[status_id]": "${model.model.status_id}",
   "support[reply]": "${model.model.reply }",
  "support[replied_by_id]": "${model.model.replied_by_id }",
  "support[replied_date]": "${DateFormat('dd/MM/yyyy').format(model.model.replied_date)}",
  "support[replied_ip]": "${model.model.replied_ip }",
  "support[captcha]": "${model.model.captcha }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SupportController support,
  var postSupportResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditSupportWidget(model.buttons[i], context,formKey, controller,support, postSupportResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
  var postSupportResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,support, postSupportResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditSupportWidget(Button button, BuildContext context,var formKey, ScrollController controller, SupportController support,
 var postSupportResult, State state, String? sendPath, String? id,  String? title){
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
                        support = new  SupportController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = support.postSupport();
                        future.then((value) {
                        state.setState(() {
                        postSupportResult = value;
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
   


	  	    Widget editYourName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.your_name,
		caption: 'Your Name',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.your_name = val;
		  });
		},
    ));}

	  	    Widget editEmailAddress (State state) {
      return(
	 EmailWidget(
		value: model.model.email_address,
		caption: 'Email Address',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.email_address = val;
		  });
		},
	));}

	 	    Widget editQuestion (State state) {
      return(
	MultilineWidget(
	  value: model.model.question,
	  caption: 'Question',
	  hint: 'Isi dengan Multiline Anda',
	  required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.question = val;
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

	  	    Widget editIpAddress (State state) {
      return(
	DisplayNameWidget(
		value: model.model.ip_address,
		caption: 'IP Address',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.ip_address = val;
		  });
		},
    ));}

	  	    Widget editReplied (State state) {
      return(
	BooleanWidget(
	  value: model.model.replied,
	  caption: 'Replied',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.replied = val;
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

	 	    Widget editReply (State state) {
      return(
	MultilineWidget(
	  value: model.model.reply,
	  caption: 'Reply',
	  hint: 'Isi dengan Multiline Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.reply = val;
		});
	  },
	));}

	  	    Widget editRepliedBy (State state) {
	   return(  StringView(
		value: model.model.replied_by_str,
		caption: 'Replied By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.replied_by_id,
	  caption: 'Replied By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.replied_by_id_list,
	  nameenum: model.model.replied_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.replied_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRepliedDate (State state) {
      return(
	new DateWidget(
	  value: model.model.replied_date,
	  caption: 'Replied Date',
	  hint: 'isi dengan Date diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  
		state.setState(() {
		  model.model.replied_date = val;
		});
	  },
	));} 

	  	    Widget editRepliedIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.replied_ip,
		caption: 'Replied IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.replied_ip = val;
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
	
}


@JsonSerializable()

class SupportSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelSupport? model;
  SupportSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory SupportSuperBase.fromJson(Map<String, dynamic> json) => _$SupportSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$SupportSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelSupport {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? contact_form_id;
  String? your_name;
  String? email_address;
  String? question;
  DateTime? date;
  String? ip_address;
  bool?replied;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  String? reply;
  int? replied_by_id;
  String? replied_by_str;
  String? replied_by_url;
  List<int?>? replied_by_list;
  List<String?>? replied_by_list_str;
  DateTime? replied_date;
  String? replied_ip;
  String? captcha;

	//
	  ViewModelSupport(
            this.id,
            this.contact_form_id,
			this.your_name,
			this.email_address,
			this.question,
			this.date,
			this.ip_address,
			this.replied,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.reply,
			this.replied_by_id,
			this.replied_by_str,
			this.replied_by_url,
			this.replied_by_list,
			this.replied_by_list_str,
			this.replied_date,
			this.replied_ip,
			this.captcha,

  );

  
   factory ViewModelSupport.fromJson(Map<String, dynamic> json) => _$ViewModelSupportFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelSupportToJson(this); 
  
}


class SupportViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	SupportViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewSupportWidget(model.buttons[i],context,  formKey, controller, support,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewSupportWidget(Button button, BuildContext context,var formKey, ScrollController controller, SupportController support,
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
                        
                        support = new  SupportController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = support.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postSupportResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, SupportController support,
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
				children:listButton(context, visible!, formKey, controller, support,
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

	 	  
	   viewChildren!.add(viewYourName(context)); 
	   viewChildren!.add(viewEmailAddress(context)); 
	   viewChildren!.add(viewQuestion(context)); 
	   viewChildren!.add(viewDate(context)); 
	   viewChildren!.add(viewIpAddress(context)); 
	   viewChildren!.add(viewReplied(context)); 
	   viewChildren!.add(viewStatus(context)); 
	   viewChildren!.add(viewReply(context)); 
	   viewChildren!.add(viewRepliedBy(context)); 
	   viewChildren!.add(viewRepliedDate(context)); 
	   viewChildren!.add(viewRepliedIp(context)); 

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

 
		    Widget viewYourName (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.your_name,
		caption: 'Your Name',
	));}
		    Widget viewEmailAddress (BuildContext context) {  
	return(  EmailView(
		value: model.model.email_address,
		caption: 'Email Address',
	));}
		    Widget viewQuestion (BuildContext context) {  
	return(  MultilineView(
		value: model.model.question,
		caption: 'Question',
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
		    Widget viewIpAddress (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.ip_address,
		caption: 'IP Address',
	));}
		    Widget viewReplied (BuildContext context) {  

	if(model.model.replied != null){
		return(  BooleanView(
		value: model.model.replied,
		caption: 'Replied',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Replied',
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
		    Widget viewReply (BuildContext context) {  
	return(  MultilineView(
		value: model.model.reply,
		caption: 'Reply',
	));}
				Widget viewRepliedBy (BuildContext context) {  
		return(  ModelView(
			value: model.model.replied_by_id,
			caption: 'Replied By',
			idenum: model.model.replied_by_list,
			nameenum: model.model.replied_by_str,
		));} 
		    Widget viewRepliedDate (BuildContext context) {  
    if(model.model.replied_date != null){
		return(  DateView(
		value: model.model.replied_date,
		caption: 'Replied Date',
		));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Replied Date',
		    ));	
	}			
     } 
		    Widget viewRepliedIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.replied_ip,
		caption: 'Replied IP',
	));}
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: model.model.captcha,
		caption: 'Captcha',
	));}
  
}


@JsonSerializable()
class SupportViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelSupport? model;
  SupportViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory SupportViewSuperBase.fromJson(Map<String, dynamic> json) => _$SupportViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$SupportViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class SupportListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	SupportListingBase(this.json){
		items = SupportListingItems.fromJson(this.json);
		tools = SupportListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemSupportModel item,String? search, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemSupportCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemSupportModel item,String? search, int? index, bool?account, String? id) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemSupportCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemSupportModel item,String? search, int? index, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemSupportCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemSupportModel item,ItemSupportModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemSupportCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemSupportModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemSupportCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonSupportWidget(tools.buttons[i],context, account));
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





class SupportListingItems{
  List<ItemSupportModel?>? items;
  SupportListingItems(
      this.items,
      );

  factory SupportListingItems.fromJson(Map<String, dynamic> json) {
  	return SupportListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemSupportModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class SupportListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemSupport?>? items;
	SupportListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory SupportListingTools.fromJson(Map<String, dynamic> json) => _$SupportListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$SupportListingToolsToJson(this);

}




class ItemSupportCard extends StatelessWidget {
  const ItemSupportCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemSupportModel? destination;
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
                child: ItemSupportContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSupportContent extends StatelessWidget {
  const ItemSupportContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemSupportModel? destination;

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
		  buttonChildren!.add(itemSupportButton(destination,i , context));
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
	   children!.add(destination!.viewYourName(context)); 
	   children!.add(destination!.viewEmailAddress(context)); 
	   children!.add(destination!.viewQuestion(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewIpAddress(context)); 
	   children!.add(destination!.viewReplied(context)); 
	   children!.add(destination!.viewStatus(context)); 
	   children!.add(destination!.viewReply(context)); 
	   children!.add(destination!.viewRepliedBy(context)); 
	   children!.add(destination!.viewRepliedDate(context)); 
	   children!.add(destination!.viewRepliedIp(context)); 
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

Widget itemSupportButton(ItemSupportModel? destination, int? index, BuildContext context){
  SupportController support; 
  
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
                        
                        support = new  SupportController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = support.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postSupportResult = value;
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



class ItemSupportWidget extends StatelessWidget {

	final ItemSupportModel?  item;
	final String? search;
	const  ItemSupportWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonSupportWidget(Button button, BuildContext context, bool?account){
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






  






  

