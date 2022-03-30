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
part 'sales_view_base.g.dart';




SpeedDialChild ListButtonSalesWidget(Button button, BuildContext context){
  
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
class ViewModelSales {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? order_item_id;
  int? buyer_id;
  String? buyer_str;
  String? buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int? order_id;
  String? order_str;
  String? order_url;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String? title;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
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
  DateTime? date;
  double? price;
  String? price_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? buyer_payment_id;
  String? buyer_payment_str;
  String? buyer_payment_url;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int? seller_credit_id;
  String? seller_credit_str;
  String? seller_credit_url;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int? rating;
  String? testimony;

	
	  ViewModelSales(
            this.id,
            this.order_item_id,
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.order_id,
			this.order_str,
			this.order_url,
			this.order_list,
			this.order_list_str,
			this.title,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
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
			this.date,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_url,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_url,
			this.seller_credit_list,
			this.seller_credit_list_str,
			this.rating,
			this.testimony,

  );

  
   factory ViewModelSales.fromJson(Map<String, dynamic> json) => _$ViewModelSalesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelSalesToJson(this); 
  
}

@JsonSerializable()
class SalesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelSales? model;
  SalesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory SalesViewSuperBase.fromJson(Map<String, dynamic> json) => _$SalesViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$SalesViewSuperBaseToJson(this);
   
}

class SalesViewBase{
	var model;
	Map<String, dynamic> json;
	SalesViewBase(this.json){
		model = SalesViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonSalesWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewBuyer (BuildContext context) {  
	   return(  StringView(
			value: model.model.buyer_str,
			caption: 'Buyer',
		));
		} 
		    Widget viewOrder (BuildContext context) {  
	   return(  StringView(
			value: model.model.order_str,
			caption: 'Order',
		));
		} 
		    Widget viewTitle (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.title,
		caption: 'Title',
	));}
	    Widget viewType (BuildContext context) {
	   return(  StringView(
			value: model.model.type_str,
			caption: 'Type',
		));
		} 
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
		    Widget viewDate (BuildContext context) {  
	if(model.model.date != null){
	return(  DateTimeView(
		value: model.model.date,
		caption: 'Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Date',
		    ));
	}			 
	 } 
		    Widget viewPrice (BuildContext context) {  			
    if(model.model.price != null){
		return(  MoneyView(
		value: model.model.price,
		caption: 'Price',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Price',
		    ));
	}			
     }
	    Widget viewStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.status_str,
			caption: 'Status',
		));
		} 
		    Widget viewSeller (BuildContext context) {  
	   return(  StringView(
			value: model.model.seller_str,
			caption: 'Seller',
		));
		} 
		    Widget viewBuyerPayment (BuildContext context) {  
	   return(  StringView(
			value: model.model.buyer_payment_str,
			caption: 'Buyer Payment',
		));
		} 
		    Widget viewSellerCredit (BuildContext context) {  
	   return(  StringView(
			value: model.model.seller_credit_str,
			caption: 'Seller Credit',
		));
		} 
		    Widget viewRating (BuildContext context) {  
	
	if(model.model.rating != null){
		return(  RatingView(
		value: model.model.rating,
		caption: 'Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Rating',
		 ));	
	}
     }
		    Widget viewTestimony (BuildContext context) {  
	if(model.model.testimony != null){
		return(  ArticleView(
		value: model.model.testimony,
		caption: 'Testimony',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Testimony',
		    ));
	}		
     }
  
}









  

