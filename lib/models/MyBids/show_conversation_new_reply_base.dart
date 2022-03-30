
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
part 'show_conversation_new_reply_base.g.dart';
/** AUTOGENERATE OFF **/


@JsonSerializable()

class ModelActionNewReplyShowConversation {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? post_id;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;

	
	  ModelActionNewReplyShowConversation(
            this.id,
			this.post_id,
			this.message,
			this.attachments,

  );
    factory ModelActionNewReplyShowConversation.fromJson(Map<String, dynamic> json) => _$ModelActionNewReplyShowConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionNewReplyShowConversationToJson(this);

}

@JsonSerializable()
class NewReplyShowConversationSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionNewReplyShowConversation? model;
  NewReplyShowConversationSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory NewReplyShowConversationSuperBase.fromJson(Map<String, dynamic> json) => _$NewReplyShowConversationSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$NewReplyShowConversationSuperBaseToJson(this);
  
 
}

class NewReplyShowConversationBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	NewReplyShowConversationBase(this.json){
		model = NewReplyShowConversationSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}




Widget RButtonActionShowConversationWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController show_conversation,
 var postShowConversationResult, State state, String sendPath, String id,  String title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double width = 400; //size.width;
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
                               Text('Reply'),
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
									show_conversation = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = show_conversation.sendData();
									future.then((value) {
									state.setState(() {
									postShowConversationResult = value;
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

SpeedDialChild ButtonActionShowConversationWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController show_conversation,
 var postShowConversationResult, State state, String sendPath, String id,  String title){
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
                        //AppProvider.getRouter(context).navigateTo(context,
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
                        show_conversation = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = show_conversation.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShowConversationResult = value;
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
	//ShowConversation
   Map<String, dynamic> convertFormDataAction(var data){
  String action =   'NewReply';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachments = '';
  String attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
   
     String tgr =   'new_reply';
         var formData = {"post[_trigger_]":"$tgr"};
  formData.addAll({"post[message]": "${model.model.message }"});
  formData.addAll({"post[attachments]": '$attachments'});
  formData.addAll({"post[attachments_lastval]": '$attachments_last'});
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_conversation,
  var postNewReplyResult, State state, String sendPath, String id,  String title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionShowConversationWidget(model.buttons[i], context,formKey, controller,show_conversation, postNewReplyResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_conversation,
  var postNewReplyResult, State state, String sendPath, String id,  String title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionShowConversationWidget(model.buttons[i], context,formKey, controller,show_conversation, postNewReplyResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool visible, var formKey, ScrollController controller, SubModelController show_conversation,
  var postNewReplyResult, State state, String sendPath, String id,  String title ){
     // final size =MediaQuery.of(context).size;
    double width = 400;

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
           RlistButton(context, formKey,controller,show_conversation, postNewReplyResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool visible, var formKey, ScrollController controller, SubModelController show_conversation,
  var postNewReplyResult, State state, String sendPath, String id,  String title ){
     return(
	 SpeedDial(
       childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
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
				children:listButton(context, formKey,controller,show_conversation, postNewReplyResult, state, sendPath, id,  title )
	    )
	 );
   } 
	
   
	  	    Widget editMessage (State state) {
	if(model.model.message == null){
			return(
			new ArticleWidget(
			  value: '',
			  caption: 'Message',
			  hint: 'isi dengan Article Anda',
			   required: false,
			  getValue:(String val) {
				state.setState(() {
				  model.model.message = val;
				});
			  },
			));
	}else{		
		  return(
		  new ArticleWidget(
		  value: model.model.message,
		  caption: 'Message',
		  hint: 'isi dengan Article Anda',
		   required: false,
		  getValue:(String val) {
			state.setState(() {
			  model.model.message = val;
			});
		  },
		));
	}
	}
	  	    Widget editAttachments (State state) {
      return(
	FileWidget(
		value: model.model.attachments,
		caption: 'Attachments',
		hint: 'Isi dengan File Anda',
		 required: false,
		getValue: (var val) {
		  state.setState(() {
			model.model.attachments = val;
		  });
		},
	));} 

}
















  

