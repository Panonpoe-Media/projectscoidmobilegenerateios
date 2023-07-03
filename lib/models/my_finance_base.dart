

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
import 'my_finance_item.dart';
import 'my_finance_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/MyFinance/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'my_finance_base.g.dart';



@JsonSerializable()

class ModelActionChangePaymentSettingsMyFinance {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
  int? bank_id;
  String? bank_str;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_number;
  String? account_name;
  int? cutoff_period_id;
  String? cutoff_period_str;
  List<int?>? cutoff_period_list;
  List<String?>? cutoff_period_list_str;
  double? cutoff_amount;
  String? data_pajak;
  String? npwp;
  int? status_marital_id;
  String? status_marital_str;
  List<int?>? status_marital_list;
  List<String?>? status_marital_list_str;
  int? jumlah_tanggungan;
  String? security;
  String? secure_code;

	
	  ModelActionChangePaymentSettingsMyFinance(
            this.id,
			this.user_id,
			this.bank_id,
			this.bank_str,
			this.bank_list,
			this.bank_list_str,
			this.branch,
			this.city,
			this.account_number,
			this.account_name,
			this.cutoff_period_id,
			this.cutoff_period_str,
			this.cutoff_period_list,
			this.cutoff_period_list_str,
			this.cutoff_amount,
			this.data_pajak,
			this.npwp,
			this.status_marital_id,
			this.status_marital_str,
			this.status_marital_list,
			this.status_marital_list_str,
			this.jumlah_tanggungan,
			this.security,
			this.secure_code,

  );
    factory ModelActionChangePaymentSettingsMyFinance.fromJson(Map<String, dynamic> json) => _$ModelActionChangePaymentSettingsMyFinanceFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionChangePaymentSettingsMyFinanceToJson(this);

}



class ChangePaymentSettingsMyFinanceBase{
	var model;
	Map<String, dynamic> json;
	ChangePaymentSettingsMyFinanceBase(this.json){
		model = ChangePaymentSettingsMyFinanceSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyFinanceWidget(InterstitialAd? _interstitialAd, Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400;
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
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: Colors.white)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						cl),
					),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button!.text!,
                    initialitems: button.selections,
                    initvalue: button!.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button!.text!)
                             ],
                            ),
				style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
				  ),
              //textColor: button.color == 'green'? Colors.white : Colors.black,
              //color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              //splashColor :  CurrentTheme.ShadeColor,
              //shape: RoundedRectangleBorder(
              //    side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
               //   ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataChangePaymentSettings(button!.text!, model
                     					  );
                                  my_finance = new MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllChangePaymentSettingsMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postChangePaymentSettingsMyFinanceWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						  if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
                     				  
					 _createInterstitialAd(_interstitialAd);
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
						   
					  	  
                      });
                      }else{
                      final future = my_finance.postChangePaymentSettingsMyFinance();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
					   
					_createInterstitialAd(_interstitialAd);
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	

                      });
                      }
                                

                                  } else {
								  _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
								  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

  void _createInterstitialAd(InterstitialAd? _interstitialAd) {
    int _numInterstitialLoadAttempts = 0;
    int maxFailedLoadAttempts = 2;
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
            // print('berhasil 1234 ${this.model.model.model.price.toString()}');


            _showInterstitialAd(_interstitialAd);
            //  Future.delayed(Duration.zero, () => _showInterstitialAd());



          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts!) {
              _createInterstitialAd(_interstitialAd);
            }
          },
        ));
  }
  void _showInterstitialAd(InterstitialAd? _interstitialAd) {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        // _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        //_createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
    _setAdsStatus();
  }
  Future<void> _setAdsStatus() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('appads_timestamp', tm);
    ///print('apakah bisa man123456????');
    //setState(() {
    //  _isSetAds = false;
    //});
  }
  Future<bool> getAdsStatus() async {
    bool _isSetAds;
    var ts, fd;
    var delay;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
	   fd =  prefs.getBool('first_delay');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(fd){
        if(difference <= AdHelper.FirstDelay){
          _isSetAds = false;
         // delay = AdHelper.FirstDelay;
        }else{
          prefs.setBool('first_delay', false);
          //delay = AdHelper.delaySet;
          _isSetAds = true;
        }

      }else{

        if(difference <= AdHelper.delaySet){
          // if (!mounted) {
          // print('apakah bisa 1 ${difference}');
          //setState(() {
          _isSetAds = false;
          //});
          // }else{
          // print('apakah bisa 2');
          // _isSetAds = false;
          //  }
        }else{
          _isSetAds = true;
          // print('apakah bisa 2 ${difference}');
        }

      }


    } else {
      //print('apakah bisa 3');
      _isSetAds = true;
    }

    return _isSetAds;

  }

SpeedDialChild  ButtonActionMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
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
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
  if(button.type == 'custom_filter'){
    return (
	     
          SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text == 'Order by ...' ?  button.text : 'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button!.text!,
                                initialitems: button.selections,
                                initvalue: button!.selections![0]);
                        },
                      )

	);  
  }else{
	return(	
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataChangePaymentSettings(button!.text!, model
                     					  );
                                  my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ChangePaymentSettings')){
										my_finance.deleteAllChangePaymentSettingsMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllChangePaymentSettingsMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postChangePaymentSettingsMyFinanceWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_finance.postChangePaymentSettingsMyFinance();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }
                                

                                  } else {}
                            }
                      )

     );
  }

}

	
   Map<String, dynamic> convertFormDataAction(var data, String? triger){
  
   String? action =   'ChangePaymentSettings';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
  "user[bank_id]": "${model.model.bank_id_id }",
  "user[branch]": "${model.model.branch }",
  "user[city]": "${model.model.city }",
  "user[account_number]": "${model.model.account_number }",
  "user[account_name]": "${model.model.account_name }",
   "user[cutoff_period_id]": "${model.model.cutoff_period_id_id }",
  "user[cutoff_amount]": "${model.model.cutoff_amount }",
  "user[npwp]": "${model.model.npwp }",
   "user[status_marital_id]": "${model.model.status_marital_id_id }",
  "user[jumlah_tanggungan]": "${model.model.jumlah_tanggungan }",
  "user[secure_code]": "${model.model.secure_code }",
	  
  };  


    return( formData);
  } 	
  List<Widget> RlistButton(InterstitialAd? _interstitialAd,BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postChangePaymentSettingsResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(RButtonActionMyFinanceWidget( _interstitialAd, model.buttons[i], context,formKey, controller,my_finance, postChangePaymentSettingsResult, state, sendPath, id,  title));
	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
  var postChangePaymentSettingsResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyFinanceWidget(model.buttons[i], context,formKey, controller,my_finance, postChangePaymentSettingsResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postChangePaymentSettingsResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(InterstitialAd? _interstitialAd, BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postChangePaymentSettingsResult, State state, String? sendPath, String? id,  String? title ){
     // final size =MediaQuery.of(context).size;
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
           RlistButton( _interstitialAd, context, formKey,controller,my_finance, postChangePaymentSettingsResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postChangePaymentSettingsResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_finance, postChangePaymentSettingsResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editBank (State state) {
								  return(
								  ModelWidget(
								  value: model.model.bank_id,
								  caption: 'Bank',
								  hint: 'pilih Model',
								  required: true,
								  idenum: model.model.bank_list,
								  nameenum: model.model.bank_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.bank_id = val;
									});
								  },
								));}
										Widget editBranch (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.branch,
									caption: 'Branch',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.branch = val;
									  });
									},
								));}
										Widget editCity (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.city,
									caption: 'City',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.city = val;
									  });
									},
								));}
										Widget editAccountNumber (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.account_number,
									caption: 'Account Number',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.account_number = val;
									  });
									},
								));}
										Widget editAccountName (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.account_name,
									caption: 'Account Name',
									hint: 'Isi dengan Website Anda',
									required: true,
									getValue: (String? val) {
									  state.setState(() {
										model.model.account_name = val;
									  });
									},
								));}
									Widget editCutOffPeriod (State state) {
								  return(
								  EnumWidget(
								  value: model.model.cutoff_period_id,
								  caption: 'Cut-off Period',
								  hint: 'pilih Enum',
								  required: true,
								  idenum: model.model.cutoff_period_list,
								  nameenum: model.model.cutoff_period_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.cutoff_period_id = val;
									});
								  },
								));}
										Widget editCutOffAmount (State state) {
								  return(
								MoneyWidget(
								  value: model.model.cutoff_amount,
								  caption: 'Cut-off Amount',
								  hint: 'Isi dengan Money Anda',
								  required: true,
								  min:'9999', 
								  max:'100000000', 
								  getValue: (double? val) {
									state.setState(() {
									  model.model.cutoff_amount = val;
									});
								  },
								));}
										Widget editNpwp (State state) {
								  return(
								DisplayNameWidget(
									value: model.model.npwp,
									caption: 'NPWP',
									hint: 'Isi dengan Website Anda',
									required: false,
									getValue: (String? val) {
									  state.setState(() {
										model.model.npwp = val;
									  });
									},
								));}
									Widget editStatusMarital (State state) {
								  return(
								  EnumWidget(
								  value: model.model.status_marital_id,
								  caption: 'Status Marital',
								  hint: 'pilih Enum',
								  required: false,
								  idenum: model.model.status_marital_list,
								  nameenum: model.model.status_marital_list_str,
								  getValue: (int? val) {
									state.setState(() {
									  model.model.status_marital_id = val;
									});
								  },
								));}
										Widget editJumlahTanggungan (State state) {
								  return(
								NumberWidget(
								  value: model.model.jumlah_tanggungan,
								  caption: 'Jumlah Tanggungan',
								  hint: 'Isi dengan Number Anda',
								  required: false,
								  min: '0',
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.jumlah_tanggungan = val;
									});
								  },
								));}
								  
								 // String? model.model.secure_code;
 	

}


@JsonSerializable()
class ChangePaymentSettingsMyFinanceSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionChangePaymentSettingsMyFinance? model;
  ChangePaymentSettingsMyFinanceSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory ChangePaymentSettingsMyFinanceSuperBase.fromJson(Map<String, dynamic> json) => _$ChangePaymentSettingsMyFinanceSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePaymentSettingsMyFinanceSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionWithdrawPaymentMyFinance {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
  double? amount;
	  double? transfer_fee;
	  String? transfer_fee_str;
	  int? bank_id;
	  String? bank_str;
	  String? bank_url;
	  List<int?>? bank_list;
	  List<String?>? bank_list_str;
	  String? account_no;
	  String? account_name;

	
	  ModelActionWithdrawPaymentMyFinance(
            this.id,
			this.user_id,
			this.amount,
				this.transfer_fee,
				this.transfer_fee_str,
				this.bank_id,
				this.bank_str,
				this.bank_url,
				this.bank_list,
				this.bank_list_str,
        this.account_no,
        this.account_name,

  );
    factory ModelActionWithdrawPaymentMyFinance.fromJson(Map<String, dynamic> json) => _$ModelActionWithdrawPaymentMyFinanceFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionWithdrawPaymentMyFinanceToJson(this);

}



class WithdrawPaymentMyFinanceBase{
	var model;
	Map<String, dynamic> json;
	WithdrawPaymentMyFinanceBase(this.json){
		model = WithdrawPaymentMyFinanceSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

Future<int?> _getRateCountSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('apprate_count')) {
      return prefs.getInt('apprate_count');
    } else {
      return 0;
    }
  }

  Future<void> _setRateCountSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_count', i);
  }

