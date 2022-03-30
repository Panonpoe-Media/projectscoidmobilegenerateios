
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
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
import '../option_fields.dart';
import '../image_fields.dart';
import '../file_fields.dart';
part 'service_comments_add_base.g.dart';



SpeedDialChild ButtonEditServiceCommentsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController service_comments,
 var postServiceCommentsResult, State state, String? sendPath, String? id,  String? title, var formData){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0),
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
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        service_comments =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = service_comments.sendData();
                        future.then((value) {
                        state.setState(() {
                        postServiceCommentsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelServiceComments {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?service_post_id;
   int?user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
   int?service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
   int?thread_id;
  String? thread_url;
  String? thread_str;
  List<int?>? thread_list;
  List<String?>? thread_list_str;
   int?post_type_id;
  String? post_type_str;
  List<int?>? post_type_list;
  List<String?>? post_type_list_str;
  DateTime? post_date;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool? read_by_seller;
  bool? read_by_buyer;
  String? captcha;

	
	  AddModelServiceComments(
            this.id,
            this.service_post_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.thread_id,
			this.thread_str,
			this.thread_list,
			this.thread_list_str,
			this.post_type_id,
			this.post_type_str,
			this.post_type_list,
			this.post_type_list_str,
			this.attachments,
			this.attachments_name,

  );
    factory AddModelServiceComments.fromJson(Map<String, dynamic> json) => _$AddModelServiceCommentsFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelServiceCommentsToJson(this);

}



@JsonSerializable()

class ServiceCommentsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelServiceComments? model;
  ServiceCommentsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ServiceCommentsSuperBase.fromJson(Map<String, dynamic> json) => _$ServiceCommentsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCommentsSuperBaseToJson(this);
   
}




class ServiceCommentsAddBase{
	var model;
	Map<String, dynamic> json;
	ServiceCommentsAddBase(this.json){
		model = ServiceCommentsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "service_comments[_trigger_]":"",
  "service_comments[user_id]": "${model.model.user_id }",
  "service_comments[service_id]": "${model.model.service_id }",
  "service_comments[thread_id]": "${model.model.thread_id }",
   "service_comments[post_type_id]": "${model.model.post_type_id}",
  "service_comments[post_date]": "${model.model.post_date}",
  "service_comments[message]": "${model.model.message }",
  "service_comments[attachments]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "service_comments[read_by_seller]": "${model.model.read_by_seller}",
  "service_comments[read_by_buyer]": "${model.model.read_by_buyer}",
  "service_comments[captcha]": "${model.model.captcha }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController service_comments,
  var postServiceCommentsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditServiceCommentsWidget(model.buttons[i], context,formKey, controller,service_comments, postServiceCommentsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController service_comments,
  var postServiceCommentsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,service_comments, postServiceCommentsResult, state, sendPath, id,  title )
	    )
	 );
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
	  required:true,
	  idenum: model.model.user_id_list,
	  nameenum: model.model.user_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.user_id = val;
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
	  required:true,
	  idenum: model.model.service_id_list,
	  nameenum: model.model.service_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	  	    Widget editThread (State state) {
	   return(  StringView(
		value: model.model.thread_str,
		caption: 'Thread',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.thread_id,
	  caption: 'Thread',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.thread_id_list,
	  nameenum: model.model.thread_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.thread_id = val;
		});
	  },
	));*/
	}

   	    Widget editPostType (State state) {
      return(
	  EnumWidget(
	  value: model.model.post_type_id,
	  caption: 'Post Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.post_type_list,
	  nameenum: model.model.post_type_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.post_type_id = val;
		});
	  },
	));}

	  	    Widget editPostDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.post_date,
	  caption: 'Post Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.post_date = val;
		});
	  },
	));} 

	  	    Widget editMessage (State state) {
      return(
	  ArticleWidget(
	  value: model.model.message,
	  caption: 'Message',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.message = val;
		});
	  },
	));}

	  	    Widget editAttachments (State state) {
      return(
	FileWidget(
		value: model.model.attachments[0],
		caption: 'Attachments',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.attachments[0] = val;
		  });
		},
	));} 

	  	    Widget editReadBySeller (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_seller,
	  caption: 'Read By Seller',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.read_by_seller = val;
		});
	  },
	));} 

	  	    Widget editReadByBuyer (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_buyer,
	  caption: 'Read By Buyer',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.read_by_buyer = val;
		});
	  },
	));} 

	  	    Widget editCaptcha (State state) {
      return(
	  CaptchaWidget(
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









  

