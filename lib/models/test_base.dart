

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
import 'test_item.dart';
import 'test_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/Test/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/route.dart' as rt;

part 'test_base.g.dart';








@JsonSerializable()

class ModelTest {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? test_id;
  String? user_name;
  String? password;
  String? display_name;
  String? title;
  String? email;
  int? model_id;
  String? model_url;
  String? model_str;
  List<int?>? model_list;
  List<String?>? model_list_str;
  int? enum_id;
  String? enum_str;
  List<int?>? enum_list;
  List<String?>? enum_list_str;
  String? address;
  String? multiline;
  DateTime? date;
  DateTime? date_time;
  DateTime? time;
  int? rating;
  int? number;
  String? number_str;
  double? money;
  String? money_str;
  double? double1;
  String? double1_str;
  bool?boolean;
  int? percent;
  String? website;
  String? article;
  List<int?>? inline_tags_id;
  List<String?>?  inline_tags_str;
  List<String?>? inline_tags_url;
  List<int?>? inline_tags_list;
  List<String?>? inline_tags_list_str;

  String? handphone;
  Photo?image;
  String?  image_url;
  String? file_name;
  List<FileField?>? file;
  String? captcha;

	
	  ModelTest(
            this.id,
            this.test_id,
			this.model_id,
			this.model_str,
			this.model_list,
			this.model_list_str,
			this.enum_id,
			this.enum_str,
			this.enum_list,
			this.enum_list_str,
			this.number,
			this.number_str,
			this.money,
			this.money_str,
			this.double1,
			this.double1_str,
			this.inline_tags_id,
			this.inline_tags_str,
			this.inline_tags_url,
			this.inline_tags_list,
			this.inline_tags_list_str,
			this.image,
			this.image_url,
			this.file,
			this.file_name,

  );
    factory ModelTest.fromJson(Map<String, dynamic> json) => _$ModelTestFromJson(json);

  Map<String, dynamic> toJson() => _$ModelTestToJson(this);

}




