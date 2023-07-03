

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
import 'my_projects_item.dart';
import 'my_projects_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyProjects/action.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:shared_preferences/shared_preferences.dart';
part 'my_projects_base.g.dart';

/** AUTOGENERATE OFF **/


@JsonSerializable()

class ModelActionBumpUpMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   description;
	   String?   attachments_url;
	   String?   attachments_name;
	  List<FileField?>? attachments;
	  int? finish_days;
	  String?   finish_days_str;
    String?   budget_range;
    double?   budget_range_min;
    String?   budget_range_min_str;
    double?   budget_range_max;
    String?   budget_range_max_str;
    String?   budget_range_str;
	  List<int?>? channels_id;
	  List<String?>?   channels_str;
	  List<String?>?  channels_url;

	
	  ModelActionBumpUpMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.description,
				this.attachments,
				this.attachments_url,
				this.attachments_name,
				this.finish_days,
				this.finish_days_str,
         this.budget_range,
        this.budget_range_min,
        this.budget_range_min_str,
        this.budget_range_max,
        this.budget_range_max_str,
        this.budget_range_str,
				this.channels_id,
				this.channels_str,
				this.channels_url,

  );
    factory ModelActionBumpUpMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionBumpUpMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionBumpUpMyProjectsToJson(this);

}



class BumpUpMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	BumpUpMyProjectsBase(this.json){
		model = BumpUpMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataBumpUp(button.text!, model
											,  attachmentslast   
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllBumpUpMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postBumpUpMyProjectsWithID();
                                   future.then((value) {
                                     /*
								 
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							  
                      });
                      }else{
                      final future = my_projects.postBumpUpMyProjects();
                                   future.then((value) {
                                     /*
								              
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							  
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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataBumpUp(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('BumpUp')){
										my_projects.deleteAllBumpUpMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllBumpUpMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postBumpUpMyProjectsWithID();
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
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postBumpUpMyProjects();
                                   future.then((value) {
								                /*
								                
                                    
								                 */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'BumpUp';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBumpUpResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postBumpUpResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBumpUpResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postBumpUpResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBumpUpResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBumpUpResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postBumpUpResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBumpUpResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postBumpUpResult, state, sendPath, id,  title )
	    )
	 );
   }






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
										Widget viewFinishDays (BuildContext context) {
								return(  NumberView(
									value: model.model.finish_days,
									caption: 'Finish Days',
								));}
										Widget viewBudgetRange (BuildContext context) {
								return(  StringView(
									value: model.model.budget_range_str,
									caption: 'Budget Range'
								));}

							Widget viewChannels (BuildContext context) {
							return( 	ChannelRouteTagsWidget(
										value: model.model.channels_id,
										caption: '',
										hint: ' ',
										required: true,
										idroutetags: model.model.channels_id,
										nameroutetags: model.model.channels_str,
										urlroutetags: model.model.channels_url,
										getValue: (String?   val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));}


}


@JsonSerializable()
class BumpUpMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionBumpUpMyProjects? model;
  BumpUpMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory BumpUpMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$BumpUpMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BumpUpMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionBroadcastMessageMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   short_description;
  String?   broadcast_message;
   String?   attach_file_url;
  String?   attach_file_name;
  List<FileField?>? attach_file;
  bool? automatic_send_to_new_bidder;


	  ModelActionBroadcastMessageMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.short_description,
			this.broadcast_message,
			this.attach_file,
			this.attach_file_url,
			this.attach_file_name,
			this.automatic_send_to_new_bidder,

  );
    factory ModelActionBroadcastMessageMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionBroadcastMessageMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionBroadcastMessageMyProjectsToJson(this);

}



class BroadcastMessageMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attach_filelast ;
	BroadcastMessageMyProjectsBase(this.json){
		model = BroadcastMessageMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attach_file!= null) {
            attach_filelast  = FileField(model.model.attach_file[0].status, model.model.attach_file[0].name, model.model.attach_file[0].size, model.model.attach_file[0].created,
            model.model.attach_file[0].modified, model.model.attach_file[0].temp, model.model.attach_file[0].remote, model.model.attach_file[0].dir, model.model.attach_file[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataBroadcastMessage(button.text!, model
											,  attach_filelast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllBroadcastMessageMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postBroadcastMessageMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postBroadcastMessageMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataBroadcastMessage(button.text!, model
											,  attach_filelast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('BroadcastMessage')){
										my_projects.deleteAllBroadcastMessageMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllBroadcastMessageMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postBroadcastMessageMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postBroadcastMessageMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'BroadcastMessage';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attach_file = '';
  String?   attach_file_last = '';
   if(isEdit && attach_filelast != null){
         attach_file_last = '[{"name":"${ attach_filelast.name}","size":${ attach_filelast.size.toString()},"created":${ attach_filelast.created.toString()},"modified":${ attach_filelast.modified.toString()},"temp":"${ attach_filelast.temp}","remote":"","dir":"${ attach_filelast.dir}"}]';

       }
	if (model.model.attach_file!= null) {
		if (model.model.attach_file[0].temp != '') {
			attach_file = '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size},"created":${model.model.attach_file[0].date},"modified":${model.model.attach_file[0].date},"temp":"${model.model.attach_file[0].temp}","remote":"${model.model.attach_file[0].remote}","dir":"${model.model.attach_file[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[broadcast_message]": "${model.model.broadcast_message }",
  "project[attach_file]": '$attach_file',
  "project[attach_file_lastval]": '$attach_file_last',
  "project[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder ? 1 : 0}",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBroadcastMessageResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postBroadcastMessageResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBroadcastMessageResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postBroadcastMessageResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBroadcastMessageResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBroadcastMessageResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postBroadcastMessageResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postBroadcastMessageResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postBroadcastMessageResult, state, sendPath, id,  title )
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
										Widget editBroadcastMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.broadcast_message,
								  caption: 'Broadcast Message',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.broadcast_message = val;
									});
								  },
								));}
										Widget editAttachFile (State state) {
								  return(
								FileWidget(
									value: model.model.attach_file,
									caption: 'Attach File(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attach_file = val;
									  });
									},
								));}
										Widget editAutomaticSendToNewBidder (State state) {
								  return(
								BooleanWidget(
								  value: model.model.automatic_send_to_new_bidder,
								  caption: 'Automatic Send to New Bidder',
								  hint: 'Isi dengan Boolean Anda',
								  required: false,
								  getValue: (bool? val) {
									state.setState(() {
									  model.model.automatic_send_to_new_bidder = val;
									});
								  },
								));}


}


@JsonSerializable()
class BroadcastMessageMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionBroadcastMessageMyProjects? model;
  BroadcastMessageMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory BroadcastMessageMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$BroadcastMessageMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastMessageMyProjectsSuperBaseToJson(this);


}





@JsonSerializable()

class ModelActionCreateProjectMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
  String?   title;
  String?   description;
   String?   attachments_url;
  String?   attachments_name;
  List<FileField?>? attachments;
  int? finish_days;
   String?   budget_range;
   double?   budget_range_min;
   String?   budget_range_min_str;
   double?   budget_range_max;
   String?   budget_range_max_str;
   String?   budget_range_str;

  List<int?>? channels_id;
  List<String?>?   channels_str;
  List<String?>?  channels_url;
  List<int?>? channels_list;
  List<String?>?  channels_list_str;



	  ModelActionCreateProjectMyProjects(
            this.id,
			this.project_id,
			this.title,
			this.description,
			this.attachments,
			this.attachments_url,
			this.attachments_name,
			this.finish_days,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,

  );
    factory ModelActionCreateProjectMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionCreateProjectMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionCreateProjectMyProjectsToJson(this);

}



class CreateProjectMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	CreateProjectMyProjectsBase(this.json){
		model = CreateProjectMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{

                _onWidgetDidBuild(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Mohon tunggu beberapa saat lagi!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                });

                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataCreateProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCreateProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCreateProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                       // AppProvider.getRouter(context)!.pop(context);



                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postCreateProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                       // AppProvider.getRouter(context)!.pop(context);

                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataCreateProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('CreateProject')){
										my_projects.deleteAllCreateProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCreateProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCreateProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postCreateProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'CreateProject';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[title]": "${model.model.title }",
  "project[description]": "${model.model.description }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',
  "project[finish_days]": "${model.model.finish_days }",
 "project[budget_range_min]": "${model.model.budget_range_min }",
  "project[budget_range_max]": "${model.model.budget_range_max }",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCreateProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCreateProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCreateProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCreateProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCreateProjectResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCreateProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postCreateProjectResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCreateProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postCreateProjectResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget editTitle (State state) {
								  return(
								TitleWidget(
									value: model.model.title,
									caption: 'Title',
									hint: 'Isi dengan Title Anda',
									required: true,
									getValue: (String?   val) {
									  state.setState(() {
										model.model.title = val;
									  });
									},
								));}
										Widget editDescription (State state) {
								  return(
								ArticleWidget(
								  value: model.model.description,
								  caption: 'Description',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.description = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
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
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.finish_days = val;
									});
								  },
								));}
										Widget editBudgetRange (State state) {
								  return(
									RangeWidget(
									  value: model.model.budget_range,
									  valuemin: model.model.budget_range_min,
									  valuemax: model.model.budget_range_max,
									  caption: 'Range Budget',
									  hint: 'Isi dengan Range penawaran Anda',
									  required:true,
									 min: '0',
									 max: '100000000000',

									  getValue1: (double?   val) {
										state.setState(() {
										  model.model.budget_range_min = val;
										});
									  },
									  getValue2: (double?   val) {
										state.setState(() {
										  model.model.budget_range_max = val;
										});
									  },
									  getValue: (String?   val) {
										state.setState(() {
										  model.model.budget_range = val;
										});
									  },
									)
								  );}
										Widget editChannels (State state) {
								  return(

								InlineTagsWidget(
								  value: model.model.channels_id,
								  caption: 'Channels',
								  hint: ' ',
								  required: true,
								  idtags: model.model.channels_list,
								  nametags: model.model.channels_list_str,
								  getValue: (List<int?>? val) {
								  model.model.channels_id.clear();
									state.setState(() {
									  model.model.channels_id.addAll(val!);
									});
								  },
								  removeValue: (int? val) {
									state.setState(() {
									  model.model.channels_id.remove(val!);
									});
								  },
								));}




}


@JsonSerializable()
class CreateProjectMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionCreateProjectMyProjects? model;
  CreateProjectMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory CreateProjectMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$CreateProjectMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProjectMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionEditDraftMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
  String?   title;
  String?   description;
   String?   attachments_url;
  String?   attachments_name;
  List<FileField?>? attachments;
  int? finish_days;
   String?   budget_range;
   double?   budget_range_min;
   String?   budget_range_min_str;
   double?   budget_range_max;
   String?   budget_range_max_str;
   String?   budget_range_str;

  List<int?>? channels_id;
  List<String?>?   channels_str;
  List<String?>?  channels_url;
  List<int?>? channels_list;
  List<String?>?  channels_list_str;



	  ModelActionEditDraftMyProjects(
            this.id,
			this.project_id,
			this.title,
			this.description,
			this.attachments,
			this.attachments_url,
			this.attachments_name,
			this.finish_days,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,

  );
    factory ModelActionEditDraftMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionEditDraftMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionEditDraftMyProjectsToJson(this);

}



class EditDraftMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	EditDraftMyProjectsBase(this.json){
		model = EditDraftMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataEditDraft(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllEditDraftMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postEditDraftMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postEditDraftMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataEditDraft(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('EditDraft')){
										my_projects.deleteAllEditDraftMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllEditDraftMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postEditDraftMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postEditDraftMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'EditDraft';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[title]": "${model.model.title }",
  "project[description]": "${model.model.description }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',
  "project[finish_days]": "${model.model.finish_days }",
 "project[budget_range_min]": "${model.model.budget_range_min }",
  "project[budget_range_max]": "${model.model.budget_range_max }",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postEditDraftResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postEditDraftResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postEditDraftResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postEditDraftResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postEditDraftResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postEditDraftResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postEditDraftResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postEditDraftResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postEditDraftResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget editTitle (State state) {
								  return(
								TitleWidget(
									value: model.model.title,
									caption: 'Title',
									hint: 'Isi dengan Title Anda',
									required: true,
									getValue: (String?   val) {
									  state.setState(() {
										model.model.title = val;
									  });
									},
								));}
										Widget editDescription (State state) {
								  return(
								ArticleWidget(
								  value: model.model.description,
								  caption: 'Description',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.description = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
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
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.finish_days = val;
									});
								  },
								));}
										Widget editBudgetRange (State state) {
								  return(
									RangeWidget(
									  value: model.model.budget_range,
									  valuemin: model.model.budget_range_min,
									  valuemax: model.model.budget_range_max,
									  caption: 'Range Budget',
									  hint: 'Isi dengan Range penawaran Anda',
									  required:true,
									 min: '0',
									 max: '100000000000',

									  getValue1: (double?   val) {
										state.setState(() {
										  model.model.budget_range_min = val;
										});
									  },
									  getValue2: (double?   val) {
										state.setState(() {
										  model.model.budget_range_max = val;
										});
									  },
									  getValue: (String?   val) {
										state.setState(() {
										  model.model.budget_range = val;
										});
									  },
									)
								  );}
										Widget editChannels (State state) {
								  return(

								InlineTagsWidget(
								  value: model.model.channels_id,
								  caption: 'Channels',
								  hint: ' ',
								  required: true,
								  idtags: model.model.channels_list,
								  nametags: model.model.channels_list_str,
								  getValue: (List<int?>? val) {
								  model.model.channels_id.clear();
									state.setState(() {
									  model.model.channels_id.addAll(val!);
									});
								  },
								  removeValue: (int? val) {
									state.setState(() {
									  model.model.channels_id.remove(val!);
									});
								  },
								));}




}


@JsonSerializable()
class EditDraftMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionEditDraftMyProjects? model;
  EditDraftMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory EditDraftMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$EditDraftMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$EditDraftMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionPublishProjectMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   description;
	   String?   attachments_url;
	   String?   attachments_name;
	  List<FileField?>? attachments;
	  int? finish_days;
	  String?   finish_days_str;
    String?   budget_range;
    double?   budget_range_min;
    String?   budget_range_min_str;
    double?   budget_range_max;
    String?   budget_range_max_str;
    String?   budget_range_str;
	  List<int?>? channels_id;
	  List<String?>?   channels_str;
	  List<String?>?  channels_url;


	  ModelActionPublishProjectMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.description,
				this.attachments,
				this.attachments_url,
				this.attachments_name,
				this.finish_days,
				this.finish_days_str,
         this.budget_range,
        this.budget_range_min,
        this.budget_range_min_str,
        this.budget_range_max,
        this.budget_range_max_str,
        this.budget_range_str,
				this.channels_id,
				this.channels_str,
				this.channels_url,

  );
    factory ModelActionPublishProjectMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionPublishProjectMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPublishProjectMyProjectsToJson(this);

}



class PublishProjectMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	PublishProjectMyProjectsBase(this.json){
		model = PublishProjectMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataPublishProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllPublishProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postPublishProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postPublishProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataPublishProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('PublishProject')){
										my_projects.deleteAllPublishProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllPublishProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postPublishProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postPublishProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'PublishProject';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postPublishProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postPublishProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postPublishProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postPublishProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postPublishProjectResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postPublishProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postPublishProjectResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postPublishProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postPublishProjectResult, state, sendPath, id,  title )
	    )
	 );
   }






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
										Widget viewFinishDays (BuildContext context) {
								return(  NumberView(
									value: model.model.finish_days,
									caption: 'Finish Days',
								));}
										Widget viewBudgetRange (BuildContext context) {
								return(  StringView(
									value: model.model.budget_range_str,
									caption: 'Budget Range'
								));}

							Widget viewChannels (BuildContext context) {
							return( 	ChannelRouteTagsWidget(
										value: model.model.channels_id,
										caption: '',
										hint: ' ',
										required: true,
										idroutetags: model.model.channels_id,
										nameroutetags: model.model.channels_str,
										urlroutetags: model.model.channels_url,
										getValue: (String?   val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));}


}


@JsonSerializable()
class PublishProjectMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPublishProjectMyProjects? model;
  PublishProjectMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory PublishProjectMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$PublishProjectMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PublishProjectMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionCancelProjectMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   description;
	   String?   attachments_url;
	   String?   attachments_name;
	  List<FileField?>? attachments;
	  int? finish_days;
	  String?   finish_days_str;
    String?   budget_range;
    double?   budget_range_min;
    String?   budget_range_min_str;
    double?   budget_range_max;
    String?   budget_range_max_str;
    String?   budget_range_str;
	  List<int?>? channels_id;
	  List<String?>?   channels_str;
	  List<String?>?  channels_url;


	  ModelActionCancelProjectMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.description,
				this.attachments,
				this.attachments_url,
				this.attachments_name,
				this.finish_days,
				this.finish_days_str,
         this.budget_range,
        this.budget_range_min,
        this.budget_range_min_str,
        this.budget_range_max,
        this.budget_range_max_str,
        this.budget_range_str,
				this.channels_id,
				this.channels_str,
				this.channels_url,

  );
    factory ModelActionCancelProjectMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionCancelProjectMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionCancelProjectMyProjectsToJson(this);

}



class CancelProjectMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	CancelProjectMyProjectsBase(this.json){
		model = CancelProjectMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataCancelProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCancelProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCancelProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postCancelProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataCancelProject(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('CancelProject')){
										my_projects.deleteAllCancelProjectMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCancelProjectMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCancelProjectMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postCancelProjectMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'CancelProject';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCancelProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelProjectResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCancelProjectResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelProjectResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postCancelProjectResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelProjectResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postCancelProjectResult, state, sendPath, id,  title )
	    )
	 );
   }






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
										Widget viewFinishDays (BuildContext context) {
								return(  NumberView(
									value: model.model.finish_days,
									caption: 'Finish Days',
								));}
										Widget viewBudgetRange (BuildContext context) {
								return(  StringView(
									value: model.model.budget_range_str,
									caption: 'Budget Range'
								));}

							Widget viewChannels (BuildContext context) {
							return( 	ChannelRouteTagsWidget(
										value: model.model.channels_id,
										caption: '',
										hint: ' ',
										required: true,
										idroutetags: model.model.channels_id,
										nameroutetags: model.model.channels_str,
										urlroutetags: model.model.channels_url,
										getValue: (String?   val) {
										//  Navigator.pushReplacementNamed(context, "/projectscoid");
										  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
										},
									  ));}


}


@JsonSerializable()
class CancelProjectMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionCancelProjectMyProjects? model;
  CancelProjectMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory CancelProjectMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$CancelProjectMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelProjectMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionAcceptOrRejectWorkMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
  String?   message;
   String?   attachments_url;
  String?   attachments_name;
  List<FileField?>? attachments;


	  ModelActionAcceptOrRejectWorkMyProjects(
            this.id,
			this.project_id,
			this.message,
			this.attachments,
			this.attachments_url,
			this.attachments_name,

  );
    factory ModelActionAcceptOrRejectWorkMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionAcceptOrRejectWorkMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAcceptOrRejectWorkMyProjectsToJson(this);

}



class AcceptOrRejectWorkMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	AcceptOrRejectWorkMyProjectsBase(this.json){
		model = AcceptOrRejectWorkMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}




  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }




  Future<int?> _getRateCountSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('apprate_count')) {
      return prefs.getInt('apprate_count');
    } else {
      return 0;
    }
  }

  Future<void> _setRateCountSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_count', i);
  }


Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
  ic = Icons.send;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                _onWidgetDidBuild(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Mohon tunggu beberapa saat lagi!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                });
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataAcceptOrRejectWork(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllAcceptOrRejectWorkMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postAcceptOrRejectWorkMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
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


                    ScaffoldMessenger.of(context).hideCurrentSnackBar();

									    if(button.text!.contains('Revision')){
										Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
										  );
										}else{

                        var x = await _getRateCountSF();
                        // l.log('aku getRateCountSF ${x.toString()}');
                        if(x == 0){
                          await showDialog(
                              context: context,
                              builder: (context) =>
                              AlertDialog(
                                title: Text('App Ratting',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async{
                                      await _setRateCountSF(1);
                                      if (await canLaunch(
                                          'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                        await launch(
                                            'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                      } else {
                                        throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                      }
                                      Navigator.of(context).pop(true);
                                    },

                                    child: Text('Rate'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child: Text('Nanti'),
                                  ),


                                ],
                              ),
                                     );
                                     }else{
                                     await _setRateCountSF(1);
                                     }

                                     Navigator.pushAndRemoveUntil(
											context,
											MaterialPageRoute(builder: (context) => rt.RateWorkerMyProjects(id :  id!, title: 'zzzz')),
												(Route<dynamic> route) => false,
										  );
										}



                      });
                      }else{
                      final future = my_projects.postAcceptOrRejectWorkMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error)async{					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                       // AppProvider.getRouter(context)!.pop(context);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
										   if(button.text!.contains('Revision')){
										Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
										  );
										}else{
                         var x = await _getRateCountSF();
                         // l.log('aku getRateCountSF ${x.toString()}');
                         if(x == 0){
                           await showDialog(
                             context: context,
                             builder: (context) =>
                                 AlertDialog(
                                   title: Text('App Ratting',
                                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                   content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                   actions: <Widget>[
                                     TextButton(
                                       onPressed: () async{
                                         await _setRateCountSF(1);
                                         if (await canLaunch(
                                             'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                           await launch(
                                               'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                         } else {
                                           throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                         }
                                         Navigator.of(context).pop(true);
                                       },

                                       child: Text('Rate'),
                                     ),
                                     TextButton(
                                       onPressed: () => Navigator.of(context).pop(false),
                                       child: Text('Nanti'),
                                     ),


                                   ],
                                 ),
                           );
                         }else{
                           await _setRateCountSF(1);
                         }

                         Navigator.pushAndRemoveUntil(
											context,
											MaterialPageRoute(builder: (context) => rt.RateWorkerMyProjects(id :  id!, title: 'zzzz')),
												(Route<dynamic> route) => false,
										  );
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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataAcceptOrRejectWork(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('AcceptOrRejectWork')){
										my_projects.deleteAllAcceptOrRejectWorkMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllAcceptOrRejectWorkMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postAcceptOrRejectWorkMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

										 if(button.text!.contains('Revision')){
										Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
										  );
										}else{
 											Navigator.pushAndRemoveUntil(
											context,
											MaterialPageRoute(builder: (context) => rt.RateWorkerMyProjects(id :  id!, title: 'zzzz')),
												(Route<dynamic> route) => false,
										  );
										}


                      });
                      }else{
                      final future = my_projects.postAcceptOrRejectWorkMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                         // AppProvider.getRouter(context)!.pop(context);

										if(button.text!.contains('Revision')){
										Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
										  );
										}else{
 											Navigator.pushAndRemoveUntil(
											context,
											MaterialPageRoute(builder: (context) => rt.RateWorkerMyProjects(id :  id!, title: 'zzzz')),
												(Route<dynamic> route) => false,
										  );
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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'AcceptOrRejectWork';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[message]": "${model.model.message }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOrRejectWorkResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postAcceptOrRejectWorkResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOrRejectWorkResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postAcceptOrRejectWorkResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOrRejectWorkResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOrRejectWorkResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postAcceptOrRejectWorkResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOrRejectWorkResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postAcceptOrRejectWorkResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget editMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));}


}


@JsonSerializable()
class AcceptOrRejectWorkMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAcceptOrRejectWorkMyProjects? model;
  AcceptOrRejectWorkMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory AcceptOrRejectWorkMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$AcceptOrRejectWorkMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOrRejectWorkMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionRateWorkerMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   short_description;
	  int? accepted_worker_id;
	  String?   accepted_worker_str;
	  String?   accepted_worker_url;
	  List<int?>? accepted_worker_list;
	  List<String?>?  accepted_worker_list_str;
  int? work_quality;
  int? expertise;
  int? worker_communication;
  int? worker_professionalism;
  String?   worker_feedback;
  String?   testimonial_for_projects_co_id;
  String?   testimony;


	  ModelActionRateWorkerMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.short_description,
				this.accepted_worker_id,
				this.accepted_worker_str,
				this.accepted_worker_url,
				this.accepted_worker_list,
				this.accepted_worker_list_str,
			this.work_quality,
			this.expertise,
			this.worker_communication,
			this.worker_professionalism,
			this.worker_feedback,
			this.testimonial_for_projects_co_id,
			this.testimony,

  );
    factory ModelActionRateWorkerMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionRateWorkerMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRateWorkerMyProjectsToJson(this);

}



class RateWorkerMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	RateWorkerMyProjectsBase(this.json){
		model = RateWorkerMyProjectsSuperBase.fromJson(this.json);
	}

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


  Future<int?> _getRateCountSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('apprate_count')) {
      return prefs.getInt('apprate_count');
    } else {
      return 0;
    }
  }

  Future<void> _setRateCountSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_count', i);
  }

Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{


                _onWidgetDidBuild(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Mohon tunggu beberapa saat lagi!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                });
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataRateWorker(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRateWorkerMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postRateWorkerMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error)async{					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                       // AppProvider.getRouter(context)!.pop(context);


                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                   var x = await _getRateCountSF();
                                   // l.log('aku getRateCountSF ${x.toString()}');
                                   if(x == 0){
                                     await showDialog(
                                         context: context,
                                         builder: (context) =>
                                         AlertDialog(
                                           title: Text('App Ratting',
                                             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                           content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                           actions: <Widget>[
                                             TextButton(
                                               onPressed: () async{
                                                 await _setRateCountSF(1);
                                                 if (await canLaunch(
                                                     'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                                   await launch(
                                                       'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                                 } else {
                                                   throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                                 }
                                                 Navigator.of(context).pop(true);
                                               },

                                               child: Text('Rate'),
                                             ),
                                             TextButton(
                                               onPressed: () => Navigator.of(context).pop(false),
                                               child: Text('Nanti'),
                                             ),


                                           ],
                                         ),
                                     );
                                     }else{
                                     await _setRateCountSF(1);
                                     }

                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postRateWorkerMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error)async{					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                       // AppProvider.getRouter(context)!.pop(context);

                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                   var x = await _getRateCountSF();
                                   // l.log('aku getRateCountSF ${x.toString()}');
                                   if(x == 0){
                                     await showDialog(
                                       context: context,
                                       builder: (context) =>
                                           AlertDialog(
                                             title: Text('App Ratting',
                                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                             content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                             actions: <Widget>[
                                               TextButton(
                                                 onPressed: () async{
                                                   await _setRateCountSF(1);
                                                   if (await canLaunch(
                                                       'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                                     await launch(
                                                         'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                                   } else {
                                                     throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                                   }
                                                   Navigator.of(context).pop(true);
                                                 },

                                                 child: Text('Rate'),
                                               ),
                                               TextButton(
                                                 onPressed: () => Navigator.of(context).pop(false),
                                                 child: Text('Nanti'),
                                               ),


                                             ],
                                           ),
                                     );
                                   }else{
                                     await _setRateCountSF(1);
                                   }

                                   Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataRateWorker(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('RateWorker')){
										my_projects.deleteAllRateWorkerMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRateWorkerMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postRateWorkerMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postRateWorkerMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'RateWorker';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[work_quality]": "${model.model.work_quality }",
  "project[expertise]": "${model.model.expertise }",
  "project[worker_communication]": "${model.model.worker_communication }",
  "project[worker_professionalism]": "${model.model.worker_professionalism }",
  "project[worker_feedback]": "${model.model.worker_feedback }",
  "project[testimony]": "${model.model.testimony }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateWorkerResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRateWorkerResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateWorkerResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRateWorkerResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateWorkerResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateWorkerResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postRateWorkerResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateWorkerResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postRateWorkerResult, state, sendPath, id,  title )
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
										Widget viewAcceptedWorker (BuildContext context) {
								return(
								   StringView(
									value: model.model.accepted_worker_str,
									caption: 'Accepted Worker',
								));
								 }
										Widget editWorkQuality (State state) {
								  return(
								RatingWidget(
								  value: model.model.work_quality,
								  caption: 'Work Quality',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.work_quality = val;
									});
								  },
								));}
										Widget editExpertise (State state) {
								  return(
								RatingWidget(
								  value: model.model.expertise,
								  caption: 'Expertise',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.expertise = val;
									});
								  },
								));}
										Widget editWorkerCommunication (State state) {
								  return(
								RatingWidget(
								  value: model.model.worker_communication,
								  caption: 'Worker Communication',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.worker_communication = val;
									});
								  },
								));}
										Widget editWorkerProfessionalism (State state) {
								  return(
								RatingWidget(
								  value: model.model.worker_professionalism,
								  caption: 'Worker Professionalism',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.worker_professionalism = val;
									});
								  },
								));}
										Widget editWorkerFeedback (State state) {
								  return(
								ArticleWidget(
								  value: model.model.worker_feedback,
								  caption: 'Worker Feedback',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.worker_feedback = val;
									});
								  },
								));}
										Widget editTestimony (State state) {
								  return(
								ArticleWidget(
								  value: model.model.testimony,
								  caption: 'Testimony',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.testimony = val;
									});
								  },
								));}


}


