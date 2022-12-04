
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
part 'cart_items_increase_base.g.dart';



@JsonSerializable()

class ModelActionIncreaseCartItems {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? cart_id;
  int? user_id;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
  int? product_id;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_str;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_str;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  int? seller_id;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  double? item_price;
  int? quantity;
  double? total_price;

	
	  ModelActionIncreaseCartItems(
            this.id,
			this.cart_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.title,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_list,
			this.iklan_list_str,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.item_price,
			this.quantity,
			this.total_price,

  );
    factory ModelActionIncreaseCartItems.fromJson(Map<String, dynamic> json) => _$ModelActionIncreaseCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionIncreaseCartItemsToJson(this);

}

@JsonSerializable()
class IncreaseCartItemsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionIncreaseCartItems? model;
  IncreaseCartItemsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory IncreaseCartItemsSuperBase.fromJson(Map<String, dynamic> json) => _$IncreaseCartItemsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$IncreaseCartItemsSuperBaseToJson(this);
  
 
}

class IncreaseCartItemsBase{
	var model;
	Map<String, dynamic> json;
	IncreaseCartItemsBase(this.json){
		model = IncreaseCartItemsSuperBase.fromJson(this.json);
	}


 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Widget RButtonActionCartItemsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController cart_items,
 var postCartItemsResult, State state, String? sendPath, String? id,  String? title){
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
									cart_items = new  SubModelController(AppProvider.getApplication(context),
									sendPath,
									formData);
									final future = cart_items.sendData();
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
									postCartItemsResult = value;
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

SpeedDialChild ButtonActionCartItemsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController cart_items,
 var postCartItemsResult, State state, String? sendPath, String? id,  String? title){
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
                        cart_items = new  SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = cart_items.sendData();
                        future.then((value) {
                        state.setState(() {
                        postCartItemsResult = value;
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
	//CartItems
   Map<String, dynamic> convertFormDataAction(var data){
  String? action =   'Increase';
   bool?  isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
   
     String? tgr =   'increase';
         var formData = {"cart[_trigger_]":"$tgr"};
  formData.addAll({"cart[user_id]": "${model.model.user_id }"});
   formData.addAll({"cart[type_id]": "${model.model.type_id }"});
  formData.addAll({"cart[title]": "${model.model.title }"});
  formData.addAll({"cart[product_id]": "${model.model.product_id }"});
  formData.addAll({"cart[project_id]": "${model.model.project_id }"});
  formData.addAll({"cart[service_id]": "${model.model.service_id }"});
  formData.addAll({"cart[bid_id]": "${model.model.bid_id }"});
  formData.addAll({"cart[iklan_id]": "${model.model.iklan_id }"});
  formData.addAll({"cart[seller_id]": "${model.model.seller_id }"});
  formData.addAll({"cart[item_price]": "${model.model.item_price }"});
  formData.addAll({"cart[quantity]": "${model.model.quantity }"});
  formData.addAll({"cart[total_price]": "${model.model.total_price }"});
	  
		  
		 
 
   
 


    return( formData);
  } 	
	
	  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController cart_items,
  var postIncreaseResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionCartItemsWidget(model.buttons[i], context,formKey, controller,cart_items, postIncreaseResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
	
	
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController cart_items,
  var postIncreaseResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonActionCartItemsWidget(model.buttons[i], context,formKey, controller,cart_items, postIncreaseResult, state, sendPath, id,  title ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
    Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController cart_items,
  var postIncreaseResult, State state, String? sendPath, String? id,  String? title ){
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
           RlistButton(context, formKey,controller,cart_items, postIncreaseResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
   
    SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController cart_items,
  var postIncreaseResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,cart_items, postIncreaseResult, state, sendPath, id,  title )
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
   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Type',
	   required: false,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}
	  	    Widget editTitle (State state) {
      return(
	DisplayNameWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Title Anda',
		 required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
    ));}
	  	    Widget editProduct (State state) {
      return(
	  ModelWidget(
	  value: model.model.product_id,
	  caption: 'Product',
	  hint: 'pilih Product',
	   required: false,
	  idenum: model.model.product_list,
	  nameenum: model.model.product_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_id = val;
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
	  	    Widget editService (State state) {
      return(
	  ModelWidget(
	  value: model.model.service_id,
	  caption: 'Service',
	  hint: 'pilih Service',
	   required: false,
	  idenum: model.model.service_list,
	  nameenum: model.model.service_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));}
	  	    Widget editBid (State state) {
      return(
	  ModelWidget(
	  value: model.model.bid_id,
	  caption: 'Bid',
	  hint: 'pilih Bid',
	   required: false,
	  idenum: model.model.bid_list,
	  nameenum: model.model.bid_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_id = val;
		});
	  },
	));}
	  	    Widget editIklan (State state) {
      return(
	  ModelWidget(
	  value: model.model.iklan_id,
	  caption: 'Iklan',
	  hint: 'pilih Iklan',
	   required: false,
	  idenum: model.model.iklan_list,
	  nameenum: model.model.iklan_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.iklan_id = val;
		});
	  },
	));}
	  	    Widget editSeller (State state) {
      return(
	  ModelWidget(
	  value: model.model.seller_id,
	  caption: 'Seller',
	  hint: 'pilih Seller',
	   required: false,
	  idenum: model.model.seller_list,
	  nameenum: model.model.seller_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_id = val;
		});
	  },
	));}
	  	    Widget editItemPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.item_price,
	  caption: 'Item Price',
	  hint: 'Isi dengan Item Price Anda',
	   required: false,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {
		  model.model.item_price = val;
		});
	  },
	));}
	  	    Widget editQuantity (State state) {
      return(
	NumberWidget(
	  value: model.model.quantity,
	  caption: 'Quantity',
	  hint: 'Isi dengan Quantity Anda',
	   required: false,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.quantity = val;
		});
	  },
	));}
	  	    Widget editTotalPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.total_price,
	  caption: 'Total Price',
	  hint: 'Isi dengan Total Price Anda',
	   required: false,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {
		  model.model.total_price = val;
		});
	  },
	));}

}
















  