Widget RButtonActionMyFinanceWidget(InterstitialAd? _interstitialAd, Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400;
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
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: Colors.white)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						cl),
					),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button!.text!,
                    initialitems: button.selections,
                    initvalue: button!.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button!.text!)
                             ],
                            ),
				style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
				  ),
              //textColor: button.color == 'green'? Colors.white : Colors.black,
              //color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              //splashColor :  CurrentTheme.ShadeColor,
              //shape: RoundedRectangleBorder(
              //    side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
               //   ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataWithdrawPayment(button!.text!, model
                     					  );
                                  my_finance = new MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllWithdrawPaymentMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postWithdrawPaymentMyFinanceWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						  if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
					   var x = await _getRateCountSF();
                                   // l.log('aku getRateCountSF ${x.toString()}');
                                    if(x == 0){
                                      await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AlertDialog(
                                              title: Text('App Ratting',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                              content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () async{
                                                    await _setRateCountSF(1);
                                                    if (await canLaunch(
                                                        'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                                      await launch(
                                                          'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                                    } else {
                                                      throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                                    }
                                                    Navigator.of(context).pop(true);
                                                    },
                                                  
                                                  child: Text('Rate'),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: Text('Nanti'),
                                                ),

                                          
                                              ],
                                            ),
                                      );
                                    }else{
                                      await _setRateCountSF(1);
                                    }

                     				  
					 _createInterstitialAd(_interstitialAd);
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
						   
					  	  
                      });
                      }else{
                      final future = my_finance.postWithdrawPaymentMyFinance();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
					   
					   var x = await _getRateCountSF();
                                   // l.log('aku getRateCountSF ${x.toString()}');
                                    if(x == 0){
                                      await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AlertDialog(
                                              title: Text('App Ratting',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                              content: Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () async{
                                                    await _setRateCountSF(1);
                                                    if (await canLaunch(
                                                        'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                                      await launch(
                                                          'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                                    } else {
                                                      throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                                    }
                                                    Navigator.of(context).pop(true);
                                                    },
                                                  
                                                  child: Text('Rate'),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: Text('Nanti'),
                                                ),

                                          
                                              ],
                                            ),
                                      );
                                    }else{
                                      await _setRateCountSF(1);
                                    }

					_createInterstitialAd(_interstitialAd);
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	

                      });
                      }
                                

                                  } else {
								  _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
								  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

  void _createInterstitialAd(InterstitialAd? _interstitialAd) {
    int _numInterstitialLoadAttempts = 0;
    int maxFailedLoadAttempts = 2;
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
            // print('berhasil 1234 ${this.model.model.model.price.toString()}');


            _showInterstitialAd(_interstitialAd);
            //  Future.delayed(Duration.zero, () => _showInterstitialAd());



          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts!) {
              _createInterstitialAd(_interstitialAd);
            }
          },
        ));
  }
  void _showInterstitialAd(InterstitialAd? _interstitialAd) {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        // _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        //_createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
    _setAdsStatus();
  }
  Future<void> _setAdsStatus() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('appads_timestamp', tm);
    ///print('apakah bisa man123456????');
    //setState(() {
    //  _isSetAds = false;
    //});
  }
  Future<bool> getAdsStatus() async {
    bool _isSetAds;
    var ts, fd;
    var delay;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
	   fd =  prefs.getBool('first_delay');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(fd){
        if(difference <= AdHelper.FirstDelay){
          _isSetAds = false;
         // delay = AdHelper.FirstDelay;
        }else{
          prefs.setBool('first_delay', false);
          //delay = AdHelper.delaySet;
          _isSetAds = true;
        }

      }else{

        if(difference <= AdHelper.delaySet){
          // if (!mounted) {
          // print('apakah bisa 1 ${difference}');
          //setState(() {
          _isSetAds = false;
          //});
          // }else{
          // print('apakah bisa 2');
          // _isSetAds = false;
          //  }
        }else{
          _isSetAds = true;
          // print('apakah bisa 2 ${difference}');
        }

      }


    } else {
      //print('apakah bisa 3');
      _isSetAds = true;
    }

    return _isSetAds;

  }

SpeedDialChild  ButtonActionMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
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
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
  if(button.type == 'custom_filter'){
    return (
	     
          SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text == 'Order by ...' ?  button.text : 'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button!.text!,
                                initialitems: button.selections,
                                initvalue: button!.selections![0]);
                        },
                      )

	);  
  }else{
	return(	
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataWithdrawPayment(button!.text!, model
                     					  );
                                  my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('WithdrawPayment')){
										my_finance.deleteAllWithdrawPaymentMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllWithdrawPaymentMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postWithdrawPaymentMyFinanceWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_finance.postWithdrawPaymentMyFinance();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }
                                

                                  } else {}
                            }
                      )

     );
  }

}

	
   Map<String, dynamic> convertFormDataAction(var data, String? triger){
  
   String? action =   'WithdrawPayment';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
  "user[amount]": "${model.model.amount }",
	  
  };  


    return( formData);
  } 	
  List<Widget> RlistButton(InterstitialAd? _interstitialAd,BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postWithdrawPaymentResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(RButtonActionMyFinanceWidget( _interstitialAd, model.buttons[i], context,formKey, controller,my_finance, postWithdrawPaymentResult, state, sendPath, id,  title));
	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
  var postWithdrawPaymentResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyFinanceWidget(model.buttons[i], context,formKey, controller,my_finance, postWithdrawPaymentResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postWithdrawPaymentResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(InterstitialAd? _interstitialAd, BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postWithdrawPaymentResult, State state, String? sendPath, String? id,  String? title ){
     // final size =MediaQuery.of(context).size;
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
           RlistButton( _interstitialAd, context, formKey,controller,my_finance, postWithdrawPaymentResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postWithdrawPaymentResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_finance, postWithdrawPaymentResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editAmount (State state) {
								  return(
								MoneyWidget(
								  value: model.model.amount,
								  caption: 'Amount',
								  hint: 'Isi dengan Money Anda',
								  required: true,
								  min: '0',
								  max: '1000000000',
								  getValue: (double? val) {
									state.setState(() {
									  model.model.amount = val;
									});
								  },
								));}
										Widget viewTransferFee (BuildContext context) {  
								return(  MoneyView(
									value: model.model.transfer_fee,
									caption: 'Transfer Fee',
								));}
										Widget viewBank (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.bank_str,
									caption: 'Bank',
								));
								 } 
										Widget viewAccountNo (BuildContext context) { 
							    if(model.model.account_no == null || model.model.account_no == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.account_no,
									caption: 'Account No',
								));
								}			
								
								}
										Widget viewAccountName (BuildContext context) { 
							    if(model.model.account_name == null || model.model.account_name == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.account_name,
									caption: 'Account Name',
								));
								}			
								
								}
 	

}


@JsonSerializable()
class WithdrawPaymentMyFinanceSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionWithdrawPaymentMyFinance? model;
  WithdrawPaymentMyFinanceSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory WithdrawPaymentMyFinanceSuperBase.fromJson(Map<String, dynamic> json) => _$WithdrawPaymentMyFinanceSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawPaymentMyFinanceSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionDepositBalanceMyFinance {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
  double? deposit_amount;

	
	  ModelActionDepositBalanceMyFinance(
            this.id,
			this.user_id,
			this.deposit_amount,

  );
    factory ModelActionDepositBalanceMyFinance.fromJson(Map<String, dynamic> json) => _$ModelActionDepositBalanceMyFinanceFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionDepositBalanceMyFinanceToJson(this);

}



class DepositBalanceMyFinanceBase{
	var model;
	Map<String, dynamic> json;
	DepositBalanceMyFinanceBase(this.json){
		model = DepositBalanceMyFinanceSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,

 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
  var cl;
  var ic;
  // final size =MediaQuery.of(context).size;
    double? width = 400;
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
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: Colors.white)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						cl),
					),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button!.text!,
                    initialitems: button.selections,
                    initvalue: button!.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
                               Text(button!.text!)
                             ],
                            ),
				style: ButtonStyle(
					shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
					backgroundColor:
					MaterialStateProperty.all<Color>(cl),
					overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
				  ),
              //textColor: button.color == 'green'? Colors.white : Colors.black,
              //color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
              //splashColor :  CurrentTheme.ShadeColor,
              //shape: RoundedRectangleBorder(
              //    side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
               //   ),
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataDepositBalance(button!.text!, model
                     					  );
                                  my_finance = new MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllDepositBalanceMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postDepositBalanceMyFinanceWithID();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						  if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
						   
					  	  
                      });
                      }else{
                      final future = my_finance.postDepositBalanceMyFinance();
                                  future.then((value) {
								  /*
								  _onWidgetDidBuild(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(value.toString()),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
									*/
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error)async{
						if(!Error.toString().contains('302')){
					     _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					   }	
					   
                          AppProvider.getRouter(context)!.pop(context);
                       // AppProvider.getRouter(context)!.pop(context);	

                      });
                      }
                                

                                  } else {
								  _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
								  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

  void _createInterstitialAd(InterstitialAd? _interstitialAd) {
    int _numInterstitialLoadAttempts = 0;
    int maxFailedLoadAttempts = 2;
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
            // print('berhasil 1234 ${this.model.model.model.price.toString()}');


            _showInterstitialAd(_interstitialAd);
            //  Future.delayed(Duration.zero, () => _showInterstitialAd());



          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts!) {
              _createInterstitialAd(_interstitialAd);
            }
          },
        ));
  }
  void _showInterstitialAd(InterstitialAd? _interstitialAd) {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        // _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        //_createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
    _setAdsStatus();
  }
  Future<void> _setAdsStatus() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('appads_timestamp', tm);
    ///print('apakah bisa man123456????');
    //setState(() {
    //  _isSetAds = false;
    //});
  }
  Future<bool> getAdsStatus() async {
    bool _isSetAds;
    var ts, fd;
    var delay;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
	   fd =  prefs.getBool('first_delay');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(fd){
        if(difference <= AdHelper.FirstDelay){
          _isSetAds = false;
         // delay = AdHelper.FirstDelay;
        }else{
          prefs.setBool('first_delay', false);
          //delay = AdHelper.delaySet;
          _isSetAds = true;
        }

      }else{

        if(difference <= AdHelper.delaySet){
          // if (!mounted) {
          // print('apakah bisa 1 ${difference}');
          //setState(() {
          _isSetAds = false;
          //});
          // }else{
          // print('apakah bisa 2');
          // _isSetAds = false;
          //  }
        }else{
          _isSetAds = true;
          // print('apakah bisa 2 ${difference}');
        }

      }


    } else {
      //print('apakah bisa 3');
      _isSetAds = true;
    }

    return _isSetAds;

  }