@JsonSerializable()
class RateWorkerMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRateWorkerMyProjects? model;
  RateWorkerMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory RateWorkerMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$RateWorkerMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RateWorkerMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionReportProgressMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   description;
	  int? finish_days;
	  String?   finish_days_str;
	  double?   accepted_budget;
	  String?   accepted_budget_str;
  int? progress;


	  ModelActionReportProgressMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.description,
				this.finish_days,
				this.finish_days_str,
				this.accepted_budget,
				this.accepted_budget_str,
			this.progress,

  );
    factory ModelActionReportProgressMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionReportProgressMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionReportProgressMyProjectsToJson(this);

}



class ReportProgressMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	ReportProgressMyProjectsBase(this.json){
		model = ReportProgressMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataReportProgress(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllReportProgressMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postReportProgressMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postReportProgressMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataReportProgress(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('ReportProgress')){
										my_projects.deleteAllReportProgressMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllReportProgressMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postReportProgressMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postReportProgressMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'ReportProgress';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[progress]": "${model.model.progress }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportProgressResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postReportProgressResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportProgressResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postReportProgressResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportProgressResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportProgressResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postReportProgressResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportProgressResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postReportProgressResult, state, sendPath, id,  title )
	    )
	 );
   }






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
										Widget viewFinishDays (BuildContext context) {
								return(  NumberView(
									value: model.model.finish_days,
									caption: 'Finish Days',
								));}
										Widget viewAcceptedBudget (BuildContext context) {
								return(  MoneyView(
									value: model.model.accepted_budget,
									caption: 'Accepted Budget',
								));}
										Widget editProgress (State state) {
								  return(
								PercentWidget(
								  value: model.model.progress,
								  caption: 'Progress',
								  hint: 'Isi dengan Double Anda',
								  required: false,
								  min:'0.0',
								  max:'100.0',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.progress = val;
									});
								  },
								));}


}


@JsonSerializable()
class ReportProgressMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionReportProgressMyProjects? model;
  ReportProgressMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory ReportProgressMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$ReportProgressMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportProgressMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionWeeklyReportMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
  String?   message;
   String?   attachments_url;
  String?   attachments_name;
  List<FileField?>? attachments;


	  ModelActionWeeklyReportMyProjects(
            this.id,
			this.project_id,
			this.message,
			this.attachments,
			this.attachments_url,
			this.attachments_name,

  );
    factory ModelActionWeeklyReportMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionWeeklyReportMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionWeeklyReportMyProjectsToJson(this);

}



class WeeklyReportMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	WeeklyReportMyProjectsBase(this.json){
		model = WeeklyReportMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
                 style: ButtonStyle(
                   shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                   backgroundColor:
                   MaterialStateProperty.all<Color>(cl),
                   overlayColor: MaterialStateProperty.all<Color>(cl),
                 ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataWeeklyReport(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllWeeklyReportMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postWeeklyReportMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postWeeklyReportMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataWeeklyReport(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('WeeklyReport')){
										my_projects.deleteAllWeeklyReportMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllWeeklyReportMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postWeeklyReportMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postWeeklyReportMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'WeeklyReport';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[message]": "${model.model.message }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postWeeklyReportResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postWeeklyReportResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postWeeklyReportResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postWeeklyReportResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postWeeklyReportResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postWeeklyReportResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postWeeklyReportResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postWeeklyReportResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postWeeklyReportResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget editMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));}


}


@JsonSerializable()
class WeeklyReportMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionWeeklyReportMyProjects? model;
  WeeklyReportMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory WeeklyReportMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$WeeklyReportMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyReportMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionReportDoneMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
  String?   message;
   String?   attachments_url;
  String?   attachments_name;
  List<FileField?>? attachments;


	  ModelActionReportDoneMyProjects(
            this.id,
			this.project_id,
			this.message,
			this.attachments,
			this.attachments_url,
			this.attachments_name,

  );
    factory ModelActionReportDoneMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionReportDoneMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionReportDoneMyProjectsToJson(this);

}



class ReportDoneMyProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;
	ReportDoneMyProjectsBase(this.json){
		model = ReportDoneMyProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created,
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataReportDone(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllReportDoneMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postReportDoneMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postReportDoneMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataReportDone(button.text!, model
											,  attachmentslast
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('ReportDone')){
										my_projects.deleteAllReportDoneMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllReportDoneMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postReportDoneMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postReportDoneMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'ReportDone';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
	String?   attachments = '';
  String?   attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';

  	}
	}
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[message]": "${model.model.message }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportDoneResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postReportDoneResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportDoneResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postReportDoneResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportDoneResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportDoneResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postReportDoneResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postReportDoneResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postReportDoneResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget editMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));}


}


@JsonSerializable()
class ReportDoneMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionReportDoneMyProjects? model;
  ReportDoneMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory ReportDoneMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$ReportDoneMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDoneMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionRateOwnerMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   short_description;
	  int? owner_id;
	  String?   owner_str;
	  String?   owner_url;
	  List<int?>? owner_list;
	  List<String?>?  owner_list_str;
  int? clarity;
  int? friendliness;
  int? owner_communication;
  int? owner_professionalism;
  String?   owner_feedback;
  String?   testimonial_for_projects_co_id;
  String?   testimony;


	  ModelActionRateOwnerMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.short_description,
				this.owner_id,
				this.owner_str,
				this.owner_url,
				this.owner_list,
				this.owner_list_str,
			this.clarity,
			this.friendliness,
			this.owner_communication,
			this.owner_professionalism,
			this.owner_feedback,
			this.testimonial_for_projects_co_id,
			this.testimony,

  );
    factory ModelActionRateOwnerMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionRateOwnerMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRateOwnerMyProjectsToJson(this);

}



class RateOwnerMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	RateOwnerMyProjectsBase(this.json){
		model = RateOwnerMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataRateOwner(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRateOwnerMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postRateOwnerMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postRateOwnerMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataRateOwner(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('RateOwner')){
										my_projects.deleteAllRateOwnerMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRateOwnerMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postRateOwnerMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postRateOwnerMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'RateOwner';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[clarity]": "${model.model.clarity }",
  "project[friendliness]": "${model.model.friendliness }",
  "project[owner_communication]": "${model.model.owner_communication }",
  "project[owner_professionalism]": "${model.model.owner_professionalism }",
  "project[owner_feedback]": "${model.model.owner_feedback }",
  "project[testimony]": "${model.model.testimony }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateOwnerResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRateOwnerResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateOwnerResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRateOwnerResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateOwnerResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateOwnerResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postRateOwnerResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRateOwnerResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postRateOwnerResult, state, sendPath, id,  title )
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
										Widget viewOwner (BuildContext context) {
								return(
								   StringView(
									value: model.model.owner_str,
									caption: 'Owner',
								));
								 }
										Widget editClarity (State state) {
								  return(
								RatingWidget(
								  value: model.model.clarity,
								  caption: 'Clarity',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.clarity = val;
									});
								  },
								));}
										Widget editFriendliness (State state) {
								  return(
								RatingWidget(
								  value: model.model.friendliness,
								  caption: 'Friendliness',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.friendliness = val;
									});
								  },
								));}
										Widget editOwnerCommunication (State state) {
								  return(
								RatingWidget(
								  value: model.model.owner_communication,
								  caption: 'Owner Communication',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.owner_communication = val;
									});
								  },
								));}
										Widget editOwnerProfessionalism (State state) {
								  return(
								RatingWidget(
								  value: model.model.owner_professionalism,
								  caption: 'Owner Professionalism',
								  hint: 'isi dengan Rating diatas.',
								  required: true,
								  getValue:(int? val) {
									state.setState(() {
									  model.model.owner_professionalism = val;
									});
								  },
								));}
										Widget editOwnerFeedback (State state) {
								  return(
								ArticleWidget(
								  value: model.model.owner_feedback,
								  caption: 'Owner Feedback',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.owner_feedback = val;
									});
								  },
								));}
										Widget editTestimony (State state) {
								  return(
								ArticleWidget(
								  value: model.model.testimony,
								  caption: 'Testimony',
								  hint: 'isi dengan Article Anda',
								  required: false,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.testimony = val;
									});
								  },
								));}


}


@JsonSerializable()
class RateOwnerMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRateOwnerMyProjects? model;
  RateOwnerMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory RateOwnerMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$RateOwnerMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RateOwnerMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionFileArbitrationMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   project_title;
	  String?   project_owner;
	  String?   project_worker;
  String?   problem_description;
  String?   your_wishes;
  String?   your_offer;
	  double?   budget;
	  String?   budget_str;
  double?   worker_receives;
  double?   owner_receives;


	  ModelActionFileArbitrationMyProjects(
            this.id,
			this.project_id,
        this.project_title,
        this.project_owner,
        this.project_worker,
			this.problem_description,
			this.your_wishes,
			this.your_offer,
				this.budget,
				this.budget_str,
			this.worker_receives,
			this.owner_receives,

  );
    factory ModelActionFileArbitrationMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionFileArbitrationMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionFileArbitrationMyProjectsToJson(this);

}



class FileArbitrationMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	FileArbitrationMyProjectsBase(this.json){
		model = FileArbitrationMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataFileArbitration(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllFileArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')) {


                       // if (this.model.model.worker_receives == 0.0 &&
                      //      this.model.model.owner_receives == 0.0) {

                      //  } else {
                        final future = my_projects
                            .postFileArbitrationMyProjectsWithID();
                         future.then((value) {
								 
                          // state.setState(() {
                          postMyProjectsResult = value;
                          //  });
                        }).catchError((Error) {
                          // AppProvider.getRouter(context)!.pop(context);



                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  rt.UserMyProjectsListing(id: id!)),
                                  (Route<dynamic> route) => false,
                            );

                        });
                     // }
                      }else{
                      //  if(this.model.model.worker_receives == 0.0 && this.model.model.owner_receives == 0.0){

                      //  }else {
                          final future = my_projects
                              .postFileArbitrationMyProjects();
                           future.then((value) {
								 
                            //state.setState(() {
                            postMyProjectsResult = value;
                            //});
                          }).catchError((Error) {
                            // AppProvider.getRouter(context)!.pop(context);


                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  rt.UserMyProjectsListing(id: id!)),
                                  (Route<dynamic> route) => false,
                            );
                          });
                       // }
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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataFileArbitration(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('FileArbitration')){
										my_projects.deleteAllFileArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllFileArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postFileArbitrationMyProjectsWithID();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postFileArbitrationMyProjects();
                                   future.then((value) {
								 
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'FileArbitration';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[problem_description]": "${model.model.problem_description }",
  "project[your_wishes]": "${model.model.your_wishes }",
  "project[worker_receives]": "${model.model.worker_receives }",
  "project[owner_receives]": "${model.model.owner_receives }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postFileArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postFileArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postFileArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postFileArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postFileArbitrationResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postFileArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postFileArbitrationResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postFileArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postFileArbitrationResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget viewProjectTitle (BuildContext context) {
							    if(model.model.project_title == null || model.model.project_title == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_title,
									caption: 'Project Title',
								));
								}

								}
										Widget viewProjectOwner (BuildContext context) {
							    if(model.model.project_owner == null || model.model.project_owner == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_owner,
									caption: 'Project Owner',
								));
								}

								}
										Widget viewProjectWorker (BuildContext context) {
							    if(model.model.project_worker == null || model.model.project_worker == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_worker,
									caption: 'Project Worker',
								));
								}

								}
										Widget editProblemDescription (State state) {
								  return(
								ArticleWidget(
								  value: model.model.problem_description,
								  caption: 'Problem Description',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.problem_description = val;
									});
								  },
								));}
										Widget editYourWishes (State state) {
								  return(
								ArticleWidget(
								  value: model.model.your_wishes,
								  caption: 'Your Wishes',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.your_wishes = val;
									});
								  },
								));}
										Widget viewBudget (BuildContext context) {
								return(  MoneyView(
									value: model.model.budget,
									caption: 'Budget',
								));}
										Widget editWorkerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.worker_receives,
								  caption: 'Worker Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.worker_receives = val;
									});
								  },
								));}
										Widget editOwnerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.owner_receives,
								  caption: 'Owner Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.owner_receives = val;
									});
								  },
								));}


}


@JsonSerializable()
class FileArbitrationMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionFileArbitrationMyProjects? model;
  FileArbitrationMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory FileArbitrationMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$FileArbitrationMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$FileArbitrationMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionNewOfferMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   project_title;
	  String?   project_owner;
	  String?   project_worker;
	  double?   budget;
	  String?   budget_str;
  double?   worker_receives;
  double?   owner_receives;


	  ModelActionNewOfferMyProjects(
            this.id,
			this.project_id,
        this.project_title,
        this.project_owner,
        this.project_worker,
				this.budget,
				this.budget_str,
			this.worker_receives,
			this.owner_receives,

  );
    factory ModelActionNewOfferMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionNewOfferMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionNewOfferMyProjectsToJson(this);

}



class NewOfferMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	NewOfferMyProjectsBase(this.json){
		model = NewOfferMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                    //Map<String, dynamic> res = model.toJson();
                                    //print('json result == $res');
                                    var formData = await convertFormDataNewOffer(
                                        button.text!, model
                                    );
                                    my_projects = MyProjectsController(
                                        AppProvider.getApplication(context),
                                        sendPath,
                                        AppAction.post,
                                        id,
                                        title,
                                        formData,
                                        false);
                                    if ([ 'PlaceNewBid'].contains('NewOffer')) {
                                      my_projects.deleteAllNewOfferMyProjects(
                                          this.model.model.project_title);
                                    } else
                                    if (['AskOwner'].contains('NewOffer')) {
                                      my_projects.deleteAllNewOfferMyProjects(
                                          this.model.model.project_id
                                              .toString());
                                    } else
                                    if (['HireMe'].contains('NewOffer')) {
                                      my_projects.deleteAllNewOfferMyProjects(
                                          this.model.model.private_worker_id
                                              .toString());
                                    } else
                                    if (['InviteToBid'].contains('NewOffer')) {
                                      my_projects.deleteAllNewOfferMyProjects(
                                          this.model.model.user_id);
                                    } else {
                                      my_projects.deleteAllNewOfferMyProjects(
                                          '');
                                    }
                                    if (sendPath!.contains('%s')) {
                                     // if (this.model.model.worker_receives ==
                                      //    0.0 &&
                                       //   this.model.model.owner_receives ==
                                      //        0.0) {

                                     // } else {
                                        final future = my_projects
                                            .postNewOfferMyProjectsWithID();
                                         future.then((value) {
                                    /*       
								                   */
                                          state.setState(() {
                                            postMyProjectsResult = value;
                                            print('error3 ${value.toString()}');
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  AlertDialog(
                                                    title: Text('Please Check Your Input',
                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                    content: Text('Worker Received atau Owner Received harus diisi.'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {

                                                           Navigator.pop(context);},
                                                        /*Navigator.of(context).pop(true)*/
                                                        child: Text('OK'),
                                                      ),

                                                    ],
                                                  ),
                                            );
                                          });
                                        }).catchError((Error) {
                                          // AppProvider.getRouter(context)!.pop(context);

                                          print('error1 ${Error.toString()}');
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (
                                                context) =>
                                                rt.UserMyProjectsListing(
                                                    id: id!)),
                                                (Route<dynamic> route) => false,
                                          );
                                        });
                                     // }
                                    } else {
                                    //  if (this.model.model.worker_receives == 0.0 &&
                                     //     this.model.model.owner_receives == 0.0) {

                                     // } else{
                                      final future = my_projects
                                          .postNewOfferMyProjects();
                                       future.then((value) {
                                         /*
								                   
                                    
                                          */
                                        state.setState(() {
                                          postMyProjectsResult = value;
                                        });
                                        print('error2 ${value.toSrting()}');
                                      }).catchError((Error) {
                                        // AppProvider.getRouter(context)!.pop(context);
                                        print('error1 ${Error.toSrting()}');

                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  rt.UserMyProjectsListing(
                                                      id: id!)),
                                              (Route<dynamic> route) => false,
                                        );
                                      });
                                   // }
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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataNewOffer(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('NewOffer')){
										my_projects.deleteAllNewOfferMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('NewOffer')){
										my_projects.deleteAllNewOfferMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('NewOffer')){
										my_projects.deleteAllNewOfferMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('NewOffer')){
										my_projects.deleteAllNewOfferMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllNewOfferMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postNewOfferMyProjectsWithID();
                                   future.then((value) {
                                     /*
								                
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postNewOfferMyProjects();
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
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'NewOffer';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[worker_receives]": "${model.model.worker_receives }",
  "project[owner_receives]": "${model.model.owner_receives }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postNewOfferResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postNewOfferResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postNewOfferResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postNewOfferResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postNewOfferResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postNewOfferResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postNewOfferResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postNewOfferResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postNewOfferResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget viewProjectTitle (BuildContext context) {
							    if(model.model.project_title == null || model.model.project_title == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_title,
									caption: 'Project Title',
								));
								}

								}
										Widget viewProjectOwner (BuildContext context) {
							    if(model.model.project_owner == null || model.model.project_owner == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_owner,
									caption: 'Project Owner',
								));
								}

								}
										Widget viewProjectWorker (BuildContext context) {
							    if(model.model.project_worker == null || model.model.project_worker == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_worker,
									caption: 'Project Worker',
								));
								}

								}
										Widget viewBudget (BuildContext context) {
								return(  MoneyView(
									value: model.model.budget,
									caption: 'Budget',
								));}
										Widget editWorkerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.worker_receives,
								  caption: 'Worker Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.worker_receives = val;
									});
								  },
								));}
										Widget editOwnerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.owner_receives,
								  caption: 'Owner Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.owner_receives = val;
									});
								  },
								));}


}


@JsonSerializable()
class NewOfferMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionNewOfferMyProjects? model;
  NewOfferMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory NewOfferMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$NewOfferMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$NewOfferMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionAcceptOfferMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   bid_id;
	  int? project_id;
	  String?   project_str;
	  String?   project_url;
	  List<int?>? project_list;
	  List<String?>?  project_list_str;
	  DateTime?  requested_date;
	  int? type_id;
	  String?   type_str;
	  List<int?>? type_list;
	  List<String?>?  type_list_str;
	  int? plaintiff_id;
	  String?   plaintiff_str;
	  String?   plaintiff_url;
	  List<int?>? plaintiff_list;
	  List<String?>?  plaintiff_list_str;
	  int? defendant_id;
	  String?   defendant_str;
	  String?   defendant_url;
	  List<int?>? defendant_list;
	  List<String?>?  defendant_list_str;
	  double?   worker_receives;
	  String?   worker_receives_str;
	  double?   owner_receives;
	  String?   owner_receives_str;


	  ModelActionAcceptOfferMyProjects(
            this.id,
			this.bid_id,
				this.project_id,
				this.project_str,
				this.project_url,
				this.project_list,
				this.project_list_str,
        this.requested_date,
				this.type_id,
				this.type_str,
				this.type_list,
				this.type_list_str,
				this.plaintiff_id,
				this.plaintiff_str,
				this.plaintiff_url,
				this.plaintiff_list,
				this.plaintiff_list_str,
				this.defendant_id,
				this.defendant_str,
				this.defendant_url,
				this.defendant_list,
				this.defendant_list_str,
				this.worker_receives,
				this.worker_receives_str,
				this.owner_receives,
				this.owner_receives_str,

  );
    factory ModelActionAcceptOfferMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionAcceptOfferMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAcceptOfferMyProjectsToJson(this);

}



class AcceptOfferMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	AcceptOfferMyProjectsBase(this.json){
		model = AcceptOfferMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataAcceptOffer(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllAcceptOfferMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postAcceptOfferMyProjectsWithID();
                                   future.then((value) {
                                     /*
								              
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postAcceptOfferMyProjects();
                                   future.then((value) {
                                     /*
								               
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataAcceptOffer(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('AcceptOffer')){
										my_projects.deleteAllAcceptOfferMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllAcceptOfferMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postAcceptOfferMyProjectsWithID();
                                   future.then((value) {
                                     /*
								               
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postAcceptOfferMyProjects();
                                   future.then((value) {
                                     /*
								                
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'AcceptOffer';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOfferResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postAcceptOfferResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOfferResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postAcceptOfferResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOfferResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOfferResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postAcceptOfferResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postAcceptOfferResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postAcceptOfferResult, state, sendPath, id,  title )
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
										Widget viewRequestedDate (BuildContext context) {
								return(  DateTimeView(
									value: model.model.requested_date,
									caption: 'Requested Date',
								));}
									Widget viewType (BuildContext context) {
								 return(
								   StringView(
									value: model.model.type_str,
									caption: 'Type',
								));}
										Widget viewPlaintiff (BuildContext context) {
								return(
								   StringView(
									value: model.model.plaintiff_str,
									caption: 'Plaintiff',
								));
								 }
										Widget viewDefendant (BuildContext context) {
								return(
								   StringView(
									value: model.model.defendant_str,
									caption: 'Defendant',
								));
								 }
										Widget viewWorkerReceives (BuildContext context) {
								return(  MoneyView(
									value: model.model.worker_receives,
									caption: 'Worker Receives',
								));}
										Widget viewOwnerReceives (BuildContext context) {
								return(  MoneyView(
									value: model.model.owner_receives,
									caption: 'Owner Receives',
								));}


}


@JsonSerializable()
class AcceptOfferMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAcceptOfferMyProjects? model;
  AcceptOfferMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory AcceptOfferMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$AcceptOfferMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOfferMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionRespondArbitrationMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   project_title;
	  String?   project_owner;
	  String?   project_worker;
	  DateTime?  requested_date;
	  int? plaintiff_id;
	  String?   plaintiff_str;
	  String?   plaintiff_url;
	  List<int?>? plaintiff_list;
	  List<String?>?  plaintiff_list_str;
	  String?   plaintiff_description;
	  String?   plaintiff_wishes;
  String?   problem_description;
  String?   your_wishes;
	  String?   your_offer;
	  double?   budget;
	  String?   budget_str;
  double?   worker_receives;
  double?   owner_receives;


	  ModelActionRespondArbitrationMyProjects(
            this.id,
			this.project_id,
        this.project_title,
        this.project_owner,
        this.project_worker,
        this.requested_date,
				this.plaintiff_id,
				this.plaintiff_str,
				this.plaintiff_url,
				this.plaintiff_list,
				this.plaintiff_list_str,
        this.plaintiff_description,
        this.plaintiff_wishes,
			this.problem_description,
			this.your_wishes,
        this.your_offer,
				this.budget,
				this.budget_str,
			this.worker_receives,
			this.owner_receives,

  );
    factory ModelActionRespondArbitrationMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionRespondArbitrationMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRespondArbitrationMyProjectsToJson(this);

}



class RespondArbitrationMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	RespondArbitrationMyProjectsBase(this.json){
		model = RespondArbitrationMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataRespondArbitration(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRespondArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                       // if (this.model.model.worker_receives == 0.0 &&
                       //     this.model.model.owner_receives == 0.0) {

                       // } else {
                          final future = my_projects
                              .postRespondArbitrationMyProjectsWithID();
                           future.then((value) {
                             /*
								         
                                    
                              */
                            state.setState(() {
                              postMyProjectsResult = value;
                            });
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: Text('Please Check Your Input',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    content: Text('Worker Received atau Owner Received harus diisi.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {

                                          Navigator.pop(context);},
                                        /*Navigator.of(context).pop(true)*/
                                        child: Text('OK'),
                                      ),

                                    ],
                                  ),
                            );
                          }).catchError((Error) {
                            // AppProvider.getRouter(context)!.pop(context);


                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  rt.UserMyProjectsListing(id: id!)),
                                  (Route<dynamic> route) => false,
                            );
                          });
                       // }
                      }else {
                       // if (this.model.model.worker_receives == 0.0 &&
                       //     this.model.model.owner_receives == 0.0) {

                       // } else {
                          final future = my_projects
                              .postRespondArbitrationMyProjects();
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
                              postMyProjectsResult = value;
                            });
                          }).catchError((Error) {
                            // AppProvider.getRouter(context)!.pop(context);


                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  rt.UserMyProjectsListing(id: id!)),
                                  (Route<dynamic> route) => false,
                            );
                          });
                      //  }
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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataRespondArbitration(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('RespondArbitration')){
										my_projects.deleteAllRespondArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllRespondArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postRespondArbitrationMyProjectsWithID();
                                   future.then((value) {
                                     /*
								                 
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postRespondArbitrationMyProjects();
                                   future.then((value) {
                                     /*
								                 
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'RespondArbitration';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[problem_description]": "${model.model.problem_description }",
  "project[your_wishes]": "${model.model.your_wishes }",
  "project[worker_receives]": "${model.model.worker_receives }",
  "project[owner_receives]": "${model.model.owner_receives }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRespondArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRespondArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRespondArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postRespondArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRespondArbitrationResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRespondArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postRespondArbitrationResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postRespondArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postRespondArbitrationResult, state, sendPath, id,  title )
	    )
	 );
   }






										Widget viewProjectTitle (BuildContext context) {
							    if(model.model.project_title == null || model.model.project_title == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_title,
									caption: 'Project Title',
								));
								}

								}
										Widget viewProjectOwner (BuildContext context) {
							    if(model.model.project_owner == null || model.model.project_owner == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_owner,
									caption: 'Project Owner',
								));
								}

								}
										Widget viewProjectWorker (BuildContext context) {
							    if(model.model.project_worker == null || model.model.project_worker == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_worker,
									caption: 'Project Worker',
								));
								}

								}
										Widget viewRequestedDate (BuildContext context) {
								return(  DateTimeView(
									value: model.model.requested_date,
									caption: 'Requested Date',
								));}
										Widget viewPlaintiff (BuildContext context) {
								return(
								   StringView(
									value: model.model.plaintiff_str,
									caption: 'Plaintiff',
								));
								 }
										Widget viewPlaintiffDescription (BuildContext context) {
								return(  ArticleView(
									value: model.model.plaintiff_description,
									caption: 'Plaintiff Description',
								));}
										Widget viewPlaintiffWishes (BuildContext context) {
								return(  ArticleView(
									value: model.model.plaintiff_wishes,
									caption: 'Plaintiff Wishes',
								));}
										Widget editProblemDescription (State state) {
								  return(
								ArticleWidget(
								  value: model.model.problem_description,
								  caption: 'Problem Description',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.problem_description = val;
									});
								  },
								));}
										Widget editYourWishes (State state) {
								  return(
								ArticleWidget(
								  value: model.model.your_wishes,
								  caption: 'Your Wishes',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.your_wishes = val;
									});
								  },
								));}
										Widget viewYourOffer (BuildContext context) {
								return(  TitleView(
									value: model.model.your_offer,
									caption: 'Your Offer',
								));}
										Widget viewBudget (BuildContext context) {
								return(  MoneyView(
									value: model.model.budget,
									caption: 'Budget',
								));}
										Widget editWorkerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.worker_receives,
								  caption: 'Worker Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.worker_receives = val;
									});
								  },
								));}
										Widget editOwnerReceives (State state) {
								  return(
								MoneyWidget(
								  value: model.model.owner_receives,
								  caption: 'Owner Receives',
								  hint: 'Isi dengan Money Anda',
								  required: false,
								  min: '0',
								  max: '1000000000',
								  getValue: (double?   val) {
									state.setState(() {
									  model.model.owner_receives = val;
									});
								  },
								));}


}


@JsonSerializable()
class RespondArbitrationMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRespondArbitrationMyProjects? model;
  RespondArbitrationMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory RespondArbitrationMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$RespondArbitrationMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RespondArbitrationMyProjectsSuperBaseToJson(this);


}

@JsonSerializable()

class ModelActionCancelArbitrationMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

String?   project_id;
	  String?   title;
	  String?   short_description;
	  DateTime?  start_date;
	  DateTime?  finish_deadline;
  int? extend_deadline_days;
  String?   your_wishes;


	  ModelActionCancelArbitrationMyProjects(
            this.id,
			this.project_id,
        this.title,
        this.short_description,
        this.start_date,
        this.finish_deadline,
			this.extend_deadline_days,
			this.your_wishes,

  );
    factory ModelActionCancelArbitrationMyProjects.fromJson(Map<String, dynamic> json) => _$ModelActionCancelArbitrationMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionCancelArbitrationMyProjectsToJson(this);

}



class CancelArbitrationMyProjectsBase{
	var model;
	Map<String, dynamic> json;
	CancelArbitrationMyProjectsBase(this.json){
		model = CancelArbitrationMyProjectsSuperBase.fromJson(this.json);
	}



  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double?   width = 400;
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
              child: button.text! == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
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
                    caption:button.text!,
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button.text!)
                             ],
                            ),
            style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(cl),
				  ),


             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {

                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataCancelArbitration(button.text!, model
                     					  );
                                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCancelArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCancelArbitrationMyProjectsWithID();
                                   future.then((value) {
                                     /*
								                  
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                      });
                      }else{
                      final future = my_projects.postCancelArbitrationMyProjects();
                                   future.then((value) {
                                     
								                /*
								                
                                    
								                 */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

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

SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
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
                        label: button.text! == 'Order by ...' ?  button.text! : 'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button.text!,
                                initialitems: button.selections,
                                initvalue: button.selections![0]);
                        },
                      )

	);
  }else{
	return(
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataCancelArbitration(button.text!, model
                     					  );
                                  my_projects =  MyProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.private_worker_id.toString());

										}else if(['InviteToBid'].contains('CancelArbitration')){
										my_projects.deleteAllCancelArbitrationMyProjects(this.model.model.user_id);
										}else{
										my_projects.deleteAllCancelArbitrationMyProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_projects.postCancelArbitrationMyProjectsWithID();
                                   future.then((value) {
								                  /*
                                    
                                    
								                   */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }
                        //AppProvider.getRouter(context)!.pop(context);

									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


                      });
                      }else{
                      final future = my_projects.postCancelArbitrationMyProjects();
                                   future.then((value) {
                                     /*
								                 
                                    
                                      */
                                  state.setState(() {
                                  postMyProjectsResult = value;
                                  });
                                   }).catchError((Error){					  if(!Error.toString().contains('302')){			     _onWidgetDidBuild(() {
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
										MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );


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

     );
  }

}


   Map<String, dynamic> convertFormDataAction(var data, String?   triger){

   String?   action =   'CancelArbitration';
   bool? isEdit = action.contains(RegExp(r'edit', caseSensitive: false));
      String?   tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[extend_deadline_days]": "${model.model.extend_deadline_days }",
  "project[your_wishes]": "${model.model.your_wishes }",

  };


    return( formData);
  }

  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCancelArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelArbitrationResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postCancelArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren
	   );
   }



  Widget injectAction(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelArbitrationResult, State state, String?   sendPath, String?   id,  String?   title, bool? isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }

    Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
     // final size =MediaQuery.of(context).size;
    double?   width = 400;

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
           RlistButton(context, formKey,controller,my_projects, postCancelArbitrationResult, state, sendPath, id,  title )

            )
        )
    );

   }

 SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postCancelArbitrationResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children: listButton(context, formKey,controller,my_projects, postCancelArbitrationResult, state, sendPath, id,  title )
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
										Widget viewStartDate (BuildContext context) {
								return(  DateTimeView(
									value: model.model.start_date,
									caption: 'Start Date',
								));}
										Widget viewFinishDeadline (BuildContext context) {
								return(  DateTimeView(
									value: model.model.finish_deadline,
									caption: 'Finish Deadline',
								));}
										Widget editExtendDeadlineDays (State state) {
								  return(
								NumberWidget(
								  value: model.model.extend_deadline_days,
								  caption: 'Extend Deadline Days',
								  hint: 'Isi dengan Number Anda',
								  required: false,
								  min: '0',
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.extend_deadline_days = val;
									});
								  },
								));}
										Widget editYourWishes (State state) {
								  return(
								ArticleWidget(
								  value: model.model.your_wishes,
								  caption: 'Your Wishes',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?   val) {
									state.setState(() {
									  model.model.your_wishes = val;
									});
								  },
								));}


}


