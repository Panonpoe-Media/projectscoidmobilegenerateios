
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
part 'products_add_base.g.dart';



SpeedDialChild ButtonEditProductsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController products,
 var postProductsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        products =    SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = products.sendData();
                        future.then((value) {
                        state.setState(() {
                        postProductsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class AddModelProducts {
   int?   age;
   int?   cnt;
   int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


   int?product_id;
   int?seller_id;
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  Photo? logo;
  String?  logo_url;
   int?category_id;
  String? category_url;
  String? category_str;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String? title;
  String? description;
  String? short_description;
  String? deliverable_name;
  List<FileField?>? deliverable;
  String? trial_version_name;
  List<FileField?>? trial_version;
  double? price;
  String? price_str;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<int?>? tags_list;
  List<String?>? tags_list_str;

   int?status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
   int?registered_by_id;
  String? registered_by_url;
  String? registered_by_str;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime? registered_date;
  String? registered_from_ip;
   int?verified_by_id;
  String? verified_by_url;
  String? verified_by_str;
  List<int?>? verified_by_list;
  List<String?>? verified_by_list_str;
  DateTime? verified_date;
  String? verified_from_ip;
  String? verifier_note;
   int?approved_by_id;
  String? approved_by_url;
  String? approved_by_str;
  List<int?>? approved_by_list;
  List<String?>? approved_by_list_str;
  DateTime? approved_date;
  String? approved_from_ip;
  String? approver_note;
   int?published_by_id;
  String? published_by_url;
  String? published_by_str;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime? published_date;
  String? published_from_ip;
   int?rejected_by_id;
  String? rejected_by_url;
  String? rejected_by_str;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime? rejected_date;
  String? rejected_from_ip;
  String? admin_note;
  DateTime? last_bump;
   int?sales_count;
  String? sales_count_str;
  double? sales_amount;
  String? sales_amount_str;
   int?rating;
   int?points;
  String? points_str;
   int?ranking;
  String? ranking_str;
  double? rating_num;
  String? rating_num_str;
   int?rating_sum;
  String? rating_sum_str;
   int?rating_div;
  String? rating_div_str;

	
	  AddModelProducts(
            this.id,
            this.product_id,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.logo,
			this.logo_url,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.deliverable,
			this.deliverable_name,
			this.trial_version,
			this.trial_version_name,
			this.price,
			this.price_str,
			this.tags_id,
			this.tags_str,
			this.tags_url,
			this.tags_list,
			this.tags_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_list,
			this.registered_by_list_str,
			this.verified_by_id,
			this.verified_by_str,
			this.verified_by_list,
			this.verified_by_list_str,
			this.approved_by_id,
			this.approved_by_str,
			this.approved_by_list,
			this.approved_by_list_str,
			this.published_by_id,
			this.published_by_str,
			this.published_by_list,
			this.published_by_list_str,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.sales_count,
			this.sales_count_str,
			this.sales_amount,
			this.sales_amount_str,
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
    factory AddModelProducts.fromJson(Map<String, dynamic> json) => _$AddModelProductsFromJson(json);

  Map<String, dynamic> toJson() => _$AddModelProductsToJson(this);

}



@JsonSerializable()

class ProductsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  AddModelProducts? model;
  ProductsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ProductsSuperBase.fromJson(Map<String, dynamic> json) => _$ProductsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsSuperBaseToJson(this);
   
}




class ProductsAddBase{
	var model;
	Map<String, dynamic> json;
	ProductsAddBase(this.json){
		model = ProductsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "user_products[_trigger_]":"",
  "user_products[seller_id]": "${model.model.seller_id }",
  "user_products[logo]": '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.dir}"}',
  "user_products[category_id]": "${model.model.category_id }",
  "user_products[title]": "${model.model.title }",
  "user_products[description]": "${model.model.description }",
  "user_products[short_description]": "${model.model.short_description }",
  "user_products[deliverable]": '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size.toString()},"created":${model.model.deliverable[0].date.toString()},"modified":${model.model.deliverable[0].date.toString()},"temp":"${model.model.deliverable[0].temp}","remote":"","dir":"temp"}]',
  "user_products[trial_version]": '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size.toString()},"created":${model.model.trial_version[0].date.toString()},"modified":${model.model.trial_version[0].date.toString()},"temp":"${model.model.trial_version[0].temp}","remote":"","dir":"temp"}]',
  "user_products[price]": "${model.model.price}",
   "user_products[status_id]": "${model.model.status_id}",
  "user_products[registered_by_id]": "${model.model.registered_by_id }",
  "user_products[registered_date]": "${model.model.registered_date}",
  "user_products[registered_from_ip]": "${model.model.registered_from_ip }",
  "user_products[verified_by_id]": "${model.model.verified_by_id }",
  "user_products[verified_date]": "${model.model.verified_date}",
  "user_products[verified_from_ip]": "${model.model.verified_from_ip }",
   "user_products[verifier_note]": "${model.model.verifier_note }",
  "user_products[approved_by_id]": "${model.model.approved_by_id }",
  "user_products[approved_date]": "${model.model.approved_date}",
  "user_products[approved_from_ip]": "${model.model.approved_from_ip }",
   "user_products[approver_note]": "${model.model.approver_note }",
  "user_products[published_by_id]": "${model.model.published_by_id }",
  "user_products[published_date]": "${model.model.published_date}",
  "user_products[published_from_ip]": "${model.model.published_from_ip }",
  "user_products[rejected_by_id]": "${model.model.rejected_by_id }",
  "user_products[rejected_date]": "${model.model.rejected_date}",
  "user_products[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "user_products[admin_note]": "${model.model.admin_note }",
  "user_products[last_bump]": "${model.model.last_bump}",
  "user_products[sales_count]": "${model.model.sales_count }",
  "user_products[sales_amount]": "${model.model.sales_amount}",
  "user_products[rating]": "${model.model.rating }",
  "user_products[points]": "${model.model.points }",
  "user_products[ranking]": "${model.model.ranking }",
  "user_products[rating_num]": "${model.model.rating_num}",
  "user_products[rating_sum]": "${model.model.rating_sum }",
  "user_products[rating_div]": "${model.model.rating_div }",
	  
  };  
       int count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"user_products[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController products,
  var postProductsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditProductsWidget(model.buttons[i], context,formKey, controller,products, postProductsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController products,
  var postProductsResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,products, postProductsResult, state, sendPath, id,  title )
	    )
	 );
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

	  	    Widget editLogo (State state) {
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.
	ImageWidget(
		value: model.model.logo,
		caption: 'Logo',
		hint: 'Isi dengan Image Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.logo = val;
		  });
		},
	));} 

	  	    Widget editCategory (State state) {
	   return(  StringView(
		value: model.model.category_str,
		caption: 'Category',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.category_id,
	  caption: 'Category',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.category_id_list,
	  nameenum: model.model.category_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.category_id = val;
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
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
	));}

	  	    Widget editDescription (State state) {
      return(
	  ArticleWidget(
	  value: model.model.description,
	  caption: 'Description',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.description = val;
		});
	  },
	));}

	  	    Widget editShortDescription (State state) {
      return(
	DisplayNameWidget(
		value: model.model.short_description,
		caption: 'Short Description',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.short_description = val;
		  });
		},
    ));}

	  	    Widget editDeliverable (State state) {
      return(
	FileWidget(
		value: model.model.deliverable[0],
		caption: 'Deliverable',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.deliverable[0] = val;
		  });
		},
	));} 

	  	    Widget editTrialVersion (State state) {
      return(
	FileWidget(
		value: model.model.trial_version[0],
		caption: 'Trial Version',
		hint: 'Isi dengan File Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.trial_version[0] = val;
		  });
		},
	));} 

	  	    Widget editPrice (State state) {
      return(
	MoneyWidget(
	  value: model.model.price,
	  caption: 'Price',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.price = val;
		});
	  },
	));}

	  	    Widget editTags (State state) {
      return(
	
	  InlineTagsWidget(
	  value: model.model.tags_id,
	  caption: 'Tags',
	  hint: ' ',
	  required: true,
	  idtags: model.model.tags_list,
	  nametags: model.model.tags_list_str,
	  getValue: (List<int?>? val) {
		state.setState(() {
		  model.model.tags_id.addAll(val);
		});
	  },
	  removeValue: ( int?val) {
		state.setState(() {
		  model.model.tags_id.remove(val);
		});
	  },
	));}

   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

	  	    Widget editRegisteredBy (State state) {
	   return(  StringView(
		value: model.model.registered_by_str,
		caption: 'Registered By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.registered_by_id,
	  caption: 'Registered By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.registered_by_id_list,
	  nameenum: model.model.registered_by_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.registered_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRegisteredDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.registered_date,
	  caption: 'Registered Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.registered_date = val;
		});
	  },
	));} 

	  	    Widget editRegisteredFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.registered_from_ip,
		caption: 'Registered From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.registered_from_ip = val;
		  });
		},
    ));}

	  	    Widget editVerifiedBy (State state) {
	   return(  StringView(
		value: model.model.verified_by_str,
		caption: 'Verified By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.verified_by_id,
	  caption: 'Verified By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.verified_by_id_list,
	  nameenum: model.model.verified_by_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.verified_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editVerifiedDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.verified_date,
	  caption: 'Verified Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.verified_date = val;
		});
	  },
	));} 

	  	    Widget editVerifiedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.verified_from_ip,
		caption: 'Verified From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.verified_from_ip = val;
		  });
		},
    ));}

	 	    Widget editVerifierNote (State state) {
      return(
	MultilineWidget(
	  value: model.model.verifier_note,
	  caption: 'Verifier Note',
	  hint: 'Isi dengan Multiline Anda',
	  required:true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.verifier_note = val;
		});
	  },
	));}

	  	    Widget editApprovedBy (State state) {
	   return(  StringView(
		value: model.model.approved_by_str,
		caption: 'Approved By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.approved_by_id,
	  caption: 'Approved By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.approved_by_id_list,
	  nameenum: model.model.approved_by_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.approved_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editApprovedDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.approved_date,
	  caption: 'Approved Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.approved_date = val;
		});
	  },
	));} 

	  	    Widget editApprovedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.approved_from_ip,
		caption: 'Approved From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.approved_from_ip = val;
		  });
		},
    ));}

	 	    Widget editApproverNote (State state) {
      return(
	MultilineWidget(
	  value: model.model.approver_note,
	  caption: 'Approver Note',
	  hint: 'Isi dengan Multiline Anda',
	  required:true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.approver_note = val;
		});
	  },
	));}

	  	    Widget editPublishedBy (State state) {
	   return(  StringView(
		value: model.model.published_by_str,
		caption: 'Published By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.published_by_id,
	  caption: 'Published By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.published_by_id_list,
	  nameenum: model.model.published_by_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.published_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPublishedDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.published_date,
	  caption: 'Published Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.published_date = val;
		});
	  },
	));} 

	  	    Widget editPublishedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.published_from_ip,
		caption: 'Published From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.published_from_ip = val;
		  });
		},
    ));}

	  	    Widget editRejectedBy (State state) {
	   return(  StringView(
		value: model.model.rejected_by_str,
		caption: 'Rejected By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.rejected_by_id,
	  caption: 'Rejected By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.rejected_by_id_list,
	  nameenum: model.model.rejected_by_id_list_str,
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.rejected_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRejectedDate (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.rejected_date,
	  caption: 'Rejected Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.rejected_date = val;
		});
	  },
	));} 

	  	    Widget editRejectedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.rejected_from_ip,
		caption: 'Rejected From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.rejected_from_ip = val;
		  });
		},
    ));}

	  	    Widget editAdminNote (State state) {
      return(
	  ArticleWidget(
	  value: model.model.admin_note,
	  caption: 'Admin Note',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.admin_note = val;
		});
	  },
	));}

	  	    Widget editLastBump (State state) {
      return(
	  DateTimeWidget(
	  value: model.model.last_bump,
	  caption: 'Last Bump',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.last_bump = val;
		});
	  },
	));} 

	  	    Widget editSalesCount (State state) {
      return(
	NumberWidget(
	  value: model.model.sales_count,
	  caption: 'Sales Count',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.sales_count = val;
		});
	  },
	));}

	  	    Widget editSalesAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.sales_amount,
	  caption: 'Sales Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.sales_amount = val;
		});
	  },
	));}

	  	    Widget editRating (State state) {
      return(
	  RatingWidget(
	  value: model.model.rating,
	  caption: 'Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:( int?val) {
		state.setState(() {
		  model.model.rating = val;
		});
	  },
	));}

	  	    Widget editPoints (State state) {
      return(
	NumberWidget(
	  value: model.model.points,
	  caption: 'Points',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.points = val;
		});
	  },
	));}

	  	    Widget editRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.ranking,
	  caption: 'Ranking',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.ranking = val;
		});
	  },
	));}

	  	    Widget editRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.rating_num,
	  caption: 'Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.rating_num = val;
		});
	  },
	));}

	  	    Widget editRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.rating_sum,
	  caption: 'Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.rating_sum = val;
		});
	  },
	));}

	  	    Widget editRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.rating_div,
	  caption: 'Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: ( int?val) {
		state.setState(() {
		  model.model.rating_div = val;
		});
	  },
	));}
	
}









  

