
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
part 'comments_edit_base.g.dart';

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionCommentsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController comments,
 var postCommentsResult, State state, String? sendPath, String? id,  String? title,  var formData){
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
                        comments =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = comments.sendData();
                        future.then((value) {
                        state.setState(() {
                        postCommentsResult = value;
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

SpeedDialChild ButtonEditCommentsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController comments,
 var postCommentsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        comments =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = comments.sendData();
                        future.then((value) {
                        state.setState(() {
                        postCommentsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelComments {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? product_post_id;
  int? user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? product_id;
  String? product_url;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? thread_id;
  String? thread_url;
  String? thread_str;
  List<int?>? thread_list;
  List<String?>? thread_list_str;
  int? post_type_id;
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

	
	  EditModelComments(
            this.id,
            this.product_post_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
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
    factory EditModelComments.fromJson(Map<String, dynamic> json) => _$EditModelCommentsFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelCommentsToJson(this);

}



@JsonSerializable()

class CommentsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelComments? model;
  CommentsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory CommentsSuperBase.fromJson(Map<String, dynamic> json) => _$CommentsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsSuperBaseToJson(this);
   
}




class EditCommentsBase{
	var model;
	Map<String, dynamic> json;
	EditCommentsBase(this.json){
		model = CommentsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "my_product_comments[_trigger_]":"",
  "my_product_comments[user_id]": "${model.model.user_id }",
  "my_product_comments[product_id]": "${model.model.product_id }",
  "my_product_comments[thread_id]": "${model.model.thread_id }",
   "my_product_comments[post_type_id]": "${model.model.post_type_id}",
  "my_product_comments[post_date]": "${model.model.post_date}",
  "my_product_comments[message]": "${model.model.message }",
  "my_product_comments[attachments]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "my_product_comments[read_by_seller]": "${model.model.read_by_seller}",
  "my_product_comments[read_by_buyer]": "${model.model.read_by_buyer}",
  "my_product_comments[captcha]": "${model.model.captcha }",
	  
  };  

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController comments,
  var postCommentsResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionCommentsWidget(model.buttons[i], context,formKey, controller,comments, postCommentsResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController comments,
  var postCommentsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditCommentsWidget(model.buttons[i], context,formKey, controller,comments, postCommentsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController comments,
  var postCommentsResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,comments, postCommentsResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController comments,
  var postCommentsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,comments, postCommentsResult, state, sendPath, id,  title )
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
	  getValue: (int? val) {
		state.setState(() {
		  model.model.user_id = val;
		});
	  },
	));*/
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
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_id = val;
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
	  getValue: (int? val) {
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
	  getValue: (int? val) {
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













  

