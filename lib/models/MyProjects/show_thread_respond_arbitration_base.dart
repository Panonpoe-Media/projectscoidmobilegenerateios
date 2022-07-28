
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
part 'show_thread_respond_arbitration_base.g.dart';



@JsonSerializable()

class ModelActionRespondArbitrationShowThread {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? post_id;
  int? user_id;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? project_id;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? thread_id;
  String? thread_str;
  List<int?>? thread_list;
  List<String?>? thread_list_str;
  int? post_type_id;
  String? post_type_str;
  List<int?>? post_type_list;
  List<String?>? post_type_list_str;
  DateTime? post_date;
  double? bid_amount;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool?  read_by_owner;
  bool?  read_by_worker;

	
	  ModelActionRespondArbitrationShowThread(
            this.id,
			this.post_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.thread_id,
			this.thread_str,
			this.thread_list,
			this.thread_list_str,
			this.post_type_id,
			this.post_type_str,
			this.post_type_list,
			this.post_type_list_str,
			this.post_date,
			this.bid_amount,
			this.message,
			this.attachments,
			this.read_by_owner,
			this.read_by_worker,

  );
    factory ModelActionRespondArbitrationShowThread.fromJson(Map<String, dynamic> json) => _$ModelActionRespondArbitrationShowThreadFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionRespondArbitrationShowThreadToJson(this);

}

@JsonSerializable()
class RespondArbitrationShowThreadSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionRespondArbitrationShowThread? model;
  RespondArbitrationShowThreadSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory RespondArbitrationShowThreadSuperBase.fromJson(Map<String, dynamic> json) => _$RespondArbitrationShowThreadSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RespondArbitrationShowThreadSuperBaseToJson(this);
  
 
}

class RespondArbitrationShowThreadBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	RespondArbitrationShowThreadBase(this.json){
		model = RespondArbitrationShowThreadSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}




Widget RButtonActionShowThreadWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController show_thread,
 var postShowThreadResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400; //size.width;
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
							   Text(button.text!),
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
									show_thread = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = show_thread.sendData();
									future.then((value) {
									state.setState(() {
									postShowThreadResult = value;
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

SpeedDialChild ButtonActionShowThreadWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController show_thread,
 var postShowThreadResult, State state, String? sendPath, String? id,  String? title){
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
                        //AppProvider.getRouter(context)!.navigateTo(context,
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
                        show_thread = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = show_thread.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShowThreadResult = value;
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
	//ShowThread
   Map<String, dynamic> convertFormDataAction(var data){
  String? action =   'RespondArbitration';
   bool?  isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String attachments = '';
  String? attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
   
     String? tgr =   'respond_arbitration';
         var formData = {"post[_trigger_]":"$tgr"};
  formData.addAll({"post[user_id]": "${model.model.user_id }"});
  formData.addAll({"post[project_id]": "${model.model.project_id }"});
  formData.addAll({"post[thread_id]": "${model.model.thread_id }"});
   formData.addAll({"post[post_type_id]": "${model.model.post_type_id }"});
  formData.addAll({"post[post_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.post_date)}"});
  formData.addAll({"post[bid_amount]": "${model.model.bid_amount }"});
  formData.addAll({"post[message]": "${model.model.message }"});
  formData.addAll({"post[attachments]": '$attachments'});
  formData.addAll({"post[attachments_lastval]": '$attachments_last'});
  formData.addAll({"post[read_by_owner]": "${model.model.read_by_owner ? 1 : 0}"});
  formData.addAll({"post[read_by_worker]": "${model.model.read_by_worker ? 1 : 0}"});
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_thread,
  var postRespondArbitrationResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionShowThreadWidget(model.buttons[i], context,formKey, controller,show_thread, postRespondArbitrationResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_thread,
  var postRespondArbitrationResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionShowThreadWidget(model.buttons[i], context,formKey, controller,show_thread, postRespondArbitrationResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_thread,
  var postRespondArbitrationResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,show_thread, postRespondArbitrationResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_thread,
  var postRespondArbitrationResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,show_thread, postRespondArbitrationResult, state, sendPath, id,  title )
	    )
	 );
   } 
	
   
	  	    Widget editUser (State state) {
      return(
	  ModelWidget(
	  value: model.model.user_id,
	  caption: 'User',
	  hint: 'pilih User',
	   required: false,
	  idenum: model.model.user_list,
	  nameenum: model.model.user_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.user_id = val;
		});
	  },
	));}
	  	    Widget editProject (State state) {
      return(
	  ModelWidget(
	  value: model.model.project_id,
	  caption: 'Project',
	  hint: 'pilih Project',
	   required: false,
	  idenum: model.model.project_list,
	  nameenum: model.model.project_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_id = val;
		});
	  },
	));}
	  	    Widget editThread (State state) {
      return(
	  ModelWidget(
	  value: model.model.thread_id,
	  caption: 'Thread',
	  hint: 'pilih Thread',
	   required: false,
	  idenum: model.model.thread_list,
	  nameenum: model.model.thread_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.thread_id = val;
		});
	  },
	));}
   	    Widget editPostType (State state) {
      return(
	  EnumWidget(
	  value: model.model.post_type_id,
	  caption: 'Post Type',
	  hint: 'pilih Post Type',
	   required: false,
	  idenum: model.model.post_type_list,
	  nameenum: model.model.post_type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.post_type_id = val;
		});
	  },
	));}
	  	    Widget editPostDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.post_date,
	  caption: 'Post Date',
	  hint: 'isi dengan Post Date diatas.',
	   required: false,
	  getValue:(DateTime? val) {
		state.setState(() {
		  model.model.post_date = val;
		});
	  },
	));} 
	  	    Widget editBidAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.bid_amount,
	  caption: 'Bid Amount',
	  hint: 'Isi dengan Bid Amount Anda',
	   required: false,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {
		  model.model.bid_amount = val;
		});
	  },
	));}
	  	    Widget editMessage (State state) {
	if(model.model.message == null){
			return(
			new ArticleWidget(
			  value: '',
			  caption: 'Message',
			  hint: 'isi dengan Message Anda',
			   required: false,
			  getValue:(String? val) {
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
		  hint: 'isi dengan Message Anda',
		   required: false,
		  getValue:(String? val) {
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
		hint: 'Isi dengan Attachments Anda',
		 required: false,
		getValue: (var val) {
		  state.setState(() {
			model.model.attachments = val;
		  });
		},
	));} 
	  	    Widget editReadByOwner (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_owner,
	  caption: 'Read By Owner',
	  hint: 'Isi dengan Read By Owner Anda',
	   required: false,
	  getValue: (bool? val) {
		state.setState(() {
		  model.model.read_by_owner = val;
		});
	  },
	));} 
	  	    Widget editReadByWorker (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_worker,
	  caption: 'Read By Worker',
	  hint: 'Isi dengan Read By Worker Anda',
	   required: false,
	  getValue: (bool? val) {
		state.setState(() {
		  model.model.read_by_worker = val;
		});
	  },
	));} 

}
















  

