
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
part 'screenshots_edit_base.g.dart';


Widget RButtonActionScreenshotsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController screenshots,
 var postScreenshotsResult, State state, String? sendPath, String? id,  String? title,  var formData){
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
                        screenshots =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = screenshots.sendData();
                        future.then((value) {
                        state.setState(() {
                        postScreenshotsResult = value;
                        });
                        });

                        } else {}
                  }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild ButtonEditScreenshotsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController screenshots,
 var postScreenshotsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        screenshots =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = screenshots.sendData();
                        future.then((value) {
                        state.setState(() {
                        postScreenshotsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelScreenshots {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? service_images_id;
  int? service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  String? description;
  Photo? image;
  String?  image_url;

	
	  EditModelScreenshots(
            this.id,
            this.service_images_id,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.image,
			this.image_url,

  );
    factory EditModelScreenshots.fromJson(Map<String, dynamic> json) => _$EditModelScreenshotsFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelScreenshotsToJson(this);

}



@JsonSerializable()

class ScreenshotsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelScreenshots? model;
  ScreenshotsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ScreenshotsSuperBase.fromJson(Map<String, dynamic> json) => _$ScreenshotsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotsSuperBaseToJson(this);
   
}




class EditScreenshotsBase{
	var model;
	Map<String, dynamic> json;
	EditScreenshotsBase(this.json){
		model = ScreenshotsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "service_screenshots[_trigger_]":"",
  "service_screenshots[service_id]": "${model.model.service_id }",
   "service_screenshots[description]": "${model.model.description }",
  "service_screenshots[image]": '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.dir}"}',
	  
  };  

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController screenshots,
  var postScreenshotsResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionScreenshotsWidget(model.buttons[i], context,formKey, controller,screenshots, postScreenshotsResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController screenshots,
  var postScreenshotsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditScreenshotsWidget(model.buttons[i], context,formKey, controller,screenshots, postScreenshotsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController screenshots,
  var postScreenshotsResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,screenshots, postScreenshotsResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController screenshots,
  var postScreenshotsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,screenshots, postScreenshotsResult, state, sendPath, id,  title )
	    )
	 );
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
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	 	    Widget editDescription (State state) {
      return(
	MultilineWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'Isi dengan Multiline Anda',
	  required:true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}

	  	    Widget editImage (State state) {
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
		  });
		},
	));} 
	
}













  