@JsonSerializable()
class CancelArbitrationMyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionCancelArbitrationMyProjects? model;
  CancelArbitrationMyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );


  factory CancelArbitrationMyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$CancelArbitrationMyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelArbitrationMyProjectsSuperBaseToJson(this);


}






@JsonSerializable()

class ModelMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;

  String?   project_id;
  int? owner_id;
  String?   owner_url;
  String?   owner_str;
  List<int?>? owner_list;
  List<String?>?  owner_list_str;
  int? accepted_worker_id;
  String?   accepted_worker_url;
  String?   accepted_worker_str;
  List<int?>? accepted_worker_list;
  List<String?>?  accepted_worker_list_str;
  String?   testimonial_for_projects_co_id;
  String?   your_offer;
  int? category_id;
  String?   category_url;
  String?   category_str;
  List<int?>? category_list;
  List<String?>?  category_list_str;
  String?   title;
  String?   description;
  String?   short_description;
  String?   attachments_name;
  List<FileField?>? attachments;
  int? finish_days;
  String?   finish_days_str;
  String?   search_text;
  List<int?>? channels_id;
  List<String?>?   channels_str;
  List<String?>?  channels_url;
  List<int?>? channels_list;
  List<String?>?  channels_list_str;

  DateTime?  last_bump;
  DateTime?  select_deadline;
  DateTime?  start_date;
  DateTime?  finish_deadline;
  DateTime?  finish_date;
  DateTime?  closed_date;
  int? bid_count;
  String?   bid_count_str;
  int? progress;
  int? project_status_id;
  String?   project_status_str;
  List<int?>? project_status_list;
  List<String?>?  project_status_list_str;
  int? project_ending_id;
  String?   project_ending_str;
  List<int?>? project_ending_list;
  List<String?>?  project_ending_list_str;
  int? project_type_id;
  String?   project_type_str;
  List<int?>? project_type_list;
  List<String?>?  project_type_list_str;
  int? project_class_id;
  String?   project_class_str;
  List<int?>? project_class_list;
  List<String?>?  project_class_list_str;
  double?   published_budget;
  String?   published_budget_str;
   String?   budget_range;
   double?   budget_range_min;
   String?   budget_range_min_str;
   double?   budget_range_max;
   String?   budget_range_max_str;
   String?   budget_range_str;
  int? fee_percent;
  String?   fee_percent_str;
  int? service_id;
  String?   service_url;
  String?   service_str;
  List<int?>? service_list;
  List<String?>?  service_list_str;
  int? private_worker_id;
  String?   private_worker_url;
  String?   private_worker_str;
  List<int?>? private_worker_list;
  List<String?>?  private_worker_list_str;
  String?   invited_users;
  int? accepted_bid_id;
  String?   accepted_bid_url;
  String?   accepted_bid_str;
  List<int?>? accepted_bid_list;
  List<String?>?  accepted_bid_list_str;
  double?   accepted_budget;
  String?   accepted_budget_str;
  int? accepted_work_id;
  String?   accepted_work_url;
  String?   accepted_work_str;
  List<int?>? accepted_work_list;
  List<String?>?  accepted_work_list_str;
  DateTime?  accepted_date;
  double?   available_budget;
  String?   available_budget_str;
  bool? need_weekly_report;
  bool? weekly_report_needed;
  bool? weekly_report_posted;
  bool? deadline_passed_sent;
  bool? deadline_approaching_sent;
  String?   rating_for_worker;
  int? work_quality;
  int? expertise;
  int? worker_communication;
  int? worker_professionalism;
  int? worker_rating;
  double?   worker_rating_num;
  String?   worker_rating_num_str;
  String?   worker_feedback;
  String?   rating_for_owner;
  int? clarity;
  int? friendliness;
  int? owner_communication;
  int? owner_professionalism;
  int? owner_rating;
  double?   owner_rating_num;
  String?   owner_rating_num_str;
  String?   owner_feedback;
  String?   owner_signature_ip;
  DateTime?  owner_signature_date;
  String?   worker_signature_ip;
  DateTime?  worker_signature_date;
  int? owner_escrow_id;
  String?   owner_escrow_url;
  String?   owner_escrow_str;
  List<int?>? owner_escrow_list;
  List<String?>?  owner_escrow_list_str;
  int? worker_credit_id;
  String?   worker_credit_url;
  String?   worker_credit_str;
  List<int?>? worker_credit_list;
  List<String?>?  worker_credit_list_str;
  int? arbitration_id;
  String?   arbitration_url;
  String?   arbitration_str;
  List<int?>? arbitration_list;
  List<String?>?  arbitration_list_str;
  int? owner_credit_id;
  String?   owner_credit_url;
  String?   owner_credit_str;
  List<int?>? owner_credit_list;
  List<String?>?  owner_credit_list_str;
  int? registered_by_id;
  String?   registered_by_url;
  String?   registered_by_str;
  List<int?>? registered_by_list;
  List<String?>?  registered_by_list_str;
  DateTime?  registered_date;
  String?   registered_from_ip;
  int? canceled_by_id;
  String?   canceled_by_url;
  String?   canceled_by_str;
  List<int?>? canceled_by_list;
  List<String?>?  canceled_by_list_str;
  DateTime?  canceled_date;
  String?   canceled_from_ip;
  int? published_by_id;
  String?   published_by_url;
  String?   published_by_str;
  List<int?>? published_by_list;
  List<String?>?  published_by_list_str;
  DateTime?  published_date;
  String?   published_from_ip;
  int? rejected_by_id;
  String?   rejected_by_url;
  String?   rejected_by_str;
  List<int?>? rejected_by_list;
  List<String?>?  rejected_by_list_str;
  DateTime?  rejected_date;
  String?   rejected_from_ip;
  String?   admin_note;
  bool? announced;
  String?   your_wishes;
  int? extend_deadline_days;
  String?   extend_deadline_days_str;
  String?   testimony;
  String?   pick_user_name;
  String?   enter_email_address;
  String?   handphone;
  String?   broadcast_message;
  String?   attach_file_name;
  List<FileField?>? attach_file;
  bool? automatic_send_to_new_bidder;
  bool? is_system_message;
  String?   admin_notes;


	  ModelMyProjects(
            this.id,
            this.project_id,
			this.owner_id,
			this.owner_str,
			this.owner_list,
			this.owner_list_str,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.attachments,
			this.attachments_name,
			this.finish_days,
			this.finish_days_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,
			this.bid_count,
			this.bid_count_str,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.project_type_id,
			this.project_type_str,
			this.project_type_list,
			this.project_type_list_str,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
			this.published_budget,
			this.published_budget_str,
			this.budget_range,
			this.budget_range_min,
			this.budget_range_min_str,
			this.budget_range_max,
			this.budget_range_max_str,
      this.budget_range_str,
			this.fee_percent,
			this.fee_percent_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.private_worker_id,
			this.private_worker_str,
			this.private_worker_list,
			this.private_worker_list_str,
			this.accepted_bid_id,
			this.accepted_bid_str,
			this.accepted_bid_list,
			this.accepted_bid_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.accepted_work_id,
			this.accepted_work_str,
			this.accepted_work_list,
			this.accepted_work_list_str,
			this.available_budget,
			this.available_budget_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_escrow_id,
			this.owner_escrow_str,
			this.owner_escrow_list,
			this.owner_escrow_list_str,
			this.worker_credit_id,
			this.worker_credit_str,
			this.worker_credit_list,
			this.worker_credit_list_str,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_list,
			this.arbitration_list_str,
			this.owner_credit_id,
			this.owner_credit_str,
			this.owner_credit_list,
			this.owner_credit_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_list,
			this.registered_by_list_str,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.published_by_id,
			this.published_by_str,
			this.published_by_list,
			this.published_by_list_str,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.extend_deadline_days,
			this.extend_deadline_days_str,
			this.attach_file,
			this.attach_file_name,

  );
    factory ModelMyProjects.fromJson(Map<String, dynamic> json) => _$ModelMyProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyProjectsToJson(this);

}




class MyProjectsBase{
	var model;
	Map<String, dynamic> json;
	MyProjectsBase(this.json){
		model = MyProjectsSuperBase.fromJson(this.json);

	}

