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
part 'cart_items_view_base.g.dart';




SpeedDialChild ListButtonCartItemsWidget(Button button, BuildContext context){
  
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
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()=>
		  {AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url!)) }
	  ));
  }

}


@JsonSerializable()
class ViewModelCartItems {
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
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  String? title;
  int? product_id;
  String? product_str;
  String? product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_str;
  String? service_url;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_str;
  String? bid_url;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_str;
  String? iklan_url;
  List<int?>? iklan_list;
  List<String?>? iklan_list_str;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  double? item_price;
  String? item_price_str;
  int? quantity;
  String? quantity_str;
  double? total_price;
  String? total_price_str;

	
	  ViewModelCartItems(
            this.id,
            this.cart_id,
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.title,
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_url,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_url,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_url,
			this.iklan_list,
			this.iklan_list_str,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.item_price,
			this.item_price_str,
			this.quantity,
			this.quantity_str,
			this.total_price,
			this.total_price_str,

  );

  
   factory ViewModelCartItems.fromJson(Map<String, dynamic> json) => _$ViewModelCartItemsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelCartItemsToJson(this); 
  
}

@JsonSerializable()
class CartItemsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelCartItems? model;
  CartItemsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory CartItemsViewSuperBase.fromJson(Map<String, dynamic> json) => _$CartItemsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemsViewSuperBaseToJson(this);
   
}

class CartItemsViewBase{
	var model;
	Map<String, dynamic> json;
	CartItemsViewBase(this.json){
		model = CartItemsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonCartItemsWidget(model.buttons[i],context));
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool visible){
     return(
	 SpeedDial(
                childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
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
				children:listButton(context)
	    )
	 );
   } 	
	
	
	
	
  
		    Widget viewUser (BuildContext context) {  
	   return(  StringView(
			value: model.model.user_str,
			caption: 'User',
		));
		} 
	    Widget viewType (BuildContext context) {
	   return(  StringView(
			value: model.model.type_str,
			caption: 'Type',
		));
		} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.title,
		caption: 'Title',
	));}
		    Widget viewProduct (BuildContext context) {  
	   return(  StringView(
			value: model.model.product_str,
			caption: 'Product',
		));
		} 
		    Widget viewProject (BuildContext context) {  
	   return(  StringView(
			value: model.model.project_str,
			caption: 'Project',
		));
		} 
		    Widget viewService (BuildContext context) {  
	   return(  StringView(
			value: model.model.service_str,
			caption: 'Service',
		));
		} 
		    Widget viewBid (BuildContext context) {  
	   return(  StringView(
			value: model.model.bid_str,
			caption: 'Bid',
		));
		} 
		    Widget viewIklan (BuildContext context) {  
	   return(  StringView(
			value: model.model.iklan_str,
			caption: 'Iklan',
		));
		} 
		    Widget viewSeller (BuildContext context) {  
	   return(  StringView(
			value: model.model.seller_str,
			caption: 'Seller',
		));
		} 
		    Widget viewItemPrice (BuildContext context) {  			
    if(model.model.item_price != null){
		return(  MoneyView(
		value: model.model.item_price,
		caption: 'Item Price',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Item Price',
		    ));
	}			
     }
		    Widget viewQuantity (BuildContext context) { 
    if(model.model.quantity != null){
		return(  NumberView(
		value: model.model.quantity,
		caption: 'Quantity',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Quantity',
		));
	}		
     }
		    Widget viewTotalPrice (BuildContext context) {  			
    if(model.model.total_price != null){
		return(  MoneyView(
		value: model.model.total_price,
		caption: 'Total Price',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Total Price',
		    ));
	}			
     }
  
}









  

