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
part 'portofolio_view_base.g.dart';




SpeedDialChild ListButtonPortofolioWidget(Button button, BuildContext context){
  
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
class ViewModelPortofolio {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  int? year;
  String? year_str;
  String? description;
  String? link;
  String? image_url;
  Photo? image;

	
	  ViewModelPortofolio(
            this.id,
			this.year,
			this.year_str,
			this.description,
			this.link,
			this.image,
			this.image_url,

  );

  
   factory ViewModelPortofolio.fromJson(Map<String, dynamic> json) => _$ViewModelPortofolioFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelPortofolioToJson(this); 
  
}

@JsonSerializable()
class PortofolioViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelPortofolio? model;
  PortofolioViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  		
  factory PortofolioViewSuperBase.fromJson(Map<String, dynamic> json) => _$PortofolioViewSuperBaseFromJson(json);
  Map<String, dynamic> toJson() => _$PortofolioViewSuperBaseToJson(this);
   
}

class PortofolioViewBase{
	var model;
	Map<String, dynamic> json;
	PortofolioViewBase(this.json){
		model = PortofolioViewSuperBase.fromJson(this.json);
	}
	
	
   List<SpeedDialChild>	 listButton(BuildContext context){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ListButtonPortofolioWidget(model.buttons[i],context));
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
	
	
	
	
  
		    Widget viewYear (BuildContext context) { 
    if(model.model.year != null){
		return(  NumberView(
		value: model.model.year,
		caption: 'Year',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Year',
		));
	}		
     }
		    Widget viewDescription (BuildContext context) {  
	return(  MultilineView(
		value: model.model.description,
		caption: 'Description',
	));}
		    Widget viewLink (BuildContext context) {  
	return(  WebsiteView(
		value: model.model.link,
		caption: 'Link',
	));}
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: model.model.image_url,
		caption: 'Image',
	));} 
  
}









  