   Map<String, dynamic> convertFormDataEdit(var data){





	String?   attachments = '';
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
		}
	}
	String?   attach_file = '';
	if (model.model.attach_file!= null) {
		if (model.model.attach_file[0].temp != '') {
			attach_file = '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size},"created":${model.model.attach_file[0].date},"modified":${model.model.attach_file[0].date},"temp":"${model.model.attach_file[0].temp}","remote":"${model.model.attach_file[0].remote}","dir":"${model.model.attach_file[0].dir}"}]';
		}
	}


      var formData = {
      "my_projects[_trigger_]":"",
   "my_projects[project_id]": "${model.model.project_id }",
  "my_projects[owner_id]": "${model.model.owner_id }",
  "my_projects[accepted_worker_id]": "${model.model.accepted_worker_id }",
  "my_projects[testimonial_for_projects_co_id]": "${model.model.testimonial_for_projects_co_id }",
  "my_projects[your_offer]": "${model.model.your_offer }",
  "my_projects[category_id]": "${model.model.category_id }",
  "my_projects[title]": "${model.model.title }",
  "my_projects[description]": "${model.model.description }",
  "my_projects[short_description]": "${model.model.short_description }",
  "my_projects[attachments]": '$attachments',
  "my_projects[attachments_lastval]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "my_projects[finish_days]": "${model.model.finish_days }",
  "my_projects[search_text]": "${model.model.search_text }",
  "my_projects[last_bump]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}",
  "my_projects[select_deadline]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.select_deadline)}",
  "my_projects[start_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.start_date)}",
  "my_projects[finish_deadline]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_deadline)}",
  "my_projects[finish_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_date)}",
  "my_projects[closed_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.closed_date)}",
  "my_projects[bid_count]": "${model.model.bid_count }",
  "my_projects[progress]": "${model.model.progress }",
   "my_projects[project_status_id]": "${model.model.project_status_id}",
   "my_projects[project_ending_id]": "${model.model.project_ending_id}",
   "my_projects[project_type_id]": "${model.model.project_type_id}",
   "my_projects[project_class_id]": "${model.model.project_class_id}",
  "my_projects[published_budget]": "${model.model.published_budget}",
  "my_projects[budget_range]": "${model.model.budget_range }",
  "my_projects[fee_percent]": "${model.model.fee_percent }",
  "my_projects[service_id]": "${model.model.service_id }",
  "my_projects[private_worker_id]": "${model.model.private_worker_id }",
  "my_projects[invited_users]": "${model.model.invited_users }",
  "my_projects[accepted_bid_id]": "${model.model.accepted_bid_id }",
  "my_projects[accepted_budget]": "${model.model.accepted_budget}",
  "my_projects[accepted_work_id]": "${model.model.accepted_work_id }",
  "my_projects[accepted_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.accepted_date)}",
  "my_projects[available_budget]": "${model.model.available_budget}",
  "my_projects[need_weekly_report]": "${model.model.need_weekly_report ? 1 : 0}",
  "my_projects[weekly_report_needed]": "${model.model.weekly_report_needed ? 1 : 0}",
  "my_projects[weekly_report_posted]": "${model.model.weekly_report_posted ? 1 : 0}",
  "my_projects[deadline_passed_sent]": "${model.model.deadline_passed_sent ? 1 : 0}",
  "my_projects[deadline_approaching_sent]": "${model.model.deadline_approaching_sent ? 1 : 0}",
  "my_projects[rating_for_worker]": "${model.model.rating_for_worker }",
  "my_projects[work_quality]": "${model.model.work_quality }",
  "my_projects[expertise]": "${model.model.expertise }",
  "my_projects[worker_communication]": "${model.model.worker_communication }",
  "my_projects[worker_professionalism]": "${model.model.worker_professionalism }",
  "my_projects[worker_rating]": "${model.model.worker_rating }",
  "my_projects[worker_rating_num]": "${model.model.worker_rating_num}",
  "my_projects[worker_feedback]": "${model.model.worker_feedback }",
  "my_projects[rating_for_owner]": "${model.model.rating_for_owner }",
  "my_projects[clarity]": "${model.model.clarity }",
  "my_projects[friendliness]": "${model.model.friendliness }",
  "my_projects[owner_communication]": "${model.model.owner_communication }",
  "my_projects[owner_professionalism]": "${model.model.owner_professionalism }",
  "my_projects[owner_rating]": "${model.model.owner_rating }",
  "my_projects[owner_rating_num]": "${model.model.owner_rating_num}",
  "my_projects[owner_feedback]": "${model.model.owner_feedback }",
  "my_projects[owner_signature_ip]": "${model.model.owner_signature_ip }",
  "my_projects[owner_signature_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.owner_signature_date)}",
  "my_projects[worker_signature_ip]": "${model.model.worker_signature_ip }",
  "my_projects[worker_signature_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.worker_signature_date)}",
  "my_projects[owner_escrow_id]": "${model.model.owner_escrow_id }",
  "my_projects[worker_credit_id]": "${model.model.worker_credit_id }",
  "my_projects[arbitration_id]": "${model.model.arbitration_id }",
  "my_projects[owner_credit_id]": "${model.model.owner_credit_id }",
  "my_projects[registered_by_id]": "${model.model.registered_by_id }",
  "my_projects[registered_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}",
  "my_projects[registered_from_ip]": "${model.model.registered_from_ip }",
  "my_projects[canceled_by_id]": "${model.model.canceled_by_id }",
  "my_projects[canceled_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.canceled_date)}",
  "my_projects[canceled_from_ip]": "${model.model.canceled_from_ip }",
  "my_projects[published_by_id]": "${model.model.published_by_id }",
  "my_projects[published_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}",
  "my_projects[published_from_ip]": "${model.model.published_from_ip }",
  "my_projects[rejected_by_id]": "${model.model.rejected_by_id }",
  "my_projects[rejected_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}",
  "my_projects[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "my_projects[admin_note]": "${model.model.admin_note }",
  "my_projects[announced]": "${model.model.announced ? 1 : 0}",
  "my_projects[your_wishes]": "${model.model.your_wishes }",
  "my_projects[extend_deadline_days]": "${model.model.extend_deadline_days }",
  "my_projects[testimony]": "${model.model.testimony }",
  "my_projects[pick_user_name]": "${model.model.pick_user_name }",
  "my_projects[enter_email_address]": "${model.model.enter_email_address }",
  "my_projects[handphone]": "${model.model.handphone }",
  "my_projects[broadcast_message]": "${model.model.broadcast_message }",
  "my_projects[attach_file]": '$attach_file',
  "my_projects[attach_file_lastval]": '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size.toString()},"created":${model.model.attach_file[0].date.toString()},"modified":${model.model.attach_file[0].date.toString()},"temp":"${model.model.attach_file[0].temp}","remote":"","dir":"temp"}]',
  "my_projects[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder ? 1 : 0}",
  "my_projects[is_system_message]": "${model.model.is_system_message ? 1 : 0}",
  "my_projects[admin_notes]": "${model.model.admin_notes }",

  };
      int count = 0;
      for(var tag in model.model.channels_id){
        formData.addAll({"my_projects[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  }

  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonEditMyProjectsWidget(model.buttons[i], context,formKey, controller,my_projects, postMyProjectsResult, state, sendPath, id,  title ));
      }
    }
       return(
	        buttonChildren
	   );
   }

    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
  var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title ){
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
				children:listButton(context, formKey,controller,my_projects, postMyProjectsResult, state, sendPath, id,  title )
	    )
	 );
   }

SpeedDialChild ButtonEditMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
 var postMyProjectsResult, State state, String?   sendPath, String?   id,  String?   title){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button.text!,
                        initialitems: button.selections,
                        initvalue: button.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
						var formData = await convertFormDataEdit(model);
                        my_projects =  MyProjectsController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_projects.postMyProjects();
                         future.then((value) {

                        state.setState(() {
                        postMyProjectsResult = value;
						//AppProvider.getRouter(context)!.pop(context);
                        });
                         }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);
						});

                        } else {

								  }
                  }
		  }
	  ));
  }

}
   


	  	    Widget editOwner (State state) {
	   return(  StringView(
		value: model.model.owner_str,
		caption: 'Owner',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_id,
	  caption: 'Owner',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_id_list,
	  nameenum: model.model.owner_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedWorker (State state) {
	   return(  StringView(
		value: model.model.accepted_worker_str,
		caption: 'Accepted Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_worker_id,
	  caption: 'Accepted Worker',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_worker_id_list,
	  nameenum: model.model.accepted_worker_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_worker_id = val;
		});
	  },
	));*/
	}


	  	    Widget editTestimonialForProjectsCoId (State state) {
      return(
	TitleWidget(
		value: model.model.testimonial_for_projects_co_id,
		caption: 'Testimonial for Projects.co.id',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.testimonial_for_projects_co_id = val;
		  });
		},
	));}

	  	    Widget editYourOffer (State state) {
      return(
	TitleWidget(
		value: model.model.your_offer,
		caption: 'Your Offer',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.your_offer = val;
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
		getValue: (String?   val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
	));}

	  	    Widget editDescription (State state) {
      return(
	ArticleWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?   val) {
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
		getValue: (String?   val) {
		  state.setState(() {
			model.model.short_description = val;
		  });
		},
    ));}

	  	    Widget editAttachments (State state) {
	 if(model.model.attachments== null){
		FileField file = FileField('', '',0,0,0, '', '', '','' );
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

	  	    Widget editSearchText (State state) {
      return(
	DisplayNameWidget(
		value: model.model.search_text,
		caption: 'Search Text',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.search_text = val;
		  });
		},
    ));}

	  	    Widget editChannels (State state) {
      return(
	
	InlineTagsWidget(
	  value: model.model.channels_id,
	  caption: 'Channels',
	  hint: ' ',
	  required: true,
	  idtags: model.model.channels_list,
	  nametags: model.model.channels_list_str,
	  getValue: (List<int?>? val) {
    model.model.channels_id.clear();
		state.setState(() {
		  model.model.channels_id.addAll(val!);
		});
	  },
	  removeValue: (int? val) {
		state.setState(() {
		  model.model.channels_id.remove(val!);
		});
	  },
	));}

	  	    Widget editLastBump (State state) {
      return(
	DateTimeWidget(
	  value: model.model.last_bump,
	  caption: 'Last Bump',
	  hint: 'isi dengan DateTime  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.last_bump = val;
		});
	  },
	));} 

	  	    Widget editSelectDeadline (State state) {
      return(
	DateTimeWidget(
	  value: model.model.select_deadline,
	  caption: 'Select Deadline',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.select_deadline = val;
		});
	  },
	));} 

	  	    Widget editStartDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.start_date,
	  caption: 'Start Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.start_date = val;
		});
	  },
	));} 

	  	    Widget editFinishDeadline (State state) {
      return(
	DateTimeWidget(
	  value: model.model.finish_deadline,
	  caption: 'Finish Deadline',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.finish_deadline = val;
		});
	  },
	));} 

	  	    Widget editFinishDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.finish_date,
	  caption: 'Finish Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.finish_date = val;
		});
	  },
	));} 

	  	    Widget editClosedDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.closed_date,
	  caption: 'Closed Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.closed_date = val;
		});
	  },
	));} 

	  	    Widget editBidCount (State state) {
      return(
	NumberWidget(
	  value: model.model.bid_count,
	  caption: 'Bid Count',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_count = val;
		});
	  },
	));}

	  	    Widget editProgress (State state) {
      return(
	PercentWidget(
	  value: model.model.progress,
	  caption: 'Progress',
	  hint: 'Isi dengan Double Anda',
	  required: false,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
	  
		state.setState(() {
		  model.model.progress = val;
		});
	  },
	));}

   	    Widget editProjectStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_status_id,
	  caption: 'Project Status',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_status_list,
	  nameenum: model.model.project_status_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.project_status_id = val;
		});
	  },
	));}

   	    Widget editProjectEnding (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_ending_id,
	  caption: 'Project Ending',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_ending_list,
	  nameenum: model.model.project_ending_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.project_ending_id = val;
		});
	  },
	));}

   	    Widget editProjectType (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_type_id,
	  caption: 'Project Type',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_type_list,
	  nameenum: model.model.project_type_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.project_type_id = val;
		});
	  },
	));}

   	    Widget editProjectClass (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_class_id,
	  caption: 'Project Class',
	  hint: 'pilih Enum',
	  required: true,
	  idenum: model.model.project_class_list,
	  nameenum: model.model.project_class_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.project_class_id = val;
		});
	  },
	));}

	  	    Widget editPublishedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.published_budget,
	  caption: 'Published Budget',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min: '0',
	  max: '1000000000',
	  getValue: (double?   val) {
		state.setState(() {	
		  model.model.published_budget = val;
		});
	  },
	));}

	  	    Widget editBudgetRange (State state) {
      return(   
        RangeWidget( 
          value: model.model.budget_range,
          valuemin: model.model.budget_range_min,
          valuemax: model.model.budget_range_max,
          caption: 'Range Budget',
          hint: 'Isi dengan Range penawaran Anda',
          required:true,
         min: '0',
         max: '100000000000',

          getValue1: (double?   val) {
            state.setState(() {
              model.model.budget_range_min = val;
            });
          },
          getValue2: (double?   val) {
            state.setState(() {
              model.model.budget_range_max = val;
            });
          },
          getValue: (String?   val) {
            state.setState(() {
              model.model.budget_range = val;
            });
          },
        )
      );} 

	  	    Widget editFeePercent (State state) {
      return(
	NumberWidget(
	  value: model.model.fee_percent,
	  caption: 'Fee Percent',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.fee_percent = val;
		});
	  },
	));}

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

	  	    Widget editPrivateWorker (State state) {
	   return(  StringView(
		value: model.model.private_worker_str,
		caption: 'Private Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.private_worker_id,
	  caption: 'Private Worker',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.private_worker_id_list,
	  nameenum: model.model.private_worker_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.private_worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editInvitedUsers (State state) {
      return(
	DisplayNameWidget(
		value: model.model.invited_users,
		caption: 'Invited Users',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.invited_users = val;
		  });
		},
    ));}

	  	    Widget editAcceptedBid (State state) {
	   return(  StringView(
		value: model.model.accepted_bid_str,
		caption: 'Accepted Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_bid_id,
	  caption: 'Accepted Bid',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_bid_id_list,
	  nameenum: model.model.accepted_bid_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.accepted_budget,
	  caption: 'Accepted Budget',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double?   val) {
		state.setState(() {	
		  model.model.accepted_budget = val;
		});
	  },
	));}

	  	    Widget editAcceptedWork (State state) {
	   return(  StringView(
		value: model.model.accepted_work_str,
		caption: 'Accepted Work',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_work_id,
	  caption: 'Accepted Work',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_work_id_list,
	  nameenum: model.model.accepted_work_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.accepted_work_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.accepted_date,
	  caption: 'Accepted Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.accepted_date = val;
		});
	  },
	));} 

	  	    Widget editAvailableBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.available_budget,
	  caption: 'Available Budget',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double?   val) {
		state.setState(() {	
		  model.model.available_budget = val;
		});
	  },
	));}

	  	    Widget editNeedWeeklyReport (State state) {
      return(
	BooleanWidget(
	  value: model.model.need_weekly_report,
	  caption: 'Need Weekly Report',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.need_weekly_report = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportNeeded (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_needed,
	  caption: 'Weekly Report Needed',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.weekly_report_needed = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportPosted (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_posted,
	  caption: 'Weekly Report Posted',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.weekly_report_posted = val;
		});
	  },
	));} 

	  	    Widget editDeadlinePassedSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_passed_sent,
	  caption: 'Deadline Passed Sent',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.deadline_passed_sent = val;
		});
	  },
	));} 

	  	    Widget editDeadlineApproachingSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_approaching_sent,
	  caption: 'Deadline Approaching sent',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.deadline_approaching_sent = val;
		});
	  },
	));} 

	  	    Widget editRatingForWorker (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_worker,
		caption: 'Rating For Worker',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.rating_for_worker = val;
		  });
		},
	));}

	  	    Widget editWorkQuality (State state) {
      return(
	RatingWidget(
	  value: model.model.work_quality,
	  caption: 'Work Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.work_quality = val;
		});
	  },
	));}

	  	    Widget editExpertise (State state) {
      return(
	RatingWidget(
	  value: model.model.expertise,
	  caption: 'Expertise',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.expertise = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunication (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_communication,
	  caption: 'Worker Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_communication = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalism (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_professionalism,
	  caption: 'Worker Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_professionalism = val;
		});
	  },
	));}

	  	    Widget editWorkerRating (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_rating,
	  caption: 'Worker Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_rating = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_rating_num,
	  caption: 'Worker Rating Num',
	  hint: 'Isi dengan Double Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double?   val) {
		state.setState(() {
		  
	     model.model.worker_rating_num = val;
		});
	  },
	));}

	  	    Widget editWorkerFeedback (State state) {
      return(
	ArticleWidget(
	  value: model.model.worker_feedback,
	  caption: 'Worker Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.worker_feedback = val;
		});
	  },
	));}

	  	    Widget editRatingForOwner (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_owner,
		caption: 'Rating For Owner',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.rating_for_owner = val;
		  });
		},
	));}

	  	    Widget editClarity (State state) {
      return(
	RatingWidget(
	  value: model.model.clarity,
	  caption: 'Clarity',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.clarity = val;
		});
	  },
	));}

	  	    Widget editFriendliness (State state) {
      return(
	RatingWidget(
	  value: model.model.friendliness,
	  caption: 'Friendliness',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.friendliness = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunication (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_communication,
	  caption: 'Owner Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_communication = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalism (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_professionalism,
	  caption: 'Owner Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_professionalism = val;
		});
	  },
	));}

	  	    Widget editOwnerRating (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_rating,
	  caption: 'Owner Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_rating = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_rating_num,
	  caption: 'Owner Rating Num',
	  hint: 'Isi dengan Double Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double?   val) {
		state.setState(() {
		  
	     model.model.owner_rating_num = val;
		});
	  },
	));}

	  	    Widget editOwnerFeedback (State state) {
      return(
	ArticleWidget(
	  value: model.model.owner_feedback,
	  caption: 'Owner Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.owner_feedback = val;
		});
	  },
	));}

	  	    Widget editOwnerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.owner_signature_ip,
		caption: 'Owner Signature IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.owner_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editOwnerSignatureDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.owner_signature_date,
	  caption: 'Owner Signature Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.owner_signature_date = val;
		});
	  },
	));} 

	  	    Widget editWorkerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.worker_signature_ip,
		caption: 'Worker Signature IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.worker_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editWorkerSignatureDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.worker_signature_date,
	  caption: 'Worker Signature Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.worker_signature_date = val;
		});
	  },
	));} 

	  	    Widget editOwnerEscrow (State state) {
	   return(  StringView(
		value: model.model.owner_escrow_str,
		caption: 'Owner Escrow',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_escrow_id,
	  caption: 'Owner Escrow',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_escrow_id_list,
	  nameenum: model.model.owner_escrow_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_escrow_id = val;
		});
	  },
	));*/
	}

	  	    Widget editWorkerCredit (State state) {
	   return(  StringView(
		value: model.model.worker_credit_str,
		caption: 'Worker Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_credit_id,
	  caption: 'Worker Credit',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.worker_credit_id_list,
	  nameenum: model.model.worker_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_credit_id = val;
		});
	  },
	));*/
	}

	  	    Widget editArbitration (State state) {
	   return(  StringView(
		value: model.model.arbitration_str,
		caption: 'Arbitration',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.arbitration_id,
	  caption: 'Arbitration',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.arbitration_id_list,
	  nameenum: model.model.arbitration_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.arbitration_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwnerCredit (State state) {
	   return(  StringView(
		value: model.model.owner_credit_str,
		caption: 'Owner Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_credit_id,
	  caption: 'Owner Credit',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_credit_id_list,
	  nameenum: model.model.owner_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_credit_id = val;
		});
	  },
	));*/
	}

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
	DateTimeWidget(
	  value: model.model.registered_date,
	  caption: 'Registered Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
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
		getValue: (String?   val) {
		  state.setState(() {
			model.model.registered_from_ip = val;
		  });
		},
    ));}

	  	    Widget editCanceledBy (State state) {
	   return(  StringView(
		value: model.model.canceled_by_str,
		caption: 'Canceled By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.canceled_by_id,
	  caption: 'Canceled By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.canceled_by_id_list,
	  nameenum: model.model.canceled_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.canceled_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editCanceledDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.canceled_date,
	  caption: 'Canceled Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.canceled_date = val;
		});
	  },
	));} 

	  	    Widget editCanceledFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.canceled_from_ip,
		caption: 'Canceled From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.canceled_from_ip = val;
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
	DateTimeWidget(
	  value: model.model.published_date,
	  caption: 'Published Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
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
		getValue: (String?   val) {
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
	DateTimeWidget(
	  value: model.model.rejected_date,
	  caption: 'Rejected Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
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
		getValue: (String?   val) {
		  state.setState(() {
			model.model.rejected_from_ip = val;
		  });
		},
    ));}

	  	    Widget editAdminNote (State state) {
      return(
	ArticleWidget(
	  value: model.model.admin_note,
	  caption: 'Admin Note',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.admin_note = val;
		});
	  },
	));}

	  	    Widget editAnnounced (State state) {
      return(
	BooleanWidget(
	  value: model.model.announced,
	  caption: 'Announced',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.announced = val;
		});
	  },
	));} 

	  	    Widget editYourWishes (State state) {
      return(
	ArticleWidget(
	  value: model.model.your_wishes,
	  caption: 'Your Wishes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.your_wishes = val;
		});
	  },
	));}

	  	    Widget editExtendDeadlineDays (State state) {
      return(
	NumberWidget(
	  value: model.model.extend_deadline_days,
	  caption: 'Extend Deadline Days',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.extend_deadline_days = val;
		});
	  },
	));}

	  	    Widget editTestimony (State state) {
      return(
	ArticleWidget(
	  value: model.model.testimony,
	  caption: 'Testimony',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.testimony = val;
		});
	  },
	));}

	  	    Widget editPickUserName (State state) {
      return(
	UsernameWidget(
		value: model.model.pick_user_name,
		caption: 'Pick User Name',
		hint: 'Isi dengan Username Anda',
		required: true,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.pick_user_name = val;
		  });
		}
	));}

	  	    Widget editEnterEmailAddress (State state) {
      return(
	 EmailWidget(
		value: model.model.enter_email_address,
		caption: 'Enter Email Address',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.enter_email_address = val;
		  });
		},
	));}

	  	    Widget editHandphone (State state) {
      return(
	HandphoneWidget(
		value: model.model.handphone,
		caption: 'Handphone',
		hint: 'Isi dengan Handphone Anda',
		required: true,
		getValue: (String?   val) {
		  state.setState(() {
			model.model.handphone = val;
		  });
		},
	));}

	  	    Widget editBroadcastMessage (State state) {
      return(
	ArticleWidget(
	  value: model.model.broadcast_message,
	  caption: 'Broadcast Message',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.broadcast_message = val;
		});
	  },
	));}

	  	    Widget editAttachFile (State state) {
	 if(model.model.attach_file== null){
		FileField file = FileField('', '',0,0,0, '', '', '','' );
		model.model.attach_file = [file];
		}
      return(
	FileWidget(
		value: model.model.attach_file[0],
		caption: 'Attach File',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.attach_file[0] = val;
		  });
		},
	));} 

	  	    Widget editAutomaticSendToNewBidder (State state) {
      return(
	BooleanWidget(
	  value: model.model.automatic_send_to_new_bidder,
	  caption: 'Automatic Send to New Bidder',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.automatic_send_to_new_bidder = val;
		});
	  },
	));} 

	  	    Widget editIsSystemMessage (State state) {
      return(
	BooleanWidget(
	  value: model.model.is_system_message,
	  caption: 'Is System Message',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool? val) {
	  
		state.setState(() {
		  model.model.is_system_message = val;
		});
	  },
	));} 

	  	    Widget editAdminNotes (State state) {
      return(
	ArticleWidget(
	  value: model.model.admin_notes,
	  caption: 'Admin Notes',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?   val) {
		state.setState(() {
		  model.model.admin_notes = val;
		});
	  },
	));}
	
}


