
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
part 'shortlisted_bids_add_base.g.dart';



SpeedDialChild ButtonEditShortlistedBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController shortlisted_bids,
 var postShortlistedBidsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        shortlisted_bids =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = shortlisted_bids.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShortlistedBidsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelShortlistedBids {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?bid_id;
   int?worker_id;
  String? worker_url;
  String? worker_str;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
   int?project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
   int?status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
   int?mark_id;
  String? mark_str;
  List<int?>? mark_list;
  List<String?>? mark_list_str;
  DateTime? date;
   int?location_id;
  String? location_url;
  String? location_str;
  List<int?>? location_list;
  List<String?>? location_list_str;
   int?rating;
   int?matching_skills;
  double? amount;
  String? amount_str;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool? read_by_owner;
  bool? shortlisted;
  String? captcha;
  String? project_title;
  String? project_owner;
  String? description;
  String? published_budget;
     String? budget_range;

	
	  AddModelShortlistedBids(
            this.id,
            this.bid_id,
			this.worker_id,
			this.worker_str,
			this.worker_list,
			this.worker_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.mark_id,
			this.mark_str,
			this.mark_list,
			this.mark_list_str,
			this.location_id,
			this.location_str,
			this.location_list,
			this.location_list_str,
			this.amount,
			this.amount_str,
			this.attachments,
			this.attachments_name,

  );
    factory AddModelShortlistedBids.fromJson(Map<String, dynamic> json) => _$AddModelShortlistedBidsFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelShortlistedBidsToJson(this);

}



@JsonSerializable()

class ShortlistedBidsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelShortlistedBids? model;
  ShortlistedBidsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ShortlistedBidsSuperBase.fromJson(Map<String, dynamic> json) => _$ShortlistedBidsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortlistedBidsSuperBaseToJson(this);
   
}




class ShortlistedBidsAddBase{
	var model;
	Map<String, dynamic> json;
	ShortlistedBidsAddBase(this.json){
		model = ShortlistedBidsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "shortlisted_bids[_trigger_]":"",
  "shortlisted_bids[worker_id]": "${model.model.worker_id }",
  "shortlisted_bids[project_id]": "${model.model.project_id }",
   "shortlisted_bids[status_id]": "${model.model.status_id}",
   "shortlisted_bids[mark_id]": "${model.model.mark_id}",
  "shortlisted_bids[date]": "${model.model.date}",
  "shortlisted_bids[location_id]": "${model.model.location_id }",
  "shortlisted_bids[rating]": "${model.model.rating }",
  "shortlisted_bids[matching_skills]": "${model.model.matching_skills }",
  "shortlisted_bids[amount]": "${model.model.amount}",
  "shortlisted_bids[message]": "${model.model.message }",
  "shortlisted_bids[attachments]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "shortlisted_bids[read_by_owner]": "${model.model.read_by_owner}",
  "shortlisted_bids[shortlisted]": "${model.model.shortlisted}",
  "shortlisted_bids[captcha]": "${model.model.captcha }",
  "shortlisted_bids[project_title]": "${model.model.project_title }",
  "shortlisted_bids[project_owner]": "${model.model.project_owner }",
  "shortlisted_bids[description]": "${model.model.description }",
  "shortlisted_bids[published_budget]": "${model.model.published_budget }",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController shortlisted_bids,
  var postShortlistedBidsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditShortlistedBidsWidget(model.buttons[i], context,formKey, controller,shortlisted_bids, postShortlistedBidsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController shortlisted_bids,
  var postShortlistedBidsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,shortlisted_bids, postShortlistedBidsResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editWorker (State state) {
	   return(  StringView(
		value: model.model.worker_str,
		caption: 'Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_id,
	  caption: 'Worker',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.worker_id_list,
	  nameenum: model.model.worker_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.worker_id = val;
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

   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

   	    Widget editMark (State state) {
      return(
	  EnumWidget(
	  value: model.model.mark_id,
	  caption: 'Mark',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.mark_list,
	  nameenum: model.model.mark_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.mark_id = val;
		});
	  },
	));}

	  	    Widget editDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.date = val;
		});
	  },
	));} 

	  	    Widget editLocation (State state) {
	   return(  StringView(
		value: model.model.location_str,
		caption: 'Location',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.location_id,
	  caption: 'Location',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.location_id_list,
	  nameenum: model.model.location_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.location_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRating (State state) {
      return(
	  RatingWidget(
	  value: model.model.rating,
	  caption: 'Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:( int?val) {
		state.setState(() {
		  model.model.rating = val;
		});
	  },
	));}

	  	    Widget editMatchingSkills (State state) {
      return(
	PercentWidget(
	  value: model.model.matching_skills,
	  caption: 'Matching Skills',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'0.0',
	  max:'100.0',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.matching_skills = val;
		});
	  },
	));}

	  	    Widget editAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.amount,
	  caption: 'Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.amount = val;
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

	  	    Widget editShortlisted (State state) {
      return(
	BooleanWidget(
	  value: model.model.shortlisted,
	  caption: 'Shortlisted',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.shortlisted = val;
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

	  	    Widget editProjectTitle (State state) {
      return(
	TitleWidget(
		value: model.model.project_title,
		caption: 'Project Title',
		hint: 'Isi dengan Title Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.project_title = val;
		  });
		},
	));}

	  	    Widget editProjectOwner (State state) {
      return(
	DisplayNameWidget(
		value: model.model.project_owner,
		caption: 'Project Owner',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.project_owner = val;
		  });
		},
    ));}

	  	    Widget editDescription (State state) {
      return(
	DisplayNameWidget(
		value: model.model.description,
		caption: 'Description',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.description = val;
		  });
		},
    ));}

	  	    Widget editPublishedBudget (State state) {
      return(
	DisplayNameWidget(
		value: model.model.published_budget,
		caption: 'Published Budget',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_budget = val;
		  });
		},
    ));}

	
}









  

