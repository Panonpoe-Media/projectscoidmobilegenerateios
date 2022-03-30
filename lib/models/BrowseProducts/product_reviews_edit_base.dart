
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
part 'product_reviews_edit_base.g.dart';


Widget RButtonActionProductReviewsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController product_reviews,
 var postProductReviewsResult, State state, String? sendPath, String? id,  String? title,  var formData){
  var cl;
  var ic;
 //  final size =MediaQuery.of(context).size;
    double? width = 400; //size.width;
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
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
	  
  if(button.type == 'custom_filter'){
    return (
	       RaisedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
              textColor: Colors.white,
              splashColor : CurrentTheme.ShadeColor,
              color : Color(0xFF037f51),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button.text,
                    initialitems: button.selections,
                    initvalue: button.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             RaisedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
							   Text(button.text!),
                             ],
                            ),
              textColor: button.color == 'green'? Colors.white : Colors.black,
              color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              splashColor :  CurrentTheme.ShadeColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        product_reviews =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = product_reviews.sendData();
                        future.then((value) {
                        state.setState(() {
                        postProductReviewsResult = value;
                        });
                        });

                        } else {}
                  }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild ButtonEditProductReviewsWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController product_reviews,
 var postProductReviewsResult, State state, String? sendPath, String? id,  String? title, var formData){
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
                        product_reviews =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = product_reviews.sendData();
                        future.then((value) {
                        state.setState(() {
                        postProductReviewsResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelProductReviews {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? order_item_id;
  int? buyer_id;
  String? buyer_url;
  String? buyer_str;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  int? order_id;
  String? order_url;
  String? order_str;
  List<int?>? order_list;
  List<String?>? order_list_str;
  String? title;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? product_id;
  String? product_url;
  String? product_str;
  List<int?>? product_list;
  List<String?>? product_list_str;
  int? project_id;
  String? project_url;
  String? project_str;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? service_id;
  String? service_url;
  String? service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int? bid_id;
  String? bid_url;
  String? bid_str;
  List<int?>? bid_list;
  List<String?>? bid_list_str;
  int? iklan_id;
  String? iklan_url;
  String? iklan_str;
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
  String? seller_url;
  String? seller_str;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? buyer_payment_id;
  String? buyer_payment_url;
  String? buyer_payment_str;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  int? seller_credit_id;
  String? seller_credit_url;
  String? seller_credit_str;
  List<int?>? seller_credit_list;
  List<String?>? seller_credit_list_str;
  int? rating;
  String? testimony;

	
	  EditModelProductReviews(
            this.id,
            this.order_item_id,
			this.buyer_id,
			this.buyer_str,
			this.buyer_list,
			this.buyer_list_str,
			this.order_id,
			this.order_str,
			this.order_list,
			this.order_list_str,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.product_id,
			this.product_str,
			this.product_list,
			this.product_list_str,
			this.project_id,
			this.project_str,
			this.project_list,
			this.project_list_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.bid_id,
			this.bid_str,
			this.bid_list,
			this.bid_list_str,
			this.iklan_id,
			this.iklan_str,
			this.iklan_list,
			this.iklan_list_str,
			this.price,
			this.price_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.seller_id,
			this.seller_str,
			this.seller_list,
			this.seller_list_str,
			this.buyer_payment_id,
			this.buyer_payment_str,
			this.buyer_payment_list,
			this.buyer_payment_list_str,
			this.seller_credit_id,
			this.seller_credit_str,
			this.seller_credit_list,
			this.seller_credit_list_str,

  );
    factory EditModelProductReviews.fromJson(Map<String, dynamic> json) => _$EditModelProductReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelProductReviewsToJson(this);

}



@JsonSerializable()

class ProductReviewsSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelProductReviews? model;
  ProductReviewsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory ProductReviewsSuperBase.fromJson(Map<String, dynamic> json) => _$ProductReviewsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewsSuperBaseToJson(this);
   
}




class EditProductReviewsBase{
	var model;
	Map<String, dynamic> json;
	EditProductReviewsBase(this.json){
		model = ProductReviewsSuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "product_reviews[_trigger_]":"",
  "product_reviews[buyer_id]": "${model.model.buyer_id }",
  "product_reviews[order_id]": "${model.model.order_id }",
  "product_reviews[title]": "${model.model.title }",
   "product_reviews[type_id]": "${model.model.type_id}",
  "product_reviews[product_id]": "${model.model.product_id }",
  "product_reviews[project_id]": "${model.model.project_id }",
  "product_reviews[service_id]": "${model.model.service_id }",
  "product_reviews[bid_id]": "${model.model.bid_id }",
  "product_reviews[iklan_id]": "${model.model.iklan_id }",
  "product_reviews[date]": "${model.model.date}",
  "product_reviews[price]": "${model.model.price}",
   "product_reviews[status_id]": "${model.model.status_id}",
  "product_reviews[seller_id]": "${model.model.seller_id }",
  "product_reviews[buyer_payment_id]": "${model.model.buyer_payment_id }",
  "product_reviews[seller_credit_id]": "${model.model.seller_credit_id }",
  "product_reviews[rating]": "${model.model.rating }",
  "product_reviews[testimony]": "${model.model.testimony }",
	  
  };  

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController product_reviews,
  var postProductReviewsResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionProductReviewsWidget(model.buttons[i], context,formKey, controller,product_reviews, postProductReviewsResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController product_reviews,
  var postProductReviewsResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditProductReviewsWidget(model.buttons[i], context,formKey, controller,product_reviews, postProductReviewsResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController product_reviews,
  var postProductReviewsResult, State state, String? sendPath, String? id,  String? title ){
    //  final size =MediaQuery.of(context).size;
    double? width = 400;

    return(
        ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.9 * width,
                children:
           RlistButton(context, formKey,controller,product_reviews, postProductReviewsResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController product_reviews,
  var postProductReviewsResult, State state, String? sendPath, String? id,  String? title ){
     return(
	 SpeedDial(
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
				children:listButton(context, formKey,controller,product_reviews, postProductReviewsResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editBuyer (State state) {
	   return(  StringView(
		value: model.model.buyer_str,
		caption: 'Buyer',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.buyer_id,
	  caption: 'Buyer',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.buyer_id_list,
	  nameenum: model.model.buyer_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOrder (State state) {
	   return(  StringView(
		value: model.model.order_str,
		caption: 'Order',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.order_id,
	  caption: 'Order',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.order_id_list,
	  nameenum: model.model.order_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.order_id = val;
		});
	  },
	));*/
	}

	  	    Widget editTitle (State state) {
      return(
	DisplayNameWidget(
		value: model.model.title,
		caption: 'Title',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.title = val;
		  });
		},
    ));}

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}

	  	    Widget editProduct (State state) {
	   return(  StringView(
		value: model.model.product_str,
		caption: 'Product',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.product_id,
	  caption: 'Product',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.product_id_list,
	  nameenum: model.model.product_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_id = val;
		});
	  },
	));*/
	}

	  	    Widget editProject (State state) {
	   return(  StringView(
		value: model.model.project_str,
		caption: 'Project',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.project_id,
	  caption: 'Project',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.project_id_list,
	  nameenum: model.model.project_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.project_id = val;
		});
	  },
	));*/
	}

	  	    Widget editService (State state) {
	   return(  StringView(
		value: model.model.service_str,
		caption: 'Service',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.service_id,
	  caption: 'Service',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.service_id_list,
	  nameenum: model.model.service_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	  	    Widget editBid (State state) {
	   return(  StringView(
		value: model.model.bid_str,
		caption: 'Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.bid_id,
	  caption: 'Bid',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.bid_id_list,
	  nameenum: model.model.bid_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editIklan (State state) {
	   return(  StringView(
		value: model.model.iklan_str,
		caption: 'Iklan',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.iklan_id,
	  caption: 'Iklan',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.iklan_id_list,
	  nameenum: model.model.iklan_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.iklan_id = val;
		});
	  },
	));*/
	}

	  	    Widget editDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.date,
	  caption: 'Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.date = val;
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

   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

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
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_id = val;
		});
	  },
	));*/
	}

	  	    Widget editBuyerPayment (State state) {
	   return(  StringView(
		value: model.model.buyer_payment_str,
		caption: 'Buyer Payment',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.buyer_payment_id,
	  caption: 'Buyer Payment',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.buyer_payment_id_list,
	  nameenum: model.model.buyer_payment_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_payment_id = val;
		});
	  },
	));*/
	}

	  	    Widget editSellerCredit (State state) {
	   return(  StringView(
		value: model.model.seller_credit_str,
		caption: 'Seller Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.seller_credit_id,
	  caption: 'Seller Credit',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.seller_credit_id_list,
	  nameenum: model.model.seller_credit_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_credit_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRating (State state) {
      return(
	    RatingWidget(
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

	  	    Widget editTestimony (State state) {
      return(
	    ArticleWidget(
	  value: model.model.testimony,
	  caption: 'Testimony',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.testimony = val;
		});
	  },
	));}
	
}













  

