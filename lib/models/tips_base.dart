

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'tips_item.dart';
import 'tips_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/Tips/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'tips_base.g.dart';








@JsonSerializable()

class ModelTips {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? article_id;
  int? category_id;
  String? category_str;
  List<int?>? category_list;
  List<String?>? category_list_str;
  int? author_id;
  String? author_url;
  String? author_str;
  List<int?>? author_list;
  List<String?>? author_list_str;
  String? title;
  bool?published;
  DateTime? published_date;
  String? teaser;
  String? content;
  String? keywords;
  Photo?image;
  String?  image_url;
  String? files_name;
  List<FileField?>? files;

	
	  ModelTips(
            this.id,
            this.article_id,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.author_id,
			this.author_str,
			this.author_list,
			this.author_list_str,
			this.image,
			this.image_url,
			this.files,
			this.files_name,

  );
    factory ModelTips.fromJson(Map<String, dynamic> json) => _$ModelTipsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelTipsToJson(this);

}




class TipsBase{
	var model;
	Map<String, dynamic> json;
	TipsBase(this.json){
		model = TipsSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? image = '';
	if (model.model.image!= null) {
		 if (model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"} ';
		 }
	 }
	String? files = '';
	if (model.model.files!= null) {
		if (model.model.files[0].temp != '') {
			files = '[{"name":"${model.model.files[0].name}","size":${model.model.files[0].size},"created":${model.model.files[0].date},"modified":${model.model.files[0].date},"temp":"${model.model.files[0].temp}","remote":"${model.model.files[0].remote}","dir":"${model.model.files[0].dir}"}]';
		}
	}
   
   
      var formData = {
      "tips[_trigger_]":"",
   "tips[article_id]": "${model.model.article_id }",
   "tips[category_id]": "${model.model.category_id}",
  "tips[author_id]": "${model.model.author_id }",
  "tips[title]": "${model.model.title }",
  "tips[published]": "${model.model.published ? 1 : 0}",
  "tips[published_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}",
   "tips[teaser]": "${model.model.teaser }",
  "tips[content]": "${model.model.content }",
   "tips[keywords]": "${model.model.keywords }",
  "tips[image]": '$image',
  "tips[image_lastval]": '{"name":"${model.model.image.name}","dir":"${model.model.image.dir}","file":"${model.model.image.file}","thumb":"${model.model.image.thumb}"}',
  "tips[files]": '$files',
  "tips[files_lastval]": '[{"name":"${model.model.files[0].name}","size":${model.model.files[0].size.toString()},"created":${model.model.files[0].date.toString()},"modified":${model.model.files[0].date.toString()},"temp":"${model.model.files[0].temp}","remote":"","dir":"temp"}]',
	  
  };  

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, TipsController tips,
  var postTipsResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditTipsWidget(model.buttons[i], context,formKey, controller,tips, postTipsResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, TipsController tips,
  var postTipsResult, State state, String? sendPath, String? id,  String? title ){
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
				overlayColor: CurrentTheme.MainAccentColor,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.SecondaryColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, formKey,controller,tips, postTipsResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditTipsWidget(Button button, BuildContext context,var formKey, ScrollController controller, TipsController tips,
 var postTipsResult, State state, String? sendPath, String? id,  String? title){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button!.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
						var formData = await convertFormDataEdit(model);
                        tips = new  TipsController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = tips.postTips();
                        future.then((value) {
                        state.setState(() {
                        postTipsResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
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
   


   	    Widget editCategory (State state) {
      return(
	  EnumWidget(
	  value: model.model.category_id,
	  caption: 'Category',
	  hint: 'pilih Enum',
	  required: true,
	  idenum: model.model.category_list,
	  nameenum: model.model.category_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.category_id = val;
		});
	  },
	));}

	  	    Widget editAuthor (State state) {
	   return(  StringView(
		value: model.model.author_str,
		caption: 'Author',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.author_id,
	  caption: 'Author',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.author_id_list,
	  nameenum: model.model.author_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.author_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTitle (State state) {
      return(
	TitleWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Title Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
	));}

	  	    Widget editPublished (State state) {
      return(
	BooleanWidget(
	  value: model.model.published,
	  caption: 'Published',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.published = val;
		});
	  },
	));} 

	  	    Widget editPublishedDate (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.published_date,
	  caption: 'Published Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.published_date = val;
		});
	  },
	));} 

	 	    Widget editTeaser (State state) {
      return(
	MultilineWidget(
	  value: model.model.teaser,
	  caption: 'Teaser',
	  hint: 'Isi dengan Multiline Anda',
	  required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.teaser = val;
		});
	  },
	));}

	  	    Widget editContent (State state) {
      return(
	new ArticleWidget(
	  value: model.model.content,
	  caption: 'Content',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.content = val;
		});
	  },
	));}

	 	    Widget editKeywords (State state) {
      return(
	MultilineWidget(
	  value: model.model.keywords,
	  caption: 'Keywords',
	  hint: 'Isi dengan Multiline Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.keywords = val;
		});
	  },
	));}

	Widget editImage (State state) {
	if(model.model.image_url== ''){
		model.model.image = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.image,
		caption: 'Image',
		hint: 'Isi dengan Image Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.image = val;
			model.model.image_url = val!.name;
		  });
		},
	));} 

	  	    Widget editFiles (State state) {
	 if(model.model.files== null){
		FileField? file = new FileField('', '',0,0,0, '', '', '','' );
		model.model.files = [file];
		}
      return(
	FileWidget(
		value: model.model.files[0],
		caption: 'Files',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.files[0] = val;
		  });
		},
	));} 
	
}


