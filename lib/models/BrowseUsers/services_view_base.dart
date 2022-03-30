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
part 'services_view_base.g.dart';




SpeedDialChild ListButtonServicesWidget(Button button, BuildContext context){
  
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
class ViewModelServices {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? service_id;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? logo_url;
  Photo? logo;
  int? category_id;
  String? category_str;
  String? category_url;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  String? description;
  String? short_description;
  int? finish_days;
  String? finish_days_str;
  double? price;
  String? price_str;
  String? options;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? registered_by_id;
  String? registered_by_str;
  String? registered_by_url;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime? registered_date;
  String? registered_from_ip;
  int? verified_by_id;
  String? verified_by_str;
  String? verified_by_url;
  List<int?>? verified_by_list;
  List<String?>? verified_by_list_str;
  DateTime? verified_date;
  String? verified_from_ip;
  String? verifier_note;
  int? approved_by_id;
  String? approved_by_str;
  String? approved_by_url;
  List<int?>? approved_by_list;
  List<String?>? approved_by_list_str;
  DateTime? approved_date;
  String? approved_from_ip;
  String? approver_note;
  int? published_by_id;
  String? published_by_str;
  String? published_by_url;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime? published_date;
  String? published_from_ip;
  int? rejected_by_id;
  String? rejected_by_str;
  String? rejected_by_url;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime? rejected_date;
  String? rejected_from_ip;
  String? admin_note;
  DateTime? last_bump;
  int? sales_count;
  String? sales_count_str;
  double? sales_amount;
  String? sales_amount_str;
  int? rating;
  int? points;
  String? points_str;
  int? ranking;
  String? ranking_str;
  double? rating_num;
  String? rating_num_str;
  int? rating_sum;
  String? rating_sum_str;
  int? rating_div;
  String? rating_div_str;

	
	  ViewModelServices(
            this.id,
            this.service_id,
			this.seller_id,
			this.seller_str,
			this.seller_url,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.category_id,
			this.category_str,
			this.category_url,
			this.category_list,
			this.category_list_str,
			this.title,
			this.description,
			this.short_description,
			this.finish_days,
			this.finish_days_str,
			this.price,
			this.price_str,
			this.options,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_url,
			this.registered_by_list,
			this.registered_by_list_str,
			this.registered_date,
			this.registered_from_ip,
			this.verified_by_id,
			this.verified_by_str,
			this.verified_by_url,
			this.verified_by_list,
			this.verified_by_list_str,
			this.verified_date,
			this.verified_from_ip,
			this.verifier_note,
			this.approved_by_id,
			this.approved_by_str,
			this.approved_by_url,
			this.approved_by_list,
			this.approved_by_list_str,
			this.approved_date,
			this.approved_from_ip,
			this.approver_note,
			this.published_by_id,
			this.published_by_str,
			this.published_by_url,
			this.published_by_list,
			this.published_by_list_str,
			this.published_date,
			this.published_from_ip,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_url,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.rejected_date,
			this.rejected_from_ip,
			this.admin_note,
			this.last_bump,
			this.sales_count,
			this.sales_count_str,
			this.sales_amount,
			this.sales_amount_str,
			this.rating,
			this.points,
			this.points_str,
			this.ranking,
			this.ranking_str,
			this.rating_num,
			this.rating_num_str,
			this.rating_sum,
			this.rating_sum_str,
			this.rating_div,
			this.rating_div_str,

  );

  
   factory ViewModelServices.fromJson(Map<String, dynamic> json) => _$ViewModelServicesFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelServicesToJson(this); 
  
}

@JsonSerializable()
class ServicesViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelServices? model;
  ServicesViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory ServicesViewSuperBase.fromJson(Map<String, dynamic> json) => _$ServicesViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesViewSuperBaseToJson(this);
   
}

