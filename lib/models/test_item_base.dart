

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'test_item_base.g.dart';
//


class ItemTestBase {
	var item;
	Map<String, dynamic> json;
	ItemTestBase(this.json){
		item = ItemTest.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
		}
	}


	Widget itemButton( int?index, BuildContext context){
		return(
				FlatButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					textColor: CurrentTheme.MainAccentColor,
					splashColor : CurrentTheme.ShadeColor,
					color : CurrentTheme.SecondaryAccentColor,
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: item.user_name,
		caption: 'User Name',
	));}
		    Widget viewPassword (BuildContext context) {  
	return(  PasswordView(
		value: item.password,
		caption: 'Password',
	));}
		    Widget viewDisplayName (BuildContext context) { 
	return(  DisplayNameView(
		value: item.display_name,
		caption: 'Display Name',
	));}
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: item.title,
		caption: 'Title',
	));}
		    Widget viewEmail (BuildContext context) {  
	return(  EmailView(
		value: item.email,
		caption: 'Email',
	));}
		    Widget viewModel (BuildContext context) {  
	return(  ModelView(
		value: item.model_id,
		caption: 'Model',
		idenum: item.model_list,
		nameenum: item.model_str,
	));} 
	    Widget viewEnum (BuildContext context) {
      return( 
	 EnumView(
		value: item.enum_id,
		caption: 'Enum',
		idenum: item.enum_list,
		nameenum: item.enum_str,
	));} 
		    Widget viewAddress (BuildContext context) {  
	return(  AddressView(
		value: item.address,
		caption: 'Address',
	));}
		    Widget viewMultiline (BuildContext context) {  
	return(  MultilineView(
		value: item.multiline,
		caption: 'Multiline',
	));}
		    Widget viewDate (BuildContext context) {  
	return(  DateView(
		value: item.date,
		caption: 'Date',
	));} 
		    Widget viewDateTime (BuildContext context) {  
	return(  DateTimeView(
		value: item.date_time,
		caption: 'Date Time',
	));} 
		    Widget viewTime (BuildContext context) {  
	return(  TimeView(
		value: item.time,
		caption: 'Time',
	));} 
		    Widget viewRating (BuildContext context) {  
	return(  RatingView(
		value: item.rating,
		caption: 'Rating'
	));}
		    Widget viewNumber (BuildContext context) { 
	return(  NumberView(
		value: item.number,
		caption: 'Number',
	));}
		    Widget viewMoney (BuildContext context) {  
	return(  MoneyView(
		value: item.money,
		caption: 'Money',
	));}
		    Widget viewDouble (BuildContext context) {  
	return(  DoubleView(
	  value: item.double1,
		caption: 'Double',
	));}
		    Widget viewBoolean (BuildContext context) {  
	return(  BooleanView(
		value: item.boolean,
		caption: 'Boolean',
	));} 
	Widget viewPercent (BuildContext context) {
	return(  PercentView(
		value: item.percent,
		caption: 'Percent',
	));}
		    Widget viewWebsite (BuildContext context) {  
	return(  WebsiteView(
		value: item.website,
		caption: 'Website',
	));}
		    Widget viewArticle (BuildContext context) {  
	return(  ArticleView(
		value: item.article,
		caption: 'Article',
	));}
	Widget viewInlineTags (BuildContext context) {  
	return( 	ChannelRouteTagsWidget(
                value: item.inline_tags_id,
                caption: '',
                hint: ' ',
                required: true,
                idroutetags: item.inline_tags_id,
                nameroutetags: item.inline_tags_str,
                urlroutetags: item.inline_tags_url,
                getValue: (String?  val) {
                  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
                },
              ));} 
		    Widget viewHandphone (BuildContext context) { 
	return(  HandphoneView(
		value: item.handphone,
		caption: 'Handphone',
	));}
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: item.image_url,
		caption: 'Image',
	));} 
		    Widget viewFile (BuildContext context) {  
    if(item.file == null){
		  return(  StringView(
		value: '',
		caption: 'File',
	));
	}			
	if(item.file_name != ''){
	  return(  FileViewRev(
		value: item.file_name,
		value1: item.file_url,
		caption: 'File',
	));
	}else{
	  return(  StringView(
		value: '',
		caption: 'File',
	));
	}		
     } 
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: item.captcha,
		caption: 'Captcha',
	));}

}


@JsonSerializable()

class ItemTest{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  test_id;
  String?  user_name;
  String?  password;
  String?  display_name;
  String?  title;
  String?  email;
  int?model_id;
  String?  model_str;
  String?  model_url;
  List<int?>? model_list;
  List<String?>? model_list_str;
  int?enum_id;
  String?  enum_str;
  List<int?>? enum_list;
  List<String?>? enum_list_str;
  String?  address;
  String?  multiline;
  DateTime? date;
  DateTime? date_time;
  DateTime? time;
  int?rating;
  int?number;
  String?  number_str;
  double? money;
  String?  money_str;
  double? double1;
  String?  double1_str;  
  bool? boolean;
  int?percent;
  String?  website;
  String?  article;
  List<int?>? inline_tags_id;
  List<String?>?  inline_tags_str;
  List<String?>? inline_tags_url;
  String?  handphone;
  String?  image_url;
  Photo? image;
  String?  file_name;
  String?  file_url;
  List<FileField?>? file;
  String?  captcha;

	
	 ItemTest(
			this.buttons,
			this.test_id,			
			this.user_name,
			this.password,
			this.display_name,
			this.title,
			this.email,
			this.model_id,
			this.model_str,
			this.model_url,
			this.model_list,
			this.model_list_str,
			this.enum_id,
			this.enum_str,
			this.enum_list,
			this.enum_list_str,
			this.address,
			this.multiline,
			this.date,
			this.date_time,
			this.time,
			this.rating,
			this.number,
			this.number_str,
			this.money,
			this.money_str,
			this.double1,
			this.double1_str,
			this.boolean,
			this.percent,
			this.website,
			this.article,
			this.inline_tags_id,
			this.inline_tags_str,
			this.inline_tags_url,
			this.handphone,
			this.image,
			this.image_url,
			this.file_name,
			this.file_url,
			this.file,
			this.captcha,

  );
	

	
  factory ItemTest.fromJson(Map<String, dynamic> json) => _$ItemTestFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTestToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