@JsonSerializable()

class TipsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelTips? model;
  TipsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory TipsSuperBase.fromJson(Map<String, dynamic> json) => _$TipsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$TipsSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelTips {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  int? author_id;
  String? author_str;
  String? author_url;
  List<int?>? author_list;
  List<String?>? author_list_str;
  DateTime? published_date;
  String? image_url;
  Photo?image;
  String? content;
  List<FileField?>? files;  
  String? files_url;
  String? files_name;

	//
	  ViewModelTips(
            this.id,
			this.author_id,
			this.author_str,
			this.author_url,
			this.author_list,
			this.author_list_str,
			this.published_date,
			this.image,
			this.image_url,
			this.content,
			this.files,
			this.files_url,	
            this.files_name,				

  );

  
   factory ViewModelTips.fromJson(Map<String, dynamic> json) => _$ViewModelTipsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelTipsToJson(this); 
  
}


class TipsViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	TipsViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, TipsController tips,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewTipsWidget(model.buttons[i],context,  formKey, controller, tips,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewTipsWidget(Button button, BuildContext context,var formKey, ScrollController controller, TipsController tips,
  State state, String? sendPath, String? id,  String? title, bool?account){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search!),
                        backgroundColor: Colors.green,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button!.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
    var cl;
	var ic;
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
		 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
		if (button.icon == 'fa fa-send'){
		  ic = Icons.send;
		} 
    
    if(button!.url!.contains('user/my_purchases/download/')){
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        tips = new  TipsController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = tips.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postTipsResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
                        });
                        }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);	
						});

                       
                  }
		  }
	  ));
	  }else{
	     	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: (){
		  
		  if(account!){	   
			AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! ));
		  }else{
		    AppProvider.getRouter(context)!.navigateTo(context,'/login/1');
		   }
		  }
	  ));
	  }
	  
  }

}  
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, TipsController tips,
    State state, String? sendPath, String? id,  String? title, bool? account){
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
				overlayColor: CurrentTheme.MainAccentColor,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.SecondaryColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, visible!, formKey, controller, tips,
                                    state, sendPath, id!,  title!, account! )
	    )
	 );
   } 	
	
	PreferredSizeWidget  appBar(BuildContext context, String? idHash){
	  return(
	      AppBar(
		   iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),
			title: Text('', style : TextStyle( color: Colors.white, )),
		  )
	  );
	}

   	Widget body (BuildContext context, ScrollController controller, bool?account, GlobalKey<ScaffoldState> ss, State state) {
		return(Container(width: 0.0, height: 0.0,color: Colors.white ));	
	}

	Widget view (BuildContext context, ScrollController controller, bool?account, bool _isBannerAdReady,  _bannerAd) {


	  viewChildren!.clear();
	  
	  if(this.model.meta.before_title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_title),
	  ));}
	  if(this.model.meta.title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.title),
	  ));}
	  if(this.model.meta.after_title != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_title),
	  ));}
	  if(this.model.meta.warning != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.warning.message,
		             style: {
							"html": Style(
							  backgroundColor: CurrentTheme.WarningColor,
							   ),
							},
					),
	  ));}

	  if(this.model.meta.before_content != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_content),
	  ));}	  

	 	  
	   viewChildren!.add(viewAuthor(context)); 
	   viewChildren!.add(viewPublishedDate(context)); 
	   viewChildren!.add(viewImage(context)); 
	   viewChildren!.add(viewContent(context)); 
	   viewChildren!.add(viewFiles(context)); 
	  
	  viewChildren!.add(
	  
				  Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
					  if (_isBannerAdReady)
						const SizedBox(
						  height: 10,
						),
					  if (_isBannerAdReady)
						Center(
						  child: Container(
							width: _bannerAd.size.width.toDouble(),
							height: _bannerAd.size.height.toDouble(),
							child: AdWidget(ad: _bannerAd),
						  ),
						),


					  if (_isBannerAdReady)
						const SizedBox(
						  height: 10,
						),
						const SizedBox(
						  height: 10,
						),
					],
				  )
				 ); 

	 //
	if(this.model.meta.after_content != null){ viewChildren!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_content),
	  ));}	 
   return(  SingleChildScrollView(
                     controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
				  
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					 					  
                       children: viewChildren!
                  ) 
     ));
	} 

 
				Widget viewAuthor (BuildContext context) {  
		return(  ModelView(
			value: model.model.author_id,
			caption: 'Author',
			idenum: model.model.author_list,
			nameenum: model.model.author_str,
		));} 
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
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: model.model.image_url,
		caption: 'Image',
	));} 
		    Widget viewContent (BuildContext context) {  
	if(model.model.content != null){
		return(  ArticleView(
		value: model.model.content,
		caption: 'Content',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Content',
		    ));
	}		
     }
		    Widget viewFiles (BuildContext context) {  
			if(model.model.files == null){
				  return(  StringView(
				value: '',
				caption: 'Files',
			));
			}			
			if(model.model.files_name != ''){
			  return(  FileView(
				value: model.model.files_name,
				value1: model.model.files_url,
				caption: 'Files',
			));
			}else{
			  return(  StringView(
				value: '',
				caption: 'Files',
			));
			}
			
    } 
  
}


