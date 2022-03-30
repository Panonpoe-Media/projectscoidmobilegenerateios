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
part 'user_arbitrations_view_base.g.dart';




SpeedDialChild ListButtonUserArbitrationsWidget(Button button, BuildContext context){
  
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
class ViewModelUserArbitrations {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? arbitration_id;
  int? plaintiff_id;
  String? plaintiff_str;
  String? plaintiff_url;
  List<int?>? plaintiff_list;
  List<String?>? plaintiff_list_str;
  int? defendant_id;
  String? defendant_str;
  String? defendant_url;
  List<int?>? defendant_list;
  List<String?>? defendant_list_str;
  int? project_id;
  String? project_str;
  String? project_url;
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
  bool plaintiff_has_offer;
  double? plaintiff_offer_for_worker;
  String? plaintiff_offer_for_worker_str;
  double? plaintiff_offer_for_owner;
  String? plaintiff_offer_for_owner_str;
  DateTime? plaintiff_response_date;
  String? plaintiff_ip;
  String? defendant_description;
  String? defendant_wishes;
  bool defendant_has_offer;
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
  String? requested_by_str;
  String? requested_by_url;
  List<int?>? requested_by_list;
  List<String?>? requested_by_list_str;
  String? requested_ip;
  DateTime? decided_date;
  int? decided_by_id;
  String? decided_by_str;
  String? decided_by_url;
  List<int?>? decided_by_list;
  List<String?>? decided_by_list_str;
  String? decided_ip;
  DateTime? canceled_date;
  int? canceled_by_id;
  String? canceled_by_str;
  String? canceled_by_url;
  List<int?>? canceled_by_list;
  List<String?>? canceled_by_list_str;
  String? canceled_ip;
  int? arbitrator_2_id;
  String? arbitrator_2_str;
  String? arbitrator_2_url;
  List<int?>? arbitrator_2_list;
  List<String?>? arbitrator_2_list_str;
  int? arbitrator_3_id;
  String? arbitrator_3_str;
  String? arbitrator_3_url;
  List<int?>? arbitrator_3_list;
  List<String?>? arbitrator_3_list_str;
  int? owner_rating;
  int? owner_point;
  String? owner_point_str;
  int? owner_point_base_id;
  String? owner_point_base_str;
  String? owner_point_base_url;
  List<int?>? owner_point_base_list;
  List<String?>? owner_point_base_list_str;
  double? owner_amount;
  String? owner_amount_str;
  int? owner_percentage;
  int? worker_rating;
  int? worker_point;
  String? worker_point_str;
  int? worker_point_base_id;
  String? worker_point_base_str;
  String? worker_point_base_url;
  List<int?>? worker_point_base_list;
  List<String?>? worker_point_base_list_str;
  double? worker_amount;
  String? worker_amount_str;
  int? worker_percentage;
  String? analysis;
  String? your_offer;

	
	  ViewModelUserArbitrations(
            this.id,
            this.arbitration_id,
			this.plaintiff_id,
			this.plaintiff_str,
			this.plaintiff_url,
			this.plaintiff_list,
			this.plaintiff_list_str,
			this.defendant_id,
			this.defendant_str,
			this.defendant_url,
			this.defendant_list,
			this.defendant_list_str,
			this.project_id,
			this.project_str,
			this.project_url,
			this.project_list,
			this.project_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.status_date,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.plaintiff_description,
			this.plaintiff_wishes,
			this.plaintiff_has_offer,
			this.plaintiff_offer_for_worker,
			this.plaintiff_offer_for_worker_str,
			this.plaintiff_offer_for_owner,
			this.plaintiff_offer_for_owner_str,
			this.plaintiff_response_date,
			this.plaintiff_ip,
			this.defendant_description,
			this.defendant_wishes,
			this.defendant_has_offer,
			this.defendant_offer_for_worker,
			this.defendant_offer_for_worker_str,
			this.defendant_offer_for_owner,
			this.defendant_offer_for_owner_str,
			this.defendant_response_date,
			this.defendant_last_status_id,
			this.defendant_last_status_str,
			this.defendant_last_status_list,
			this.defendant_last_status_list_str,
			this.defendant_ip,
			this.requested_date,
			this.requested_by_id,
			this.requested_by_str,
			this.requested_by_url,
			this.requested_by_list,
			this.requested_by_list_str,
			this.requested_ip,
			this.decided_date,
			this.decided_by_id,
			this.decided_by_str,
			this.decided_by_url,
			this.decided_by_list,
			this.decided_by_list_str,
			this.decided_ip,
			this.canceled_date,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_url,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.canceled_ip,
			this.arbitrator_2_id,
			this.arbitrator_2_str,
			this.arbitrator_2_url,
			this.arbitrator_2_list,
			this.arbitrator_2_list_str,
			this.arbitrator_3_id,
			this.arbitrator_3_str,
			this.arbitrator_3_url,
			this.arbitrator_3_list,
			this.arbitrator_3_list_str,
			this.owner_rating,
			this.owner_point,
			this.owner_point_str,
			this.owner_point_base_id,
			this.owner_point_base_str,
			this.owner_point_base_url,
			this.owner_point_base_list,
			this.owner_point_base_list_str,
			this.owner_amount,
			this.owner_amount_str,
			this.owner_percentage,
			this.worker_rating,
			this.worker_point,
			this.worker_point_str,
			this.worker_point_base_id,
			this.worker_point_base_str,
			this.worker_point_base_url,
			this.worker_point_base_list,
			this.worker_point_base_list_str,
			this.worker_amount,
			this.worker_amount_str,
			this.worker_percentage,
			this.analysis,
			this.your_offer,

  );

  
   factory ViewModelUserArbitrations.fromJson(Map<String, dynamic> json) => _$ViewModelUserArbitrationsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelUserArbitrationsToJson(this); 
  
}

@JsonSerializable()
class UserArbitrationsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelUserArbitrations? model;
  UserArbitrationsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory UserArbitrationsViewSuperBase.fromJson(Map<String, dynamic> json) => _$UserArbitrationsViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$UserArbitrationsViewSuperBaseToJson(this);
   
}