SpeedDialChild  ButtonActionMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
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
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
  if(button.type == 'custom_filter'){
    return (
	     
          SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button.text == 'Order by ...' ?  button.text : 'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black ),
                        onTap: (){ showSearchSelectDialog(context: context,
                                caption:button!.text!,
                                initialitems: button.selections,
                                initvalue: button!.selections![0]);
                        },
                      )

	);  
  }else{
	return(	
           SpeedDialChild(
                        child: Icon(ic),
                        backgroundColor: cl,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                       var formData = await convertFormDataDepositBalance(button!.text!, model
                     					  );
                                  my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_title);
										}else if(['AskOwner'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('DepositBalance')){
										my_finance.deleteAllDepositBalanceMyFinance(this.model.model.user_id);
										}else{
										my_finance.deleteAllDepositBalanceMyFinance('');
										}
                      if(sendPath!.contains('%s')){
                      final future = my_finance.postDepositBalanceMyFinanceWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = my_finance.postDepositBalanceMyFinance();
                                  future.then((value) {
                                  state.setState(() {
                                  postMyFinanceResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserMyFinanceListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }
                                

                                  } else {}
                            }
                      )

     );
  }

}

	
   Map<String, dynamic> convertFormDataAction(var data, String? triger){
  
   String? action =   'DepositBalance';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
  "user[deposit_amount]": "${model.model.deposit_amount }",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,

 var postDepositBalanceResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionMyFinanceWidget(model.buttons[i], context,formKey, controller,my_finance, postDepositBalanceResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
  var postDepositBalanceResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionMyFinanceWidget(model.buttons[i], context,formKey, controller,my_finance, postDepositBalanceResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postDepositBalanceResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postDepositBalanceResult, State state, String? sendPath, String? id,  String? title ){
     // final size =MediaQuery.of(context).size;
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
		   RlistButton(context, formKey,controller,my_finance, postDepositBalanceResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postDepositBalanceResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,my_finance, postDepositBalanceResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editDepositAmount (State state) {
								  return(
								MoneyWidget(
								  value: model.model.deposit_amount,
								  caption: 'Deposit Amount',
								  hint: 'Isi dengan Money Anda',
								  required: true,
								  min:'50000', 
								  max:'100000000', 
								  getValue: (double? val) {
									state.setState(() {
									  model.model.deposit_amount = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class DepositBalanceMyFinanceSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionDepositBalanceMyFinance? model;
  DepositBalanceMyFinanceSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory DepositBalanceMyFinanceSuperBase.fromJson(Map<String, dynamic> json) => _$DepositBalanceMyFinanceSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$DepositBalanceMyFinanceSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelMyFinance {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? user_id;
  String? data_pajak;
  String? security;
  String? user_name;
  int? group_id;
  String? group_url;
  String? group_str;
  List<int?>? group_list;
  List<String?>? group_list_str;
  String? email;
  String? password;
  String? auth;
  int? account_status_id;
  String? account_status_str;
  List<int?>? account_status_list;
  List<String?>? account_status_list_str;
  int? account_type_id;
  String? account_type_str;
  List<int?>? account_type_list;
  List<String?>? account_type_list_str;
  DateTime? date_registered;
  DateTime? last_login;
  DateTime? last_seen;
  bool?online;
  DateTime? last_online_mark;
  double? online_hours;
  String? online_hours_str;
  String? nomor_ktp;
  Photo?scan_ktp;
  String?  scan_ktp_url;
  String? nomor_siup;
  Photo?scan_siup;
  String?  scan_siup_url;
  String? npwp;
  int? status_marital_id;
  String? status_marital_str;
  List<int?>? status_marital_list;
  List<String?>? status_marital_list_str;
  int? jumlah_tanggungan;
  String? jumlah_tanggungan_str;
  String? personal_data;
  Photo?photo;
  String?  photo_url;
  String? display_name;
  DateTime? birth_date;
  String? birth_code;
  int? jenis_kelamin_id;
  String? jenis_kelamin_str;
  List<int?>? jenis_kelamin_list;
  List<String?>? jenis_kelamin_list_str;
  String? address;
  int? country_id;
  String? country_url;
  String? country_str;
  List<int?>? country_list;
  List<String?>? country_list_str;
  int? provinsi_id;
  String? provinsi_url;
  String? provinsi_str;
  List<int?>? provinsi_list;
  List<String?>? provinsi_list_str;
  int? kabupaten_id;
  String? kabupaten_url;
  String? kabupaten_str;
  List<int?>? kabupaten_list;
  List<String?>? kabupaten_list_str;
  int? kecamatan_id;
  String? kecamatan_url;
  String? kecamatan_str;
  List<int?>? kecamatan_list;
  List<String?>? kecamatan_list_str;
  int? kelurahan_id;
  String? kelurahan_url;
  String? kelurahan_str;
  List<int?>? kelurahan_list;
  List<String?>? kelurahan_list_str;
  String? post_code;
  String? handphone;
  String? self_introduction;
  String? website;
  int? language_id;
  String? language_url;
  String? language_str;
  List<int?>? language_list;
  List<String?>? language_list_str;
  List<int?>? skills_id;
  List<String?>?  skills_str;
  List<String?>? skills_url;
  List<int?>? skills_list;
  List<String?>? skills_list_str;

  String? full_name;
  String? captcha;
  String? secure_code;
  String? old_password;
  String? new_email;
  String? your_email;
  String? invitation_message;
  String? financial_data;
  int? bank_id;
  String? bank_url;
  String? bank_str;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_number;
  String? account_name;
  int? cutoff_period_id;
  String? cutoff_period_str;
  List<int?>? cutoff_period_list;
  List<String?>? cutoff_period_list_str;
  double? cutoff_amount;
  String? cutoff_amount_str;
  double? deposit_amount;
  String? deposit_amount_str;
  String? statistics;
  double? money_earned;
  String? money_earned_str;
  double? money_spent;
  String? money_spent_str;
  double? available_balance;
  String? available_balance_str;
  double? withheld_balance;
  String? withheld_balance_str;
  String? admin_notes;
  int? pesta_point;
  String? pesta_point_str;
  int? worker_rating;
  int? worker_ranking;
  String? worker_ranking_str;
  int? worker_point;
  String? worker_point_str;
  double? worker_rating_num;
  String? worker_rating_num_str;
  int? worker_rating_sum;
  String? worker_rating_sum_str;
  int? worker_rating_div;
  String? worker_rating_div_str;
  int? owner_rating;
  int? owner_ranking;
  String? owner_ranking_str;
  int? owner_point;
  String? owner_point_str;
  double? owner_rating_num;
  String? owner_rating_num_str;
  int? owner_rating_sum;
  String? owner_rating_sum_str;
  int? owner_rating_div;
  String? owner_rating_div_str;
  int? seller_rating;
  int? seller_ranking;
  String? seller_ranking_str;
  int? seller_point;
  String? seller_point_str;
  double? seller_rating_num;
  String? seller_rating_num_str;
  int? seller_rating_sum;
  String? seller_rating_sum_str;
  int? seller_rating_div;
  String? seller_rating_div_str;
  int? buyer_rating;
  int? buyer_ranking;
  String? buyer_ranking_str;
  int? buyer_point;
  String? buyer_point_str;
  double? buyer_rating_num;
  String? buyer_rating_num_str;
  int? buyer_rating_sum;
  String? buyer_rating_sum_str;
  int? buyer_rating_div;
  String? buyer_rating_div_str;
  int? affiliate_rating;
  int? affiliate_ranking;
  String? affiliate_ranking_str;
  int? affiliate_point;
  String? affiliate_point_str;
  double? affiliate_rating_num;
  String? affiliate_rating_num_str;
  int? affiliate_rating_sum;
  String? affiliate_rating_sum_str;
  int? affiliate_rating_div;
  String? affiliate_rating_div_str;
  int? projects_won;
  String? projects_won_str;
  double? projects_won_cumulative;
  String? projects_won_cumulative_str;
  int? projects_owned;
  String? projects_owned_str;
  double? projects_owned_cumulative;
  String? projects_owned_cumulative_str;
  int? projects_noaction;
  String? projects_noaction_str;
  int? projects_canceled;
  String? projects_canceled_str;
  int? missed_payment;
  String? missed_payment_str;
  int? projects_completed;
  String? projects_completed_str;
  int? projects_arbitrated;
  String? projects_arbitrated_str;
  int? projects_arbit_won;
  String? projects_arbit_won_str;
  int? projects_arbit_lost;
  String? projects_arbit_lost_str;
  int? current_projects;
  String? current_projects_str;
  int? missed_weekly_report;
  String? missed_weekly_report_str;
  int? product_sold;
  String? product_sold_str;
  double? product_sold_cumulative;
  String? product_sold_cumulative_str;
  int? product_bought;
  String? product_bought_str;
  double? product_bought_cumulative;
  String? product_bought_cumulative_str;
  int? bid_count;
  String? bid_count_str;
  int? post_count;
  String? post_count_str;
  int? work_quality;
  double? work_quality_num;
  String? work_quality_num_str;
  int? work_quality_sum;
  String? work_quality_sum_str;
  int? work_quality_div;
  String? work_quality_div_str;
  int? expertise;
  double? expertise_num;
  String? expertise_num_str;
  int? expertise_sum;
  String? expertise_sum_str;
  int? expertise_div;
  String? expertise_div_str;
  int? worker_communication;
  double? worker_communication_num;
  String? worker_communication_num_str;
  int? worker_communication_sum;
  String? worker_communication_sum_str;
  int? worker_communication_div;
  String? worker_communication_div_str;
  int? worker_professionalism;
  double? worker_professionalism_num;
  String? worker_professionalism_num_str;
  int? worker_professionalism_sum;
  String? worker_professionalism_sum_str;
  int? worker_professionalism_div;
  String? worker_professionalism_div_str;
  int? clarity;
  double? clarity_num;
  String? clarity_num_str;
  int? clarity_sum;
  String? clarity_sum_str;
  int? clarity_div;
  String? clarity_div_str;
  int? friendliness;
  double? friendliness_num;
  String? friendliness_num_str;
  int? friendliness_sum;
  String? friendliness_sum_str;
  int? friendliness_div;
  String? friendliness_div_str;
  int? owner_communication;
  double? owner_communication_num;
  String? owner_communication_num_str;
  int? owner_communication_sum;
  String? owner_communication_sum_str;
  int? owner_communication_div;
  String? owner_communication_div_str;
  int? owner_professionalism;
  double? owner_professionalism_num;
  String? owner_professionalism_num_str;
  int? owner_professionalism_sum;
  String? owner_professionalism_sum_str;
  int? owner_professionalism_div;
  String? owner_professionalism_div_str;
  int? product_quality;
  double? product_quality_num;
  String? product_quality_num_str;
  int? product_quality_sum;
  String? product_quality_sum_str;
  int? product_quality_div;
  String? product_quality_div_str;
  int? service_quality;
  double? service_quality_num;
  String? service_quality_num_str;
  int? service_quality_sum;
  String? service_quality_sum_str;
  int? service_quality_div;
  String? service_quality_div_str;
  int? seller_communication;
  double? seller_communication_num;
  String? seller_communication_num_str;
  int? seller_communication_sum;
  String? seller_communication_sum_str;
  int? seller_communication_div;
  String? seller_communication_div_str;
  int? seller_professionalism;
  double? seller_professionalism_num;
  String? seller_professionalism_num_str;
  int? seller_professionalism_sum;
  String? seller_professionalism_sum_str;
  int? seller_professionalism_div;
  String? seller_professionalism_div_str;
  int? referer_id;
  String? referer_url;
  String? referer_str;
  List<int?>? referer_list;
  List<String?>? referer_list_str;
  DateTime? referer_expires;
  int? referal_this_month;
  String? referal_this_month_str;
  int? cookies_this_month;
  String? cookies_this_month_str;
  bool?premium_affiliate;
  int? refered_users;
  String? refered_users_str;
  double? referal_earnings;
  String? referal_earnings_str;
  int? affiliate_id;
  String? affiliate_id_str;
  int? last_announced_project;
  String? last_announced_project_str;
  int? notif_count;
  String? notif_count_str;
  bool?notify_projects;
  bool?lost_arbitration_recently;
  String? coupon;

	
	  ModelMyFinance(
            this.id,
            this.user_id,
			this.group_id,
			this.group_str,
			this.group_list,
			this.group_list_str,
			this.account_status_id,
			this.account_status_str,
			this.account_status_list,
			this.account_status_list_str,
			this.account_type_id,
			this.account_type_str,
			this.account_type_list,
			this.account_type_list_str,
			this.online_hours,
			this.online_hours_str,
			this.scan_ktp,
			this.scan_ktp_url,
			this.scan_siup,
			this.scan_siup_url,
			this.status_marital_id,
			this.status_marital_str,
			this.status_marital_list,
			this.status_marital_list_str,
			this.jumlah_tanggungan,
			this.jumlah_tanggungan_str,
			this.photo,
			this.photo_url,
			this.jenis_kelamin_id,
			this.jenis_kelamin_str,
			this.jenis_kelamin_list,
			this.jenis_kelamin_list_str,
			this.country_id,
			this.country_str,
			this.country_list,
			this.country_list_str,
			this.provinsi_id,
			this.provinsi_str,
			this.provinsi_list,
			this.provinsi_list_str,
			this.kabupaten_id,
			this.kabupaten_str,
			this.kabupaten_list,
			this.kabupaten_list_str,
			this.kecamatan_id,
			this.kecamatan_str,
			this.kecamatan_list,
			this.kecamatan_list_str,
			this.kelurahan_id,
			this.kelurahan_str,
			this.kelurahan_list,
			this.kelurahan_list_str,
			this.language_id,
			this.language_str,
			this.language_list,
			this.language_list_str,
			this.skills_id,
			this.skills_str,
			this.skills_url,
			this.skills_list,
			this.skills_list_str,
			this.bank_id,
			this.bank_str,
			this.bank_list,
			this.bank_list_str,
			this.cutoff_period_id,
			this.cutoff_period_str,
			this.cutoff_period_list,
			this.cutoff_period_list_str,
			this.cutoff_amount,
			this.cutoff_amount_str,
			this.deposit_amount,
			this.deposit_amount_str,
			this.money_earned,
			this.money_earned_str,
			this.money_spent,
			this.money_spent_str,
			this.available_balance,
			this.available_balance_str,
			this.withheld_balance,
			this.withheld_balance_str,
			this.pesta_point,
			this.pesta_point_str,
			this.worker_ranking,
			this.worker_ranking_str,
			this.worker_point,
			this.worker_point_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_rating_sum,
			this.worker_rating_sum_str,
			this.worker_rating_div,
			this.worker_rating_div_str,
			this.owner_ranking,
			this.owner_ranking_str,
			this.owner_point,
			this.owner_point_str,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_rating_sum,
			this.owner_rating_sum_str,
			this.owner_rating_div,
			this.owner_rating_div_str,
			this.seller_ranking,
			this.seller_ranking_str,
			this.seller_point,
			this.seller_point_str,
			this.seller_rating_num,
			this.seller_rating_num_str,
			this.seller_rating_sum,
			this.seller_rating_sum_str,
			this.seller_rating_div,
			this.seller_rating_div_str,
			this.buyer_ranking,
			this.buyer_ranking_str,
			this.buyer_point,
			this.buyer_point_str,
			this.buyer_rating_num,
			this.buyer_rating_num_str,
			this.buyer_rating_sum,
			this.buyer_rating_sum_str,
			this.buyer_rating_div,
			this.buyer_rating_div_str,
			this.affiliate_ranking,
			this.affiliate_ranking_str,
			this.affiliate_point,
			this.affiliate_point_str,
			this.affiliate_rating_num,
			this.affiliate_rating_num_str,
			this.affiliate_rating_sum,
			this.affiliate_rating_sum_str,
			this.affiliate_rating_div,
			this.affiliate_rating_div_str,
			this.projects_won,
			this.projects_won_str,
			this.projects_won_cumulative,
			this.projects_won_cumulative_str,
			this.projects_owned,
			this.projects_owned_str,
			this.projects_owned_cumulative,
			this.projects_owned_cumulative_str,
			this.projects_noaction,
			this.projects_noaction_str,
			this.projects_canceled,
			this.projects_canceled_str,
			this.missed_payment,
			this.missed_payment_str,
			this.projects_completed,
			this.projects_completed_str,
			this.projects_arbitrated,
			this.projects_arbitrated_str,
			this.projects_arbit_won,
			this.projects_arbit_won_str,
			this.projects_arbit_lost,
			this.projects_arbit_lost_str,
			this.current_projects,
			this.current_projects_str,
			this.missed_weekly_report,
			this.missed_weekly_report_str,
			this.product_sold,
			this.product_sold_str,
			this.product_sold_cumulative,
			this.product_sold_cumulative_str,
			this.product_bought,
			this.product_bought_str,
			this.product_bought_cumulative,
			this.product_bought_cumulative_str,
			this.bid_count,
			this.bid_count_str,
			this.post_count,
			this.post_count_str,
			this.work_quality_num,
			this.work_quality_num_str,
			this.work_quality_sum,
			this.work_quality_sum_str,
			this.work_quality_div,
			this.work_quality_div_str,
			this.expertise_num,
			this.expertise_num_str,
			this.expertise_sum,
			this.expertise_sum_str,
			this.expertise_div,
			this.expertise_div_str,
			this.worker_communication_num,
			this.worker_communication_num_str,
			this.worker_communication_sum,
			this.worker_communication_sum_str,
			this.worker_communication_div,
			this.worker_communication_div_str,
			this.worker_professionalism_num,
			this.worker_professionalism_num_str,
			this.worker_professionalism_sum,
			this.worker_professionalism_sum_str,
			this.worker_professionalism_div,
			this.worker_professionalism_div_str,
			this.clarity_num,
			this.clarity_num_str,
			this.clarity_sum,
			this.clarity_sum_str,
			this.clarity_div,
			this.clarity_div_str,
			this.friendliness_num,
			this.friendliness_num_str,
			this.friendliness_sum,
			this.friendliness_sum_str,
			this.friendliness_div,
			this.friendliness_div_str,
			this.owner_communication_num,
			this.owner_communication_num_str,
			this.owner_communication_sum,
			this.owner_communication_sum_str,
			this.owner_communication_div,
			this.owner_communication_div_str,
			this.owner_professionalism_num,
			this.owner_professionalism_num_str,
			this.owner_professionalism_sum,
			this.owner_professionalism_sum_str,
			this.owner_professionalism_div,
			this.owner_professionalism_div_str,
			this.product_quality_num,
			this.product_quality_num_str,
			this.product_quality_sum,
			this.product_quality_sum_str,
			this.product_quality_div,
			this.product_quality_div_str,
			this.service_quality_num,
			this.service_quality_num_str,
			this.service_quality_sum,
			this.service_quality_sum_str,
			this.service_quality_div,
			this.service_quality_div_str,
			this.seller_communication_num,
			this.seller_communication_num_str,
			this.seller_communication_sum,
			this.seller_communication_sum_str,
			this.seller_communication_div,
			this.seller_communication_div_str,
			this.seller_professionalism_num,
			this.seller_professionalism_num_str,
			this.seller_professionalism_sum,
			this.seller_professionalism_sum_str,
			this.seller_professionalism_div,
			this.seller_professionalism_div_str,
			this.referer_id,
			this.referer_str,
			this.referer_list,
			this.referer_list_str,
			this.referal_this_month,
			this.referal_this_month_str,
			this.cookies_this_month,
			this.cookies_this_month_str,
			this.refered_users,
			this.refered_users_str,
			this.referal_earnings,
			this.referal_earnings_str,
			this.last_announced_project,
			this.last_announced_project_str,
			this.notif_count,
			this.notif_count_str,

  );
    factory ModelMyFinance.fromJson(Map<String, dynamic> json) => _$ModelMyFinanceFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMyFinanceToJson(this);

}




class MyFinanceBase{
	var model;
	Map<String, dynamic> json;
	MyFinanceBase(this.json){
		model = MyFinanceSuperBase.fromJson(this.json);
			model.model.password = '';
			model.model.old_password = '';
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String? scan_ktp = '';
	if (model.model.scan_ktp!= null) {
		 if (model.model.scan_ktp.temp != null) {
		   scan_ktp = '{"status":"1","name":"${model.model.scan_ktp.name}","temp":"${model.model.scan_ktp.temp}"} ';
		 }
	 }
	String? scan_siup = '';
	if (model.model.scan_siup!= null) {
		 if (model.model.scan_siup.temp != null) {
		   scan_siup = '{"status":"1","name":"${model.model.scan_siup.name}","temp":"${model.model.scan_siup.temp}"} ';
		 }
	 }
	String? photo = '';
	if (model.model.photo!= null) {
		 if (model.model.photo.temp != null) {
		   photo = '{"status":"1","name":"${model.model.photo.name}","temp":"${model.model.photo.temp}"} ';
		 }
	 }
   
   
      var formData = {
      "my_finance[_trigger_]":"",
   "my_finance[user_id]": "${model.model.user_id }",
  "my_finance[data_pajak]": "${model.model.data_pajak }",
  "my_finance[security]": "${model.model.security }",
  "my_finance[user_name]": "${model.model.user_name }",
  "my_finance[group_id]": "${model.model.group_id }",
  "my_finance[email]": "${model.model.email }",
  "my_finance[password]": "${model.model.password }",
  "my_finance[password_confirmation]": "${model.model.password }",
  "my_finance[auth]": "${model.model.auth }",
   "my_finance[account_status_id]": "${model.model.account_status_id}",
   "my_finance[account_type_id]": "${model.model.account_type_id}",
  "my_finance[date_registered]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date_registered)}",
  "my_finance[last_login]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_login)}",
  "my_finance[last_seen]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_seen)}",
  "my_finance[online]": "${model.model.online ? 1 : 0}",
  "my_finance[last_online_mark]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_online_mark)}",
  "my_finance[online_hours]": "${model.model.online_hours}",
  "my_finance[nomor_ktp]": "${model.model.nomor_ktp }",
  "my_finance[scan_ktp]": '$scan_ktp',
  "my_finance[scan_ktp_lastval]": '{"name":"${model.model.scan_ktp.name}","dir":"${model.model.scan_ktp.dir}","file":"${model.model.scan_ktp.file}","thumb":"${model.model.scan_ktp.thumb}"}',
  "my_finance[nomor_siup]": "${model.model.nomor_siup }",
  "my_finance[scan_siup]": '$scan_siup',
  "my_finance[scan_siup_lastval]": '{"name":"${model.model.scan_siup.name}","dir":"${model.model.scan_siup.dir}","file":"${model.model.scan_siup.file}","thumb":"${model.model.scan_siup.thumb}"}',
  "my_finance[npwp]": "${model.model.npwp }",
   "my_finance[status_marital_id]": "${model.model.status_marital_id}",
  "my_finance[jumlah_tanggungan]": "${model.model.jumlah_tanggungan }",
  "my_finance[personal_data]": "${model.model.personal_data }",
  "my_finance[photo]": '$photo',
  "my_finance[photo_lastval]": '{"name":"${model.model.photo.name}","dir":"${model.model.photo.dir}","file":"${model.model.photo.file}","thumb":"${model.model.photo.thumb}"}',
  "my_finance[display_name]": "${model.model.display_name }",
  "my_finance[birth_date]": "${DateFormat('dd/MM/yyyy').format(model.model.birth_date)}",
  "my_finance[birth_code]": "${model.model.birth_code }",
   "my_finance[jenis_kelamin_id]": "${model.model.jenis_kelamin_id}",
  "my_finance[address]": "${model.model.address }",
  "my_finance[country_id]": "${model.model.country_id }",
  "my_finance[provinsi_id]": "${model.model.provinsi_id }",
  "my_finance[kabupaten_id]": "${model.model.kabupaten_id }",
  "my_finance[kecamatan_id]": "${model.model.kecamatan_id }",
  "my_finance[kelurahan_id]": "${model.model.kelurahan_id }",
  "my_finance[post_code]": "${model.model.post_code }",
  "my_finance[handphone]": "${model.model.handphone }",
  "my_finance[self_introduction]": "${model.model.self_introduction }",
  "my_finance[website]": "${model.model.website }",
  "my_finance[language_id]": "${model.model.language_id }",
  "my_finance[full_name]": "${model.model.full_name }",
  "my_finance[captcha]": "${model.model.captcha }",
  "my_finance[secure_code]": "${model.model.secure_code }",
  "my_finance[old_password]": "${model.model.old_password }",
  "my_finance[old_password_confirmation]": "${model.model.old_password }",
  "my_finance[new_email]": "${model.model.new_email }",
  "my_finance[your_email]": "${model.model.your_email }",
  "my_finance[invitation_message]": "${model.model.invitation_message }",
  "my_finance[financial_data]": "${model.model.financial_data }",
  "my_finance[bank_id]": "${model.model.bank_id }",
  "my_finance[branch]": "${model.model.branch }",
  "my_finance[city]": "${model.model.city }",
  "my_finance[account_number]": "${model.model.account_number }",
  "my_finance[account_name]": "${model.model.account_name }",
   "my_finance[cutoff_period_id]": "${model.model.cutoff_period_id}",
  "my_finance[cutoff_amount]": "${model.model.cutoff_amount}",
  "my_finance[deposit_amount]": "${model.model.deposit_amount}",
  "my_finance[statistics]": "${model.model.statistics }",
  "my_finance[money_earned]": "${model.model.money_earned}",
  "my_finance[money_spent]": "${model.model.money_spent}",
  "my_finance[available_balance]": "${model.model.available_balance}",
  "my_finance[withheld_balance]": "${model.model.withheld_balance}",
  "my_finance[admin_notes]": "${model.model.admin_notes }",
  "my_finance[pesta_point]": "${model.model.pesta_point }",
  "my_finance[worker_rating]": "${model.model.worker_rating }",
  "my_finance[worker_ranking]": "${model.model.worker_ranking }",
  "my_finance[worker_point]": "${model.model.worker_point }",
  "my_finance[worker_rating_num]": "${model.model.worker_rating_num}",
  "my_finance[worker_rating_sum]": "${model.model.worker_rating_sum }",
  "my_finance[worker_rating_div]": "${model.model.worker_rating_div }",
  "my_finance[owner_rating]": "${model.model.owner_rating }",
  "my_finance[owner_ranking]": "${model.model.owner_ranking }",
  "my_finance[owner_point]": "${model.model.owner_point }",
  "my_finance[owner_rating_num]": "${model.model.owner_rating_num}",
  "my_finance[owner_rating_sum]": "${model.model.owner_rating_sum }",
  "my_finance[owner_rating_div]": "${model.model.owner_rating_div }",
  "my_finance[seller_rating]": "${model.model.seller_rating }",
  "my_finance[seller_ranking]": "${model.model.seller_ranking }",
  "my_finance[seller_point]": "${model.model.seller_point }",
  "my_finance[seller_rating_num]": "${model.model.seller_rating_num}",
  "my_finance[seller_rating_sum]": "${model.model.seller_rating_sum }",
  "my_finance[seller_rating_div]": "${model.model.seller_rating_div }",
  "my_finance[buyer_rating]": "${model.model.buyer_rating }",
  "my_finance[buyer_ranking]": "${model.model.buyer_ranking }",
  "my_finance[buyer_point]": "${model.model.buyer_point }",
  "my_finance[buyer_rating_num]": "${model.model.buyer_rating_num}",
  "my_finance[buyer_rating_sum]": "${model.model.buyer_rating_sum }",
  "my_finance[buyer_rating_div]": "${model.model.buyer_rating_div }",
  "my_finance[affiliate_rating]": "${model.model.affiliate_rating }",
  "my_finance[affiliate_ranking]": "${model.model.affiliate_ranking }",
  "my_finance[affiliate_point]": "${model.model.affiliate_point }",
  "my_finance[affiliate_rating_num]": "${model.model.affiliate_rating_num}",
  "my_finance[affiliate_rating_sum]": "${model.model.affiliate_rating_sum }",
  "my_finance[affiliate_rating_div]": "${model.model.affiliate_rating_div }",
  "my_finance[projects_won]": "${model.model.projects_won }",
  "my_finance[projects_won_cumulative]": "${model.model.projects_won_cumulative}",
  "my_finance[projects_owned]": "${model.model.projects_owned }",
  "my_finance[projects_owned_cumulative]": "${model.model.projects_owned_cumulative}",
  "my_finance[projects_noaction]": "${model.model.projects_noaction }",
  "my_finance[projects_canceled]": "${model.model.projects_canceled }",
  "my_finance[missed_payment]": "${model.model.missed_payment }",
  "my_finance[projects_completed]": "${model.model.projects_completed }",
  "my_finance[projects_arbitrated]": "${model.model.projects_arbitrated }",
  "my_finance[projects_arbit_won]": "${model.model.projects_arbit_won }",
  "my_finance[projects_arbit_lost]": "${model.model.projects_arbit_lost }",
  "my_finance[current_projects]": "${model.model.current_projects }",
  "my_finance[missed_weekly_report]": "${model.model.missed_weekly_report }",
  "my_finance[product_sold]": "${model.model.product_sold }",
  "my_finance[product_sold_cumulative]": "${model.model.product_sold_cumulative}",
  "my_finance[product_bought]": "${model.model.product_bought }",
  "my_finance[product_bought_cumulative]": "${model.model.product_bought_cumulative}",
  "my_finance[bid_count]": "${model.model.bid_count }",
  "my_finance[post_count]": "${model.model.post_count }",
  "my_finance[work_quality]": "${model.model.work_quality }",
  "my_finance[work_quality_num]": "${model.model.work_quality_num}",
  "my_finance[work_quality_sum]": "${model.model.work_quality_sum }",
  "my_finance[work_quality_div]": "${model.model.work_quality_div }",
  "my_finance[expertise]": "${model.model.expertise }",
  "my_finance[expertise_num]": "${model.model.expertise_num}",
  "my_finance[expertise_sum]": "${model.model.expertise_sum }",
  "my_finance[expertise_div]": "${model.model.expertise_div }",
  "my_finance[worker_communication]": "${model.model.worker_communication }",
  "my_finance[worker_communication_num]": "${model.model.worker_communication_num}",
  "my_finance[worker_communication_sum]": "${model.model.worker_communication_sum }",
  "my_finance[worker_communication_div]": "${model.model.worker_communication_div }",
  "my_finance[worker_professionalism]": "${model.model.worker_professionalism }",
  "my_finance[worker_professionalism_num]": "${model.model.worker_professionalism_num}",
  "my_finance[worker_professionalism_sum]": "${model.model.worker_professionalism_sum }",
  "my_finance[worker_professionalism_div]": "${model.model.worker_professionalism_div }",
  "my_finance[clarity]": "${model.model.clarity }",
  "my_finance[clarity_num]": "${model.model.clarity_num}",
  "my_finance[clarity_sum]": "${model.model.clarity_sum }",
  "my_finance[clarity_div]": "${model.model.clarity_div }",
  "my_finance[friendliness]": "${model.model.friendliness }",
  "my_finance[friendliness_num]": "${model.model.friendliness_num}",
  "my_finance[friendliness_sum]": "${model.model.friendliness_sum }",
  "my_finance[friendliness_div]": "${model.model.friendliness_div }",
  "my_finance[owner_communication]": "${model.model.owner_communication }",
  "my_finance[owner_communication_num]": "${model.model.owner_communication_num}",
  "my_finance[owner_communication_sum]": "${model.model.owner_communication_sum }",
  "my_finance[owner_communication_div]": "${model.model.owner_communication_div }",
  "my_finance[owner_professionalism]": "${model.model.owner_professionalism }",
  "my_finance[owner_professionalism_num]": "${model.model.owner_professionalism_num}",
  "my_finance[owner_professionalism_sum]": "${model.model.owner_professionalism_sum }",
  "my_finance[owner_professionalism_div]": "${model.model.owner_professionalism_div }",
  "my_finance[product_quality]": "${model.model.product_quality }",
  "my_finance[product_quality_num]": "${model.model.product_quality_num}",
  "my_finance[product_quality_sum]": "${model.model.product_quality_sum }",
  "my_finance[product_quality_div]": "${model.model.product_quality_div }",
  "my_finance[service_quality]": "${model.model.service_quality }",
  "my_finance[service_quality_num]": "${model.model.service_quality_num}",
  "my_finance[service_quality_sum]": "${model.model.service_quality_sum }",
  "my_finance[service_quality_div]": "${model.model.service_quality_div }",
  "my_finance[seller_communication]": "${model.model.seller_communication }",
  "my_finance[seller_communication_num]": "${model.model.seller_communication_num}",
  "my_finance[seller_communication_sum]": "${model.model.seller_communication_sum }",
  "my_finance[seller_communication_div]": "${model.model.seller_communication_div }",
  "my_finance[seller_professionalism]": "${model.model.seller_professionalism }",
  "my_finance[seller_professionalism_num]": "${model.model.seller_professionalism_num}",
  "my_finance[seller_professionalism_sum]": "${model.model.seller_professionalism_sum }",
  "my_finance[seller_professionalism_div]": "${model.model.seller_professionalism_div }",
  "my_finance[referer_id]": "${model.model.referer_id }",
  "my_finance[referer_expires]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.referer_expires)}",
  "my_finance[referal_this_month]": "${model.model.referal_this_month }",
  "my_finance[cookies_this_month]": "${model.model.cookies_this_month }",
  "my_finance[premium_affiliate]": "${model.model.premium_affiliate ? 1 : 0}",
  "my_finance[refered_users]": "${model.model.refered_users }",
  "my_finance[referal_earnings]": "${model.model.referal_earnings}",
  "my_finance[affiliate_id]": "${model.model.affiliate_id }",
  "my_finance[last_announced_project]": "${model.model.last_announced_project }",
  "my_finance[notif_count]": "${model.model.notif_count }",
  "my_finance[notify_projects]": "${model.model.notify_projects ? 1 : 0}",
  "my_finance[lost_arbitration_recently]": "${model.model.lost_arbitration_recently ? 1 : 0}",
  "my_finance[coupon]": "${model.model.coupon }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.skills_id){
        formData.addAll({"my_finance[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
  var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditMyFinanceWidget(model.buttons[i], context,formKey, controller,my_finance, postMyFinanceResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
  var postMyFinanceResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,my_finance, postMyFinanceResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
 var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
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
                        my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = my_finance.postMyFinance();
                        future.then((value) {
                        state.setState(() {
                        postMyFinanceResult = value;
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
   




	  	    Widget editDataPajak (State state) {
      return(
	TitleWidget(
		value: model.model.data_pajak,
		caption: 'Data Pajak',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.data_pajak = val;
		  });
		},
	));}

	  	    Widget editSecurity (State state) {
      return(
	TitleWidget(
		value: model.model.security,
		caption: 'Security',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.security = val;
		  });
		},
	));}

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

	  	    Widget editGroup (State state) {
	   return(  StringView(
		value: model.model.group_str,
		caption: 'Group',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.group_id,
	  caption: 'Group',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.group_id_list,
	  nameenum: model.model.group_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.group_id = val;
		});
	  },
	));*/
	}

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

	  	    Widget editAuth (State state) {
      return(
	DisplayNameWidget(
		value: model.model.auth,
		caption: 'Auth',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.auth = val;
		  });
		},
    ));}

   	    Widget editAccountStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.account_status_id,
	  caption: 'Account Status',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.account_status_list,
	  nameenum: model.model.account_status_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.account_status_id = val;
		});
	  },
	));}

   	    Widget editAccountType (State state) {
      return(
	  EnumWidget(
	  value: model.model.account_type_id,
	  caption: 'Account Type',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.account_type_list,
	  nameenum: model.model.account_type_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.account_type_id = val;
		});
	  },
	));}

	  	    Widget editDateRegistered (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.date_registered,
	  caption: 'Date Registered',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.date_registered = val;
		});
	  },
	));} 

	  	    Widget editLastLogin (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.last_login,
	  caption: 'Last Login',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.last_login = val;
		});
	  },
	));} 

	  	    Widget editLastSeen (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.last_seen,
	  caption: 'Last Seen',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.last_seen = val;
		});
	  },
	));} 

	  	    Widget editOnline (State state) {
      return(
	BooleanWidget(
	  value: model.model.online,
	  caption: 'Online',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.online = val;
		});
	  },
	));} 

	  	    Widget editLastOnlineMark (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.last_online_mark,
	  caption: 'Last Online Mark',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.last_online_mark = val;
		});
	  },
	));} 

	  	    Widget editOnlineHours (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.online_hours,
	  caption: 'Online Hours',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.online_hours = val;
		});
	  },
	));}

	  	    Widget editNomorKtp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.nomor_ktp,
		caption: 'Nomor KTP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.nomor_ktp = val;
		  });
		},
    ));}

	Widget editScanKtp (State state) {
	if(model.model.scan_ktp_url== ''){
		model.model.scan_ktp = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.scan_ktp,
		caption: 'Scan KTP',
		hint: 'Isi dengan Image Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.scan_ktp = val;
			model.model.scan_ktp_url = val!.name;
		  });
		},
	));} 

	  	    Widget editNomorSiup (State state) {
      return(
	DisplayNameWidget(
		value: model.model.nomor_siup,
		caption: 'Nomor SIUP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.nomor_siup = val;
		  });
		},
    ));}

	Widget editScanSiup (State state) {
	if(model.model.scan_siup_url== ''){
		model.model.scan_siup = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.scan_siup,
		caption: 'Scan SIUP',
		hint: 'Isi dengan Image Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.scan_siup = val;
			model.model.scan_siup_url = val!.name;
		  });
		},
	));} 

	  	    Widget editNpwp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.npwp,
		caption: 'NPWP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.npwp = val;
		  });
		},
    ));}

   	    Widget editStatusMarital (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_marital_id,
	  caption: 'Status Marital',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.status_marital_list,
	  nameenum: model.model.status_marital_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.status_marital_id = val;
		});
	  },
	));}

	  	    Widget editJumlahTanggungan (State state) {
      return(
	NumberWidget(
	  value: model.model.jumlah_tanggungan,
	  caption: 'Jumlah Tanggungan',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.jumlah_tanggungan = val;
		});
	  },
	));}

	  	    Widget editPersonalData (State state) {
      return(
	TitleWidget(
		value: model.model.personal_data,
		caption: 'Personal Data',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.personal_data = val;
		  });
		},
	));}

	Widget editPhoto (State state) {
	if(model.model.photo_url== ''){
		model.model.photo = new Photo('','0','', '','', '');
		}
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.

	ImageWidget(
		value: model.model.photo,
		caption: 'Photo',
		hint: 'Isi dengan Image Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.photo = val;
			model.model.photo_url = val!.name;
		  });
		},
	));} 

	  	    Widget editDisplayName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.display_name,
		caption: 'Display Name',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.display_name = val;
		  });
		},
    ));}

	  	    Widget editBirthDate (State state) {
      return(
	new DateWidget(
	  value: model.model.birth_date,
	  caption: 'Birth Date',
	  hint: 'isi dengan Date diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  
		state.setState(() {
		  model.model.birth_date = val;
		});
	  },
	));} 

	  	    Widget editBirthCode (State state) {
      return(
	DisplayNameWidget(
		value: model.model.birth_code,
		caption: 'Birth Code',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.birth_code = val;
		  });
		},
    ));}

   	    Widget editJenisKelamin (State state) {
      return(
	  EnumWidget(
	  value: model.model.jenis_kelamin_id,
	  caption: 'Jenis Kelamin',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.jenis_kelamin_list,
	  nameenum: model.model.jenis_kelamin_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.jenis_kelamin_id = val;
		});
	  },
	));}

	  	    Widget editAddress (State state) {
      return(
	AddressWidget(
	  value: model.model.address,
	  caption: 'Address',
	  hint: 'Isi dengan Address Anda',
	  required: false,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.address = val;
		});
	  },
	));}

	  	    Widget editCountry (State state) {
	   return(  StringView(
		value: model.model.country_str,
		caption: 'Country',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.country_id,
	  caption: 'Country',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.country_id_list,
	  nameenum: model.model.country_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.country_id = val;
		});
	  },
	));*/
	}

	  	    Widget editProvinsi (State state) {
	   return(  StringView(
		value: model.model.provinsi_str,
		caption: 'Provinsi',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.provinsi_id,
	  caption: 'Provinsi',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.provinsi_id_list,
	  nameenum: model.model.provinsi_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.provinsi_id = val;
		});
	  },
	));*/
	}

	  	    Widget editKabupaten (State state) {
	   return(  StringView(
		value: model.model.kabupaten_str,
		caption: 'Kabupaten',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.kabupaten_id,
	  caption: 'Kabupaten',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.kabupaten_id_list,
	  nameenum: model.model.kabupaten_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.kabupaten_id = val;
		});
	  },
	));*/
	}

	  	    Widget editKecamatan (State state) {
	   return(  StringView(
		value: model.model.kecamatan_str,
		caption: 'Kecamatan',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.kecamatan_id,
	  caption: 'Kecamatan',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.kecamatan_id_list,
	  nameenum: model.model.kecamatan_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.kecamatan_id = val;
		});
	  },
	));*/
	}

	  	    Widget editKelurahan (State state) {
	   return(  StringView(
		value: model.model.kelurahan_str,
		caption: 'Kelurahan',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.kelurahan_id,
	  caption: 'Kelurahan',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.kelurahan_id_list,
	  nameenum: model.model.kelurahan_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.kelurahan_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPostCode (State state) {
      return(
	DisplayNameWidget(
		value: model.model.post_code,
		caption: 'Post Code',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.post_code = val;
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

	  	    Widget editSelfIntroduction (State state) {
      return(
	new ArticleWidget(
	  value: model.model.self_introduction,
	  caption: 'Self Introduction',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.self_introduction = val;
		});
	  },
	));}

	  	    Widget editWebsite (State state) {
      return(
	 WebsiteWidget(
		value: model.model.website,
		caption: 'Website',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.website = val;
		  });
		},
	));}

	  	    Widget editLanguage (State state) {
	   return(  StringView(
		value: model.model.language_str,
		caption: 'Language',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.language_id,
	  caption: 'Language',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.language_id_list,
	  nameenum: model.model.language_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.language_id = val;
		});
	  },
	));*/
	}

	  	    Widget editSkills (State state) {
      return(
	
	new InlineTagsWidget(
	  value: model.model.skills_id,
	  caption: 'Skills',
	  hint: ' ',
	  required: false,
	  idtags: model.model.skills_list,
	  nametags: model.model.skills_list_str,
	  getValue: (List<int?>? val) {
    model.model.skills_id.clear();
		state.setState(() {
		  model.model.skills_id.addAll(val);
		});
	  },
	  removeValue: (int? val) {
		state.setState(() {
		  model.model.skills_id.remove(val);
		});
	  },
	));}

	  	    Widget editFullName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.full_name,
		caption: 'Full Name',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.full_name = val;
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

	  
	 // String? model.model.secure_code;

	    String? confirmOldPassword = ''; 
	  	    Widget editOldPassword (State state) {
      return(
	 PasswordWidget(
		value: model.model.old_password,
		value1: confirmOldPassword ,
		caption: 'Old Password',
		hint: '',
		required: true,
		getValue:(String?  val){
		  state.setState(() {
			model.model.old_password = val;
		  });
		},
		getValue1:(String?  val){
		  state.setState(() {
			confirmOldPassword = val;
		  });
		}
	));}

	  	    Widget editNewEmail (State state) {
      return(
	 EmailWidget(
		value: model.model.new_email,
		caption: 'New Email',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.new_email = val;
		  });
		},
	));}

	  	    Widget editYourEmail (State state) {
      return(
	 EmailWidget(
		value: model.model.your_email,
		caption: 'Your Email',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.your_email = val;
		  });
		},
	));}

	  	    Widget editInvitationMessage (State state) {
      return(
	new ArticleWidget(
	  value: model.model.invitation_message,
	  caption: 'Invitation Message',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.invitation_message = val;
		});
	  },
	));}

	  	    Widget editFinancialData (State state) {
      return(
	TitleWidget(
		value: model.model.financial_data,
		caption: 'Financial Data',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.financial_data = val;
		  });
		},
	));}

	  	    Widget editBank (State state) {
	   return(  StringView(
		value: model.model.bank_str,
		caption: 'Bank',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.bank_id,
	  caption: 'Bank',
	  hint: 'pilih Model',
	  required: true,
	  idenum: model.model.bank_id_list,
	  nameenum: model.model.bank_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bank_id = val;
		});
	  },
	));*/
	}

	  	    Widget editBranch (State state) {
      return(
	DisplayNameWidget(
		value: model.model.branch,
		caption: 'Branch',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.branch = val;
		  });
		},
    ));}

	  	    Widget editCity (State state) {
      return(
	DisplayNameWidget(
		value: model.model.city,
		caption: 'City',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.city = val;
		  });
		},
    ));}

	  	    Widget editAccountNumber (State state) {
      return(
	DisplayNameWidget(
		value: model.model.account_number,
		caption: 'Account Number',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.account_number = val;
		  });
		},
    ));}

	  	    Widget editAccountName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.account_name,
		caption: 'Account Name',
		hint: 'Isi dengan Website Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.account_name = val;
		  });
		},
    ));}

   	    Widget editCutOffPeriod (State state) {
      return(
	  EnumWidget(
	  value: model.model.cutoff_period_id,
	  caption: 'Cut-off Period',
	  hint: 'pilih Enum',
	  required: true,
	  idenum: model.model.cutoff_period_list,
	  nameenum: model.model.cutoff_period_list_str,
	  getValue: (int? val) {
	  	;
		state.setState(() {
		  model.model.cutoff_period_id = val;
		});
	  },
	));}

	  	    Widget editCutOffAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.cutoff_amount,
	  caption: 'Cut-off Amount',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min:'9999', 
	  max:'100000000', 
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.cutoff_amount = val;
		});
	  },
	));}

	  	    Widget editDepositAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.deposit_amount,
	  caption: 'Deposit Amount',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min:'50000', 
	  max:'100000000', 
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.deposit_amount = val;
		});
	  },
	));}

	  	    Widget editStatistics (State state) {
      return(
	TitleWidget(
		value: model.model.statistics,
		caption: 'Statistics',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String? val) {
		  state.setState(() {
			model.model.statistics = val;
		  });
		},
	));}

	  	    Widget editMoneyEarned (State state) {
      return(
	MoneyWidget(
	  value: model.model.money_earned,
	  caption: 'Money Earned',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.money_earned = val;
		});
	  },
	));}

	  	    Widget editMoneySpent (State state) {
      return(
	MoneyWidget(
	  value: model.model.money_spent,
	  caption: 'Money Spent',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.money_spent = val;
		});
	  },
	));}

	  	    Widget editAvailableBalance (State state) {
      return(
	MoneyWidget(
	  value: model.model.available_balance,
	  caption: 'Available Balance',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.available_balance = val;
		});
	  },
	));}

	  	    Widget editWithheldBalance (State state) {
      return(
	MoneyWidget(
	  value: model.model.withheld_balance,
	  caption: 'Withheld Balance',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.withheld_balance = val;
		});
	  },
	));}

	  	    Widget editAdminNotes (State state) {
      return(
	new ArticleWidget(
	  value: model.model.admin_notes,
	  caption: 'Admin Notes',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String? val) {
		state.setState(() {
		  model.model.admin_notes = val;
		});
	  },
	));}

	  	    Widget editPestaPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.pesta_point,
	  caption: 'Pesta Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.pesta_point = val;
		});
	  },
	));}

	  	    Widget editWorkerRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.worker_rating,
	  caption: 'Worker Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_rating = val;
		});
	  },
	));}

	  	    Widget editWorkerRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_ranking,
	  caption: 'Worker Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_ranking = val;
		});
	  },
	));}

	  	    Widget editWorkerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_point,
	  caption: 'Worker Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_point = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_rating_num,
	  caption: 'Worker Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.worker_rating_num = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_rating_sum,
	  caption: 'Worker Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_rating_sum = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_rating_div,
	  caption: 'Worker Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_rating_div = val;
		});
	  },
	));}

	  	    Widget editOwnerRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.owner_rating,
	  caption: 'Owner Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_rating = val;
		});
	  },
	));}

	  	    Widget editOwnerRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_ranking,
	  caption: 'Owner Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_ranking = val;
		});
	  },
	));}

	  	    Widget editOwnerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_point,
	  caption: 'Owner Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_point = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_rating_num,
	  caption: 'Owner Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.owner_rating_num = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_rating_sum,
	  caption: 'Owner Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_rating_sum = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_rating_div,
	  caption: 'Owner Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_rating_div = val;
		});
	  },
	));}

	  	    Widget editSellerRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.seller_rating,
	  caption: 'Seller Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.seller_rating = val;
		});
	  },
	));}

	  	    Widget editSellerRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_ranking,
	  caption: 'Seller Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_ranking = val;
		});
	  },
	));}

	  	    Widget editSellerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_point,
	  caption: 'Seller Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_point = val;
		});
	  },
	));}

	  	    Widget editSellerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.seller_rating_num,
	  caption: 'Seller Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.seller_rating_num = val;
		});
	  },
	));}

	  	    Widget editSellerRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_rating_sum,
	  caption: 'Seller Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_rating_sum = val;
		});
	  },
	));}

	  	    Widget editSellerRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_rating_div,
	  caption: 'Seller Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_rating_div = val;
		});
	  },
	));}

	  	    Widget editBuyerRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.buyer_rating,
	  caption: 'Buyer Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.buyer_rating = val;
		});
	  },
	));}

	  	    Widget editBuyerRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.buyer_ranking,
	  caption: 'Buyer Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_ranking = val;
		});
	  },
	));}

	  	    Widget editBuyerPoint (State state) {
      return(
	NumberWidget(
	  value: model.model.buyer_point,
	  caption: 'Buyer Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_point = val;
		});
	  },
	));}

	  	    Widget editBuyerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.buyer_rating_num,
	  caption: 'Buyer Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.buyer_rating_num = val;
		});
	  },
	));}

	  	    Widget editBuyerRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.buyer_rating_sum,
	  caption: 'Buyer Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_rating_sum = val;
		});
	  },
	));}

	  	    Widget editBuyerRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.buyer_rating_div,
	  caption: 'Buyer Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.buyer_rating_div = val;
		});
	  },
	));}

	  	    Widget editAffiliateRating (State state) {
      return(
	new RatingWidget(
	  value: model.model.affiliate_rating,
	  caption: 'Affiliate Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.affiliate_rating = val;
		});
	  },
	));}

	  	    Widget editAffiliateRanking (State state) {
      return(
	NumberWidget(
	  value: model.model.affiliate_ranking,
	  caption: 'Affiliate Ranking',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.affiliate_ranking = val;
		});
	  },
	));}

	  	    Widget editAffiliatePoint (State state) {
      return(
	NumberWidget(
	  value: model.model.affiliate_point,
	  caption: 'Affiliate Point',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.affiliate_point = val;
		});
	  },
	));}

	  	    Widget editAffiliateRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.affiliate_rating_num,
	  caption: 'Affiliate Rating Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.affiliate_rating_num = val;
		});
	  },
	));}

	  	    Widget editAffiliateRatingSum (State state) {
      return(
	NumberWidget(
	  value: model.model.affiliate_rating_sum,
	  caption: 'Affiliate Rating Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.affiliate_rating_sum = val;
		});
	  },
	));}

	  	    Widget editAffiliateRatingDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.affiliate_rating_div,
	  caption: 'Affiliate Rating Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.affiliate_rating_div = val;
		});
	  },
	));}

	  	    Widget editProjectsWon (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_won,
	  caption: 'Projects Won',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_won = val;
		});
	  },
	));}

	  	    Widget editProjectsWonCumulative (State state) {
      return(
	MoneyWidget(
	  value: model.model.projects_won_cumulative,
	  caption: 'Projects Won Cumulative',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.projects_won_cumulative = val;
		});
	  },
	));}

	  	    Widget editProjectsOwned (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_owned,
	  caption: 'Projects Owned',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_owned = val;
		});
	  },
	));}

	  	    Widget editProjectsOwnedCumulative (State state) {
      return(
	MoneyWidget(
	  value: model.model.projects_owned_cumulative,
	  caption: 'Projects Owned Cumulative',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.projects_owned_cumulative = val;
		});
	  },
	));}

	  	    Widget editProjectsNoAction (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_noaction,
	  caption: 'Projects No-Action',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_noaction = val;
		});
	  },
	));}

	  	    Widget editProjectsCanceled (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_canceled,
	  caption: 'Projects Canceled',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_canceled = val;
		});
	  },
	));}

	  	    Widget editMissedPayment (State state) {
      return(
	NumberWidget(
	  value: model.model.missed_payment,
	  caption: 'Missed Payment',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.missed_payment = val;
		});
	  },
	));}

	  	    Widget editProjectsCompleted (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_completed,
	  caption: 'Projects Completed',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_completed = val;
		});
	  },
	));}

	  	    Widget editProjectsArbitrated (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_arbitrated,
	  caption: 'Projects Arbitrated',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_arbitrated = val;
		});
	  },
	));}

	  	    Widget editProjectsWonInArbitration (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_arbit_won,
	  caption: 'Projects Won in Arbitration',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_arbit_won = val;
		});
	  },
	));}

	  	    Widget editProjectsLostInArbitration (State state) {
      return(
	NumberWidget(
	  value: model.model.projects_arbit_lost,
	  caption: 'Projects Lost in Arbitration',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.projects_arbit_lost = val;
		});
	  },
	));}

	  	    Widget editCurrentProjects (State state) {
      return(
	NumberWidget(
	  value: model.model.current_projects,
	  caption: 'Current Projects',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.current_projects = val;
		});
	  },
	));}

	  	    Widget editMissedWeeklyReport (State state) {
      return(
	NumberWidget(
	  value: model.model.missed_weekly_report,
	  caption: 'Missed Weekly Report',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.missed_weekly_report = val;
		});
	  },
	));}

	  	    Widget editProductSold (State state) {
      return(
	NumberWidget(
	  value: model.model.product_sold,
	  caption: 'Product Sold',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_sold = val;
		});
	  },
	));}

	  	    Widget editProductSoldCumulative (State state) {
      return(
	MoneyWidget(
	  value: model.model.product_sold_cumulative,
	  caption: 'Product Sold Cumulative',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.product_sold_cumulative = val;
		});
	  },
	));}

	  	    Widget editProductBought (State state) {
      return(
	NumberWidget(
	  value: model.model.product_bought,
	  caption: 'Product Bought',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_bought = val;
		});
	  },
	));}

	  	    Widget editProductBoughtCumulative (State state) {
      return(
	MoneyWidget(
	  value: model.model.product_bought_cumulative,
	  caption: 'Product Bought Cumulative',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.product_bought_cumulative = val;
		});
	  },
	));}

	  	    Widget editBidCount (State state) {
      return(
	NumberWidget(
	  value: model.model.bid_count,
	  caption: 'Bid Count',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bid_count = val;
		});
	  },
	));}

	  	    Widget editPostCount (State state) {
      return(
	NumberWidget(
	  value: model.model.post_count,
	  caption: 'Post Count',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.post_count = val;
		});
	  },
	));}

	  	    Widget editWorkQuality (State state) {
      return(
	new RatingWidget(
	  value: model.model.work_quality,
	  caption: 'Work Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.work_quality = val;
		});
	  },
	));}

	  	    Widget editWorkQualityNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.work_quality_num,
	  caption: 'Work Quality Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.work_quality_num = val;
		});
	  },
	));}

	  	    Widget editWorkQualitySum (State state) {
      return(
	NumberWidget(
	  value: model.model.work_quality_sum,
	  caption: 'Work Quality Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.work_quality_sum = val;
		});
	  },
	));}

	  	    Widget editWorkQualityDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.work_quality_div,
	  caption: 'Work Quality Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.work_quality_div = val;
		});
	  },
	));}

	  	    Widget editExpertise (State state) {
      return(
	new RatingWidget(
	  value: model.model.expertise,
	  caption: 'Expertise',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.expertise = val;
		});
	  },
	));}

	  	    Widget editExpertiseNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.expertise_num,
	  caption: 'Expertise Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.expertise_num = val;
		});
	  },
	));}

	  	    Widget editExpertiseSum (State state) {
      return(
	NumberWidget(
	  value: model.model.expertise_sum,
	  caption: 'Expertise Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.expertise_sum = val;
		});
	  },
	));}

	  	    Widget editExpertiseDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.expertise_div,
	  caption: 'Expertise Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.expertise_div = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunication (State state) {
      return(
	new RatingWidget(
	  value: model.model.worker_communication,
	  caption: 'Worker Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_communication = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunicationNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_communication_num,
	  caption: 'Worker Communication Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.worker_communication_num = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunicationSum (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_communication_sum,
	  caption: 'Worker Communication Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_communication_sum = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunicationDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_communication_div,
	  caption: 'Worker Communication Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_communication_div = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalism (State state) {
      return(
	new RatingWidget(
	  value: model.model.worker_professionalism,
	  caption: 'Worker Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.worker_professionalism = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalismNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_professionalism_num,
	  caption: 'Worker Professionalism Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.worker_professionalism_num = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalismSum (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_professionalism_sum,
	  caption: 'Worker Professionalism Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_professionalism_sum = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalismDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.worker_professionalism_div,
	  caption: 'Worker Professionalism Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.worker_professionalism_div = val;
		});
	  },
	));}

	  	    Widget editClarity (State state) {
      return(
	new RatingWidget(
	  value: model.model.clarity,
	  caption: 'Clarity',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.clarity = val;
		});
	  },
	));}

	  	    Widget editClarityNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.clarity_num,
	  caption: 'Clarity Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.clarity_num = val;
		});
	  },
	));}

	  	    Widget editClaritySum (State state) {
      return(
	NumberWidget(
	  value: model.model.clarity_sum,
	  caption: 'Clarity Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.clarity_sum = val;
		});
	  },
	));}

	  	    Widget editClarityDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.clarity_div,
	  caption: 'Clarity Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.clarity_div = val;
		});
	  },
	));}

	  	    Widget editFriendliness (State state) {
      return(
	new RatingWidget(
	  value: model.model.friendliness,
	  caption: 'Friendliness',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.friendliness = val;
		});
	  },
	));}

	  	    Widget editFriendlinessNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.friendliness_num,
	  caption: 'Friendliness Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.friendliness_num = val;
		});
	  },
	));}

	  	    Widget editFriendlinessSum (State state) {
      return(
	NumberWidget(
	  value: model.model.friendliness_sum,
	  caption: 'Friendliness Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.friendliness_sum = val;
		});
	  },
	));}

	  	    Widget editFriendlinessDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.friendliness_div,
	  caption: 'Friendliness Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.friendliness_div = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunication (State state) {
      return(
	new RatingWidget(
	  value: model.model.owner_communication,
	  caption: 'Owner Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_communication = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunicationNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_communication_num,
	  caption: 'Owner Communication Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.owner_communication_num = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunicationSum (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_communication_sum,
	  caption: 'Owner Communication Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_communication_sum = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunicationDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_communication_div,
	  caption: 'Owner Communication Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_communication_div = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalism (State state) {
      return(
	new RatingWidget(
	  value: model.model.owner_professionalism,
	  caption: 'Owner Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.owner_professionalism = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalismNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_professionalism_num,
	  caption: 'Owner Professionalism Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.owner_professionalism_num = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalismSum (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_professionalism_sum,
	  caption: 'Owner Professionalism Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_professionalism_sum = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalismDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.owner_professionalism_div,
	  caption: 'Owner Professionalism Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.owner_professionalism_div = val;
		});
	  },
	));}

	  	    Widget editProductQuality (State state) {
      return(
	new RatingWidget(
	  value: model.model.product_quality,
	  caption: 'Product Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.product_quality = val;
		});
	  },
	));}

	  	    Widget editProductQualityNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.product_quality_num,
	  caption: 'Product Quality Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.product_quality_num = val;
		});
	  },
	));}

	  	    Widget editProductQualitySum (State state) {
      return(
	NumberWidget(
	  value: model.model.product_quality_sum,
	  caption: 'Product Quality Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_quality_sum = val;
		});
	  },
	));}

	  	    Widget editProductQualityDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.product_quality_div,
	  caption: 'Product Quality Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.product_quality_div = val;
		});
	  },
	));}

	  	    Widget editServiceQuality (State state) {
      return(
	new RatingWidget(
	  value: model.model.service_quality,
	  caption: 'Service Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.service_quality = val;
		});
	  },
	));}

	  	    Widget editServiceQualityNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.service_quality_num,
	  caption: 'Service Quality Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.service_quality_num = val;
		});
	  },
	));}

	  	    Widget editServiceQualitySum (State state) {
      return(
	NumberWidget(
	  value: model.model.service_quality_sum,
	  caption: 'Service Quality Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_quality_sum = val;
		});
	  },
	));}

	  	    Widget editServiceQualityDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.service_quality_div,
	  caption: 'Service Quality Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.service_quality_div = val;
		});
	  },
	));}

	  	    Widget editSellerCommunication (State state) {
      return(
	new RatingWidget(
	  value: model.model.seller_communication,
	  caption: 'Seller Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.seller_communication = val;
		});
	  },
	));}

	  	    Widget editSellerCommunicationNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.seller_communication_num,
	  caption: 'Seller Communication Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.seller_communication_num = val;
		});
	  },
	));}

	  	    Widget editSellerCommunicationSum (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_communication_sum,
	  caption: 'Seller Communication Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_communication_sum = val;
		});
	  },
	));}

	  	    Widget editSellerCommunicationDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_communication_div,
	  caption: 'Seller Communication Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_communication_div = val;
		});
	  },
	));}

	  	    Widget editSellerProfessionalism (State state) {
      return(
	new RatingWidget(
	  value: model.model.seller_professionalism,
	  caption: 'Seller Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int? val) {
	  
		state.setState(() {
		  model.model.seller_professionalism = val;
		});
	  },
	));}

	  	    Widget editSellerProfessionalismNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.seller_professionalism_num,
	  caption: 'Seller Professionalism Num',
	  hint: 'Isi dengan double? Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.seller_professionalism_num = val;
		});
	  },
	));}

	  	    Widget editSellerProfessionalismSum (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_professionalism_sum,
	  caption: 'Seller Professionalism Sum',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_professionalism_sum = val;
		});
	  },
	));}

	  	    Widget editSellerProfessionalismDiv (State state) {
      return(
	NumberWidget(
	  value: model.model.seller_professionalism_div,
	  caption: 'Seller Professionalism Div',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.seller_professionalism_div = val;
		});
	  },
	));}

	  	    Widget editReferer (State state) {
	   return(  StringView(
		value: model.model.referer_str,
		caption: 'Referer',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.referer_id,
	  caption: 'Referer',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.referer_id_list,
	  nameenum: model.model.referer_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.referer_id = val;
		});
	  },
	));*/
	}

	  	    Widget editRefererExpires (State state) {
      return(
	new DateTimeWidget(
	  value: model.model.referer_expires,
	  caption: 'Referer Expires',
	  hint: 'isi dengan DateTime? diatas.',
	  required: false,
	  getValue:(DateTime? val) {
	  ;
		state.setState(() {
		  model.model.referer_expires = val;
		});
	  },
	));} 

	  	    Widget editReferalThisMonth (State state) {
      return(
	NumberWidget(
	  value: model.model.referal_this_month,
	  caption: 'Referal This Month',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.referal_this_month = val;
		});
	  },
	));}

	  	    Widget editCookiesThisMonth (State state) {
      return(
	NumberWidget(
	  value: model.model.cookies_this_month,
	  caption: 'Cookies This Month',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.cookies_this_month = val;
		});
	  },
	));}

	  	    Widget editPremiumAffiliate (State state) {
      return(
	BooleanWidget(
	  value: model.model.premium_affiliate,
	  caption: 'Premium Affiliate',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.premium_affiliate = val;
		});
	  },
	));} 

	  	    Widget editReferedUsers (State state) {
      return(
	NumberWidget(
	  value: model.model.refered_users,
	  caption: 'Refered Users',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.refered_users = val;
		});
	  },
	));}

	  	    Widget editReferalEarnings (State state) {
      return(
	MoneyWidget(
	  value: model.model.referal_earnings,
	  caption: 'Referal Earnings',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.referal_earnings = val;
		});
	  },
	));}

	  	    Widget editAffiliateId (State state) {
      return(
	NumberWidget(
	  value: model.model.affiliate_id,
	  caption: 'Affiliate ID',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.affiliate_id = val;
		});
	  },
	));}

	  	    Widget editLastAnnouncedProject (State state) {
      return(
	NumberWidget(
	  value: model.model.last_announced_project,
	  caption: 'Last Announced Project',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.last_announced_project = val;
		});
	  },
	));}

	  	    Widget editNotifCount (State state) {
      return(
	NumberWidget(
	  value: model.model.notif_count,
	  caption: 'Notif Count',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.notif_count = val;
		});
	  },
	));}

	  	    Widget editNotifyMeNewProjects (State state) {
      return(
	BooleanWidget(
	  value: model.model.notify_projects,
	  caption: 'Notify Me New Projects',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.notify_projects = val;
		});
	  },
	));} 

	  	    Widget editLostArbitrationRecently (State state) {
      return(
	BooleanWidget(
	  value: model.model.lost_arbitration_recently,
	  caption: 'Lost Arbitration Recently',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.lost_arbitration_recently = val;
		});
	  },
	));} 

	  	    Widget editCoupon (State state) {
      return(
	UsernameWidget(
		value: model.model.coupon,
		caption: 'Coupon',
		hint: 'Isi dengan Username Anda',
		required: true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.coupon = val;
		  });
		}
	));}
	
}