@JsonSerializable()
class TipsViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelTips? model;
  TipsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory TipsViewSuperBase.fromJson(Map<String, dynamic> json) => _$TipsViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$TipsViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class TipsListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	TipsListingBase(this.json){
		items = TipsListingItems.fromJson(this.json);
		tools = TipsListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemTipsModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTipsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemTipsModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTipsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemTipsModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTipsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemTipsModel item,ItemTipsModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTipsCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemTipsModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTipsCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonTipsWidget(tools.buttons[i],context, account));
   // }  
    }

       return(
	        buttonChildren 
	   );
   } 
     SpeedDial	 Buttons(BuildContext context, bool?visible, bool?account, Function open){
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
				overlayColor: CurrentTheme.MainAccentColor,
				overlayOpacity: 0.5,
				onOpen: (){open(true);},
				onClose: (){open(false);},
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.SecondaryColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, account)
	    )
	 );
   } 
   
   
   
   
   
}





class TipsListingItems{
  List<ItemTipsModel?>? items;
  TipsListingItems(
      this.items,
      );

  factory TipsListingItems.fromJson(Map<String, dynamic> json) {
  	return TipsListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemTipsModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class TipsListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemTips?>? items;
	TipsListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory TipsListingTools.fromJson(Map<String, dynamic> json) => _$TipsListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$TipsListingToolsToJson(this);

}




class ItemTipsCard extends StatelessWidget {
  const ItemTipsCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemTipsModel? destination;
  final String? search;
  final ShapeBorder? shape;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            Container(
             // height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: ItemTipsContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTipsContent extends StatelessWidget {
  const ItemTipsContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemTipsModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle?titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle?descriptionStyle = theme.textTheme.headline5;

    final List<Widget>buttonChildren = <Widget>[
    ];
	  if (destination!.item.buttons != null) {
		for(var i = 0; i < destination!.item.buttons.length; i++)
		{
		  buttonChildren!.add(itemTipsButton(destination,i , context));
		}
    }
	
    final List<Widget> children = [

    ];
	 /* children!.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child: Html(data: "<h3>Header</h3>"),
	  ));
	  */
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewAuthor(context)); 
	   children!.add(destination!.viewPublishedDate(context)); 
	   children!.add(destination!.viewTeaser(context)); 
	   children!.add(destination!.viewImage(context)); 
      /*    children!.add(Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: "<h3>footer</h3>"),
                           )
     ); */


