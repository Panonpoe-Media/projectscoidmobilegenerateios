
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
part 'payment_history_list_item_base.g.dart';

class ItemPaymentHistoryBase {
	var item;
	Map<String, dynamic> json;
	ItemPaymentHistoryBase(this.json){
		item = ItemPaymentHistory.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons!.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int? index, BuildContext context){
		return(
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
                    style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewUser (BuildContext context) {  
	return(  ModelView(
		value: item.user_id,
		caption: 'User',
		idenum: item.user_list,
		nameenum: item.user_str,
	));} 
		    Widget viewOurAccount (BuildContext context) {  
	return(  ModelView(
		value: item.our_account_id,
		caption: 'Our Account',
		idenum: item.our_account_list,
		nameenum: item.our_account_str,
	));} 
	    Widget viewDirection (BuildContext context) {
      return( 
	 EnumView(
		value: item.direction_id,
		caption: 'Direction',
		idenum: item.direction_list,
		nameenum: item.direction_str,
	));} 
	    Widget viewStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_id,
		caption: 'Status',
		idenum: item.status_list,
		nameenum: item.status_str,
	));} 
		    Widget viewBank (BuildContext context) {  
	return(  ModelView(
		value: item.bank_id,
		caption: 'Bank',
		idenum: item.bank_list,
		nameenum: item.bank_str,
	));} 
		    Widget viewBranch (BuildContext context) { 
	return(  DisplayNameView(
		value: item.branch,
		caption: 'Branch',
	));}
		    Widget viewCity (BuildContext context) { 
	return(  DisplayNameView(
		value: item.city,
		caption: 'City',
	));}
		    Widget viewAccountNo (BuildContext context) { 
	return(  DisplayNameView(
		value: item.account_no,
		caption: 'Account No',
	));}
		    Widget viewAccountName (BuildContext context) { 
	return(  DisplayNameView(
		value: item.account_name,
		caption: 'Account Name',
	));}
		    Widget viewTransferDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.transfer_date,
		caption: 'Transfer Date',
	));} 
		    Widget viewAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.amount,
		caption: 'Amount',
	));}
		    Widget viewTransferFee (BuildContext context) {  
	return(  MoneyView(
		value: item.transfer_fee,
		caption: 'Transfer Fee',
	));}
		    Widget viewMessage (BuildContext context) {  
	return(  MultilineView(
		value: item.message,
		caption: 'Message',
	));}
		    Widget viewAttachment (BuildContext context) {  
	return(  ImageView(
		value: item.attachment_url,
		caption: 'Attachment',
	));} 
	    Widget viewType (BuildContext context) {
      return( 
	 EnumView(
		value: item.type_id,
		caption: 'Type',
		idenum: item.type_list,
		nameenum: item.type_str,
	));} 
		    Widget viewRefId (BuildContext context) { 
	return(  NumberView(
		value: item.ref_id,
		caption: 'Ref Id',
	));}
		    Widget viewApprovedDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.approved_date,
		caption: 'Approved Date',
	));} 
		    Widget viewApprovedBy (BuildContext context) {  
	return(  ModelView(
		value: item.approved_by_id,
		caption: 'Approved By',
		idenum: item.approved_by_list,
		nameenum: item.approved_by_str,
	));} 
		    Widget viewApprovedFromIp (BuildContext context) { 
	return(  DisplayNameView(
		value: item.approved_from_ip,
		caption: 'Approved From IP',
	));}
		    Widget viewApproverNote (BuildContext context) {  
	return(  MultilineView(
		value: item.approver_note,
		caption: 'Approver Note',
	));}
	 // String? item.secure_code;

}


@JsonSerializable()

class ItemPaymentHistory{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? payment_id;
  int? user_id;
  String? user_str;
  String? user_url;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? our_account_id;
  String? our_account_str;
  String? our_account_url;
  List<int?>? our_account_list;
  List<String?>? our_account_list_str;
  int? direction_id;
  String? direction_str;
  List<int?>? direction_list;
  List<String?>? direction_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? bank_id;
  String? bank_str;
  String? bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_no;
  String? account_name;
  DateTime? transfer_date;
  double? amount;
  String? amount_str;
  double? transfer_fee;
  String? transfer_fee_str;
  String? message;
  String? attachment_url;
  Photo? attachment;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? ref_id;
  String? ref_id_str;
  DateTime? approved_date;
  int? approved_by_id;
  String? approved_by_str;
  String? approved_by_url;
  List<int?>? approved_by_list;
  List<String?>? approved_by_list_str;
  String? approved_from_ip;
  String? approver_note;
  String? secure_code;

	
	 ItemPaymentHistory(
			this.buttons,
			this.payment_id,			
			this.user_id,
			this.user_str,
			this.user_url,
			this.user_list,
			this.user_list_str,
			this.our_account_id,
			this.our_account_str,
			this.our_account_url,
			this.our_account_list,
			this.our_account_list_str,
			this.direction_id,
			this.direction_str,
			this.direction_list,
			this.direction_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.bank_id,
			this.bank_str,
			this.bank_url,
			this.bank_list,
			this.bank_list_str,
			this.branch,
			this.city,
			this.account_no,
			this.account_name,
			this.transfer_date,
			this.amount,
			this.amount_str,
			this.transfer_fee,
			this.transfer_fee_str,
			this.message,
			this.attachment,
			this.attachment_url,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.ref_id,
			this.ref_id_str,
			this.approved_date,
			this.approved_by_id,
			this.approved_by_str,
			this.approved_by_url,
			this.approved_by_list,
			this.approved_by_list_str,
			this.approved_from_ip,
			this.approver_note,
			this.secure_code,

  );
	

	
  factory ItemPaymentHistory.fromJson(Map<String, dynamic> json) => _$ItemPaymentHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPaymentHistoryToJson(this);
  

   
  
}












  