@JsonSerializable()

class MyProjectsSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyProjects? model;
  MyProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$MyProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyProjectsSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyProjects {
  int?    age;
  int?    cnt;
  int?    page;
  String?   id;
  String?   ttl;
  String?   pht;
  String?   sbttl;
  

  String?   admin_note;
  String?   description;
  List<FileField?>? attachments;  
  String?   attachments_url;
  String?   attachments_name;
  List<int?>? channels_id;
  List<String?>?   channels_str;
  List<String?>?  channels_url;
  int? project_class_id;
  String?   project_class_str;
  List<int?>? project_class_list;
  List<String?>?  project_class_list_str;
  String?   budget_range;
  double?   budget_range_min;
  String?   budget_range_min_str;
  double?   budget_range_max;
  String?   budget_range_max_str;
  String?   budget_range_str;
  int? project_status_id;
  String?   project_status_str;
  List<int?>? project_status_list;
  List<String?>?  project_status_list_str;
  double?   published_budget;
  String?   published_budget_str;
  DateTime?  published_date;
  int? finish_days;
  String?   finish_days_str;
  int? project_ending_id;
  String?   project_ending_str;
  List<int?>? project_ending_list;
  List<String?>?  project_ending_list_str;
  int? bid_count;
  String?   bid_count_str;
  DateTime?  select_deadline;
  bool? need_weekly_report;
  DateTime?  start_date;
  DateTime?  finish_deadline;
  DateTime?  finish_date;
  DateTime?  closed_date;
  int? accepted_worker_id;
  String?   accepted_worker_str;
  String?   accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>?  accepted_worker_list_str;
  double?   accepted_budget;
  String?   accepted_budget_str;
  int? progress;
  int? arbitration_id;
  String?   arbitration_str;
  String?   arbitration_url;
  List<int?>? arbitration_list;
  List<String?>?  arbitration_list_str;
  DateTime?  last_bump;
  int? owner_id;
  String?   owner_str;
  String?   owner_url;
  List<int?>? owner_list;
  List<String?>?  owner_list_str;
  String?   owner_photo_url;
  Photo? owner_photo; 
  String?   owner_user_name;
  int? owner_kabupaten_id;
  String?   owner_kabupaten_str;
  int?  owner_owner_rating;
  double?    owner_owner_rating_num;
  String?   owner_owner_rating_num_str;
  int?  owner_owner_point;
  String?   owner_owner_point_str;
  int?  owner_owner_ranking;
  String?   owner_owner_ranking_str;
  double?   worker_rating_num;
  String?   worker_rating_num_str;
  String?   worker_feedback;
  int?  accepted_worker_worker_rating;
  int?  accepted_worker_worker_point;
  String?   accepted_worker_worker_point_str;
  int?  accepted_worker_worker_ranking;
  String?   accepted_worker_worker_ranking_str;
  String?   owner_feedback;
   //ShortlistedBids shortlisted_bids;

	//
	  ViewModelMyProjects(
            this.id,
			this.admin_note,
			this.description,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.published_budget,
			this.published_budget_str,
			this.published_date,
			this.finish_days,
			this.finish_days_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.bid_count,
			this.bid_count_str,
			this.select_deadline,
			this.need_weekly_report,
			this.start_date,
			this.finish_deadline,
			this.finish_date,
			this.closed_date,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_url,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.progress,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_url,
			this.arbitration_list,
			this.arbitration_list_str,
			this.last_bump,
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.owner_photo_url,
			this.owner_photo,
			this.owner_kabupaten_id,
			this.owner_kabupaten_str,
			this.owner_owner_rating_num,
			this.owner_owner_rating_num_str,
			this.owner_owner_point,
			this.owner_owner_point_str,
			this.owner_owner_ranking,
			this.owner_owner_ranking_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_feedback,
			this.accepted_worker_worker_point,
			this.accepted_worker_worker_point_str,
			this.accepted_worker_worker_ranking,
			this.accepted_worker_worker_ranking_str,
			this.owner_feedback,

  );

  
   factory ViewModelMyProjects.fromJson(Map<String, dynamic> json) => _$ViewModelMyProjectsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyProjectsToJson(this); 
  
}


class MyProjectsViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyProjectsViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
    State state, String?   sendPath, String?   id,  String?   title, bool? account ){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren.add(ButtonViewMyProjectsWidget(model.buttons[i],context,  formKey, controller, my_projects,
                                    state, sendPath, id,  title, account ));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyProjectsController my_projects,
  State state, String?   sendPath, String?   id,  String?   title, bool? account){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search!),
                        backgroundColor: Colors.green,
                        label: button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button.text!,
                        initialitems: button.selections,
                        initvalue: button.selections![0]);
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
    
    if(button.url!.contains('user/my_purchases/download/')){
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        my_projects =  MyProjectsController(AppProvider.getApplication(context),
                        sendPath! + button.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_projects.downloadFile();
                         future.then((value) {

                        state.setState(() {
                       // postMyProjectsResult = value;
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
		  label: button.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: (){
		  
		  if(account!){	   
			AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! ));
		  }else{
		    AppProvider.getRouter(context)!.navigateTo(context,'/login/1');
		   }
		  }
	  ));
	  }
	  
  }

}  
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, MyProjectsController my_projects,
    State state, String?   sendPath, String?   id,  String?   title, bool? account ){
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
				children:listButton(context, visible, formKey, controller, my_projects,
                                    state, sendPath, id,  title, account )
	    )
	 );
   } 	
	
	Widget appBar(BuildContext context, String?   idHash){
	  return(
	      AppBar(
		   iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),
			title: Text('', style : TextStyle( color: Colors.white, )),
		  )
	  );
	}

   	Widget body (BuildContext context, ScrollController controller, bool? account, GlobalKey<ScaffoldState> ss, State state) {
		return(Container(width: 0.0, height: 0.0,color: Colors.white ));	
	}

	Widget view (BuildContext context, ScrollController controller, bool? account, bool _isBannerAdReady,  _bannerAd) {


	  viewChildren.clear();
	  
	  if(this.model.meta.before_title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_title),
	  ));}
	  if(this.model.meta.title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.title),
	  ));}
	  if(this.model.meta.after_title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_title),
	  ));}
	  if(this.model.meta.warning != null){ viewChildren.add(Padding(
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

	  if(this.model.meta.before_content != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_content),
	  ));}	  

	 	  
	   viewChildren.add(viewAdminNote(context)); 
	   viewChildren.add(viewDescription(context)); 
	   viewChildren.add(viewAttachments(context)); 
	   viewChildren.add(viewChannels(context)); 
	   viewChildren.add(viewProjectClass(context)); 
	   viewChildren.add(viewBudgetRange(context)); 
	   viewChildren.add(viewProjectStatus(context)); 
	   viewChildren.add(viewPublishedBudget(context)); 
	   viewChildren.add(viewPublishedDate(context)); 
	   viewChildren.add(viewFinishDays(context)); 
	   viewChildren.add(viewProjectEnding(context)); 
	   viewChildren.add(viewBidCount(context)); 
	   viewChildren.add(viewSelectDeadline(context)); 
	   viewChildren.add(viewNeedWeeklyReport(context)); 
	   viewChildren.add(viewStartDate(context)); 
	   viewChildren.add(viewFinishDeadline(context)); 
	   viewChildren.add(viewFinishDate(context)); 
	   viewChildren.add(viewClosedDate(context)); 
	   viewChildren.add(viewAcceptedWorker(context)); 
	   viewChildren.add(viewAcceptedBudget(context)); 
	   viewChildren.add(viewProgress(context)); 
	   viewChildren.add(viewArbitration(context)); 
	   viewChildren.add(viewLastBump(context)); 
	   viewChildren.add(viewOwner(context)); 
	   viewChildren.add(viewPhoto(context));
	   viewChildren.add(viewUserName(context));
	   viewChildren.add(viewKabupaten(context));
	   viewChildren.add(viewOwnerRating(context));
	   viewChildren.add(viewOwnerRatingNum(context));
	   viewChildren.add(viewOwnerPoint(context));
	   viewChildren.add(viewOwnerRanking(context));
	   viewChildren.add(viewWorkerRatingNum(context)); 
	   viewChildren.add(viewWorkerFeedback(context)); 
	   viewChildren.add(viewWorkerRating(context));
	   viewChildren.add(viewWorkerPoint(context));
	   viewChildren.add(viewWorkerRanking(context));
	   viewChildren.add(viewOwnerFeedback(context)); 
		

	 //
	if(this.model.meta.after_content != null){ viewChildren.add(Padding(
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
					 					  
                       children: viewChildren
                  ) 
     ));
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
	Widget viewChannels (BuildContext context) {  
	if(model.model.channels_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
						urlroutetags: model.model.channels_url,
						getValue: (String?   val) {
						 // Navigator.pushReplacementNamed(context, "/projectscoid");
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
					  ));
	
    }	
			  } 
	    Widget viewProjectClass (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.project_class_id,
			caption: 'Project Class',
			idenum: model.model.project_class_list,
			nameenum: model.model.project_class_str,
		));} 
		    Widget viewBudgetRange (BuildContext context) {  
	if(model.model.budget_range != null){
		return(  StringView(
		value: model.model.budget_range_str,
		caption: 'Budget Range',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Budget Range',
		    ));
	}		
     }
	    Widget viewProjectStatus (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.project_status_id,
			caption: 'Project Status',
			idenum: model.model.project_status_list,
			nameenum: model.model.project_status_str,
		));} 
		    Widget viewPublishedBudget (BuildContext context) {  			
    if(model.model.published_budget != null){
		return(  MoneyView(
		value: model.model.published_budget,
		caption: 'Published Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Published Budget',
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
	    Widget viewProjectEnding (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.project_ending_id,
			caption: 'Project Ending',
			idenum: model.model.project_ending_list,
			nameenum: model.model.project_ending_str,
		));} 
		    Widget viewBidCount (BuildContext context) { 
    if(model.model.bid_count != null){
		return(  NumberView(
		value: model.model.bid_count,
		caption: 'Bid Count',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Bid Count',
		));
	}		
     }
		    Widget viewSelectDeadline (BuildContext context) {  
	if(model.model.select_deadline != null){
	return(  DateTimeView(
		value: model.model.select_deadline,
		caption: 'Select Deadline',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Select Deadline',
		    ));
	}			 
	 } 
		    Widget viewNeedWeeklyReport (BuildContext context) {  

	if(model.model.need_weekly_report != null){
		return(  BooleanView(
		value: model.model.need_weekly_report,
		caption: 'Need Weekly Report',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Need Weekly Report',
		    ));
	}
     } 
		    Widget viewStartDate (BuildContext context) {  
	if(model.model.start_date != null){
	return(  DateTimeView(
		value: model.model.start_date,
		caption: 'Start Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Start Date',
		    ));
	}			 
	 } 
		    Widget viewFinishDeadline (BuildContext context) {  
	if(model.model.finish_deadline != null){
	return(  DateTimeView(
		value: model.model.finish_deadline,
		caption: 'Finish Deadline',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Finish Deadline',
		    ));
	}			 
	 } 
		    Widget viewFinishDate (BuildContext context) {  
	if(model.model.finish_date != null){
	return(  DateTimeView(
		value: model.model.finish_date,
		caption: 'Finish Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Finish Date',
		    ));
	}			 
	 } 
		    Widget viewClosedDate (BuildContext context) {  
	if(model.model.closed_date != null){
	return(  DateTimeView(
		value: model.model.closed_date,
		caption: 'Closed Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Closed Date',
		    ));
	}			 
	 } 
				Widget viewAcceptedWorker (BuildContext context) {  
		return(  ModelView(
			value: model.model.accepted_worker_id,
			caption: 'Accepted Worker',
			idenum: model.model.accepted_worker_list,
			nameenum: model.model.accepted_worker_str,
		));} 
		    Widget viewAcceptedBudget (BuildContext context) {  			
    if(model.model.accepted_budget != null){
		return(  MoneyView(
		value: model.model.accepted_budget,
		caption: 'Accepted Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Accepted Budget',
		    ));
	}			
     }
		    Widget viewProgress (BuildContext context) {

	if(model.model.progress != null){
		return(  PercentView(
		value: model.model.progress,
		caption: 'Progress',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Progress',
		    ));	
	}
     }
				Widget viewArbitration (BuildContext context) {  
		return(  ModelView(
			value: model.model.arbitration_id,
			caption: 'Arbitration',
			idenum: model.model.arbitration_list,
			nameenum: model.model.arbitration_str,
		));} 
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
				Widget viewOwner (BuildContext context) {  
		return(  ModelView(
			value: model.model.owner_id,
			caption: 'Owner',
			idenum: model.model.owner_list,
			nameenum: model.model.owner_str,
		));} 
	  Widget viewPhoto (BuildContext context) {  
		return(  ImageView(
			value: model.model.owner_photo_url,
			caption: 'Photo',
		));} 
		Widget viewUserName (BuildContext context) {  
	    return(  StringView(
			value: model.model.owner_user_name,
			caption: 'User Name',
		));}
	  Widget viewKabupaten (BuildContext context) {  
	  return(  StringView(
			value: model.model.owner_kabupaten_str,
			caption: 'Kabupaten',
		));}
	   Widget viewOwnerRating (BuildContext context) {
	   if(model.model.owner_owner_rating != null){
	   		return(  RatingView(
			value: model.model.owner_owner_rating,
			caption: 'Owner Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Owner Rating',
		 ));
	   }
        }
	  Widget viewOwnerRatingNum (BuildContext context) {  
	   if(model.model.owner_owner_rating_num != null){
	   	  return(  StringView(
			value: model.model.owner_owner_rating_num.toString(),
			caption: 'Owner Rating Num',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_rating_num_str,
			caption: 'Owner Rating Num',
		));
	   }
        }
	  Widget viewOwnerPoint (BuildContext context) {  
	   if(model.model.owner_owner_point != null){
	   	  return(  StringView(
			value: model.model.owner_owner_point.toString(),
			caption: 'Owner Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_point_str,
			caption: 'Owner Point',
		));
	   }
        }
	  Widget viewOwnerRanking (BuildContext context) {  
	   if(model.model.owner_owner_ranking != null){
	   	  return(  StringView(
			value: model.model.owner_owner_ranking.toString(),
			caption: 'Owner Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_ranking_str,
			caption: 'Owner Ranking',
		));
	   }
        }
		    Widget viewWorkerRatingNum (BuildContext context) {  
	   if(model.model.worker_rating_num != null){
	   	   	return(  DoubleView(
		    value: model.model.worker_rating_num,
			caption: 'Worker Rating Num',
		));
	   }else{
	   	   return(  StringView(
			value: '',
			caption: 'Worker Rating Num',
		    ));
	   }
      }
		    Widget viewWorkerFeedback (BuildContext context) {  
	if(model.model.worker_feedback != null){
		return(  ArticleView(
		value: model.model.worker_feedback,
		caption: 'Worker Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Worker Feedback',
		    ));
	}		
     }
	   Widget viewWorkerRating (BuildContext context) {
	   if(model.model.accepted_worker_worker_rating != null){
	   		return(  RatingView(
			value: model.model.accepted_worker_worker_rating,
			caption: 'Worker Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Worker Rating',
		 ));
	   }
        }
	  Widget viewWorkerPoint (BuildContext context) {  
	   if(model.model.accepted_worker_worker_point != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_worker_point.toString(),
			caption: 'Worker Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_worker_point_str,
			caption: 'Worker Point',
		));
	   }
        }
	  Widget viewWorkerRanking (BuildContext context) {  
	   if(model.model.accepted_worker_worker_ranking != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_worker_ranking.toString(),
			caption: 'Worker Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_worker_ranking_str,
			caption: 'Worker Ranking',
		));
	   }
        }
		    Widget viewOwnerFeedback (BuildContext context) {  
	if(model.model.owner_feedback != null){
		return(  ArticleView(
		value: model.model.owner_feedback,
		caption: 'Owner Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Owner Feedback',
		    ));
	}		
     }
  
}


@JsonSerializable()
class MyProjectsViewSuperBase {

  String?   id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyProjects? model;
  MyProjectsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory MyProjectsViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyProjectsViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyProjectsViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyProjectsListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyProjectsListingBase(this.json){
		items = MyProjectsListingItems.fromJson(this.json);
		tools = MyProjectsListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyProjectsModel? item,String?   search, bool? account) {
	ShapeBorder? shape;
    double?   height = 0;
	double?   totalHeight = 0;
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
	totalHeight = totalHeight + 8 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	
  Widget viewItemId(ItemMyProjectsModel? item,String?   search, int? index, bool? account, String?   id) {
	ShapeBorder? shape;
    double?   height = 0;
	double?   totalHeight = 0;
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
	totalHeight = totalHeight + 8 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	  Widget viewItemIndex (ItemMyProjectsModel? item,String?   search, int? index, bool? account) {
	ShapeBorder? shape;
    double?   height = 0;
	double?   totalHeight = 0;
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
	totalHeight = totalHeight + 8 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	
Widget viewItem1 (ItemMyProjectsModel? item,ItemMyProjectsModel? item1, String?   search, BuildContext context,bool? account, String?   id , bool? isMax, int? max, int? index) {
	ShapeBorder? shape;
    double?   height = 0;
	double?   totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyProjectsCard(destination :item, search : search, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyProjectsModel? item,String?   search, int? index, BuildContext context, bool? account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double?   height = 0;
	double?   totalHeight = 0;
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
	totalHeight = totalHeight + 8 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemMyProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren.add(ListButtonMyProjectsWidget(tools.buttons[i],context, account));
   // }  
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, bool? account){
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





class MyProjectsListingItems{
  List<ItemMyProjectsModel?>? items;
  MyProjectsListingItems(
      this.items,
      );

  factory MyProjectsListingItems.fromJson(Map<String, dynamic> json) {
  	return MyProjectsListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyProjectsModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyProjectsListingTools{

	String?   id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyProjects?>? items;
	MyProjectsListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyProjectsListingTools.fromJson(Map<String, dynamic> json) => _$MyProjectsListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyProjectsListingToolsToJson(this);

}




class ItemMyProjectsCard extends StatelessWidget {
  const ItemMyProjectsCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double?   height ;
  final ItemMyProjectsModel? destination;
  final String?   search;
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
                child: ItemMyProjectsContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyProjectsContent extends StatelessWidget {
  const ItemMyProjectsContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyProjectsModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> buttonChildren = <Widget>[
    ];
	  if (destination!.item!.buttons != null) {
		for(var i = 0; i < destination!.item!.buttons!.length; i++)
		{
		  buttonChildren.add(itemMyProjectsButton(destination,i , context));
		}
    }
	
    final List<Widget> children = [

    ];
	 /* children.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child: Html(data: "<h3>Header</h3>"),
	  ));
	  */
	   children.add(destination!.viewOwner(context)); 
	   children.add(destination!.viewAcceptedWorker(context)); 
	   children.add(destination!.viewPhoto(context));
	   children.add(destination!.viewUserName(context));
	   children.add(destination!.viewKabupaten(context));
	   children.add(destination!.viewWorkerRating(context));
	   children.add(destination!.viewWorkerRatingNum(context));
	   children.add(destination!.viewWorkerPoint(context));
	   children.add(destination!.viewWorkerRanking(context));
	   children.add(destination!.viewOwnerRating(context));
	   children.add(destination!.viewOwnerRatingNum(context));
	   children.add(destination!.viewOwnerPoint(context));
	   children.add(destination!.viewOwnerRanking(context));
	   children.add(destination!.viewTitle(context)); 
	   children.add(destination!.viewShortDescription(context)); 
	   children.add(destination!.viewChannels(context)); 
	   children.add(destination!.viewProjectClass(context)); 
	   children.add(destination!.viewBudgetRange(context)); 
	   children.add(destination!.viewPublishedBudget(context)); 
	   children.add(destination!.viewPublishedDate(context)); 
	   children.add(destination!.viewSelectDeadline(context)); 
	   children.add(destination!.viewFinishDays(context)); 
	   children.add(destination!.viewProjectStatus(context)); 
	   children.add(destination!.viewProjectEnding(context)); 
	   children.add(destination!.viewBidCount(context)); 
	   children.add(destination!.viewNeedWeeklyReport(context)); 
	   children.add(destination!.viewWeeklyReportNeeded(context)); 
	   children.add(destination!.viewWeeklyReportPosted(context)); 
	   children.add(destination!.viewStartDate(context)); 
	   children.add(destination!.viewFinishDeadline(context)); 
	   children.add(destination!.viewFinishDate(context)); 
	   children.add(destination!.viewClosedDate(context)); 
	   children.add(destination!.viewAcceptedBudget(context)); 
	   children.add(destination!.viewProgress(context)); 
	   children.add(destination!.viewArbitration(context)); 
	   children.add(destination!.viewLastBump(context)); 
      /*    children.add(Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: "<h3>footer</h3>"),
                           )
     ); */


  if (destination!.item!.buttons != null) {
        if(buttonChildren.length > 4){
		if(buttonChildren.length == 5){
		children.add(
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
		children.add(
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
		if(buttonChildren.length == 6){
		children.add(
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
		children.add(
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
		if(buttonChildren.length == 7){
		children.add(
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
		children.add(
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
				if(buttonChildren.length == 8){
		children.add(
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
		children.add(
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
		children.add(
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
      children: children,
    );
  }
}

Widget itemMyProjectsButton(ItemMyProjectsModel? destination, int? index, BuildContext context){
  MyProjectsController my_projects; 
  
   if(destination!.item!.buttons![index!]!.url!.contains('user/my_purchases/download/')){
		return(	TextButton(
			  child: Text(destination!.item!.buttons![index!]!.text!, semanticsLabel: 'Share ${destination!.item!.ttl}'),
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
                        
                        my_projects =  MyProjectsController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item!.buttons![index!]!.url!,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_projects.downloadFile();
                         future.then((value) {

                       // state.setState(() {
                       // postMyProjectsResult = value;
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
				  child: Text(destination!.item!.buttons![index!]!.text!, semanticsLabel: 'Share ${destination!.item!.ttl}'),
          style: ButtonStyle(
            textStyle:
            MaterialStateProperty.all<TextStyle>(
                const TextStyle(color:  CurrentTheme.MainAccentColor)),
            backgroundColor:
            MaterialStateProperty.all<Color>(
                CurrentTheme.SecondaryAccentColor),
          ),
				  onPressed: () {
					print('${destination!.item!.buttons![index!]!.url}');
					if(destination!.item!.buttons![index!]!.url!.contains('show_conversation')){
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item!.buttons![index!]!.url! + '/' ));
					}else{
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item!.buttons![index!]!.url! ));
					}

				  },
				)
			  );
  }
}



class ItemMyProjectsWidget extends StatelessWidget {

	final ItemMyProjectsModel? item;
	final String?   search;
	const  ItemMyProjectsWidget({Key? key, @required this.item, this.search}) : super(key: key);


	@override
	Widget build(BuildContext context) {
		return Visibility (
			// visible: (this.search == '' || this.browse_projects.item!.title.contains(this.search!) || this.browse_projects.items.items.article.contains(this.search!)),
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
						data:item!.item!.sbttl ,
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


SpeedDialChild ListButtonMyProjectsWidget(Button button, BuildContext context, bool? account){
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
                        label: button.text! == 'Order by ...' ?  button.text! :'Order : ' + button.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button.text!,
                        initialitems: button.selections,
                        initvalue: button.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()
		  {
		     if (account!){
           if(button.url!.contains('/listing') || button.url!.contains('/index')){
			          AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! + '/')) ;
           }else{
             	 AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! + '//')) ;
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






  






  

