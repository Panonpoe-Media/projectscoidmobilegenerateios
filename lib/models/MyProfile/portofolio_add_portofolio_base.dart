
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
part 'portofolio_add_portofolio_base.g.dart';



@JsonSerializable()

class ModelActionAddPortofolioPortofolio {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? portofolio_id;
  int? year;
  String? description;
  String? link;
  String? image_url;
  Photo? image;

	
	  ModelActionAddPortofolioPortofolio(
            this.id,
			this.portofolio_id,
			this.year,
			this.description,
			this.link,
			this.image,
			this.image_url,

  );
    factory ModelActionAddPortofolioPortofolio.fromJson(Map<String, dynamic> json) => _$ModelActionAddPortofolioPortofolioFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAddPortofolioPortofolioToJson(this);

}

@JsonSerializable()
class AddPortofolioPortofolioSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAddPortofolioPortofolio? model;
  AddPortofolioPortofolioSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory AddPortofolioPortofolioSuperBase.fromJson(Map<String, dynamic> json) => _$AddPortofolioPortofolioSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AddPortofolioPortofolioSuperBaseToJson(this);
  
 
}

class AddPortofolioPortofolioBase{
	var model;
	Map<String, dynamic> json;
            var imagelast ;
	AddPortofolioPortofolioBase(this.json){
		model = AddPortofolioPortofolioSuperBase.fromJson(this.json);
     if (model.model.image!= null) {
            imagelast = Photo(model.model.image.name, model.model.image.status, model.model.image.dir, model.model.image.file, model.model.image.thumb, model.model.image.temp);
     }
	}


 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Widget RButtonActionPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController portofolio,
 var postPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
									portofolio = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = portofolio.sendData();
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
									postPortofolioResult = value;
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

SpeedDialChild ButtonActionPortofolioWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController portofolio,
 var postPortofolioResult, State state, String? sendPath, String? id,  String? title){
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
                        portofolio = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = portofolio.sendData();
                        future.then((value) {
                        state.setState(() {
                        postPortofolioResult = value;
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
	//Portofolio
   Map<String, dynamic> convertFormDataAction(var data){
  String? action =   'AddPortofolio';
   bool?  isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String image = '';
  String? image_last = '';
  if(isEdit && imagelast != null){
      image_last = '{"name":"${ imagelast.name}","dir":"${ imagelast.dir}","file":"${ imagelast.file}","thumb":"${ imagelast.thumb}"}';
   
  }
	if (model.model.image!= null) {
		 if (model.model.image.temp != '') {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"}';
      		
     }
	 }
   
     String? tgr =   'add_portofolio';
         var formData = {"portofolio[_trigger_]":"$tgr"};
  formData.addAll({"portofolio[year]": "${model.model.year }"});
   formData.addAll({"portofolio[description]": "${model.model.description }"});
  formData.addAll({"portofolio[link]": "${model.model.link }"});
  formData.addAll({"portofolio[image]": '$image'});
  formData.addAll({"portofolio[image_lastval]": '$image_last'});
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionPortofolioWidget(model.buttons[i], context,formKey, controller,portofolio, postAddPortofolioResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionPortofolioWidget(model.buttons[i], context,formKey, controller,portofolio, postAddPortofolioResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,portofolio, postAddPortofolioResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController portofolio,
  var postAddPortofolioResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,portofolio, postAddPortofolioResult, state, sendPath, id,  title )
	    )
	 );
   } 
	
   
	  	    Widget editYear (State state) {
      return(
	NumberWidget(
	  value: model.model.year,
	  caption: 'Year',
	  hint: 'Isi dengan Year Anda',
	   required: true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.year = val;
		});
	  },
	));}
	 	    Widget editDescription (State state) {
      return(
	MultilineWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'Isi dengan Description Anda',
	   required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}
	  	    Widget editLink (State state) {
      return(
	 WebsiteWidget(
		value: model.model.link,
		caption: 'Link',
		hint: 'Isi dengan Link Anda',
		 required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.link = val;
		  });
		},
	));}
	Widget editImage (State state) {
	if(model.model.image_url== ''){
		model.model.image = new Photo('','0','', '','', '');
		}
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
			model.model.image_url = val!.name;
		  });
		},
	));} 

}
















  