class TestBase{
	var model;
	Map<String, dynamic> json;
	TestBase(this.json){
		model = TestSuperBase.fromJson(this.json);
			model.model.password = '';
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? image = '';
	if (model.model.image!= null) {
		 if (model.model.image.temp != null) {
		   image = '{"status":"1","name":"${model.model.image.name}","temp":"${model.model.image.temp}"} ';
		 }
	 }
	String? file = '';
	if (model.model.file!= null) {
		if (model.model.file[0].temp != '') {
			file = '[{"name":"${model.model.file[0].name}","size":${model.model.file[0].size},"created":${model.model.file[0].date},"modified":${model.model.file[0].date},"temp":"${model.model.file[0].temp}","remote":"${model.model.file[0].remote}","dir":"${model.model.file[0].dir}"}]';
		}
	}
   
   
      var formData = {
      "test[_trigger_]":"",
   "test[test_id]": "${model.model.test_id }",
  "test[user_name]": "${model.model.user_name }",
  "test[password]": "${model.model.password }",
  "test[password_confirmation]": "${model.model.password }",
  "test[display_name]": "${model.model.display_name }",
  "test[title]": "${model.model.title }",
  "test[email]": "${model.model.email }",
  "test[model_id]": "${model.model.model_id }",
   "test[enum_id]": "${model.model.enum_id}",
  "test[address]": "${model.model.address }",
   "test[multiline]": "${model.model.multiline }",
  "test[date]": "${DateFormat('dd/MM/yyyy').format(model.model.date)}",
  "test[date_time]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date_time)}",
  "test[time]": "${DateFormat('HH:mm:ss').format(model.model.time)}",
  "test[rating]": "${model.model.rating }",
  "test[number]": "${model.model.number }",
  "test[money]": "${model.model.money}",
  "test[double]": "${model.model.double1}",
  "test[boolean]": "${model.model.boolean ? 1 : 0}",
  "test[percent]": "${model.model.percent }",
  "test[website]": "${model.model.website }",
  "test[article]": "${model.model.article }",
  "test[handphone]": "${model.model.handphone }",
  "test[image]": '$image',
  "test[image_lastval]": '{"name":"${model.model.image.name}","dir":"${model.model.image.dir}","file":"${model.model.image.file}","thumb":"${model.model.image.thumb}"}',
  "test[file]": '$file',
  "test[file_lastval]": '[{"name":"${model.model.file[0].name}","size":${model.model.file[0].size.toString()},"created":${model.model.file[0].date.toString()},"modified":${model.model.file[0].date.toString()},"temp":"${model.model.file[0].temp}","remote":"","dir":"temp"}]',
  "test[captcha]": "${model.model.captcha }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.inline_tags_id){
        formData.addAll({"test[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, TestController test,
  var postTestResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditTestWidget(model.buttons[i], context,formKey, controller,test, postTestResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, TestController test,
  var postTestResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,test, postTestResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditTestWidget(Button button, BuildContext context,var formKey, ScrollController controller, TestController test,
 var postTestResult, State state, String? sendPath, String? id,  String? title){
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
                        test = new  TestController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = test.postTest();
                        future.then((value) {
                        state.setState(() {
                        postTestResult = value;
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
   


	  	    Widget editUserName (State state) {
      return(
	UsernameWidget(
		value: model.model.user_name,
		caption: 'User Name',
		hint: 'Isi dengan Username Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.user_name = val;
		  });
		}
	));}

	    String? confirmPassword = ''; 
	  	    Widget editPassword (State state) {
      return(
	 PasswordWidget(
		value: model.model.password,
		value1: confirmPassword ,
		caption: 'Password',
		hint: '',
		required: true,
		getValue:(String?  val){
		  state.setState(() {
			model.model.password = val;
		  });
		},
		getValue1:(String?  val){
		  state.setState(() {
			confirmPassword = val;
		  });
		}
	));}

	  	    Widget editDisplayName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.display_name,
		caption: 'Display Name',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.display_name = val;
		  });
		},
    ));}

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

	  	    Widget editEmail (State state) {
      return(
	 EmailWidget(
		value: model.model.email,
		caption: 'Email',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.email = val;
		  });
		},
	));}

	  	    Widget editModel (State state) {
	   return(  StringView(
		value: model.model.model_str,
		caption: 'Model',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.model_id,
	  caption: 'Model',
	  hint: 'pilih Model',
	  required: true,
	  idenum: model.model.model_id_list,
	  nameenum: model.model.model_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.model_id = val;
		});
	  },
	));*/
	}

   	    Widget editEnum (State state) {
      return(
	  EnumWidget(
	  value: model.model.enum_id,
	  caption: 'Enum',
	  hint: 'pilih Enum',
	  required: true,
	  idenum: model.model.enum_list,
	  nameenum: model.model.enum_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.enum_id = val;
		});
	  },
	));}

	  	    Widget editAddress (State state) {
      return(
	AddressWidget(
	  value: model.model.address,
	  caption: 'Address',
	  hint: 'Isi dengan Address Anda',
	  required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.address = val;
		});
	  },
	));}

	 	    Widget editMultiline (State state) {
      return(
	MultilineWidget(
	  value: model.model.multiline,
	  caption: 'Multiline',
	  hint: 'Isi dengan Multiline Anda',
	  required: true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.multiline = val;
		});
	  },
	));}

	  	    Widget editDate (State state) {
      return(
	new DateWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan Date diatas.',
	  required: true,
	  getValue:(DateTime? val) {
	  
		state.setState(() {
		  model.model.date = val;
		});
	  },
	));} 

	  	    Widget editDateTime (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.date_time,
	  caption: 'Date Time',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.date_time = val;
		});
	  },
	));} 

	  	    Widget editTime (State state) {
      return(
	new TimeWidget(
	  value: model.model.time,
	  caption: 'Time',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(DateTime? val) {
	  
		state.setState(() {
		  model.model.time = val;
		});
	  },
	));} 

	  	    Widget editRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.rating,
	  caption: 'Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.rating = val;
		});
	  },
	));}

	  	    Widget editNumber (State state) {
      return(
	NumberWidget(
	  value: model.model.number,
	  caption: 'Number',
	  hint: 'Isi dengan Number Anda',
	  required: true,
      min:'100', 
	  max:'200', 
	  getValue: (int? val) {
		state.setState(() {
		  model.model.number = val;
		});
	  },
	));}

	  	    Widget editMoney (State state) {
      return(
	MoneyWidget(
	  value: model.model.money,
	  caption: 'Money',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.money = val;
		});
	  },
	));}

	  	    Widget editDouble (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.double1,
	  caption: 'Double',
	  hint: 'Isi dengan double? Anda',
	  required: true,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.double1 = val;
		});
	  },
	));}

	  	    Widget editBoolean (State state) {
      return(
	BooleanWidget(
	  value: model.model.boolean,
	  caption: 'Boolean',
	  hint: 'Isi dengan Boolean Anda',
	  required: true,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.boolean = val;
		});
	  },
	));} 

	  	    Widget editPercent (State state) {
      return(
	PercentWidget(
	  value: model.model.percent,
	  caption: 'Percent',
	  hint: 'Isi dengan double? Anda',
	  required: true,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int? val) {
	  
		state.setState(() {
		  model.model.percent = val;
		});
	  },
	));}

	  	    Widget editWebsite (State state) {
      return(
	 WebsiteWidget(
		value: model.model.website,
		caption: 'Website',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.website = val;
		  });
		},
	));}

	  	    Widget editArticle (State state) {
      return(
	new ArticleWidget(
	  value: model.model.article,
	  caption: 'Article',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.article = val;
		});
	  },
	));}

	  	    Widget editInlineTags (State state) {
      return(
	
	new InlineTagsWidget(
	  value: model.model.inline_tags_id,
	  caption: 'Inline Tags',
	  hint: ' ',
	  required: true,
	  idtags: model.model.inline_tags_list,
	  nametags: model.model.inline_tags_list_str,
	  getValue: (List<int?>? val) {
    model.model.inline_tags_id.clear();
		state.setState(() {
		  model.model.inline_tags_id.addAll(val);
		});
	  },
	  removeValue: (int? val) {
		state.setState(() {
		  model.model.inline_tags_id.remove(val);
		});
	  },
	));}

	  	    Widget editHandphone (State state) {
      return(
	HandphoneWidget(
		value: model.model.handphone,
		caption: 'Handphone',
		hint: 'Isi dengan Handphone Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.handphone = val;
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
		required: true,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.image = val;
			model.model.image_url = val!.name;
		  });
		},
	));} 

	  	    Widget editFile (State state) {
	 if(model.model.file== null){
		FileField? file = new FileField('', '',0,0,0, '', '', '','' );
		model.model.file = [file];
		}
      return(
	FileWidget(
		value: model.model.file[0],
		caption: 'File',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.file[0] = val;
		  });
		},
	));} 

	  	    Widget editCaptcha (State state) {
      return(
	new CaptchaWidget(
	  value: model.model.captcha,
	  caption: 'Captcha',
	  hint: '',
	  required: true,
	  getValue:(String? val) {
	  
		state.setState(() {
		  model.model.captcha = val;
		});
	  },
	));}
	
}


