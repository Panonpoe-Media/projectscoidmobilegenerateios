
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
part 'cart_items_add_base.g.dart';



SpeedDialChild ButtonEditCartItemsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController cart_items,
 var postCartItemsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        cart_items =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = cart_items.sendData();
                        future.then((value) {
                        state.setState(() {
                        postCartItemsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelCartItems {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?cart_id;
   int?user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
   int?type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
   int?product_id;
  String? product_url;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
   int?project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
   int?service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
   int?bid_id;
  String? bid_url;
  String? bid_str;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
   int?iklan_id;
  String? iklan_url;
  String? iklan_str;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
   int?seller_id;
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  double? item_price;
  String? item_price_str;
   int?quantity;
  String? quantity_str;
  double? total_price;
  String? total_price_str;

	
	  AddModelCartItems(
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
			this.item_price_str,
			this.quantity,
			this.quantity_str,
			this.total_price,
			this.total_price_str,

  );
    factory AddModelCartItems.fromJson(Map<String, dynamic> json) => _$AddModelCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelCartItemsToJson(this);

}



@JsonSerializable()

class CartItemsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelCartItems? model;
  CartItemsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory CartItemsSuperBase.fromJson(Map<String, dynamic> json) => _$CartItemsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsSuperBaseToJson(this);
   
}




class CartItemsAddBase{
	var model;
	Map<String, dynamic> json;
	CartItemsAddBase(this.json){
		model = CartItemsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "cart_items[_trigger_]":"",
  "cart_items[user_id]": "${model.model.user_id }",
   "cart_items[type_id]": "${model.model.type_id}",
  "cart_items[title]": "${model.model.title }",
  "cart_items[product_id]": "${model.model.product_id }",
  "cart_items[project_id]": "${model.model.project_id }",
  "cart_items[service_id]": "${model.model.service_id }",
  "cart_items[bid_id]": "${model.model.bid_id }",
  "cart_items[iklan_id]": "${model.model.iklan_id }",
  "cart_items[seller_id]": "${model.model.seller_id }",
  "cart_items[item_price]": "${model.model.item_price}",
  "cart_items[quantity]": "${model.model.quantity }",
  "cart_items[total_price]": "${model.model.total_price}",
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController cart_items,
  var postCartItemsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditCartItemsWidget(model.buttons[i], context,formKey, controller,cart_items, postCartItemsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController cart_items,
  var postCartItemsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,cart_items, postCartItemsResult, state, sendPath, id,  title )
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

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: ( int?val) {
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
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
    ));}

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

	  	    Widget editBid (State state) {
	   return(  StringView(
		value: model.model.bid_str,
		caption: 'Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.bid_id,
	  caption: 'Bid',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.bid_id_list,
	  nameenum: model.model.bid_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editIklan (State state) {
	   return(  StringView(
		value: model.model.iklan_str,
		caption: 'Iklan',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.iklan_id,
	  caption: 'Iklan',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.iklan_id_list,
	  nameenum: model.model.iklan_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.iklan_id = val;
		});
	  },
	));*/
	}

	  	    Widget editSeller (State state) {
	   return(  StringView(
		value: model.model.seller_str,
		caption: 'Seller',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.seller_id,
	  caption: 'Seller',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.seller_id_list,
	  nameenum: model.model.seller_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.seller_id = val;
		});
	  },
	));*/
	}

	  	    Widget editItemPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.item_price,
	  caption: 'Item Price',
	  hint: 'Isi dengan Money Anda',
	  required:true,
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
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
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
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.total_price = val;
		});
	  },
	));}
	
}









  

