
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
part 'show_bids_view_profile_base.g.dart';



@JsonSerializable()

class ModelActionViewProfileShowBids {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? bid_id;
  int? worker_id;
  String? worker_str;
  List<int?>? worker_list;
  List<String?>? worker_list_str;
  int? project_id;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? mark_id;
  String? mark_str;
  List<int?>? mark_list;
  List<String?>? mark_list_str;
  DateTime? date;
  int? location_id;
  String? location_str;
  List<int?>? location_list;
  List<String?>? location_list_str;
  int? rating;
  int? matching_skills;
  double? amount;
  String? message;
  String? attachments_name;
  List<FileField?>? attachments;
  bool?  read_by_owner;
  bool?  shortlisted;
  String? captcha;
  String? project_title;
  String? project_owner;
  String? description;
  String? published_budget;
   String? budget_range;
   double? budget_range_min;
   String? budget_range_min_str;
   double? budget_range_max;
   String? budget_range_max_str;
   String? budget_range_str;

	
	  ModelActionViewProfileShowBids(
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
			this.date,
			this.location_id,
			this.location_str,
			this.location_list,
			this.location_list_str,
			this.rating,
			this.matching_skills,
			this.amount,
			this.message,
			this.attachments,
			this.read_by_owner,
			this.shortlisted,
			this.captcha,
			this.project_title,
			this.project_owner,
			this.description,
			this.published_budget,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,

  );
    factory ModelActionViewProfileShowBids.fromJson(Map<String, dynamic> json) => _$ModelActionViewProfileShowBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionViewProfileShowBidsToJson(this);

}

@JsonSerializable()
class ViewProfileShowBidsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionViewProfileShowBids? model;
  ViewProfileShowBidsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory ViewProfileShowBidsSuperBase.fromJson(Map<String, dynamic> json) => _$ViewProfileShowBidsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ViewProfileShowBidsSuperBaseToJson(this);
  
 
}

class ViewProfileShowBidsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	ViewProfileShowBidsBase(this.json){
		model = ViewProfileShowBidsSuperBase.fromJson(this.json);
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

Widget RButtonActionShowBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController show_bids,
 var postShowBidsResult, State state, String? sendPath, String? id,  String? title){
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
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
               style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: Colors.white)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						cl),
					),
			 // textColor: Colors.white,
             // splashColor : CurrentTheme.ShadeColor,
             // color : Color(0xFF037f51),
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
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
							   Text(button.text!),
                             ],
                            ),
			   style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
				  ),				
            // textColor: button.color == 'green'? Colors.white : Colors.black,
            //  color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
            //  splashColor :  CurrentTheme.ShadeColor,
            //  shape: RoundedRectangleBorder(
             //     side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
             //     ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                   controller.animateTo(controller.position.minScrollExtent,
									duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
									if (formKey.currentState.validate()) {
									//Map<String, dynamic> res = model.toJson();
									//print('json result == $res');
									var formData = await convertFormDataAction(model);
									show_bids = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = show_bids.sendData();
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
									postShowBidsResult = value;
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
					                    }else{
										  AppProvider.getRouter(context)!.pop(context);
										   }
                      });
                      
                                

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