class UserArbitrationsViewBase{
	var model;
	Map<String, dynamic> json;
	UserArbitrationsViewBase(this.json){
		model = UserArbitrationsViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonUserArbitrationsWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewPlaintiff (BuildContext context) {  
	   return(  StringView(
			value: model.model.plaintiff_str,
			caption: 'Plaintiff',
		));
		} 
		    Widget viewDefendant (BuildContext context) {  
	   return(  StringView(
			value: model.model.defendant_str,
			caption: 'Defendant',
		));
		} 
		    Widget viewProject (BuildContext context) {  
	   return(  StringView(
			value: model.model.project_str,
			caption: 'Project',
		));
		} 
	    Widget viewStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.status_str,
			caption: 'Status',
		));
		} 
		    Widget viewStatusDate (BuildContext context) {  
	if(model.model.status_date != null){
	return(  DateTimeView(
		value: model.model.status_date,
		caption: 'Status Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Status Date',
		    ));
	}			 
	 } 
	    Widget viewType (BuildContext context) {
	   return(  StringView(
			value: model.model.type_str,
			caption: 'Type',
		));
		} 
		    Widget viewPlaintiffDescription (BuildContext context) {  
	if(model.model.plaintiff_description != null){
		return(  ArticleView(
		value: model.model.plaintiff_description,
		caption: 'Plaintiff Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Plaintiff Description',
		    ));
	}		
     }
		    Widget viewPlaintiffWishes (BuildContext context) {  
	if(model.model.plaintiff_wishes != null){
		return(  ArticleView(
		value: model.model.plaintiff_wishes,
		caption: 'Plaintiff Wishes',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Plaintiff Wishes',
		    ));
	}		
     }
		    Widget viewPlaintiffHasOffer (BuildContext context) {  

	if(model.model.plaintiff_has_offer != null){
		return(  BooleanView(
		value: model.model.plaintiff_has_offer,
		caption: 'Plaintiff Has Offer',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Plaintiff Has Offer',
		    ));
	}
     } 
		    Widget viewPlaintiffOfferForWorker (BuildContext context) {  			
    if(model.model.plaintiff_offer_for_worker != null){
		return(  MoneyView(
		value: model.model.plaintiff_offer_for_worker,
		caption: 'Plaintiff Offer For Worker',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Plaintiff Offer For Worker',
		    ));
	}			
     }
		    Widget viewPlaintiffOfferForOwner (BuildContext context) {  			
    if(model.model.plaintiff_offer_for_owner != null){
		return(  MoneyView(
		value: model.model.plaintiff_offer_for_owner,
		caption: 'Plaintiff Offer For Owner',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Plaintiff Offer For Owner',
		    ));
	}			
     }
		    Widget viewPlaintiffResponseDate (BuildContext context) {  
	if(model.model.plaintiff_response_date != null){
	return(  DateTimeView(
		value: model.model.plaintiff_response_date,
		caption: 'Plaintiff Response Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Plaintiff Response Date',
		    ));
	}			 
	 } 
		    Widget viewPlaintiffIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.plaintiff_ip,
		caption: 'Plaintiff IP',
	));}
		    Widget viewDefendantDescription (BuildContext context) {  
	if(model.model.defendant_description != null){
		return(  ArticleView(
		value: model.model.defendant_description,
		caption: 'Defendant Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Defendant Description',
		    ));
	}		
     }
		    Widget viewDefendantWishes (BuildContext context) {  
	if(model.model.defendant_wishes != null){
		return(  ArticleView(
		value: model.model.defendant_wishes,
		caption: 'Defendant Wishes',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Defendant Wishes',
		    ));
	}		
     }
		    Widget viewDefendantHasOffer (BuildContext context) {  

	if(model.model.defendant_has_offer != null){
		return(  BooleanView(
		value: model.model.defendant_has_offer,
		caption: 'Defendant Has Offer',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Defendant Has Offer',
		    ));
	}
     } 
		    Widget viewDefendantOfferForWorker (BuildContext context) {  			
    if(model.model.defendant_offer_for_worker != null){
		return(  MoneyView(
		value: model.model.defendant_offer_for_worker,
		caption: 'Defendant Offer For Worker',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Defendant Offer For Worker',
		    ));
	}			
     }
		    Widget viewDefendantOfferForOwner (BuildContext context) {  			
    if(model.model.defendant_offer_for_owner != null){
		return(  MoneyView(
		value: model.model.defendant_offer_for_owner,
		caption: 'Defendant Offer For Owner',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Defendant Offer For Owner',
		    ));
	}			
     }
		    Widget viewDefendantResponseDate (BuildContext context) {  
	if(model.model.defendant_response_date != null){
	return(  DateTimeView(
		value: model.model.defendant_response_date,
		caption: 'Defendant Response Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Defendant Response Date',
		    ));
	}			 
	 } 
	    Widget viewDefendantLastStatus (BuildContext context) {
	   return(  StringView(
			value: model.model.defendant_last_status_str,
			caption: 'Defendant Last Status',
		));
		} 
		    Widget viewDefendantIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.defendant_ip,
		caption: 'Defendant IP',
	));}
		    Widget viewRequestedDate (BuildContext context) {  
	if(model.model.requested_date != null){
	return(  DateTimeView(
		value: model.model.requested_date,
		caption: 'Requested Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Requested Date',
		    ));
	}			 
	 } 
		    Widget viewRequestedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.requested_by_str,
			caption: 'Requested By',
		));
		} 
		    Widget viewRequestedIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.requested_ip,
		caption: 'Requested IP',
	));}
		    Widget viewDecidedDate (BuildContext context) {  
	if(model.model.decided_date != null){
	return(  DateTimeView(
		value: model.model.decided_date,
		caption: 'Decided Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Decided Date',
		    ));
	}			 
	 } 
		    Widget viewDecidedBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.decided_by_str,
			caption: 'Decided By',
		));
		} 
		    Widget viewDecidedIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.decided_ip,
		caption: 'Decided IP',
	));}
		    Widget viewCanceledDate (BuildContext context) {  
	if(model.model.canceled_date != null){
	return(  DateTimeView(
		value: model.model.canceled_date,
		caption: 'Canceled Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Canceled Date',
		    ));
	}			 
	 } 
		    Widget viewCanceledBy (BuildContext context) {  
	   return(  StringView(
			value: model.model.canceled_by_str,
			caption: 'Canceled By',
		));
		} 
		    Widget viewCanceledIp (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.canceled_ip,
		caption: 'Canceled IP',
	));}
		    Widget viewArbitrator2 (BuildContext context) {  
	   return(  StringView(
			value: model.model.arbitrator_2_str,
			caption: 'Arbitrator 2',
		));
		} 
		    Widget viewArbitrator3 (BuildContext context) {  
	   return(  StringView(
			value: model.model.arbitrator_3_str,
			caption: 'Arbitrator 3',
		));
		} 
		    Widget viewOwnerRating (BuildContext context) {  
	
	if(model.model.owner_rating != null){
		return(  RatingView(
		value: model.model.owner_rating,
		caption: 'Owner Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Owner Rating',
		 ));	
	}
     }
		    Widget viewOwnerPoint (BuildContext context) { 
    if(model.model.owner_point != null){
		return(  NumberView(
		value: model.model.owner_point,
		caption: 'Owner Point',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Owner Point',
		));
	}		
     }
		    Widget viewOwnerPointBase (BuildContext context) {  
	   return(  StringView(
			value: model.model.owner_point_base_str,
			caption: 'Owner Point Base',
		));
		} 
		    Widget viewOwnerAmount (BuildContext context) {  			
    if(model.model.owner_amount != null){
		return(  MoneyView(
		value: model.model.owner_amount,
		caption: 'Owner Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Owner Amount',
		    ));
	}			
     }
		    Widget viewOwnerPercentage (BuildContext context) {

	if(model.model.owner_percentage != null){
		return(  PercentView(
		value: model.model.owner_percentage,
		caption: 'Owner Percentage',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Owner Percentage',
		    ));	
	}
     }
		    Widget viewWorkerRating (BuildContext context) {  
	
	if(model.model.worker_rating != null){
		return(  RatingView(
		value: model.model.worker_rating,
		caption: 'Worker Rating'
	    ));
	}else{
		 return(  StringView(
		 value: '',
		 caption: 'Worker Rating',
		 ));	
	}
     }
		    Widget viewWorkerPoint (BuildContext context) { 
    if(model.model.worker_point != null){
		return(  NumberView(
		value: model.model.worker_point,
		caption: 'Worker Point',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Worker Point',
		));
	}		
     }
		    Widget viewWorkerPointBase (BuildContext context) {  
	   return(  StringView(
			value: model.model.worker_point_base_str,
			caption: 'Worker Point Base',
		));
		} 
		    Widget viewWorkerAmount (BuildContext context) {  			
    if(model.model.worker_amount != null){
		return(  MoneyView(
		value: model.model.worker_amount,
		caption: 'Worker Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Worker Amount',
		    ));
	}			
     }
		    Widget viewWorkerPercentage (BuildContext context) {

	if(model.model.worker_percentage != null){
		return(  PercentView(
		value: model.model.worker_percentage,
		caption: 'Worker Percentage',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Worker Percentage',
		    ));	
	}
     }
		    Widget viewAnalysis (BuildContext context) {  
	if(model.model.analysis != null){
		return(  ArticleView(
		value: model.model.analysis,
		caption: 'Analysis',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Analysis',
		    ));
	}		
     }
		    Widget viewYourOffer (BuildContext context) {  
	return(  TitleView(
		value: model.model.your_offer,
		caption: 'Your Offer',
	));}
  
}









  