@JsonSerializable()

class TestSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelTest? model;
  TestSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory TestSuperBase.fromJson(Map<String, dynamic> json) => _$TestSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$TestSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelTest {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  String? test_id;
  String? user_name;
  String? password;
  String? display_name;
  String? title;
  String? email;
  int? model_id;
  String? model_str;
  String? model_url;
  List<int?>? model_list;
  List<String?>? model_list_str;
  int? enum_id;
  String? enum_str;
  List<int?>? enum_list;
  List<String?>? enum_list_str;
  String? address;
  String? multiline;
  DateTime? date;
  DateTime? date_time;
  DateTime? time;
  int? rating;
  int? number;
  String? number_str;
  double? money;
  String? money_str;
  double? double1;
  String? double1_str;  
  bool?boolean;
  int? percent;
  String? website;
  String? article;
  List<int?>? inline_tags_id;
  List<String?>?  inline_tags_str;
  List<String?>? inline_tags_url;
  String? handphone;
  String? image_url;
  Photo?image;
  List<FileField?>? file;  
  String? file_url;
  String? file_name;
  String? captcha;

	//
	  ViewModelTest(
            this.id,
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
			this.file,
			this.file_url,	
            this.file_name,				
			this.captcha,

  );

  
   factory ViewModelTest.fromJson(Map<String, dynamic> json) => _$ViewModelTestFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelTestToJson(this); 
  
}


class TestViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	TestViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, TestController test,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewTestWidget(model.buttons[i],context,  formKey, controller, test,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewTestWidget(Button button, BuildContext context,var formKey, ScrollController controller, TestController test,
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
                        
                        test = new  TestController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = test.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postTestResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, TestController test,
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
				children:listButton(context, visible!, formKey, controller, test,
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

	Widget view (BuildContext context, ScrollController controller, bool?account) {


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

	 	  
	   viewChildren!.add(viewUserName(context)); 
	   viewChildren!.add(viewPassword(context)); 
	   viewChildren!.add(viewDisplayName(context)); 
	   viewChildren!.add(viewTitle(context)); 
	   viewChildren!.add(viewEmail(context)); 
	   viewChildren!.add(viewModel(context)); 
	   viewChildren!.add(viewEnum(context)); 
	   viewChildren!.add(viewAddress(context)); 
	   viewChildren!.add(viewMultiline(context)); 
	   viewChildren!.add(viewDate(context)); 
	   viewChildren!.add(viewDateTime(context)); 
	   viewChildren!.add(viewTime(context)); 
	   viewChildren!.add(viewRating(context)); 
	   viewChildren!.add(viewNumber(context)); 
	   viewChildren!.add(viewMoney(context)); 
	   viewChildren!.add(viewDouble(context)); 
	   viewChildren!.add(viewBoolean(context)); 
	   viewChildren!.add(viewPercent(context)); 
	   viewChildren!.add(viewWebsite(context)); 
	   viewChildren!.add(viewArticle(context)); 
	   viewChildren!.add(viewInlineTags(context)); 
	   viewChildren!.add(viewHandphone(context)); 
	   viewChildren!.add(viewImage(context)); 
	   viewChildren!.add(viewFile(context)); 

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

 
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: model.model.user_name,
		caption: 'User Name',
	));}
		    Widget viewPassword (BuildContext context) {  
	return(  PasswordView(
		value: model.model.password,
		caption: 'Password',
	));}
		    Widget viewDisplayName (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.display_name,
		caption: 'Display Name',
	));}
		    Widget viewTitle (BuildContext context) {  
	return(  TitleView(
		value: model.model.title,
		caption: 'Title',
	));}
		    Widget viewEmail (BuildContext context) {  
	return(  EmailView(
		value: model.model.email,
		caption: 'Email',
	));}
				Widget viewModel (BuildContext context) {  
		return(  ModelView(
			value: model.model.model_id,
			caption: 'Model',
			idenum: model.model.model_list,
			nameenum: model.model.model_str,
		));} 
	    Widget viewEnum (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.enum_id,
			caption: 'Enum',
			idenum: model.model.enum_list,
			nameenum: model.model.enum_str,
		));} 
		    Widget viewAddress (BuildContext context) {  
	return(  AddressView(
		value: model.model.address,
		caption: 'Address',
	));}
		    Widget viewMultiline (BuildContext context) {  
	return(  MultilineView(
		value: model.model.multiline,
		caption: 'Multiline',
	));}
		    Widget viewDate (BuildContext context) {  
    if(model.model.date != null){
		return(  DateView(
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
		    Widget viewDateTime (BuildContext context) {  
	if(model.model.date_time != null){
	return(  DateTimeView(
		value: model.model.date_time,
		caption: 'Date Time',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Date Time',
		    ));
	}			 
	 } 
		    Widget viewTime (BuildContext context) {  

	 if(model.model.time != null){
	 	return(  TimeView(
		value: model.model.time,
		caption: 'Time',
		));
	 }else{
	   	   return(  StringView(
			value: '',
			caption: 'Time',
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
		    Widget viewNumber (BuildContext context) { 
    if(model.model.number != null){
		return(  NumberView(
		value: model.model.number,
		caption: 'Number',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Number',
		));
	}		
     }
		    Widget viewMoney (BuildContext context) {  			
    if(model.model.money != null){
		return(  MoneyView(
		value: model.model.money,
		caption: 'Money',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Money',
		    ));
	}			
     }
		    Widget viewDouble (BuildContext context) {  
	   	return(  DoubleView(
		    value: model.model.double1,
			caption: 'Double',
		));
      }
		    Widget viewBoolean (BuildContext context) {  

	if(model.model.boolean != null){
		return(  BooleanView(
		value: model.model.boolean,
		caption: 'Boolean',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Boolean',
		    ));
	}
     } 
		    Widget viewPercent (BuildContext context) {

	if(model.model.percent != null){
		return(  PercentView(
		value: model.model.percent,
		caption: 'Percent',
	    ));
	}else{
	   	   return(  StringView(
			value: '',
			caption: 'Percent',
		    ));	
	}
     }
		    Widget viewWebsite (BuildContext context) {  
	return(  WebsiteView(
		value: model.model.website,
		caption: 'Website',
	));}
		    Widget viewArticle (BuildContext context) {  
	if(model.model.article != null){
		return(  ArticleView(
		value: model.model.article,
		caption: 'Article',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Article',
		    ));
	}		
     }
	Widget viewInlineTags (BuildContext context) {  
	if(model.model.inline_tags_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.inline_tags_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.inline_tags_id,
						nameroutetags: model.model.inline_tags_str,
						urlroutetags: model.model.inline_tags_url,
						getValue: (String? val) {
						 // Navigator.pushReplacementNamed(context, "/projectscoid");
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.inline_tags_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.inline_tags_id,
						nameroutetags: model.model.inline_tags_str,
					  ));
	
    }	
			  } 
		    Widget viewHandphone (BuildContext context) { 
	return(  HandphoneView(
		value: model.model.handphone,
		caption: 'Handphone',
	));}
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: model.model.image_url,
		caption: 'Image',
	));} 
		    Widget viewFile (BuildContext context) {  
			if(model.model.file == null){
				  return(  StringView(
				value: '',
				caption: 'File',
			));
			}			
			if(model.model.file_name != ''){
			  return(  FileView(
				value: model.model.file_name,
				value1: model.model.file_url,
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
		value: model.model.captcha,
		caption: 'Captcha',
	));}
  
}


@JsonSerializable()
class TestViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelTest? model;
  TestViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory TestViewSuperBase.fromJson(Map<String, dynamic> json) => _$TestViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$TestViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class TestListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	TestListingBase(this.json){
		items = TestListingItems.fromJson(this.json);
		tools = TestListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemTestModel item,String? search, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTestCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemTestModel item,String? search, int? index, bool?account, String? id) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTestCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemTestModel item,String? search, int? index, bool?account) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTestCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemTestModel item,ItemTestModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTestCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemTestModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 15 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemTestCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonTestWidget(tools.buttons[i],context, account));
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





class TestListingItems{
  List<ItemTestModel?>? items;
  TestListingItems(
      this.items,
      );

  factory TestListingItems.fromJson(Map<String, dynamic> json) {
  	return TestListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemTestModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class TestListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemTest?>? items;
	TestListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory TestListingTools.fromJson(Map<String, dynamic> json) => _$TestListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$TestListingToolsToJson(this);

}




class ItemTestCard extends StatelessWidget {
  const ItemTestCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemTestModel? destination;
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
                child: ItemTestContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTestContent extends StatelessWidget {
  const ItemTestContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemTestModel? destination;

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
		  buttonChildren!.add(itemTestButton(destination,i , context));
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
	   children!.add(destination!.viewUserName(context)); 
	   children!.add(destination!.viewPassword(context)); 
	   children!.add(destination!.viewDisplayName(context)); 
	   children!.add(destination!.viewTitle(context)); 
	   children!.add(destination!.viewEmail(context)); 
	   children!.add(destination!.viewModel(context)); 
	   children!.add(destination!.viewEnum(context)); 
	   children!.add(destination!.viewAddress(context)); 
	   children!.add(destination!.viewMultiline(context)); 
	   children!.add(destination!.viewDate(context)); 
	   children!.add(destination!.viewDateTime(context)); 
	   children!.add(destination!.viewTime(context)); 
	   children!.add(destination!.viewRating(context)); 
	   children!.add(destination!.viewNumber(context)); 
	   children!.add(destination!.viewMoney(context)); 
	   children!.add(destination!.viewDouble(context)); 
	   children!.add(destination!.viewBoolean(context)); 
	   children!.add(destination!.viewPercent(context)); 
	   children!.add(destination!.viewWebsite(context)); 
	   children!.add(destination!.viewArticle(context)); 
	   children!.add(destination!.viewInlineTags(context)); 
	   children!.add(destination!.viewHandphone(context)); 
	   children!.add(destination!.viewImage(context)); 
	   children!.add(destination!.viewFile(context)); 
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

Widget itemTestButton(ItemTestModel? destination, int? index, BuildContext context){
  TestController test; 
  
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
                        
                        test = new  TestController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = test.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postTestResult = value;
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



class ItemTestWidget extends StatelessWidget {

	final ItemTestModel?  item;
	final String? search;
	const  ItemTestWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonTestWidget(Button button, BuildContext context, bool?account){
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






  






  

