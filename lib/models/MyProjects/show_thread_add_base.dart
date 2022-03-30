
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
part 'show_thread_add_base.g.dart';



SpeedDialChild ButtonEditShowThreadWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController show_thread,
 var postShowThreadResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        show_thread =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = show_thread.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShowThreadResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelShowThread {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?post_id;
   int?user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
   int?project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
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
  double? bid_amount;
  String? bid_amount_str;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool? read_by_owner;
  bool? read_by_worker;

	
	  AddModelShowThread(
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
			this.bid_amount,
			this.bid_amount_str,
			this.attachments,
			this.attachments_name,

  );
    factory AddModelShowThread.fromJson(Map<String, dynamic> json) => _$AddModelShowThreadFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelShowThreadToJson(this);

}



@JsonSerializable()

class ShowThreadSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelShowThread? model;
  ShowThreadSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ShowThreadSuperBase.fromJson(Map<String, dynamic> json) => _$ShowThreadSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowThreadSuperBaseToJson(this);
   
}




class ShowThreadAddBase{
	var model;
	Map<String, dynamic> json;
	ShowThreadAddBase(this.json){
		model = ShowThreadSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "project_posts[_trigger_]":"",
  "project_posts[user_id]": "${model.model.user_id }",
  "project_posts[project_id]": "${model.model.project_id }",
  "project_posts[thread_id]": "${model.model.thread_id }",
   "project_posts[post_type_id]": "${model.model.post_type_id}",
  "project_posts[post_date]": "${model.model.post_date}",
  "project_posts[bid_amount]": "${model.model.bid_amount}",
  "project_posts[message]": "${model.model.message }",
  "project_posts[attachments]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "project_posts[read_by_owner]": "${model.model.read_by_owner}",
  "project_posts[read_by_worker]": "${model.model.read_by_worker}",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_thread,
  var postShowThreadResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditShowThreadWidget(model.buttons[i], context,formKey, controller,show_thread, postShowThreadResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController show_thread,
  var postShowThreadResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,show_thread, postShowThreadResult, state, sendPath, id,  title )
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
	  required:true,
	  idenum: model.model.project_id_list,
	  nameenum: model.model.project_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.project_id = val;
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

	  	    Widget editBidAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.bid_amount,
	  caption: 'Bid Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.bid_amount = val;
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

	  	    Widget editReadByOwner (State state) {
      return(
	BooleanWidget(
	  value: model.model.read_by_owner,
	  caption: 'Read By Owner',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
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
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.read_by_worker = val;
		});
	  },
	));} 
	
}









  