SpeedDialChild ButtonActionShowBidsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
 var postShowBidsResult, State state, String? sendPath, String? id,  String? title){
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
                        show_bids = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = show_bids.sendData();
                        future.then((value) {
                        state.setState(() {
                        postShowBidsResult = value;
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
	//ShowBids
   Map<String, dynamic> convertFormDataAction(var data){
  String? action =   'ViewProfile';
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
   
     String? tgr =   'view_profile';
         var formData = {"bid[_trigger_]":"$tgr"};
  formData.addAll({"bid[worker_id]": "${model.model.worker_id }"});
  formData.addAll({"bid[project_id]": "${model.model.project_id }"});
   formData.addAll({"bid[status_id]": "${model.model.status_id }"});
   formData.addAll({"bid[mark_id]": "${model.model.mark_id }"});
  formData.addAll({"bid[date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}"});
  formData.addAll({"bid[location_id]": "${model.model.location_id }"});
  formData.addAll({"bid[rating]": "${model.model.rating }"});
  formData.addAll({"bid[matching_skills]": "${model.model.matching_skills }"});
  formData.addAll({"bid[amount]": "${model.model.amount }"});
  formData.addAll({"bid[message]": "${model.model.message }"});
  formData.addAll({"bid[attachments]": '$attachments'});
  formData.addAll({"bid[attachments_lastval]": '$attachments_last'});
  formData.addAll({"bid[read_by_owner]": "${model.model.read_by_owner ? 1 : 0}"});
  formData.addAll({"bid[shortlisted]": "${model.model.shortlisted ? 1 : 0}"});
  formData.addAll({"bid[captcha]": "${model.model.captcha }"});
  formData.addAll({"bid[project_title]": "${model.model.project_title }"});
  formData.addAll({"bid[project_owner]": "${model.model.project_owner }"});
  formData.addAll({"bid[description]": "${model.model.description }"});
  formData.addAll({"bid[published_budget]": "${model.model.published_budget }"});
  formData.addAll({"bid[budget_range_min]": "${model.model.budget_range_min }"});
  formData.addAll({"bid[budget_range_max]": "${model.model.budget_range_max }"});
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
  var postViewProfileResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionShowBidsWidget(model.buttons[i], context,formKey, controller,show_bids, postViewProfileResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController show_bids,
  var postViewProfileResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionShowBidsWidget(model.buttons[i], context,formKey, controller,show_bids, postViewProfileResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_bids,
  var postViewProfileResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,show_bids, postViewProfileResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController show_bids,
  var postViewProfileResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,show_bids, postViewProfileResult, state, sendPath, id,  title )
	    )
	 );
   } 
	
   
	  	    Widget editWorker (State state) {
      return(
	  ModelWidget(
	  value: model.model.worker_id,
	  caption: 'Worker',
	  hint: 'pilih Worker',
	   required: false,
	  idenum: model.model.worker_list,
	  nameenum: model.model.worker_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_id = val;
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
   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Status',
	   required: false,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: (int? val) {
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
	  hint: 'pilih Mark',
	   required: false,
	  idenum: model.model.mark_list,
	  nameenum: model.model.mark_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.mark_id = val;
		});
	  },
	));}
	  	    Widget editDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan Date diatas.',
	   required: false,
	  getValue:(DateTime? val) {
		state.setState(() {
		  model.model.date = val;
		});
	  },
	));} 
	  	    Widget editLocation (State state) {
      return(
	  ModelWidget(
	  value: model.model.location_id,
	  caption: 'Location',
	  hint: 'pilih Location',
	   required: false,
	  idenum: model.model.location_list,
	  nameenum: model.model.location_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.location_id = val;
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
	  	    Widget editMatchingSkills (State state) {
      return(
	PercentWidget(
	  value: model.model.matching_skills,
	  caption: 'Matching Skills',
	  hint: 'Isi dengan Matching Skills Anda',
	   required: false,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
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
	  hint: 'Isi dengan Amount Anda',
	   required: true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {
		  model.model.amount = val;
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
			   required: true,
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
		   required: true,
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
	  	    Widget editShortlisted (State state) {
      return(
	BooleanWidget(
	  value: model.model.shortlisted,
	  caption: 'Shortlisted',
	  hint: 'Isi dengan Shortlisted Anda',
	   required: false,
	  getValue: (bool? val) {
		state.setState(() {
		  model.model.shortlisted = val;
		});
	  },
	));} 
	  	    Widget editCaptcha (State state) {
		if(model.model.captcha == null){
				return(
				new CaptchaWidget(
				  value: '',
				  caption: 'Captcha',
				  hint: '',
				   required: true,
				  getValue:(String? val) {
					state.setState(() {
					  model.model.captcha = val;
					});
				  },
				));
		}else{
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
				));
		}		
      }
	  	    Widget editProjectTitle (State state) {
      return(
	TitleWidget(
		value: model.model.project_title,
		caption: 'Project Title',
		hint: 'Isi dengan Project Title Anda',
		 required: false,
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
		hint: 'Isi dengan Project Owner Anda',
		 required: false,
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
		hint: 'Isi dengan Description Anda',
		 required: false,
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
		hint: 'Isi dengan Published Budget Anda',
		 required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_budget = val;
		  });
		},
    ));}
	  	    Widget editBudgetRange (State state) {
      return(   
        new RangeWidget( 
          value: model.model.budget_range,
          valuemin: model.model.budget_range_min,
          valuemax: model.model.budget_range_max,
          caption: 'Range Budget',
          hint: 'Isi dengan Range penawaran Anda',
          required:false,
         min: '0',
         max: '1000000',

          getValue1: (double? val) {
            state.setState(() {
              model.model.budget_range_min = val;
            });
          },
          getValue2: (double? val) {
            state.setState(() {
              model.model.budget_range_max = val;
            });
          },
          getValue: (String? val) {
            state.setState(() {
              model.model.budget_range = val;
            });
          },
        )
      );}  

}
















  