  if (destination!.item.buttons != null) {
        if(buttonChildren!.length > 4){
		if(buttonChildren!.length == 5){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren!.length == 6){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren!.length == 7){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  ]
			),
		  ),
		);
		}
				if(buttonChildren!.length == 8){
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  buttonChildren[7],
			  ]
			),
		  ),
		);
		}
		}else{
		children!.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: buttonChildren
			),
		  ),
		);
      }
	}	
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children!,
    );
  }
}

Widget itemTipsButton(ItemTipsModel? destination, int? index, BuildContext context){
  TipsController tips; 
  
   if(destination!.item.buttons[index].url.contains('user/my_purchases/download/')){
		return(	TextButton(
			  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
			  style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
			  onPressed: () {
		  {
                       // controller.animateTo(controller.position.minScrollExtent,
                       // duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        tips = new  TipsController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = tips.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postTipsResult = value;
						//AppProvider.getRouter(context)!.pop(context);	
                       // });
                        }).catchError((Error){
							AppProvider.getRouter(context)!.pop(context);	
						});

                       
                  }
		  }
	  ));
	  }else{
			  return(
				TextButton(
				  child: Text(destination!.item.buttons[index].text, semanticsLabel: 'Share ${destination!.item.ttl}'),
	               style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
				  onPressed: () {
					print('${destination!.item.buttons[index].url}');
					if(destination!.item.buttons[index].url.contains('show_conversation')){
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item.buttons[index].url + '/' ));
					}else{
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item.buttons[index].url ));
					}

				  },
				)
			  );
  }
}



class ItemTipsWidget extends StatelessWidget {

	final ItemTipsModel?  item;
	final String? search;
	const  ItemTipsWidget({Key? key, @required this.item, this.search}) : super(key: key);


	@override
	Widget build(BuildContext context) {
		return Visibility (
			// visible: (this.search == '' || this.browse_projects.item.title.contains(this.search!) || this.browse_projects.items.items.article.contains(this.search!)),
			visible: (this.search == '' || allModelWords(jsonEncode(this.item!.item!.toJson())).contains(this.search!)),
			child: ListTile(
				leading:  Container(
					height: 50.0,
					width : 50.0,
					child:

					ClipRRect(
						borderRadius: BorderRadius.circular(50),
						child: Image.network( this.item!.item!.pht!,
						),
					),

				),
				title: Text(this.item!.item!.ttl!),
				isThreeLine: true,
				subtitle: Html(
						data:item!.item!.sbttl! ,
						//style: TextStyle(fontSize: 16, color: CurrentTheme.ShadeColor),
						//defaultTextStyle: TextStyle(color: CurrentTheme.DisableTextColor)
						style: {
								"html": Style(
								 color: CurrentTheme.DisableTextColor
								),
					   }
				),
				dense: true,
				onTap: () 
				{ AppProvider.getRouter(context)!.navigateTo(
						context,
						"/public/browse_projects/view/" + this.item!.item!.id! + "/" +
								// this.browse_projects.title.replaceAll(' ', '-'))},
								"title");},
			),
		);
	}
}


SpeedDialChild ListButtonTipsWidget(Button button, BuildContext context, bool?account){
    var cl;
	var ic;
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
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search!),
                        backgroundColor: Colors.green,
                        label: button.text == 'Order by ...' ?  button.text :'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){
                        
						showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button!.selections![0]);
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()
		  {
		     if (account!){
           if(button!.url!.contains('/listing') || button!.url!.contains('/index')){
			          AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! + '/')) ;
           }else{
             	 AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button!.url! + '//')) ;
           }
			 }else{
			   AppProvider.getRouter(context)!.navigateTo(context, '/login/1') ;
			 } 
		  
		  }
	  ));
  }

}



/////////////////////////////////


///
////////////////////////////////////////////////






  






  