@JsonSerializable()

class MyFinanceSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyFinance? model;
  MyFinanceSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory MyFinanceSuperBase.fromJson(Map<String, dynamic> json) => _$MyFinanceSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MyFinanceSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelMyFinance {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

  double? available_balance;
  String? available_balance_str;
  int? bank_id;
  String? bank_str;
  String? bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_number;
  String? account_name;
  int? cutoff_period_id;
  String? cutoff_period_str;
  List<int?>? cutoff_period_list;
  List<String?>? cutoff_period_list_str;
  double? cutoff_amount;
  String? cutoff_amount_str;
   //CreditHistory credit_history;
   //PaymentHistory payment_history;

	//
	  ViewModelMyFinance(
            this.id,
			this.available_balance,
			this.available_balance_str,
			this.bank_id,
			this.bank_str,
			this.bank_url,
			this.bank_list,
			this.bank_list_str,
			this.branch,
			this.city,
			this.account_number,
			this.account_name,
			this.cutoff_period_id,
			this.cutoff_period_str,
			this.cutoff_period_list,
			this.cutoff_period_list_str,
			this.cutoff_amount,
			this.cutoff_amount_str,

  );

  
   factory ViewModelMyFinance.fromJson(Map<String, dynamic> json) => _$ViewModelMyFinanceFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelMyFinanceToJson(this); 
  
}


class MyFinanceViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	MyFinanceViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewMyFinanceWidget(model.buttons[i],context,  formKey, controller, my_finance,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
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
                        
                        my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = my_finance.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postMyFinanceResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, MyFinanceController my_finance,
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
				children:listButton(context, visible!, formKey, controller, my_finance,
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

	 	  
	   viewChildren!.add(viewAvailableBalance(context)); 
	   viewChildren!.add(viewBank(context)); 
	   viewChildren!.add(viewBranch(context)); 
	   viewChildren!.add(viewCity(context)); 
	   viewChildren!.add(viewAccountNumber(context)); 
	   viewChildren!.add(viewAccountName(context)); 
	   viewChildren!.add(viewCutOffPeriod(context)); 
	   viewChildren!.add(viewCutOffAmount(context)); 
		
		
	  
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

 
		    Widget viewAvailableBalance (BuildContext context) {  			
    if(model.model.available_balance != null){
		return(  MoneyView(
		value: model.model.available_balance,
		caption: 'Available Balance',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Available Balance',
		    ));
	}			
     }
				Widget viewBank (BuildContext context) {  
		return(  ModelView(
			value: model.model.bank_id,
			caption: 'Bank',
			idenum: model.model.bank_list,
			nameenum: model.model.bank_str,
		));} 
		    Widget viewBranch (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.branch,
		caption: 'Branch',
	));}
		    Widget viewCity (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.city,
		caption: 'City',
	));}
		    Widget viewAccountNumber (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.account_number,
		caption: 'Account Number',
	));}
		    Widget viewAccountName (BuildContext context) { 
	return(  DisplayNameView(
		value: model.model.account_name,
		caption: 'Account Name',
	));}
	    Widget viewCutOffPeriod (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.cutoff_period_id,
			caption: 'Cut-off Period',
			idenum: model.model.cutoff_period_list,
			nameenum: model.model.cutoff_period_str,
		));} 
		    Widget viewCutOffAmount (BuildContext context) {  			
    if(model.model.cutoff_amount != null){
		return(  MoneyView(
		value: model.model.cutoff_amount,
		caption: 'Cut-off Amount',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Cut-off Amount',
		    ));
	}			
     }
  
}