class ServicesViewBase{
	var model;
	Map<String, dynamic> json;
	ServicesViewBase(this.json){
		model = ServicesViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonServicesWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewSeller (BuildContext context) {  
	   return(  StringView(
			value: model.model.seller_str,
			caption: 'Seller',
		));
		} 
		    Widget viewLogo (BuildContext context) {  
	return(  ImageView(
		value: model.model.logo_url,
		caption: 'Logo',
	));} 
		    Widget viewCategory (BuildContext context) {  
	   return(  StringView(
			value: model.model.category_str,
			caption: 'Category',
		));
		} 
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: model.model.title,
		caption: 'Title',
	));}
		    Widget viewDescription (BuildContext context) {  
	if(model.model.description != null){
		return(  ArticleView(
		value: model.model.description,
		caption: 'Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Description',
		    ));
	}		
     }
		    Widget viewShortDescription (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.short_description,
		caption: 'Short Description',
	));}
		    Widget viewFinishDays (BuildContext context) { 
    if(model.model.finish_days != null){
		return(  NumberView(
		value: model.model.finish_days,
		caption: 'Finish Days',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Finish Days',
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
	 // String? model.model.options;
	Widget viewTags (BuildContext context) {  
	if(model.model.tags_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.tags_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.tags_id,
						nameroutetags: model.model.tags_str,
						urlroutetags: model.model.tags_url,
						getValue:  (String? val) {
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.tags_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.tags_id,
						nameroutetags: model.model.tags_str,
					  ));
	
    }	
			  } 
	    Widget viewStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.status_str,
			caption: 'Status',
		));
		} 
		    Widget viewRegisteredBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.registered_by_str,
			caption: 'Registered By',
		));
		} 
		    Widget viewRegisteredDate (BuildContext context) {  
	if(model.model.registered_date != null){
	return(  DateTimeView(
		value: model.model.registered_date,
		caption: 'Registered Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Registered Date',
		    ));
	}			 
	 } 
		    Widget viewRegisteredFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.registered_from_ip,
		caption: 'Registered From IP',
	));}
		    Widget viewVerifiedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.verified_by_str,
			caption: 'Verified By',
		));
		} 
		    Widget viewVerifiedDate (BuildContext context) {  
	if(model.model.verified_date != null){
	return(  DateTimeView(
		value: model.model.verified_date,
		caption: 'Verified Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Verified Date',
		    ));
	}			 
	 } 
		    Widget viewVerifiedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.verified_from_ip,
		caption: 'Verified From IP',
	));}
		    Widget viewVerifierNote (BuildContext context) {  
	return(  MultilineView(
		value: model.model.verifier_note,
		caption: 'Verifier Note',
	));}
		    Widget viewApprovedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.approved_by_str,
			caption: 'Approved By',
		));
		} 
		    Widget viewApprovedDate (BuildContext context) {  
	if(model.model.approved_date != null){
	return(  DateTimeView(
		value: model.model.approved_date,
		caption: 'Approved Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Approved Date',
		    ));
	}			 
	 } 
		    Widget viewApprovedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.approved_from_ip,
		caption: 'Approved From IP',
	));}
		    Widget viewApproverNote (BuildContext context) {  
	return(  MultilineView(
		value: model.model.approver_note,
		caption: 'Approver Note',
	));}
		    Widget viewPublishedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.published_by_str,
			caption: 'Published By',
		));
		} 
		    Widget viewPublishedDate (BuildContext context) {  
	if(model.model.published_date != null){
	return(  DateTimeView(
		value: model.model.published_date,
		caption: 'Published Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Published Date',
		    ));
	}			 
	 } 
		    Widget viewPublishedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.published_from_ip,
		caption: 'Published From IP',
	));}
		    Widget viewRejectedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.rejected_by_str,
			caption: 'Rejected By',
		));
		} 
		    Widget viewRejectedDate (BuildContext context) {  
	if(model.model.rejected_date != null){
	return(  DateTimeView(
		value: model.model.rejected_date,
		caption: 'Rejected Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Rejected Date',
		    ));
	}			 
	 } 
		    Widget viewRejectedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.rejected_from_ip,
		caption: 'Rejected From IP',
	));}
		    Widget viewAdminNote (BuildContext context) {  
	if(model.model.admin_note != null){
		return(  ArticleView(
		value: model.model.admin_note,
		caption: 'Admin Note',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Admin Note',
		    ));
	}		
     }
		    Widget viewLastBump (BuildContext context) {  
	if(model.model.last_bump != null){
	return(  DateTimeView(
		value: model.model.last_bump,
		caption: 'Last Bump',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Last Bump',
		    ));
	}			 
	 } 
		    Widget viewSalesCount (BuildContext context) { 
    if(model.model.sales_count != null){
		return(  NumberView(
		value: model.model.sales_count,
		caption: 'Sales Count',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Sales Count',
		));
	}		
     }
		    Widget viewSalesAmount (BuildContext context) {  			
    if(model.model.sales_amount != null){
		return(  MoneyView(
		value: model.model.sales_amount,
		caption: 'Sales Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Sales Amount',
		    ));
	}			
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
		    Widget viewPoints (BuildContext context) { 
    if(model.model.points != null){
		return(  NumberView(
		value: model.model.points,
		caption: 'Points',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Points',
		));
	}		
     }
		    Widget viewRanking (BuildContext context) { 
    if(model.model.ranking != null){
		return(  NumberView(
		value: model.model.ranking,
		caption: 'Ranking',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Ranking',
		));
	}		
     }
		    Widget viewRatingNum (BuildContext context) {  
	   if(model.model.rating_num != null){
	   	   	return(  DoubleView(
		    value: model.model.rating_num,
			caption: 'Rating Num',
		));
	   }else{
	   	   return(  StringView(
			value: '',
			caption: 'Rating Num',
		    ));
	   }
      }
		    Widget viewRatingSum (BuildContext context) { 
    if(model.model.rating_sum != null){
		return(  NumberView(
		value: model.model.rating_sum,
		caption: 'Rating Sum',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Rating Sum',
		));
	}		
     }
		    Widget viewRatingDiv (BuildContext context) { 
    if(model.model.rating_div != null){
		return(  NumberView(
		value: model.model.rating_div,
		caption: 'Rating Div',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Rating Div',
		));
	}		
     }
  
}









  

