
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
part 'screenshots_add_base.g.dart';



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
                        screenshots =    SubModelController(AppProvider.getApplication(context),
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

class AddModelScreenshots {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?product_images_id;
   int?product_id;
  String? product_url;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  String? description;
  Photo? image;
  String?  image_url;

	
	  AddModelScreenshots(
            this.id,
            this.product_images_id,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
			this.image,
			this.image_url,

  );
    factory AddModelScreenshots.fromJson(Map<String, dynamic> json) => _$AddModelScreenshotsFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelScreenshotsToJson(this);

}



@JsonSerializable()

class ScreenshotsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelScreenshots? model;
  ScreenshotsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ScreenshotsSuperBase.fromJson(Map<String, dynamic> json) => _$ScreenshotsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotsSuperBaseToJson(this);
   
}




class ScreenshotsAddBase{
	var model;
	Map<String, dynamic> json;
	ScreenshotsAddBase(this.json){
		model = ScreenshotsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "product_images[_trigger_]":"",
  "product_images[product_id]": "${model.model.product_id }",
   "product_images[description]": "${model.model.description }",
  "product_images[image]": '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.dir}"}',
	  
  };  

    return( formData);

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
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController screenshots,
  var postScreenshotsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,screenshots, postScreenshotsResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editProduct (State state) {
	   return(  StringView(
		value: model.model.product_str,
		caption: 'Product',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.product_id,
	  caption: 'Product',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.product_id_list,
	  nameenum: model.model.product_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.product_id = val;
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









  

