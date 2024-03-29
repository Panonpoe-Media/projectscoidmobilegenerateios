

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
import 'checkout_item.dart';
import 'checkout_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/Checkout/action.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'checkout_base.g.dart';



@JsonSerializable()

class ModelActionPayWithAvailableBalanceCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;
	  double? available_balance;
	  String? available_balance_str;

	
	  ModelActionPayWithAvailableBalanceCheckout(
            this.id,
			this.user_id,
        this.user_name,
				this.available_balance,
				this.available_balance_str,

  );
    factory ModelActionPayWithAvailableBalanceCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithAvailableBalanceCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithAvailableBalanceCheckoutToJson(this);

}



class PayWithAvailableBalanceCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithAvailableBalanceCheckoutBase(this.json){
		model = PayWithAvailableBalanceCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithAvailableBalance(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithAvailableBalanceCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithAvailableBalanceCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithAvailableBalanceCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithAvailableBalance(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithAvailableBalance')){
										checkout.deleteAllPayWithAvailableBalanceCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithAvailableBalanceCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithAvailableBalanceCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithAvailableBalanceCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithAvailableBalance';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithAvailableBalanceResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithAvailableBalanceResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithAvailableBalanceResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithAvailableBalanceResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithAvailableBalanceResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithAvailableBalanceResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithAvailableBalanceResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithAvailableBalanceResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithAvailableBalanceResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
										Widget viewAvailableBalance (BuildContext context) {  
								return(  MoneyView(
									value: model.model.available_balance,
									caption: 'Available Balance',
								));}
 	

}


@JsonSerializable()
class PayWithAvailableBalanceCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithAvailableBalanceCheckout? model;
  PayWithAvailableBalanceCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithAvailableBalanceCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithAvailableBalanceCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithAvailableBalanceCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayViaBankTransferCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;
	  String? display_name;
	  String? handphone;
	  String? npwp;

	
	  ModelActionPayViaBankTransferCheckout(
            this.id,
			this.user_id,
        this.user_name,
        this.display_name,
        this.handphone,
        this.npwp,

  );
    factory ModelActionPayViaBankTransferCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayViaBankTransferCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayViaBankTransferCheckoutToJson(this);

}



class PayViaBankTransferCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayViaBankTransferCheckoutBase(this.json){
		model = PayViaBankTransferCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayViaBankTransfer(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayViaBankTransferCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayViaBankTransferCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayViaBankTransferCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayViaBankTransfer(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayViaBankTransfer')){
										checkout.deleteAllPayViaBankTransferCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayViaBankTransferCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayViaBankTransferCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayViaBankTransferCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayViaBankTransfer';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayViaBankTransferResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayViaBankTransferResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayViaBankTransferResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayViaBankTransferResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayViaBankTransferResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayViaBankTransferResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayViaBankTransferResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayViaBankTransferResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayViaBankTransferResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
										Widget viewDisplayName (BuildContext context) { 
							    if(model.model.display_name == null || model.model.display_name == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.display_name,
									caption: 'Display Name',
								));
								}			
								
								}
										Widget viewHandphone (BuildContext context) { 
								return(  HandphoneView(
									value: model.model.handphone,
									caption: 'Handphone',
								));}
										Widget viewNpwp (BuildContext context) { 
							    if(model.model.npwp == null || model.model.npwp == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.npwp,
									caption: 'NPWP',
								));
								}			
								
								}
 	

}


@JsonSerializable()
class PayViaBankTransferCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayViaBankTransferCheckout? model;
  PayViaBankTransferCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayViaBankTransferCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayViaBankTransferCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayViaBankTransferCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithCreditCardCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithCreditCardCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithCreditCardCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithCreditCardCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithCreditCardCheckoutToJson(this);

}



class PayWithCreditCardCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithCreditCardCheckoutBase(this.json){
		model = PayWithCreditCardCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithCreditCard(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithCreditCardCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithCreditCardCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithCreditCardCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithCreditCard(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithCreditCard')){
										checkout.deleteAllPayWithCreditCardCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithCreditCardCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithCreditCardCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithCreditCardCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithCreditCard';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithCreditCardResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithCreditCardResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCreditCardResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithCreditCardResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCreditCardResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCreditCardResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithCreditCardResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCreditCardResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithCreditCardResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithCreditCardCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithCreditCardCheckout? model;
  PayWithCreditCardCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithCreditCardCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithCreditCardCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithCreditCardCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithCimbClicksCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithCimbClicksCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithCimbClicksCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithCimbClicksCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithCimbClicksCheckoutToJson(this);

}



class PayWithCimbClicksCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithCimbClicksCheckoutBase(this.json){
		model = PayWithCimbClicksCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithCimbClicks(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithCimbClicksCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithCimbClicksCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithCimbClicksCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithCimbClicks(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithCimbClicks')){
										checkout.deleteAllPayWithCimbClicksCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithCimbClicksCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithCimbClicksCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithCimbClicksCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithCimbClicks';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithCimbClicksResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithCimbClicksResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCimbClicksResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithCimbClicksResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCimbClicksResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCimbClicksResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithCimbClicksResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithCimbClicksResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithCimbClicksResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithCimbClicksCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithCimbClicksCheckout? model;
  PayWithCimbClicksCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithCimbClicksCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithCimbClicksCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithCimbClicksCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithBcaKlikpayCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithBcaKlikpayCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithBcaKlikpayCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithBcaKlikpayCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithBcaKlikpayCheckoutToJson(this);

}



class PayWithBcaKlikpayCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithBcaKlikpayCheckoutBase(this.json){
		model = PayWithBcaKlikpayCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithBcaKlikpay(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithBcaKlikpayCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithBcaKlikpayCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithBcaKlikpayCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithBcaKlikpay(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithBcaKlikpay')){
										checkout.deleteAllPayWithBcaKlikpayCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithBcaKlikpayCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithBcaKlikpayCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithBcaKlikpayCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithBcaKlikpay';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithBcaKlikpayResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithBcaKlikpayResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithBcaKlikpayResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithBcaKlikpayResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithBcaKlikpayResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithBcaKlikpayResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithBcaKlikpayResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithBcaKlikpayResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithBcaKlikpayResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithBcaKlikpayCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithBcaKlikpayCheckout? model;
  PayWithBcaKlikpayCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithBcaKlikpayCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithBcaKlikpayCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithBcaKlikpayCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithMandiriClickpayCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithMandiriClickpayCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithMandiriClickpayCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithMandiriClickpayCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithMandiriClickpayCheckoutToJson(this);

}



class PayWithMandiriClickpayCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithMandiriClickpayCheckoutBase(this.json){
		model = PayWithMandiriClickpayCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithMandiriClickpay(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithMandiriClickpayCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithMandiriClickpayCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithMandiriClickpayCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithMandiriClickpay(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithMandiriClickpay')){
										checkout.deleteAllPayWithMandiriClickpayCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithMandiriClickpayCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithMandiriClickpayCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithMandiriClickpayCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithMandiriClickpay';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithMandiriClickpayResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithMandiriClickpayResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithMandiriClickpayResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithMandiriClickpayResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithMandiriClickpayResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithMandiriClickpayResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithMandiriClickpayResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithMandiriClickpayResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithMandiriClickpayResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithMandiriClickpayCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithMandiriClickpayCheckout? model;
  PayWithMandiriClickpayCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithMandiriClickpayCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithMandiriClickpayCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithMandiriClickpayCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithQrisCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithQrisCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithQrisCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithQrisCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithQrisCheckoutToJson(this);

}



class PayWithQrisCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithQrisCheckoutBase(this.json){
		model = PayWithQrisCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithQris(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithQrisCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithQrisCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithQrisCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithQris(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithQris')){
										checkout.deleteAllPayWithQrisCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithQrisCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithQrisCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithQrisCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithQris';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithQrisResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithQrisResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithQrisResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithQrisResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithQrisResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithQrisResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithQrisResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithQrisResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithQrisResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithQrisCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithQrisCheckout? model;
  PayWithQrisCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithQrisCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithQrisCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithQrisCheckoutSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionPayWithPaypalCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

String? user_id;
	  String? user_name;

	
	  ModelActionPayWithPaypalCheckout(
            this.id,
			this.user_id,
        this.user_name,

  );
    factory ModelActionPayWithPaypalCheckout.fromJson(Map<String, dynamic> json) => _$ModelActionPayWithPaypalCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPayWithPaypalCheckoutToJson(this);

}



class PayWithPaypalCheckoutBase{
	var model;
	Map<String, dynamic> json;
	PayWithPaypalCheckoutBase(this.json){
		model = PayWithPaypalCheckoutSuperBase.fromJson(this.json);
	}


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


Widget RButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                      var formData = await convertFormDataPayWithPaypal(button!.text!, model
                     					  );
                                  checkout = new CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithPaypalCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithPaypalCheckoutWithID();
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
                                  postCheckoutResult = value;
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
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
					  	  
                      });
                      }else{
                      final future = checkout.postPayWithPaypalCheckout();
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
                                  postCheckoutResult = value;
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
					   
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
									
									   
									   
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
									  

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{

                                       _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                    }


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

SpeedDialChild  ButtonActionCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                       var formData = await convertFormDataPayWithPaypal(button!.text!, model
                     					  );
                                  checkout = new  CheckoutController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.project_title);
										}else if(['AskOwner'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PayWithPaypal')){
										checkout.deleteAllPayWithPaypalCheckout(this.model.model.user_id);
										}else{
										checkout.deleteAllPayWithPaypalCheckout('');
										}
                      if(sendPath!.contains('%s')){
                      final future = checkout.postPayWithPaypalCheckoutWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = checkout.postPayWithPaypalCheckout();
                                  future.then((value) {
                                  state.setState(() {
                                  postCheckoutResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.UserCheckoutListing(id :  id!)),
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
  
   String? action =   'PayWithPaypal';
   bool?isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String? tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "user[_trigger_]":"$tgr",
	  
  };  


    return( formData);
  } 	
   List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,

 var postPayWithPaypalResult, State state, String? sendPath, String? id,  String? title){
    final List<Widget>buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
	         buttonChildren!.add(RButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithPaypalResult, state, sendPath, id,  title));

	   
	  }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithPaypalResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonActionCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postPayWithPaypalResult, state, sendPath, id,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithPaypalResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
	Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithPaypalResult, State state, String? sendPath, String? id,  String? title ){
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
		   RlistButton(context, formKey,controller,checkout, postPayWithPaypalResult, state, sendPath, id,  title )
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postPayWithPaypalResult, State state, String? sendPath, String? id,  String? title ){
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
				children: listButton(context, formKey,controller,checkout, postPayWithPaypalResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewUserName (BuildContext context) {  
								return(  UsernameView(
									value: model.model.user_name,
									caption: 'User Name',
								));}
 	

}


@JsonSerializable()
class PayWithPaypalCheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPayWithPaypalCheckout? model;
  PayWithPaypalCheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PayWithPaypalCheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$PayWithPaypalCheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PayWithPaypalCheckoutSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? user_id;
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

	
	  ModelCheckout(
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
    factory ModelCheckout.fromJson(Map<String, dynamic> json) => _$ModelCheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$ModelCheckoutToJson(this);

}




class CheckoutBase{
	var model;
	Map<String, dynamic> json;
	CheckoutBase(this.json){
		model = CheckoutSuperBase.fromJson(this.json);
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
      "checkout[_trigger_]":"",
   "checkout[user_id]": "${model.model.user_id }",
  "checkout[user_name]": "${model.model.user_name }",
  "checkout[group_id]": "${model.model.group_id }",
  "checkout[email]": "${model.model.email }",
  "checkout[password]": "${model.model.password }",
  "checkout[password_confirmation]": "${model.model.password }",
  "checkout[auth]": "${model.model.auth }",
   "checkout[account_status_id]": "${model.model.account_status_id}",
   "checkout[account_type_id]": "${model.model.account_type_id}",
  "checkout[date_registered]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date_registered)}",
  "checkout[last_login]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_login)}",
  "checkout[last_seen]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_seen)}",
  "checkout[online]": "${model.model.online ? 1 : 0}",
  "checkout[last_online_mark]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_online_mark)}",
  "checkout[online_hours]": "${model.model.online_hours}",
  "checkout[nomor_ktp]": "${model.model.nomor_ktp }",
  "checkout[scan_ktp]": '$scan_ktp',
  "checkout[scan_ktp_lastval]": '{"name":"${model.model.scan_ktp.name}","dir":"${model.model.scan_ktp.dir}","file":"${model.model.scan_ktp.file}","thumb":"${model.model.scan_ktp.thumb}"}',
  "checkout[nomor_siup]": "${model.model.nomor_siup }",
  "checkout[scan_siup]": '$scan_siup',
  "checkout[scan_siup_lastval]": '{"name":"${model.model.scan_siup.name}","dir":"${model.model.scan_siup.dir}","file":"${model.model.scan_siup.file}","thumb":"${model.model.scan_siup.thumb}"}',
  "checkout[npwp]": "${model.model.npwp }",
   "checkout[status_marital_id]": "${model.model.status_marital_id}",
  "checkout[jumlah_tanggungan]": "${model.model.jumlah_tanggungan }",
  "checkout[personal_data]": "${model.model.personal_data }",
  "checkout[photo]": '$photo',
  "checkout[photo_lastval]": '{"name":"${model.model.photo.name}","dir":"${model.model.photo.dir}","file":"${model.model.photo.file}","thumb":"${model.model.photo.thumb}"}',
  "checkout[display_name]": "${model.model.display_name }",
  "checkout[birth_date]": "${DateFormat('dd/MM/yyyy').format(model.model.birth_date)}",
  "checkout[birth_code]": "${model.model.birth_code }",
   "checkout[jenis_kelamin_id]": "${model.model.jenis_kelamin_id}",
  "checkout[address]": "${model.model.address }",
  "checkout[country_id]": "${model.model.country_id }",
  "checkout[provinsi_id]": "${model.model.provinsi_id }",
  "checkout[kabupaten_id]": "${model.model.kabupaten_id }",
  "checkout[kecamatan_id]": "${model.model.kecamatan_id }",
  "checkout[kelurahan_id]": "${model.model.kelurahan_id }",
  "checkout[post_code]": "${model.model.post_code }",
  "checkout[handphone]": "${model.model.handphone }",
  "checkout[self_introduction]": "${model.model.self_introduction }",
  "checkout[website]": "${model.model.website }",
  "checkout[language_id]": "${model.model.language_id }",
  "checkout[full_name]": "${model.model.full_name }",
  "checkout[captcha]": "${model.model.captcha }",
  "checkout[secure_code]": "${model.model.secure_code }",
  "checkout[old_password]": "${model.model.old_password }",
  "checkout[old_password_confirmation]": "${model.model.old_password }",
  "checkout[new_email]": "${model.model.new_email }",
  "checkout[your_email]": "${model.model.your_email }",
  "checkout[invitation_message]": "${model.model.invitation_message }",
  "checkout[financial_data]": "${model.model.financial_data }",
  "checkout[bank_id]": "${model.model.bank_id }",
  "checkout[branch]": "${model.model.branch }",
  "checkout[city]": "${model.model.city }",
  "checkout[account_number]": "${model.model.account_number }",
  "checkout[account_name]": "${model.model.account_name }",
   "checkout[cutoff_period_id]": "${model.model.cutoff_period_id}",
  "checkout[cutoff_amount]": "${model.model.cutoff_amount}",
  "checkout[deposit_amount]": "${model.model.deposit_amount}",
  "checkout[statistics]": "${model.model.statistics }",
  "checkout[money_earned]": "${model.model.money_earned}",
  "checkout[money_spent]": "${model.model.money_spent}",
  "checkout[available_balance]": "${model.model.available_balance}",
  "checkout[withheld_balance]": "${model.model.withheld_balance}",
  "checkout[admin_notes]": "${model.model.admin_notes }",
  "checkout[pesta_point]": "${model.model.pesta_point }",
  "checkout[worker_rating]": "${model.model.worker_rating }",
  "checkout[worker_ranking]": "${model.model.worker_ranking }",
  "checkout[worker_point]": "${model.model.worker_point }",
  "checkout[worker_rating_num]": "${model.model.worker_rating_num}",
  "checkout[worker_rating_sum]": "${model.model.worker_rating_sum }",
  "checkout[worker_rating_div]": "${model.model.worker_rating_div }",
  "checkout[owner_rating]": "${model.model.owner_rating }",
  "checkout[owner_ranking]": "${model.model.owner_ranking }",
  "checkout[owner_point]": "${model.model.owner_point }",
  "checkout[owner_rating_num]": "${model.model.owner_rating_num}",
  "checkout[owner_rating_sum]": "${model.model.owner_rating_sum }",
  "checkout[owner_rating_div]": "${model.model.owner_rating_div }",
  "checkout[seller_rating]": "${model.model.seller_rating }",
  "checkout[seller_ranking]": "${model.model.seller_ranking }",
  "checkout[seller_point]": "${model.model.seller_point }",
  "checkout[seller_rating_num]": "${model.model.seller_rating_num}",
  "checkout[seller_rating_sum]": "${model.model.seller_rating_sum }",
  "checkout[seller_rating_div]": "${model.model.seller_rating_div }",
  "checkout[buyer_rating]": "${model.model.buyer_rating }",
  "checkout[buyer_ranking]": "${model.model.buyer_ranking }",
  "checkout[buyer_point]": "${model.model.buyer_point }",
  "checkout[buyer_rating_num]": "${model.model.buyer_rating_num}",
  "checkout[buyer_rating_sum]": "${model.model.buyer_rating_sum }",
  "checkout[buyer_rating_div]": "${model.model.buyer_rating_div }",
  "checkout[affiliate_rating]": "${model.model.affiliate_rating }",
  "checkout[affiliate_ranking]": "${model.model.affiliate_ranking }",
  "checkout[affiliate_point]": "${model.model.affiliate_point }",
  "checkout[affiliate_rating_num]": "${model.model.affiliate_rating_num}",
  "checkout[affiliate_rating_sum]": "${model.model.affiliate_rating_sum }",
  "checkout[affiliate_rating_div]": "${model.model.affiliate_rating_div }",
  "checkout[projects_won]": "${model.model.projects_won }",
  "checkout[projects_won_cumulative]": "${model.model.projects_won_cumulative}",
  "checkout[projects_owned]": "${model.model.projects_owned }",
  "checkout[projects_owned_cumulative]": "${model.model.projects_owned_cumulative}",
  "checkout[projects_noaction]": "${model.model.projects_noaction }",
  "checkout[projects_canceled]": "${model.model.projects_canceled }",
  "checkout[missed_payment]": "${model.model.missed_payment }",
  "checkout[projects_completed]": "${model.model.projects_completed }",
  "checkout[projects_arbitrated]": "${model.model.projects_arbitrated }",
  "checkout[projects_arbit_won]": "${model.model.projects_arbit_won }",
  "checkout[projects_arbit_lost]": "${model.model.projects_arbit_lost }",
  "checkout[current_projects]": "${model.model.current_projects }",
  "checkout[missed_weekly_report]": "${model.model.missed_weekly_report }",
  "checkout[product_sold]": "${model.model.product_sold }",
  "checkout[product_sold_cumulative]": "${model.model.product_sold_cumulative}",
  "checkout[product_bought]": "${model.model.product_bought }",
  "checkout[product_bought_cumulative]": "${model.model.product_bought_cumulative}",
  "checkout[bid_count]": "${model.model.bid_count }",
  "checkout[post_count]": "${model.model.post_count }",
  "checkout[work_quality]": "${model.model.work_quality }",
  "checkout[work_quality_num]": "${model.model.work_quality_num}",
  "checkout[work_quality_sum]": "${model.model.work_quality_sum }",
  "checkout[work_quality_div]": "${model.model.work_quality_div }",
  "checkout[expertise]": "${model.model.expertise }",
  "checkout[expertise_num]": "${model.model.expertise_num}",
  "checkout[expertise_sum]": "${model.model.expertise_sum }",
  "checkout[expertise_div]": "${model.model.expertise_div }",
  "checkout[worker_communication]": "${model.model.worker_communication }",
  "checkout[worker_communication_num]": "${model.model.worker_communication_num}",
  "checkout[worker_communication_sum]": "${model.model.worker_communication_sum }",
  "checkout[worker_communication_div]": "${model.model.worker_communication_div }",
  "checkout[worker_professionalism]": "${model.model.worker_professionalism }",
  "checkout[worker_professionalism_num]": "${model.model.worker_professionalism_num}",
  "checkout[worker_professionalism_sum]": "${model.model.worker_professionalism_sum }",
  "checkout[worker_professionalism_div]": "${model.model.worker_professionalism_div }",
  "checkout[clarity]": "${model.model.clarity }",
  "checkout[clarity_num]": "${model.model.clarity_num}",
  "checkout[clarity_sum]": "${model.model.clarity_sum }",
  "checkout[clarity_div]": "${model.model.clarity_div }",
  "checkout[friendliness]": "${model.model.friendliness }",
  "checkout[friendliness_num]": "${model.model.friendliness_num}",
  "checkout[friendliness_sum]": "${model.model.friendliness_sum }",
  "checkout[friendliness_div]": "${model.model.friendliness_div }",
  "checkout[owner_communication]": "${model.model.owner_communication }",
  "checkout[owner_communication_num]": "${model.model.owner_communication_num}",
  "checkout[owner_communication_sum]": "${model.model.owner_communication_sum }",
  "checkout[owner_communication_div]": "${model.model.owner_communication_div }",
  "checkout[owner_professionalism]": "${model.model.owner_professionalism }",
  "checkout[owner_professionalism_num]": "${model.model.owner_professionalism_num}",
  "checkout[owner_professionalism_sum]": "${model.model.owner_professionalism_sum }",
  "checkout[owner_professionalism_div]": "${model.model.owner_professionalism_div }",
  "checkout[product_quality]": "${model.model.product_quality }",
  "checkout[product_quality_num]": "${model.model.product_quality_num}",
  "checkout[product_quality_sum]": "${model.model.product_quality_sum }",
  "checkout[product_quality_div]": "${model.model.product_quality_div }",
  "checkout[service_quality]": "${model.model.service_quality }",
  "checkout[service_quality_num]": "${model.model.service_quality_num}",
  "checkout[service_quality_sum]": "${model.model.service_quality_sum }",
  "checkout[service_quality_div]": "${model.model.service_quality_div }",
  "checkout[seller_communication]": "${model.model.seller_communication }",
  "checkout[seller_communication_num]": "${model.model.seller_communication_num}",
  "checkout[seller_communication_sum]": "${model.model.seller_communication_sum }",
  "checkout[seller_communication_div]": "${model.model.seller_communication_div }",
  "checkout[seller_professionalism]": "${model.model.seller_professionalism }",
  "checkout[seller_professionalism_num]": "${model.model.seller_professionalism_num}",
  "checkout[seller_professionalism_sum]": "${model.model.seller_professionalism_sum }",
  "checkout[seller_professionalism_div]": "${model.model.seller_professionalism_div }",
  "checkout[referer_id]": "${model.model.referer_id }",
  "checkout[referer_expires]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.referer_expires)}",
  "checkout[referal_this_month]": "${model.model.referal_this_month }",
  "checkout[cookies_this_month]": "${model.model.cookies_this_month }",
  "checkout[premium_affiliate]": "${model.model.premium_affiliate ? 1 : 0}",
  "checkout[refered_users]": "${model.model.refered_users }",
  "checkout[referal_earnings]": "${model.model.referal_earnings}",
  "checkout[affiliate_id]": "${model.model.affiliate_id }",
  "checkout[last_announced_project]": "${model.model.last_announced_project }",
  "checkout[notif_count]": "${model.model.notif_count }",
  "checkout[notify_projects]": "${model.model.notify_projects ? 1 : 0}",
  "checkout[lost_arbitration_recently]": "${model.model.lost_arbitration_recently ? 1 : 0}",
  "checkout[coupon]": "${model.model.coupon }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.skills_id){
        formData.addAll({"checkout[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
  var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren!.add(ButtonEditCheckoutWidget(model.buttons[i], context,formKey, controller,checkout, postCheckoutResult, state, sendPath, id,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
  var postCheckoutResult, State state, String? sendPath, String? id,  String? title ){
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
				children:listButton(context, formKey,controller,checkout, postCheckoutResult, state, sendPath!, id!,  title! )
	    )
	 );
   } 

SpeedDialChild ButtonEditCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
 var postCheckoutResult, State state, String? sendPath, String? id,  String? title){
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
                        checkout = new  CheckoutController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id,
                        title,
                        formData,
						false);
                        final future = checkout.postCheckout();
                        future.then((value) {
                        state.setState(() {
                        postCheckoutResult = value;
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

class CheckoutSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelCheckout? model;
  CheckoutSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory CheckoutSuperBase.fromJson(Map<String, dynamic> json) => _$CheckoutSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelCheckout {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  

   //CheckoutItems checkout_items;

	//
	  ViewModelCheckout(
            this.id,

  );

  
   factory ViewModelCheckout.fromJson(Map<String, dynamic> json) => _$ViewModelCheckoutFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelCheckoutToJson(this); 
  
}


class CheckoutViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	CheckoutViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
    State state, String? sendPath, String? id,  String? title, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren!.add(ButtonViewCheckoutWidget(model.buttons[i],context,  formKey, controller, checkout,
                                    state, sendPath, id,  title, account!));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewCheckoutWidget(Button button, BuildContext context,var formKey, ScrollController controller, CheckoutController checkout,
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
                        
                        checkout = new  CheckoutController(AppProvider.getApplication(context),
                        sendPath! + button!.url!,
                        AppAction.post,
                        id,
                        title,
                        null,
						false);
                        final future = checkout.downloadFile();
                        future.then((value) {
                        state.setState(() {
                       // postCheckoutResult = value;
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
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, CheckoutController checkout,
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
				children:listButton(context, visible!, formKey, controller, checkout,
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

 
  
}


@JsonSerializable()
class CheckoutViewSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelCheckout? model;
  CheckoutViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory CheckoutViewSuperBase.fromJson(Map<String, dynamic> json) => _$CheckoutViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$CheckoutViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class CheckoutListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	CheckoutListingBase(this.json){
		items = CheckoutListingItems.fromJson(this.json);
		tools = CheckoutListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemCheckoutModel item,String? search, bool?account) {
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
        child:  ItemCheckoutCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
  Widget viewItemId(ItemCheckoutModel item,String? search, int? index, bool?account, String? id) {
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
        child:  ItemCheckoutCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	  Widget viewItemIndex (ItemCheckoutModel item,String? search, int? index, bool?account) {
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
        child:  ItemCheckoutCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
	
Widget viewItem1 (ItemCheckoutModel item,ItemCheckoutModel item1, String? search, BuildContext context,bool?account, String? id , bool?isMax, int? max, int? index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemCheckoutCard(destination :item, search : search!, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemCheckoutModel item,String? search, int? index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
        child:  ItemCheckoutCard(destination :item, search : search!, shape : shape!, height : height!)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren!.add(ListButtonCheckoutWidget(tools.buttons[i],context, account));
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





class CheckoutListingItems{
  List<ItemCheckoutModel?>? items;
  CheckoutListingItems(
      this.items,
      );

  factory CheckoutListingItems.fromJson(Map<String, dynamic> json) {
  	return CheckoutListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemCheckoutModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class CheckoutListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemCheckout?>? items;
	CheckoutListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory CheckoutListingTools.fromJson(Map<String, dynamic> json) => _$CheckoutListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$CheckoutListingToolsToJson(this);

}




class ItemCheckoutCard extends StatelessWidget {
  const ItemCheckoutCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemCheckoutModel? destination;
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
                child: ItemCheckoutContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCheckoutContent extends StatelessWidget {
  const ItemCheckoutContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemCheckoutModel? destination;

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
		  buttonChildren!.add(itemCheckoutButton(destination,i , context));
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

Widget itemCheckoutButton(ItemCheckoutModel? destination, int? index, BuildContext context){
  CheckoutController checkout; 
  
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
                        
                        checkout = new  CheckoutController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = checkout.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postCheckoutResult = value;
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



class ItemCheckoutWidget extends StatelessWidget {

	final ItemCheckoutModel?  item;
	final String? search;
	const  ItemCheckoutWidget({Key? key, @required this.item, this.search}) : super(key: key);


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


SpeedDialChild ListButtonCheckoutWidget(Button button, BuildContext context, bool?account){
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






  






  

