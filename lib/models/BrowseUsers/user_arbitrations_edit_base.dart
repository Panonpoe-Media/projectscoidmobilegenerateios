
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
part 'user_arbitrations_edit_base.g.dart';

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionUserArbitrationsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController user_arbitrations,
 var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title,  var formData){
  var cl;
  var ic;
 //  final size =MediaQuery.of(context).size;
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
                                                  const Color(0xFF037f51),),
                                              ),

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
                                                textStyle: button.color == 'green'?
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.white)):
												 MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.black))	,
                                                backgroundColor: button.color == 'green'? 
                                                MaterialStateProperty.all<Color>(
                                                  const Color(0xFF037f51),):
												  MaterialStateProperty.all<Color>(
                                                  Colors.white,) ,
												  shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
												  ),


             // shape: RoundedRectangleBorder(
               //   side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                //  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        user_arbitrations =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = user_arbitrations.sendData();
                        future.then((value) {
                        state.setState(() {
                        postUserArbitrationsResult = value;
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
                      });
						;

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

SpeedDialChild ButtonEditUserArbitrationsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController user_arbitrations,
 var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        user_arbitrations =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = user_arbitrations.sendData();
                        future.then((value) {
                        state.setState(() {
                        postUserArbitrationsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelUserArbitrations {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? arbitration_id;
  int? plaintiff_id;
  String? plaintiff_url;
  String? plaintiff_str;
  List<int?>? plaintiff_list;
  List<String?>? plaintiff_list_str;
  int? defendant_id;
  String? defendant_url;
  String? defendant_str;
  List<int?>? defendant_list;
  List<String?>? defendant_list_str;
  int? project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  DateTime? status_date;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? plaintiff_description;
  String? plaintiff_wishes;
  bool? plaintiff_has_offer;
  double? plaintiff_offer_for_worker;
  String? plaintiff_offer_for_worker_str;
  double? plaintiff_offer_for_owner;
  String? plaintiff_offer_for_owner_str;
  DateTime? plaintiff_response_date;
  String? plaintiff_ip;
  String? defendant_description;
  String? defendant_wishes;
  bool? defendant_has_offer;
  double? defendant_offer_for_worker;
  String? defendant_offer_for_worker_str;
  double? defendant_offer_for_owner;
  String? defendant_offer_for_owner_str;
  DateTime? defendant_response_date;
  int? defendant_last_status_id;
  String? defendant_last_status_str;
  List<int?>? defendant_last_status_list;
  List<String?>? defendant_last_status_list_str;
  String? defendant_ip;
  DateTime? requested_date;
  int? requested_by_id;
  String? requested_by_url;
  String? requested_by_str;
  List<int?>? requested_by_list;
  List<String?>? requested_by_list_str;
  String? requested_ip;
  DateTime? decided_date;
  int? decided_by_id;
  String? decided_by_url;
  String? decided_by_str;
  List<int?>? decided_by_list;
  List<String?>? decided_by_list_str;
  String? decided_ip;
  DateTime? canceled_date;
  int? canceled_by_id;
  String? canceled_by_url;
  String? canceled_by_str;
  List<int?>? canceled_by_list;
  List<String?>? canceled_by_list_str;
  String? canceled_ip;
  int? arbitrator_2_id;
  String? arbitrator_2_url;
  String? arbitrator_2_str;
  List<int?>? arbitrator_2_list;
  List<String?>? arbitrator_2_list_str;
  int? arbitrator_3_id;
  String? arbitrator_3_url;
  String? arbitrator_3_str;
  List<int?>? arbitrator_3_list;
  List<String?>? arbitrator_3_list_str;
  int? owner_rating;
  int? owner_point;
  String? owner_point_str;
  int? owner_point_base_id;
  String? owner_point_base_url;
  String? owner_point_base_str;
  List<int?>? owner_point_base_list;
  List<String?>? owner_point_base_list_str;
  double? owner_amount;
  String? owner_amount_str;
  int? owner_percentage;
  int? worker_rating;
  int? worker_point;
  String? worker_point_str;
  int? worker_point_base_id;
  String? worker_point_base_url;
  String? worker_point_base_str;
  List<int?>? worker_point_base_list;
  List<String?>? worker_point_base_list_str;
  double? worker_amount;
  String? worker_amount_str;
  int? worker_percentage;
  String? analysis;
  String? project_title;
  String? project_owner;
  String? project_worker;
  double? budget;
  String? budget_str;
  String? problem_description;
  String? your_wishes;
  String? your_offer;
  double? worker_receives;
  String? worker_receives_str;
  double? owner_receives;
  String? owner_receives_str;

	
	  EditModelUserArbitrations(
            this.id,
            this.arbitration_id,
			this.plaintiff_id,
			this.plaintiff_str,
			this.plaintiff_list,
			this.plaintiff_list_str,
			this.defendant_id,
			this.defendant_str,
			this.defendant_list,
			this.defendant_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.plaintiff_offer_for_worker,
			this.plaintiff_offer_for_worker_str,
			this.plaintiff_offer_for_owner,
			this.plaintiff_offer_for_owner_str,
			this.defendant_offer_for_worker,
			this.defendant_offer_for_worker_str,
			this.defendant_offer_for_owner,
			this.defendant_offer_for_owner_str,
			this.defendant_last_status_id,
			this.defendant_last_status_str,
			this.defendant_last_status_list,
			this.defendant_last_status_list_str,
			this.requested_by_id,
			this.requested_by_str,
			this.requested_by_list,
			this.requested_by_list_str,
			this.decided_by_id,
			this.decided_by_str,
			this.decided_by_list,
			this.decided_by_list_str,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.arbitrator_2_id,
			this.arbitrator_2_str,
			this.arbitrator_2_list,
			this.arbitrator_2_list_str,
			this.arbitrator_3_id,
			this.arbitrator_3_str,
			this.arbitrator_3_list,
			this.arbitrator_3_list_str,
			this.owner_point,
			this.owner_point_str,
			this.owner_point_base_id,
			this.owner_point_base_str,
			this.owner_point_base_list,
			this.owner_point_base_list_str,
			this.owner_amount,
			this.owner_amount_str,
			this.worker_point,
			this.worker_point_str,
			this.worker_point_base_id,
			this.worker_point_base_str,
			this.worker_point_base_list,
			this.worker_point_base_list_str,
			this.worker_amount,
			this.worker_amount_str,
			this.budget,
			this.budget_str,
			this.worker_receives,
			this.worker_receives_str,
			this.owner_receives,
			this.owner_receives_str,

  );
    factory EditModelUserArbitrations.fromJson(Map<String, dynamic> json) => _$EditModelUserArbitrationsFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelUserArbitrationsToJson(this);

}



@JsonSerializable()

class UserArbitrationsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelUserArbitrations? model;
  UserArbitrationsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory UserArbitrationsSuperBase.fromJson(Map<String, dynamic> json) => _$UserArbitrationsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$UserArbitrationsSuperBaseToJson(this);
   
}




class EditUserArbitrationsBase{
	var model;
	Map<String, dynamic> json;
	EditUserArbitrationsBase(this.json){
		model = UserArbitrationsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "user_arbitrations[_trigger_]":"",
  "user_arbitrations[plaintiff_id]": "${model.model.plaintiff_id }",
  "user_arbitrations[defendant_id]": "${model.model.defendant_id }",
  "user_arbitrations[project_id]": "${model.model.project_id }",
   "user_arbitrations[status_id]": "${model.model.status_id}",
  "user_arbitrations[status_date]": "${model.model.status_date}",
   "user_arbitrations[type_id]": "${model.model.type_id}",
  "user_arbitrations[plaintiff_description]": "${model.model.plaintiff_description }",
  "user_arbitrations[plaintiff_wishes]": "${model.model.plaintiff_wishes }",
  "user_arbitrations[plaintiff_has_offer]": "${model.model.plaintiff_has_offer}",
  "user_arbitrations[plaintiff_offer_for_worker]": "${model.model.plaintiff_offer_for_worker}",
  "user_arbitrations[plaintiff_offer_for_owner]": "${model.model.plaintiff_offer_for_owner}",
  "user_arbitrations[plaintiff_response_date]": "${model.model.plaintiff_response_date}",
  "user_arbitrations[plaintiff_ip]": "${model.model.plaintiff_ip }",
  "user_arbitrations[defendant_description]": "${model.model.defendant_description }",
  "user_arbitrations[defendant_wishes]": "${model.model.defendant_wishes }",
  "user_arbitrations[defendant_has_offer]": "${model.model.defendant_has_offer}",
  "user_arbitrations[defendant_offer_for_worker]": "${model.model.defendant_offer_for_worker}",
  "user_arbitrations[defendant_offer_for_owner]": "${model.model.defendant_offer_for_owner}",
  "user_arbitrations[defendant_response_date]": "${model.model.defendant_response_date}",
   "user_arbitrations[defendant_last_status_id]": "${model.model.defendant_last_status_id}",
  "user_arbitrations[defendant_ip]": "${model.model.defendant_ip }",
  "user_arbitrations[requested_date]": "${model.model.requested_date}",
  "user_arbitrations[requested_by_id]": "${model.model.requested_by_id }",
  "user_arbitrations[requested_ip]": "${model.model.requested_ip }",
  "user_arbitrations[decided_date]": "${model.model.decided_date}",
  "user_arbitrations[decided_by_id]": "${model.model.decided_by_id }",
  "user_arbitrations[decided_ip]": "${model.model.decided_ip }",
  "user_arbitrations[canceled_date]": "${model.model.canceled_date}",
  "user_arbitrations[canceled_by_id]": "${model.model.canceled_by_id }",
  "user_arbitrations[canceled_ip]": "${model.model.canceled_ip }",
  "user_arbitrations[arbitrator_2_id]": "${model.model.arbitrator_2_id }",
  "user_arbitrations[arbitrator_3_id]": "${model.model.arbitrator_3_id }",
  "user_arbitrations[owner_rating]": "${model.model.owner_rating }",
  "user_arbitrations[owner_point]": "${model.model.owner_point }",
  "user_arbitrations[owner_point_base_id]": "${model.model.owner_point_base_id }",
  "user_arbitrations[owner_amount]": "${model.model.owner_amount}",
  "user_arbitrations[owner_percentage]": "${model.model.owner_percentage }",
  "user_arbitrations[worker_rating]": "${model.model.worker_rating }",
  "user_arbitrations[worker_point]": "${model.model.worker_point }",
  "user_arbitrations[worker_point_base_id]": "${model.model.worker_point_base_id }",
  "user_arbitrations[worker_amount]": "${model.model.worker_amount}",
  "user_arbitrations[worker_percentage]": "${model.model.worker_percentage }",
  "user_arbitrations[analysis]": "${model.model.analysis }",
  "user_arbitrations[project_title]": "${model.model.project_title }",
  "user_arbitrations[project_owner]": "${model.model.project_owner }",
  "user_arbitrations[project_worker]": "${model.model.project_worker }",
  "user_arbitrations[budget]": "${model.model.budget}",
  "user_arbitrations[problem_description]": "${model.model.problem_description }",
  "user_arbitrations[your_wishes]": "${model.model.your_wishes }",
  "user_arbitrations[your_offer]": "${model.model.your_offer }",
  "user_arbitrations[worker_receives]": "${model.model.worker_receives}",
  "user_arbitrations[owner_receives]": "${model.model.owner_receives}",
	  
  };  

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController user_arbitrations,
  var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionUserArbitrationsWidget(model.buttons[i], context,formKey, controller,user_arbitrations, postUserArbitrationsResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController user_arbitrations,
  var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditUserArbitrationsWidget(model.buttons[i], context,formKey, controller,user_arbitrations, postUserArbitrationsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController user_arbitrations,
  var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title ){
    //  final size =MediaQuery.of(context).size;
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
           RlistButton(context, formKey,controller,user_arbitrations, postUserArbitrationsResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController user_arbitrations,
  var postUserArbitrationsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,user_arbitrations, postUserArbitrationsResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editPlaintiff (State state) {
	   return(  StringView(
		value: model.model.plaintiff_str,
		caption: 'Plaintiff',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.plaintiff_id,
	  caption: 'Plaintiff',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.plaintiff_id_list,
	  nameenum: model.model.plaintiff_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.plaintiff_id = val;
		});
	  },
	));*/
	}

	  	    Widget editDefendant (State state) {
	   return(  StringView(
		value: model.model.defendant_str,
		caption: 'Defendant',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.defendant_id,
	  caption: 'Defendant',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.defendant_id_list,
	  nameenum: model.model.defendant_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.defendant_id = val;
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
	  getValue: (int? val) {
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
	  getValue: (int? val) {
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

	  	    Widget editStatusDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.status_date,
	  caption: 'Status Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.status_date = val;
		});
	  },
	));} 

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}

	  	    Widget editPlaintiffDescription (State state) {
      return(
	    ArticleWidget(
	  value: model.model.plaintiff_description,
	  caption: 'Plaintiff Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.plaintiff_description = val;
		});
	  },
	));}

	  	    Widget editPlaintiffWishes (State state) {
      return(
	    ArticleWidget(
	  value: model.model.plaintiff_wishes,
	  caption: 'Plaintiff Wishes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.plaintiff_wishes = val;
		});
	  },
	));}

	  	    Widget editPlaintiffHasOffer (State state) {
      return(
	BooleanWidget(
	  value: model.model.plaintiff_has_offer,
	  caption: 'Plaintiff Has Offer',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.plaintiff_has_offer = val;
		});
	  },
	));} 

	  	    Widget editPlaintiffOfferForWorker (State state) {
      return(
	MoneyWidget(
	  value: model.model.plaintiff_offer_for_worker,
	  caption: 'Plaintiff Offer For Worker',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.plaintiff_offer_for_worker = val;
		});
	  },
	));}

	  	    Widget editPlaintiffOfferForOwner (State state) {
      return(
	MoneyWidget(
	  value: model.model.plaintiff_offer_for_owner,
	  caption: 'Plaintiff Offer For Owner',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.plaintiff_offer_for_owner = val;
		});
	  },
	));}

	  	    Widget editPlaintiffResponseDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.plaintiff_response_date,
	  caption: 'Plaintiff Response Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.plaintiff_response_date = val;
		});
	  },
	));} 

	  	    Widget editPlaintiffIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.plaintiff_ip,
		caption: 'Plaintiff IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.plaintiff_ip = val;
		  });
		},
    ));}

	  	    Widget editDefendantDescription (State state) {
      return(
	    ArticleWidget(
	  value: model.model.defendant_description,
	  caption: 'Defendant Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.defendant_description = val;
		});
	  },
	));}

	  	    Widget editDefendantWishes (State state) {
      return(
	    ArticleWidget(
	  value: model.model.defendant_wishes,
	  caption: 'Defendant Wishes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.defendant_wishes = val;
		});
	  },
	));}

	  	    Widget editDefendantHasOffer (State state) {
      return(
	BooleanWidget(
	  value: model.model.defendant_has_offer,
	  caption: 'Defendant Has Offer',
	  hint: 'Isi dengan Boolean Anda',
	  required:true,
	  getValue: (bool val) {
		state.setState(() {
		  model.model.defendant_has_offer = val;
		});
	  },
	));} 

	  	    Widget editDefendantOfferForWorker (State state) {
      return(
	MoneyWidget(
	  value: model.model.defendant_offer_for_worker,
	  caption: 'Defendant Offer For Worker',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.defendant_offer_for_worker = val;
		});
	  },
	));}

	  	    Widget editDefendantOfferForOwner (State state) {
      return(
	MoneyWidget(
	  value: model.model.defendant_offer_for_owner,
	  caption: 'Defendant Offer For Owner',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.defendant_offer_for_owner = val;
		});
	  },
	));}

	  	    Widget editDefendantResponseDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.defendant_response_date,
	  caption: 'Defendant Response Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.defendant_response_date = val;
		});
	  },
	));} 

   	    Widget editDefendantLastStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.defendant_last_status_id,
	  caption: 'Defendant Last Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.defendant_last_status_list,
	  nameenum: model.model.defendant_last_status_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.defendant_last_status_id = val;
		});
	  },
	));}

	  	    Widget editDefendantIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.defendant_ip,
		caption: 'Defendant IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.defendant_ip = val;
		  });
		},
    ));}

	  	    Widget editRequestedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.requested_date,
	  caption: 'Requested Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.requested_date = val;
		});
	  },
	));} 

	  	    Widget editRequestedBy (State state) {
	   return(  StringView(
		value: model.model.requested_by_str,
		caption: 'Requested By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.requested_by_id,
	  caption: 'Requested By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.requested_by_id_list,
	  nameenum: model.model.requested_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.requested_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRequestedIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.requested_ip,
		caption: 'Requested IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.requested_ip = val;
		  });
		},
    ));}

	  	    Widget editDecidedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.decided_date,
	  caption: 'Decided Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.decided_date = val;
		});
	  },
	));} 

	  	    Widget editDecidedBy (State state) {
	   return(  StringView(
		value: model.model.decided_by_str,
		caption: 'Decided By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.decided_by_id,
	  caption: 'Decided By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.decided_by_id_list,
	  nameenum: model.model.decided_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.decided_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editDecidedIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.decided_ip,
		caption: 'Decided IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.decided_ip = val;
		  });
		},
    ));}

	  	    Widget editCanceledDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.canceled_date,
	  caption: 'Canceled Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.canceled_date = val;
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
	  required:true,
	  idenum: model.model.canceled_by_id_list,
	  nameenum: model.model.canceled_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.canceled_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editCanceledIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.canceled_ip,
		caption: 'Canceled IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.canceled_ip = val;
		  });
		},
    ));}

	  	    Widget editArbitrator2 (State state) {
	   return(  StringView(
		value: model.model.arbitrator_2_str,
		caption: 'Arbitrator 2',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.arbitrator_2_id,
	  caption: 'Arbitrator 2',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.arbitrator_2_id_list,
	  nameenum: model.model.arbitrator_2_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.arbitrator_2_id = val;
		});
	  },
	));*/
	}

	  	    Widget editArbitrator3 (State state) {
	   return(  StringView(
		value: model.model.arbitrator_3_str,
		caption: 'Arbitrator 3',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.arbitrator_3_id,
	  caption: 'Arbitrator 3',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.arbitrator_3_id_list,
	  nameenum: model.model.arbitrator_3_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.arbitrator_3_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwnerRating (State state) {
      return(
	    RatingWidget(
	  value: model.model.owner_rating,
	  caption: 'Owner Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.owner_rating = val;
		});
	  },
	));}

	  	    Widget editOwnerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_point,
	  caption: 'Owner Point',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_point = val;
		});
	  },
	));}

	  	    Widget editOwnerPointBase (State state) {
	   return(  StringView(
		value: model.model.owner_point_base_str,
		caption: 'Owner Point Base',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_point_base_id,
	  caption: 'Owner Point Base',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.owner_point_base_id_list,
	  nameenum: model.model.owner_point_base_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_point_base_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwnerAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.owner_amount,
	  caption: 'Owner Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.owner_amount = val;
		});
	  },
	));}

	  	    Widget editOwnerPercentage (State state) {
      return(
	PercentWidget(
	  value: model.model.owner_percentage,
	  caption: 'Owner Percentage',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_percentage = val;
		});
	  },
	));}

	  	    Widget editWorkerRating (State state) {
      return(
	    RatingWidget(
	  value: model.model.worker_rating,
	  caption: 'Worker Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
		state.setState(() {
		  model.model.worker_rating = val;
		});
	  },
	));}

	  	    Widget editWorkerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_point,
	  caption: 'Worker Point',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_point = val;
		});
	  },
	));}

	  	    Widget editWorkerPointBase (State state) {
	   return(  StringView(
		value: model.model.worker_point_base_str,
		caption: 'Worker Point Base',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_point_base_id,
	  caption: 'Worker Point Base',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.worker_point_base_id_list,
	  nameenum: model.model.worker_point_base_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_point_base_id = val;
		});
	  },
	));*/
	}

	  	    Widget editWorkerAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.worker_amount,
	  caption: 'Worker Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.worker_amount = val;
		});
	  },
	));}

	  	    Widget editWorkerPercentage (State state) {
      return(
	PercentWidget(
	  value: model.model.worker_percentage,
	  caption: 'Worker Percentage',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_percentage = val;
		});
	  },
	));}

	  	    Widget editAnalysis (State state) {
      return(
	    ArticleWidget(
	  value: model.model.analysis,
	  caption: 'Analysis',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.analysis = val;
		});
	  },
	));}

	  	    Widget editProjectTitle (State state) {
      return(
	DisplayNameWidget(
		value: model.model.project_title,
		caption: 'Project Title',
		hint: 'Isi dengan Website Anda',
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

	  	    Widget editProjectWorker (State state) {
      return(
	DisplayNameWidget(
		value: model.model.project_worker,
		caption: 'Project Worker',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.project_worker = val;
		  });
		},
    ));}

	  	    Widget editBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.budget,
	  caption: 'Budget',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.budget = val;
		});
	  },
	));}

	  	    Widget editProblemDescription (State state) {
      return(
	    ArticleWidget(
	  value: model.model.problem_description,
	  caption: 'Problem Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
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
	  getValue:(String? val) {
		state.setState(() {
		  model.model.your_wishes = val;
		});
	  },
	));}

	  	    Widget editYourOffer (State state) {
      return(
	TitleWidget(
		value: model.model.your_offer,
		caption: 'Your Offer',
		hint: 'Isi dengan Title Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.your_offer = val;
		  });
		},
	));}

	  	    Widget editWorkerReceives (State state) {
      return(
	MoneyWidget(
	  value: model.model.worker_receives,
	  caption: 'Worker Receives',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
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
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.owner_receives = val;
		});
	  },
	));}
	
}













  