@JsonSerializable()
class MyFinanceViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyFinance? model;
  List<Credit?>? credits;
  List<Payment?>? payments;
  MyFinanceViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
	  this.credits,
      this.payments,	  
      );
  	


        
      
      factory MyFinanceViewSuperBase.fromJson(Map<String, dynamic> json) => _$MyFinanceViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$MyFinanceViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class MyFinanceListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	MyFinanceListingBase(this.json){
		items = MyFinanceListingItems.fromJson(this.json);
		tools = MyFinanceListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemMyFinanceModel item,String? search, bool?account) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyFinanceCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemMyFinanceModel item,String? search, int? index, bool?account, String? id) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyFinanceCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemMyFinanceModel item,String? search, int? index, bool?account) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyFinanceCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemMyFinanceModel item,ItemMyFinanceModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyFinanceCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemMyFinanceModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
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
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
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
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
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
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyFinanceCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonMyFinanceWidget(tools.buttons[i],context, account));
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





class MyFinanceListingItems{
  List<ItemMyFinanceModel?>? items;
  MyFinanceListingItems(
      this.items,
      );

  factory MyFinanceListingItems.fromJson(Map<String, dynamic> json) {
  	return MyFinanceListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemMyFinanceModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class MyFinanceListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemMyFinance?>? items;
	MyFinanceListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory MyFinanceListingTools.fromJson(Map<String, dynamic> json) => _$MyFinanceListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$MyFinanceListingToolsToJson(this);

}




class ItemMyFinanceCard extends StatelessWidget {
  const ItemMyFinanceCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyFinanceModel? destination;
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
                child: ItemMyFinanceContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMyFinanceContent extends StatelessWidget {
  const ItemMyFinanceContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemMyFinanceModel? destination;

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
		  buttonChildren!.add(itemMyFinanceButton(destination,i , context));
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
	   children!.add(destination!.viewGroup(context)); 
	   children!.add(destination!.viewEmail(context)); 
	   children!.add(destination!.viewPassword(context)); 
	   children!.add(destination!.viewAuth(context)); 
	   children!.add(destination!.viewAccountStatus(context)); 
	   children!.add(destination!.viewAccountType(context)); 
	   children!.add(destination!.viewDateRegistered(context)); 
	   children!.add(destination!.viewLastLogin(context)); 
	   children!.add(destination!.viewLastSeen(context)); 
	   children!.add(destination!.viewOnline(context)); 
	   children!.add(destination!.viewLastOnlineMark(context)); 
	   children!.add(destination!.viewOnlineHours(context)); 
	   children!.add(destination!.viewNomorKtp(context)); 
	   children!.add(destination!.viewScanKtp(context)); 
	   children!.add(destination!.viewNomorSiup(context)); 
	   children!.add(destination!.viewScanSiup(context)); 
	   children!.add(destination!.viewNpwp(context)); 
	   children!.add(destination!.viewStatusMarital(context)); 
	   children!.add(destination!.viewJumlahTanggungan(context)); 
	   children!.add(destination!.viewPhoto(context)); 
	   children!.add(destination!.viewDisplayName(context)); 
	   children!.add(destination!.viewBirthDate(context)); 
	   children!.add(destination!.viewBirthCode(context)); 
	   children!.add(destination!.viewJenisKelamin(context)); 
	   children!.add(destination!.viewAddress(context)); 
	   children!.add(destination!.viewCountry(context)); 
	   children!.add(destination!.viewProvinsi(context)); 
	   children!.add(destination!.viewKabupaten(context)); 
	   children!.add(destination!.viewKecamatan(context)); 
	   children!.add(destination!.viewKelurahan(context)); 
	   children!.add(destination!.viewPostCode(context)); 
	   children!.add(destination!.viewHandphone(context)); 
	   children!.add(destination!.viewSelfIntroduction(context)); 
	   children!.add(destination!.viewWebsite(context)); 
	   children!.add(destination!.viewLanguage(context)); 
	   children!.add(destination!.viewSkills(context)); 
	   children!.add(destination!.viewBank(context)); 
	   children!.add(destination!.viewBranch(context)); 
	   children!.add(destination!.viewCity(context)); 
	   children!.add(destination!.viewAccountNumber(context)); 
	   children!.add(destination!.viewAccountName(context)); 
	   children!.add(destination!.viewCutOffPeriod(context)); 
	   children!.add(destination!.viewCutOffAmount(context)); 
	   children!.add(destination!.viewDepositAmount(context)); 
	   children!.add(destination!.viewMoneyEarned(context)); 
	   children!.add(destination!.viewMoneySpent(context)); 
	   children!.add(destination!.viewAvailableBalance(context)); 
	   children!.add(destination!.viewWithheldBalance(context)); 
	   children!.add(destination!.viewAdminNotes(context)); 
	   children!.add(destination!.viewPestaPoint(context)); 
	   children!.add(destination!.viewWorkerRating(context)); 
	   children!.add(destination!.viewWorkerRanking(context)); 
	   children!.add(destination!.viewWorkerPoint(context)); 
	   children!.add(destination!.viewWorkerRatingNum(context)); 
	   children!.add(destination!.viewWorkerRatingSum(context)); 
	   children!.add(destination!.viewWorkerRatingDiv(context)); 
	   children!.add(destination!.viewOwnerRating(context)); 
	   children!.add(destination!.viewOwnerRanking(context)); 
	   children!.add(destination!.viewOwnerPoint(context)); 
	   children!.add(destination!.viewOwnerRatingNum(context)); 
	   children!.add(destination!.viewOwnerRatingSum(context)); 
	   children!.add(destination!.viewOwnerRatingDiv(context)); 
	   children!.add(destination!.viewSellerRating(context)); 
	   children!.add(destination!.viewSellerRanking(context)); 
	   children!.add(destination!.viewSellerPoint(context)); 
	   children!.add(destination!.viewSellerRatingNum(context)); 
	   children!.add(destination!.viewSellerRatingSum(context)); 
	   children!.add(destination!.viewSellerRatingDiv(context)); 
	   children!.add(destination!.viewBuyerRating(context)); 
	   children!.add(destination!.viewBuyerRanking(context)); 
	   children!.add(destination!.viewBuyerPoint(context)); 
	   children!.add(destination!.viewBuyerRatingNum(context)); 
	   children!.add(destination!.viewBuyerRatingSum(context)); 
	   children!.add(destination!.viewBuyerRatingDiv(context)); 
	   children!.add(destination!.viewAffiliateRating(context)); 
	   children!.add(destination!.viewAffiliateRanking(context)); 
	   children!.add(destination!.viewAffiliatePoint(context)); 
	   children!.add(destination!.viewAffiliateRatingNum(context)); 
	   children!.add(destination!.viewAffiliateRatingSum(context)); 
	   children!.add(destination!.viewAffiliateRatingDiv(context)); 
	   children!.add(destination!.viewProjectsWon(context)); 
	   children!.add(destination!.viewProjectsWonCumulative(context)); 
	   children!.add(destination!.viewProjectsOwned(context)); 
	   children!.add(destination!.viewProjectsOwnedCumulative(context)); 
	   children!.add(destination!.viewProjectsNoAction(context)); 
	   children!.add(destination!.viewProjectsCanceled(context)); 
	   children!.add(destination!.viewMissedPayment(context)); 
	   children!.add(destination!.viewProjectsCompleted(context)); 
	   children!.add(destination!.viewProjectsArbitrated(context)); 
	   children!.add(destination!.viewProjectsWonInArbitration(context)); 
	   children!.add(destination!.viewProjectsLostInArbitration(context)); 
	   children!.add(destination!.viewCurrentProjects(context)); 
	   children!.add(destination!.viewMissedWeeklyReport(context)); 
	   children!.add(destination!.viewProductSold(context)); 
	   children!.add(destination!.viewProductSoldCumulative(context)); 
	   children!.add(destination!.viewProductBought(context)); 
	   children!.add(destination!.viewProductBoughtCumulative(context)); 
	   children!.add(destination!.viewBidCount(context)); 
	   children!.add(destination!.viewPostCount(context)); 
	   children!.add(destination!.viewWorkQuality(context)); 
	   children!.add(destination!.viewWorkQualityNum(context)); 
	   children!.add(destination!.viewWorkQualitySum(context)); 
	   children!.add(destination!.viewWorkQualityDiv(context)); 
	   children!.add(destination!.viewExpertise(context)); 
	   children!.add(destination!.viewExpertiseNum(context)); 
	   children!.add(destination!.viewExpertiseSum(context)); 
	   children!.add(destination!.viewExpertiseDiv(context)); 
	   children!.add(destination!.viewWorkerCommunication(context)); 
	   children!.add(destination!.viewWorkerCommunicationNum(context)); 
	   children!.add(destination!.viewWorkerCommunicationSum(context)); 
	   children!.add(destination!.viewWorkerCommunicationDiv(context)); 
	   children!.add(destination!.viewWorkerProfessionalism(context)); 
	   children!.add(destination!.viewWorkerProfessionalismNum(context)); 
	   children!.add(destination!.viewWorkerProfessionalismSum(context)); 
	   children!.add(destination!.viewWorkerProfessionalismDiv(context)); 
	   children!.add(destination!.viewClarity(context)); 
	   children!.add(destination!.viewClarityNum(context)); 
	   children!.add(destination!.viewClaritySum(context)); 
	   children!.add(destination!.viewClarityDiv(context)); 
	   children!.add(destination!.viewFriendliness(context)); 
	   children!.add(destination!.viewFriendlinessNum(context)); 
	   children!.add(destination!.viewFriendlinessSum(context)); 
	   children!.add(destination!.viewFriendlinessDiv(context)); 
	   children!.add(destination!.viewOwnerCommunication(context)); 
	   children!.add(destination!.viewOwnerCommunicationNum(context)); 
	   children!.add(destination!.viewOwnerCommunicationSum(context)); 
	   children!.add(destination!.viewOwnerCommunicationDiv(context)); 
	   children!.add(destination!.viewOwnerProfessionalism(context)); 
	   children!.add(destination!.viewOwnerProfessionalismNum(context)); 
	   children!.add(destination!.viewOwnerProfessionalismSum(context)); 
	   children!.add(destination!.viewOwnerProfessionalismDiv(context)); 
	   children!.add(destination!.viewProductQuality(context)); 
	   children!.add(destination!.viewProductQualityNum(context)); 
	   children!.add(destination!.viewProductQualitySum(context)); 
	   children!.add(destination!.viewProductQualityDiv(context)); 
	   children!.add(destination!.viewServiceQuality(context)); 
	   children!.add(destination!.viewServiceQualityNum(context)); 
	   children!.add(destination!.viewServiceQualitySum(context)); 
	   children!.add(destination!.viewServiceQualityDiv(context)); 
	   children!.add(destination!.viewSellerCommunication(context)); 
	   children!.add(destination!.viewSellerCommunicationNum(context)); 
	   children!.add(destination!.viewSellerCommunicationSum(context)); 
	   children!.add(destination!.viewSellerCommunicationDiv(context)); 
	   children!.add(destination!.viewSellerProfessionalism(context)); 
	   children!.add(destination!.viewSellerProfessionalismNum(context)); 
	   children!.add(destination!.viewSellerProfessionalismSum(context)); 
	   children!.add(destination!.viewSellerProfessionalismDiv(context)); 
	   children!.add(destination!.viewReferer(context)); 
	   children!.add(destination!.viewRefererExpires(context)); 
	   children!.add(destination!.viewReferalThisMonth(context)); 
	   children!.add(destination!.viewCookiesThisMonth(context)); 
	   children!.add(destination!.viewPremiumAffiliate(context)); 
	   children!.add(destination!.viewReferedUsers(context)); 
	   children!.add(destination!.viewReferalEarnings(context)); 
	   children!.add(destination!.viewAffiliateId(context)); 
	   children!.add(destination!.viewLastAnnouncedProject(context)); 
	   children!.add(destination!.viewNotifCount(context)); 
	   children!.add(destination!.viewNotifyMeNewProjects(context)); 
	   children!.add(destination!.viewLostArbitrationRecently(context)); 
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

Widget itemMyFinanceButton(ItemMyFinanceModel? destination, int? index, BuildContext context){
  MyFinanceController my_finance; 
  
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
                        
                        my_finance = new  MyFinanceController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = my_finance.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postMyFinanceResult = value;
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



class ItemMyFinanceWidget extends StatelessWidget {

	final ItemMyFinanceModel?  item;
	final String? search;
	const  ItemMyFinanceWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonMyFinanceWidget(Button button, BuildContext context, bool?account){
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






  






  

