

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
import 'browse_projects_item.dart';
import 'browse_projects_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/BrowseProjects/action.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer' as l;
import 'package:shared_preferences/shared_preferences.dart';
part 'browse_projects_base.g.dart';




/** AUTOGENERATE OFF **/

@JsonSerializable()

class ModelActionPlaceNewBidBrowseProjects {
  int? age;
  int? cnt;
  int? page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;

String?project_id;
	  String?project_title;
	  String?project_owner;
	  String?description;
	  String?published_budget;
  double? amount;
  String?message;
   String?attachments_url;
  String?attachments_name;
  List<FileField?>? attachments;
  String?captcha;

	
	  ModelActionPlaceNewBidBrowseProjects(
            this.id,
			this.project_id,
        this.project_title,
        this.project_owner,
        this.description,
        this.published_budget,
			this.amount,
			this.message,
			this.attachments,
			this.attachments_url,
			this.attachments_name,
			this.captcha,

  );
    factory ModelActionPlaceNewBidBrowseProjects.fromJson(Map<String, dynamic> json) => _$ModelActionPlaceNewBidBrowseProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionPlaceNewBidBrowseProjectsToJson(this);

}



class PlaceNewBidBrowseProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	PlaceNewBidBrowseProjectsBase(this.json){
		model = PlaceNewBidBrowseProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
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

Widget RButtonActionBrowseProjectsWidget(RewardedAd? _rewardedAd,bool? _isRewardedAdReady,Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataPlaceNewBid(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects = BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllPlaceNewBidBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postPlaceNewBidBrowseProjectsWithID();
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
                                    l.log('validhaloooooooooooo1$value');

                                     */
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error)async {
                        // AppProvider.getRouter(context)!.pop(context);
                                   // l.log('errorhaloooooooooooo1${Error.toString()}');

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


                      //  print('haloooooooooooo1');
                        if (Error.toString().contains('302')) {
                          if(_isRewardedAdReady!){
                            state.setState(() {
                              _isRewardedAdReady = false;
                            });
                            _rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
                              // Reward the user for watching an ad.
                            });
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                rt.UserMyBidsListing(id: id!)),
                                (Route<dynamic> route) => false,
                          );


                          /*
                          var myurl = '****l';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => rt.ShowConversationMyBids(id : id!, title : '20000000', id1: myurl, cb: null)),
                          );

                           */
                        } else if (Error.toString().contains('429')) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                rt.LoginLinkView(id: id!,
                                  title: 'Anda Terkena Pembatasan Limit',)),
                                (Route<dynamic> route) => false,
                          );
                        } else {
                          if(Error.toString().contains('Timeout')){
                            _onWidgetDidBuild(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Silahkan cek koneksi Anda, mungkin terjadi gangguan.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });
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
                       //   print('haloooooooooooo');
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
                      }else{
                      final future = browse_projects.postPlaceNewBidBrowseProjects();
                                  future.then((value) {
                                    /*
                                    l.log('validhaloooooooooooo1$value');
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
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
                                 //   l.log('errorhaloooooooooooo11');
                                 //   l.log('haloooooooooooo1${Error.toString()}');
                                    if(Error.toString().contains('302')){
                                     Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
                                        (Route<dynamic> route) => false,
                                      );

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{
                                    //    print('haloooooooooooo');
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
                                 //   print('haloooooooooooo hanya di sini');
                                  }
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                                initvalue: button.selections![0]);
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
                       var formData = await convertFormDataPlaceNewBid(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PlaceNewBid')){
										browse_projects.deleteAllPlaceNewBidBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllPlaceNewBidBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postPlaceNewBidBrowseProjectsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = browse_projects.postPlaceNewBidBrowseProjects();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
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

	
   Map<String, dynamic> convertFormDataAction(var data, String?triger){
  
   String?action =   'PlaceNewBid';
   bool?isEdit = action.contains(RegExp(r'edit', caseSensitive: false));    
	String?attachments = '';
  String?attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
      String?tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[amount]": "${model.model.amount }",
  "project[message]": "${model.model.message }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',
  "project[captcha]": "${model.model.captcha }",
	  
  };  


    return( formData);
  } 	
	
  List<Widget> RlistButton(RewardedAd? _rewardedAd,bool? _isRewardedAdReady,BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postPlaceNewBidResult, State state, String?sendPath, String?id,  String?title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionBrowseProjectsWidget(_rewardedAd, _isRewardedAdReady, model.buttons[i], context,formKey, controller,browse_projects, postPlaceNewBidResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postPlaceNewBidResult, State state, String?sendPath, String?id,  String?title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postPlaceNewBidResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postPlaceNewBidResult, State state, String?sendPath, String?id,  String?title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(RewardedAd? _rewardedAd,bool? _isRewardedAdReady,BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postPlaceNewBidResult, State state, String?sendPath, String?id,  String?title ){
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
           RlistButton(_rewardedAd, _isRewardedAdReady, context, formKey,controller,browse_projects, postPlaceNewBidResult, state, sendPath, id!,  title )
	    
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postPlaceNewBidResult, State state, String?sendPath, String?id,  String?title ){
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
				children: listButton(context, formKey,controller,browse_projects, postPlaceNewBidResult, state, sendPath, id!,  title )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewProjectTitle (BuildContext context) {  
								return(  TitleView(
									value: model.model.project_title,
									caption: 'Project Title',
								));}
										Widget viewProjectOwner (BuildContext context) { 
							    if(model.model.project_owner == null || model.model.project_owner == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.project_owner,
									caption: 'Project Owner',
								));
								}			
								
								}
										Widget viewDescription (BuildContext context) { 
							    if(model.model.description == null || model.model.description == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.description,
									caption: 'Description',
								));
								}			
								
								}
										Widget viewPublishedBudget (BuildContext context) { 
							    if(model.model.published_budget == null || model.model.published_budget == ''){
								return(  Container());
								}else{
								return(  DisplayNameView(
									value: model.model.published_budget,
									caption: 'Published Budget',
								));
								}			
								
								}
										Widget editAmount (State state) {

                var mxx;
	              if(model.model.published_budget.contains('-')){
                  var mx = double.tryParse(model.model.published_budget.split('-')[1].replaceAll(',', '').replaceAll(' ', ''))! * 3;
                  // print('mantap ${mx.toString()}');
                  mxx = mx.toString().replaceAll('.0','');
                }else{
                  var mx = double.tryParse(model.model.published_budget.replaceAll('Rp', '' ).replaceAll(',', '').replaceAll(' ', ''))! * 3;
                  // print('mantap ${mx.toString()}');
                  mxx = mx.toString().replaceAll('.0','');
                }

								  return(
								MoneyWidget(
								  value: model.model.amount,
								  caption: 'Amount',
								  hint: 'Isi dengan Money Anda',
								  required: true,
								  min: '0',
								  max: mxx,//'1000000000',
								  getValue: (double? val) {
									state.setState(() {
									  model.model.amount = val;
									});
								  },
								));}
										Widget editMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));} 
										Widget editCaptcha (State state) {
								  return(
								CaptchaWidget(
								  value: model.model.captcha,
								  caption: 'Captcha',
								  hint: '',
								  required: true,
								  getValue:(String?val) {
									state.setState(() {
									  model.model.captcha = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class PlaceNewBidBrowseProjectsSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionPlaceNewBidBrowseProjects? model;
  PlaceNewBidBrowseProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory PlaceNewBidBrowseProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$PlaceNewBidBrowseProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceNewBidBrowseProjectsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionAskOwnerBrowseProjects {
  int? age;
  int? cnt;
  int? page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;

String?bid_id;
	  int?  project_id;
	  String?project_str;
	  String?project_url;
	  List<int?>? project_list;
	  List<String?>? project_list_str;
  String?message;
   String?attachments_url;
  String?attachments_name;
  List<FileField?>? attachments;
  String?captcha;

	
	  ModelActionAskOwnerBrowseProjects(
            this.id,
			this.bid_id,
				this.project_id,
				this.project_str,
				this.project_url,
				this.project_list,
				this.project_list_str,
			this.message,
			this.attachments,
			this.attachments_url,
			this.attachments_name,
			this.captcha,

  );
    factory ModelActionAskOwnerBrowseProjects.fromJson(Map<String, dynamic> json) => _$ModelActionAskOwnerBrowseProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionAskOwnerBrowseProjectsToJson(this);

}



class AskOwnerBrowseProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	AskOwnerBrowseProjectsBase(this.json){
		model = AskOwnerBrowseProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



Widget RButtonActionBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataAskOwner(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects = BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllAskOwnerBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postAskOwnerBrowseProjectsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = browse_projects.postAskOwnerBrowseProjects();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{


                                    }


                      });
                      }
                                

                                  } else {}
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                                initvalue: button.selections![0]);
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
                       var formData = await convertFormDataAskOwner(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AskOwner')){
										browse_projects.deleteAllAskOwnerBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllAskOwnerBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postAskOwnerBrowseProjectsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = browse_projects.postAskOwnerBrowseProjects();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
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

	
   Map<String, dynamic> convertFormDataAction(var data, String?triger){
  
   String?action =   'AskOwner';
   bool?isEdit = action.contains(RegExp(r'edit', caseSensitive: false));    
	String?attachments = '';
  String?attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
      String?tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[message]": "${model.model.message }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',
  "project[captcha]": "${model.model.captcha }",
	  
  };  


    return( formData);
  } 	
	
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postAskOwnerResult, State state, String?sendPath, String?id,  String?title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postAskOwnerResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postAskOwnerResult, State state, String?sendPath, String?id,  String?title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postAskOwnerResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postAskOwnerResult, State state, String?sendPath, String?id,  String?title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(  BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postAskOwnerResult, State state, String?sendPath, String?id,  String?title ){
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
           RlistButton(context, formKey,controller,browse_projects, postAskOwnerResult, state, sendPath, id!,  title )
	    
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postAskOwnerResult, State state, String?sendPath, String?id,  String?title ){
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
				children: listButton(context, formKey,controller,browse_projects, postAskOwnerResult, state, sendPath, id!,  title )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget viewProject (BuildContext context) {  
								return(  
								   StringView(
									value: model.model.project_str,
									caption: 'Project',
								));
								 } 
										Widget editMessage (State state) {
								  return(
								ArticleWidget(
								  value: model.model.message,
								  caption: 'Message',
								  hint: 'isi dengan Article Anda',
								  required: true,
								  getValue:(String?val) {
									state.setState(() {
									  model.model.message = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));} 
										Widget editCaptcha (State state) {
								  return(
								CaptchaWidget(
								  value: model.model.captcha,
								  caption: 'Captcha',
								  hint: '',
								  required: true,
								  getValue:(String?val) {
									state.setState(() {
									  model.model.captcha = val;
									});
								  },
								));}
 	

}


@JsonSerializable()
class AskOwnerBrowseProjectsSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionAskOwnerBrowseProjects? model;
  AskOwnerBrowseProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory AskOwnerBrowseProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$AskOwnerBrowseProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$AskOwnerBrowseProjectsSuperBaseToJson(this);
  
 
}

@JsonSerializable()

class ModelActionGuestCreateProjectBrowseProjects {
  int? age;
  int? cnt;
  int? page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;

String?project_id;
  String?pick_user_name;
  String?enter_email_address;
  String?handphone;
  String?title;
  String?description;
   String?attachments_url;
  String?attachments_name;
  List<FileField?>? attachments;
  int?  finish_days;
   String?budget_range;
   double? budget_range_min;
   String?budget_range_min_str;
   double? budget_range_max;
   String?budget_range_max_str;
   String?budget_range_str;

  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  List<int?>? channels_list;
  List<String?>? channels_list_str;


	
	  ModelActionGuestCreateProjectBrowseProjects(
            this.id,
			this.project_id,
			this.pick_user_name,
			this.enter_email_address,
			this.handphone,
			this.title,
			this.description,
			this.attachments,
			this.attachments_url,
			this.attachments_name,
			this.finish_days,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,

  );
    factory ModelActionGuestCreateProjectBrowseProjects.fromJson(Map<String, dynamic> json) => _$ModelActionGuestCreateProjectBrowseProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelActionGuestCreateProjectBrowseProjectsToJson(this);

}



class GuestCreateProjectBrowseProjectsBase{
	var model;
	Map<String, dynamic> json;
            var attachmentslast ;   
	GuestCreateProjectBrowseProjectsBase(this.json){
		model = GuestCreateProjectBrowseProjectsSuperBase.fromJson(this.json);
       if (model.model.attachments!= null) {
            attachmentslast  = FileField(model.model.attachments[0].status, model.model.attachments[0].name, model.model.attachments[0].size, model.model.attachments[0].created, 
            model.model.attachments[0].modified, model.model.attachments[0].temp, model.model.attachments[0].remote, model.model.attachments[0].dir, model.model.attachments[0].date ) ;
       }
	}



Widget RButtonActionBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                

             // color : Color(0xFF037f51),
              onPressed: () async{
                                controller.animateTo(controller.position.minScrollExtent,
                                  duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                  if (formKey.currentState.validate()) {
								  
                                  //Map<String, dynamic> res = model.toJson();
                                  //print('json result == $res');
                      var formData = await convertFormDataGuestCreateProject(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects = BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					  	if([ 'PlaceNewBid'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.project_id.toString());
									    }else if(['HireMe'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.private_worker_id.toString());
										}else if(['InviteToBid'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllGuestCreateProjectBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postGuestCreateProjectBrowseProjectsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
					 
						  
						  
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
                      });
                      }else{
                      final future = browse_projects.postGuestCreateProjectBrowseProjects();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){
                       // AppProvider.getRouter(context)!.pop(context);	
							        
                                   if(Error.toString().contains('302')){
                                     Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );

                                    }else if(Error.toString().contains('429')){
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                            (Route<dynamic> route) => false,
                                      );
                                    }else{


                                    }


                      });
                      }
                                

                                  } else {}
                            }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild  ButtonActionBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                                initvalue: button.selections![0]);
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
                       var formData = await convertFormDataGuestCreateProject(button!.text!, model
											,  attachmentslast   
                     					  );
                                  browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                                  sendPath,
                                  AppAction.post,
                                  id!,
                                  title,
                                  formData,
                      false);
					   	if([ 'PlaceNewBid'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.project_title);
										}else if(['AskOwner'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.project_id.toString());
										}else if(['HireMe'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('GuestCreateProject')){
										browse_projects.deleteAllGuestCreateProjectBrowseProjects(this.model.model.user_id!);
										}else{
										browse_projects.deleteAllGuestCreateProjectBrowseProjects('');
										}
                      if(sendPath!.contains('%s')){
                      final future = browse_projects.postGuestCreateProjectBrowseProjectsWithID();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){   
                        //AppProvider.getRouter(context)!.pop(context);	
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
											(Route<dynamic> route) => false,
									  );
							 
                      });
                      }else{
                      final future = browse_projects.postGuestCreateProjectBrowseProjects();
                                  future.then((value) {
                                  state.setState(() {
                                  postBrowseProjectsResult = value;
                                  });
                                  }).catchError((Error){ 
                         // AppProvider.getRouter(context)!.pop(context);
							   
									 Navigator.pushAndRemoveUntil(
										context,
										MaterialPageRoute(builder: (context) => rt.PublicBrowseProjectsListing(id :  id!)),
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

	
   Map<String, dynamic> convertFormDataAction(var data, String?triger){
  
   String?action =   'GuestCreateProject';
   bool?isEdit = action.contains(RegExp(r'edit', caseSensitive: false));    
	String?attachments = '';
  String?attachments_last = '';
   if(isEdit && attachmentslast != null){
         attachments_last = '[{"name":"${ attachmentslast.name}","size":${ attachmentslast.size.toString()},"created":${ attachmentslast.created.toString()},"modified":${ attachmentslast.modified.toString()},"temp":"${ attachmentslast.temp}","remote":"","dir":"${ attachmentslast.dir}"}]';

       }
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
	     
  	}
	}
      String?tgr = triger!.toLowerCase().replaceAll(' ', '_');
      var formData = {
      "project[_trigger_]":"$tgr",
  "project[pick_user_name]": "${model.model.pick_user_name }",
  "project[enter_email_address]": "${model.model.enter_email_address }",
  "project[handphone]": "${model.model.handphone }",
  "project[title]": "${model.model.title }",
  "project[description]": "${model.model.description }",
  "project[attachments]": '$attachments',
  "project[attachments_lastval]": '$attachments_last',
  "project[finish_days]": "${model.model.finish_days }",
 "project[budget_range_min]": "${model.model.budget_range_min }",
  "project[budget_range_max]": "${model.model.budget_range_max }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.channels_id!){
        formData.addAll({"project[channels][selection][$count]": "$tag"});
        count++;
      }


    return( formData);
  } 	
	
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postGuestCreateProjectResult, State state, String?sendPath, String?id,  String?title){
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postGuestCreateProjectResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 

   List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postGuestCreateProjectResult, State state, String?sendPath, String?id,  String?title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonActionBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postGuestCreateProjectResult, state, sendPath, id!,  title));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  
   
   
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postGuestCreateProjectResult, State state, String?sendPath, String?id,  String?title, bool?isLoading ) {
     return(Container(height: 0.0, width: 0.0)
	 );
  }
   
    Widget	 RButtons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postGuestCreateProjectResult, State state, String?sendPath, String?id,  String?title ){
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
           RlistButton(context, formKey,controller,browse_projects, postGuestCreateProjectResult, state, sendPath, id!,  title )
	    
            )
        )
    );
   
   } 

 SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postGuestCreateProjectResult, State state, String?sendPath, String?id,  String?title ){
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
				children: listButton(context, formKey,controller,browse_projects, postGuestCreateProjectResult, state, sendPath, id!,  title )
	    )
	 );
   } 
		
   
   
   
   
   
										Widget editPickUserName (State state) {
								  return(
								UsernameWidget(
									value: model.model.pick_user_name,
									caption: 'Pick User Name',
									hint: 'Isi dengan Username Anda',
									required: true,
									getValue: (String?val) {
									  state.setState(() {
										model.model.pick_user_name = val;
									  });
									}
								));}
										Widget editEnterEmailAddress (State state) {
								  return(
								 EmailWidget(
									value: model.model.enter_email_address,
									caption: 'Enter Email Address',
									hint: 'Isi dengan Email Anda',
									required: true,
									getValue: (String?val) {
									  state.setState(() {
										model.model.enter_email_address = val;
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
									getValue: (String?val) {
									  state.setState(() {
										model.model.handphone = val;
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
									getValue: (String?val) {
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
								  getValue:(String?val) {
									state.setState(() {
									  model.model.description = val;
									});
								  },
								));}
										Widget editAttachments (State state) {
								  return(
								FileWidget(
									value: model.model.attachments,
									caption: 'Attachments(IF ANY)',
									hint: 'Isi dengan File Anda',
									required: false,
									getValue: (var val) {
									  state.setState(() {
										model.model.attachments = val;
									  });
									},
								));} 
										Widget editFinishDays (State state) {
								  return(
								NumberWidget(
								  value: model.model.finish_days,
								  caption: 'Finish Days',
								  hint: 'Isi dengan Number Anda',
								  required: true,
								  min: '0',
								  max: '100000',
								  getValue: (int? val) {
									state.setState(() {
									  model.model.finish_days = val;
									});
								  },
								));}
										Widget editBudgetRange (State state) {
								  return(   
									RangeWidget( 
									  value: model.model.budget_range,
									  valuemin: model.model.budget_range_min,
									  valuemax: model.model.budget_range_max,
									  caption: 'Range Budget',
									  hint: 'Isi dengan Range penawaran Anda',
									  required:true,
									 min: '0',
									 max: '100000000000',

									  getValue1: (double? val) {
										state.setState(() {
										  model.model.budget_range_min = val;
										});
									  },
									  getValue2: (double? val) {
										state.setState(() {
										  model.model.budget_range_max = val;
										});
									  },
									  getValue: (String?val) {
										state.setState(() {
										  model.model.budget_range = val;
										});
									  },
									)
								  );}  
										Widget editChannels (State state) {
								  return(
								
								InlineTagsWidget(
								  value: model.model.channels_id,
								  caption: 'Channels',
								  hint: ' ',
								  required: true,
								  idtags: model.model.channels_list,
								  nametags: model.model.channels_list_str,
								  getValue: (List<int?>? val) {
								  model.model.channels_id.clear();
									state.setState(() {
									  model.model.channels_id.addAll(val);
									});
								  },
								  removeValue: (int? val) {
									state.setState(() {
									  model.model.channels_id.remove(val);
									});
								  },
								));}


 	

}


@JsonSerializable()
class GuestCreateProjectBrowseProjectsSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ModelActionGuestCreateProjectBrowseProjects? model;
  GuestCreateProjectBrowseProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	

  factory GuestCreateProjectBrowseProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$GuestCreateProjectBrowseProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$GuestCreateProjectBrowseProjectsSuperBaseToJson(this);
  
 
}






@JsonSerializable()

class ModelBrowseProjects {
  int? age;
  int? cnt;
  int? page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;

  String?project_id;
  int?  owner_id;
  String?owner_url;
  String?owner_str;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  List<int?>? channels_list;
  List<String?>? channels_list_str;

  String?project_owner;
  int?  category_id;
  String?category_url;
  String?category_str;
  List<int?>? category_list;
  List<String?>? category_list_str;
  String?title;
  String?description;
  String?short_description;
  String?attachments_name;
  List<FileField?>? attachments;
  int?  finish_days;
  String?finish_days_str;
  String?search_text;
  DateTime?  last_bump;
  DateTime?  select_deadline;
  DateTime?  start_date;
  DateTime?  finish_deadline;
  DateTime?  finish_date;
  DateTime?  closed_date;
  int?  bid_count;
  String?bid_count_str;
  int?  progress;
  int?  project_status_id;
  String?project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int?  project_ending_id;
  String?project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  int?  project_type_id;
  String?project_type_str;
  List<int?>? project_type_list;
  List<String?>? project_type_list_str;
  int?  project_class_id;
  String?project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  double? published_budget;
  String?published_budget_str;
   String?budget_range;
   double? budget_range_min;
   String?budget_range_min_str;
   double? budget_range_max;
   String?budget_range_max_str;
   String?budget_range_str;
  int?  fee_percent;
  String?fee_percent_str;
  int?  service_id;
  String?service_url;
  String?service_str;
  List<int?>? service_list;
  List<String?>? service_list_str;
  int?  private_worker_id;
  String?private_worker_url;
  String?private_worker_str;
  List<int?>? private_worker_list;
  List<String?>? private_worker_list_str;
  String?invited_users;
  int?  accepted_bid_id;
  String?accepted_bid_url;
  String?accepted_bid_str;
  List<int?>? accepted_bid_list;
  List<String?>? accepted_bid_list_str;
  int?  accepted_worker_id;
  String?accepted_worker_url;
  String?accepted_worker_str;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  double? accepted_budget;
  String?accepted_budget_str;
  int?  accepted_work_id;
  String?accepted_work_url;
  String?accepted_work_str;
  List<int?>? accepted_work_list;
  List<String?>? accepted_work_list_str;
  DateTime?  accepted_date;
  double? available_budget;
  String?available_budget_str;
  bool?need_weekly_report;
  bool?weekly_report_needed;
  bool?weekly_report_posted;
  bool?deadline_passed_sent;
  bool?deadline_approaching_sent;
  String?rating_for_worker;
  int?  work_quality;
  int?  expertise;
  int?  worker_communication;
  int?  worker_professionalism;
  int?  worker_rating;
  double? worker_rating_num;
  String?worker_rating_num_str;
  String?worker_feedback;
  String?rating_for_owner;
  int?  clarity;
  int?  friendliness;
  int?  owner_communication;
  int?  owner_professionalism;
  int?  owner_rating;
  double? owner_rating_num;
  String?owner_rating_num_str;
  String?owner_feedback;
  String?owner_signature_ip;
  DateTime?  owner_signature_date;
  String?worker_signature_ip;
  DateTime?  worker_signature_date;
  int?  owner_escrow_id;
  String?owner_escrow_url;
  String?owner_escrow_str;
  List<int?>? owner_escrow_list;
  List<String?>? owner_escrow_list_str;
  int?  worker_credit_id;
  String?worker_credit_url;
  String?worker_credit_str;
  List<int?>? worker_credit_list;
  List<String?>? worker_credit_list_str;
  int?  arbitration_id;
  String?arbitration_url;
  String?arbitration_str;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  int?  owner_credit_id;
  String?owner_credit_url;
  String?owner_credit_str;
  List<int?>? owner_credit_list;
  List<String?>? owner_credit_list_str;
  int?  registered_by_id;
  String?registered_by_url;
  String?registered_by_str;
  List<int?>? registered_by_list;
  List<String?>? registered_by_list_str;
  DateTime?  registered_date;
  String?registered_from_ip;
  int?  canceled_by_id;
  String?canceled_by_url;
  String?canceled_by_str;
  List<int?>? canceled_by_list;
  List<String?>? canceled_by_list_str;
  DateTime?  canceled_date;
  String?canceled_from_ip;
  int?  published_by_id;
  String?published_by_url;
  String?published_by_str;
  List<int?>? published_by_list;
  List<String?>? published_by_list_str;
  DateTime?  published_date;
  String?published_from_ip;
  int?  rejected_by_id;
  String?rejected_by_url;
  String?rejected_by_str;
  List<int?>? rejected_by_list;
  List<String?>? rejected_by_list_str;
  DateTime?  rejected_date;
  String?rejected_from_ip;
  String?admin_note;
  bool?announced;
  String?your_wishes;
  int?  extend_deadline_days;
  String?extend_deadline_days_str;
  String?testimony;
  String?pick_user_name;
  String?enter_email_address;
  String?handphone;
  String?broadcast_message;
  String?attach_file_name;
  List<FileField?>? attach_file;
  bool?automatic_send_to_new_bidder;
  bool?is_system_message;
  String?admin_notes;

	
	  ModelBrowseProjects(
            this.id,
            this.project_id,
			this.owner_id,
			this.owner_str,
			this.owner_list,
			this.owner_list_str,
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.channels_list,
			this.channels_list_str,
			this.category_id,
			this.category_str,
			this.category_list,
			this.category_list_str,
			this.attachments,
			this.attachments_name,
			this.finish_days,
			this.finish_days_str,
			this.bid_count,
			this.bid_count_str,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.project_ending_id,
			this.project_ending_str,
			this.project_ending_list,
			this.project_ending_list_str,
			this.project_type_id,
			this.project_type_str,
			this.project_type_list,
			this.project_type_list_str,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
			this.published_budget,
			this.published_budget_str,
			this.budget_range,
			this.budget_range_min,
			this.budget_range_min_str,
			this.budget_range_max,
			this.budget_range_max_str,
      this.budget_range_str,
			this.fee_percent,
			this.fee_percent_str,
			this.service_id,
			this.service_str,
			this.service_list,
			this.service_list_str,
			this.private_worker_id,
			this.private_worker_str,
			this.private_worker_list,
			this.private_worker_list_str,
			this.accepted_bid_id,
			this.accepted_bid_str,
			this.accepted_bid_list,
			this.accepted_bid_list_str,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.accepted_work_id,
			this.accepted_work_str,
			this.accepted_work_list,
			this.accepted_work_list_str,
			this.available_budget,
			this.available_budget_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_escrow_id,
			this.owner_escrow_str,
			this.owner_escrow_list,
			this.owner_escrow_list_str,
			this.worker_credit_id,
			this.worker_credit_str,
			this.worker_credit_list,
			this.worker_credit_list_str,
			this.arbitration_id,
			this.arbitration_str,
			this.arbitration_list,
			this.arbitration_list_str,
			this.owner_credit_id,
			this.owner_credit_str,
			this.owner_credit_list,
			this.owner_credit_list_str,
			this.registered_by_id,
			this.registered_by_str,
			this.registered_by_list,
			this.registered_by_list_str,
			this.canceled_by_id,
			this.canceled_by_str,
			this.canceled_by_list,
			this.canceled_by_list_str,
			this.published_by_id,
			this.published_by_str,
			this.published_by_list,
			this.published_by_list_str,
			this.rejected_by_id,
			this.rejected_by_str,
			this.rejected_by_list,
			this.rejected_by_list_str,
			this.extend_deadline_days,
			this.extend_deadline_days_str,
			this.attach_file,
			this.attach_file_name,

  );
    factory ModelBrowseProjects.fromJson(Map<String, dynamic> json) => _$ModelBrowseProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelBrowseProjectsToJson(this);

}




class BrowseProjectsBase{
	var model;
	Map<String, dynamic> json;
	BrowseProjectsBase(this.json){
		model = BrowseProjectsSuperBase.fromJson(this.json);
			
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
   

		

   
	String?attachments = '';
	if (model.model.attachments!= null) {
		if (model.model.attachments[0].temp != '') {
			attachments = '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size},"created":${model.model.attachments[0].date},"modified":${model.model.attachments[0].date},"temp":"${model.model.attachments[0].temp}","remote":"${model.model.attachments[0].remote}","dir":"${model.model.attachments[0].dir}"}]';
		}
	}
	String?attach_file = '';
	if (model.model.attach_file!= null) {
		if (model.model.attach_file[0].temp != '') {
			attach_file = '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size},"created":${model.model.attach_file[0].date},"modified":${model.model.attach_file[0].date},"temp":"${model.model.attach_file[0].temp}","remote":"${model.model.attach_file[0].remote}","dir":"${model.model.attach_file[0].dir}"}]';
		}
	}
   
   
      var formData = {
      "browse_projects[_trigger_]":"",
   "browse_projects[project_id]": "${model.model.project_id }",
  "browse_projects[owner_id]": "${model.model.owner_id }",
  "browse_projects[project_owner]": "${model.model.project_owner }",
  "browse_projects[category_id]": "${model.model.category_id }",
  "browse_projects[title]": "${model.model.title }",
  "browse_projects[description]": "${model.model.description }",
  "browse_projects[short_description]": "${model.model.short_description }",
  "browse_projects[attachments]": '$attachments',
  "browse_projects[attachments_lastval]": '[{"name":"${model.model.attachments[0].name}","size":${model.model.attachments[0].size.toString()},"created":${model.model.attachments[0].date.toString()},"modified":${model.model.attachments[0].date.toString()},"temp":"${model.model.attachments[0].temp}","remote":"","dir":"temp"}]',
  "browse_projects[finish_days]": "${model.model.finish_days }",
  "browse_projects[search_text]": "${model.model.search_text }",
  "browse_projects[last_bump]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}",
  "browse_projects[select_deadline]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.select_deadline)}",
  "browse_projects[start_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.start_date)}",
  "browse_projects[finish_deadline]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_deadline)}",
  "browse_projects[finish_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.finish_date)}",
  "browse_projects[closed_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.closed_date)}",
  "browse_projects[bid_count]": "${model.model.bid_count }",
  "browse_projects[progress]": "${model.model.progress }",
   "browse_projects[project_status_id]": "${model.model.project_status_id}",
   "browse_projects[project_ending_id]": "${model.model.project_ending_id}",
   "browse_projects[project_type_id]": "${model.model.project_type_id}",
   "browse_projects[project_class_id]": "${model.model.project_class_id}",
  "browse_projects[published_budget]": "${model.model.published_budget}",
  "browse_projects[budget_range]": "${model.model.budget_range }",
  "browse_projects[fee_percent]": "${model.model.fee_percent }",
  "browse_projects[service_id]": "${model.model.service_id }",
  "browse_projects[private_worker_id]": "${model.model.private_worker_id }",
  "browse_projects[invited_users]": "${model.model.invited_users }",
  "browse_projects[accepted_bid_id]": "${model.model.accepted_bid_id }",
  "browse_projects[accepted_worker_id]": "${model.model.accepted_worker_id }",
  "browse_projects[accepted_budget]": "${model.model.accepted_budget}",
  "browse_projects[accepted_work_id]": "${model.model.accepted_work_id }",
  "browse_projects[accepted_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.accepted_date)}",
  "browse_projects[available_budget]": "${model.model.available_budget}",
  "browse_projects[need_weekly_report]": "${model.model.need_weekly_report ? 1 : 0}",
  "browse_projects[weekly_report_needed]": "${model.model.weekly_report_needed ? 1 : 0}",
  "browse_projects[weekly_report_posted]": "${model.model.weekly_report_posted ? 1 : 0}",
  "browse_projects[deadline_passed_sent]": "${model.model.deadline_passed_sent ? 1 : 0}",
  "browse_projects[deadline_approaching_sent]": "${model.model.deadline_approaching_sent ? 1 : 0}",
  "browse_projects[rating_for_worker]": "${model.model.rating_for_worker }",
  "browse_projects[work_quality]": "${model.model.work_quality }",
  "browse_projects[expertise]": "${model.model.expertise }",
  "browse_projects[worker_communication]": "${model.model.worker_communication }",
  "browse_projects[worker_professionalism]": "${model.model.worker_professionalism }",
  "browse_projects[worker_rating]": "${model.model.worker_rating }",
  "browse_projects[worker_rating_num]": "${model.model.worker_rating_num}",
  "browse_projects[worker_feedback]": "${model.model.worker_feedback }",
  "browse_projects[rating_for_owner]": "${model.model.rating_for_owner }",
  "browse_projects[clarity]": "${model.model.clarity }",
  "browse_projects[friendliness]": "${model.model.friendliness }",
  "browse_projects[owner_communication]": "${model.model.owner_communication }",
  "browse_projects[owner_professionalism]": "${model.model.owner_professionalism }",
  "browse_projects[owner_rating]": "${model.model.owner_rating }",
  "browse_projects[owner_rating_num]": "${model.model.owner_rating_num}",
  "browse_projects[owner_feedback]": "${model.model.owner_feedback }",
  "browse_projects[owner_signature_ip]": "${model.model.owner_signature_ip }",
  "browse_projects[owner_signature_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.owner_signature_date)}",
  "browse_projects[worker_signature_ip]": "${model.model.worker_signature_ip }",
  "browse_projects[worker_signature_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.worker_signature_date)}",
  "browse_projects[owner_escrow_id]": "${model.model.owner_escrow_id }",
  "browse_projects[worker_credit_id]": "${model.model.worker_credit_id }",
  "browse_projects[arbitration_id]": "${model.model.arbitration_id }",
  "browse_projects[owner_credit_id]": "${model.model.owner_credit_id }",
  "browse_projects[registered_by_id]": "${model.model.registered_by_id }",
  "browse_projects[registered_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}",
  "browse_projects[registered_from_ip]": "${model.model.registered_from_ip }",
  "browse_projects[canceled_by_id]": "${model.model.canceled_by_id }",
  "browse_projects[canceled_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.canceled_date)}",
  "browse_projects[canceled_from_ip]": "${model.model.canceled_from_ip }",
  "browse_projects[published_by_id]": "${model.model.published_by_id }",
  "browse_projects[published_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}",
  "browse_projects[published_from_ip]": "${model.model.published_from_ip }",
  "browse_projects[rejected_by_id]": "${model.model.rejected_by_id }",
  "browse_projects[rejected_date]": "${DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}",
  "browse_projects[rejected_from_ip]": "${model.model.rejected_from_ip }",
  "browse_projects[admin_note]": "${model.model.admin_note }",
  "browse_projects[announced]": "${model.model.announced ? 1 : 0}",
  "browse_projects[your_wishes]": "${model.model.your_wishes }",
  "browse_projects[extend_deadline_days]": "${model.model.extend_deadline_days }",
  "browse_projects[testimony]": "${model.model.testimony }",
  "browse_projects[pick_user_name]": "${model.model.pick_user_name }",
  "browse_projects[enter_email_address]": "${model.model.enter_email_address }",
  "browse_projects[handphone]": "${model.model.handphone }",
  "browse_projects[broadcast_message]": "${model.model.broadcast_message }",
  "browse_projects[attach_file]": '$attach_file',
  "browse_projects[attach_file_lastval]": '[{"name":"${model.model.attach_file[0].name}","size":${model.model.attach_file[0].size.toString()},"created":${model.model.attach_file[0].date.toString()},"modified":${model.model.attach_file[0].date.toString()},"temp":"${model.model.attach_file[0].temp}","remote":"","dir":"temp"}]',
  "browse_projects[automatic_send_to_new_bidder]": "${model.model.automatic_send_to_new_bidder ? 1 : 0}",
  "browse_projects[is_system_message]": "${model.model.is_system_message ? 1 : 0}",
  "browse_projects[admin_notes]": "${model.model.admin_notes }",
	  
  };  
      int  count = 0;
      for(var tag in model.model.channels_id!){
        formData.addAll({"browse_projects[inline_tags][selection][$count]": "$tag"});
        count++;
      }

    return( formData);

  } 
	
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(ButtonEditBrowseProjectsWidget(model.buttons[i], context,formKey, controller,browse_projects, postBrowseProjectsResult, state, sendPath, id!,  title ));
      }  
    }
       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title ){
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
				children:listButton(context, formKey,controller,browse_projects, postBrowseProjectsResult, state, sendPath, id!,  title )
	    )
	 );
   } 

SpeedDialChild ButtonEditBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
 var postBrowseProjectsResult, State state, String?sendPath, String?id,  String?title){
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
                        initvalue: button.selections![0]);
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
                        browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                        sendPath,
                        AppAction.post,
                        id!,
                        title,
                        formData,
						false);
                        final future = browse_projects.postBrowseProjects();
                        future.then((value) {
                        state.setState(() {
                        postBrowseProjectsResult = value;
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
   


	  	    Widget editOwner (State state) {
	   return(  StringView(
		value: model.model.owner_str,
		caption: 'Owner',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_id,
	  caption: 'Owner',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_id_list,
	  nameenum: model.model.owner_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.owner_id = val;
		});
	  },
	));*/
	}

	  	    Widget editChannels (State state) {
      return(
	
	InlineTagsWidget(
	  value: model.model.channels_id,
	  caption: 'Channels',
	  hint: ' ',
	  required: true,
	  idtags: model.model.channels_list,
	  nametags: model.model.channels_list_str,
	  getValue: (List<int?>? val) {
    model.model.channels_id.clear();
		state.setState(() {
		  model.model.channels_id.addAll(val);
		});
	  },
	  removeValue: (int?  val) {
		state.setState(() {
		  model.model.channels_id.remove(val);
		});
	  },
	));}

	  	    Widget editProjectOwner (State state) {
      return(
	TitleWidget(
		value: model.model.project_owner,
		caption: 'Project Owner',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.project_owner = val;
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
	  required: true,
	  idenum: model.model.category_id_list,
	  nameenum: model.model.category_id_list_str,
	  getValue: (int?  val) {
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
		required: true,
		getValue: (String?val) {
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
	  getValue:(String?val) {
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
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.short_description = val;
		  });
		},
    ));}

	  	    Widget editAttachments (State state) {
	 if(model.model.attachments== null){
		FileField file = FileField('', '',0,0,0, '', '', '','' );
		model.model.attachments = [file];
		}
      return(
	FileWidget(
		value: model.model.attachments[0],
		caption: 'Attachments',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.attachments[0] = val;
		  });
		},
	));} 

	  	    Widget editFinishDays (State state) {
      return(
	NumberWidget(
	  value: model.model.finish_days,
	  caption: 'Finish Days',
	  hint: 'Isi dengan Number Anda',
	  required: true,
      min: '0',
	  max: '1000000',
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.finish_days = val;
		});
	  },
	));}

	  	    Widget editSearchText (State state) {
      return(
	DisplayNameWidget(
		value: model.model.search_text,
		caption: 'Search Text',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.search_text = val;
		  });
		},
    ));}

	  	    Widget editLastBump (State state) {
      return(
	DateTimeWidget(
	  value: model.model.last_bump,
	  caption: 'Last Bump',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.last_bump = val;
		});
	  },
	));} 

	  	    Widget editSelectDeadline (State state) {
      return(
	DateTimeWidget(
	  value: model.model.select_deadline,
	  caption: 'Select Deadline',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.select_deadline = val;
		});
	  },
	));} 

	  	    Widget editStartDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.start_date,
	  caption: 'Start Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.start_date = val;
		});
	  },
	));} 

	  	    Widget editFinishDeadline (State state) {
      return(
	DateTimeWidget(
	  value: model.model.finish_deadline,
	  caption: 'Finish Deadline',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.finish_deadline = val;
		});
	  },
	));} 

	  	    Widget editFinishDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.finish_date,
	  caption: 'Finish Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.finish_date = val;
		});
	  },
	));} 

	  	    Widget editClosedDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.closed_date,
	  caption: 'Closed Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.closed_date = val;
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
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.bid_count = val;
		});
	  },
	));}

	  	    Widget editProgress (State state) {
      return(
	PercentWidget(
	  value: model.model.progress,
	  caption: 'Progress',
	  hint: 'Isi dengan Double Anda',
	  required: false,
	  min:'0.0',
	  max:'100.0',
	  getValue: (int?  val) {
	  
		state.setState(() {
		  model.model.progress = val;
		});
	  },
	));}

   	    Widget editProjectStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_status_id,
	  caption: 'Project Status',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_status_list,
	  nameenum: model.model.project_status_list_str,
	  getValue: (int?  val) {
	  	;
		state.setState(() {
		  model.model.project_status_id = val;
		});
	  },
	));}

   	    Widget editProjectEnding (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_ending_id,
	  caption: 'Project Ending',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_ending_list,
	  nameenum: model.model.project_ending_list_str,
	  getValue: (int?  val) {
	  	;
		state.setState(() {
		  model.model.project_ending_id = val;
		});
	  },
	));}

   	    Widget editProjectType (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_type_id,
	  caption: 'Project Type',
	  hint: 'pilih Enum',
	  required: false,
	  idenum: model.model.project_type_list,
	  nameenum: model.model.project_type_list_str,
	  getValue: (int?  val) {
	  	;
		state.setState(() {
		  model.model.project_type_id = val;
		});
	  },
	));}

   	    Widget editProjectClass (State state) {
      return(
	  EnumWidget(
	  value: model.model.project_class_id,
	  caption: 'Project Class',
	  hint: 'pilih Enum',
	  required: true,
	  idenum: model.model.project_class_list,
	  nameenum: model.model.project_class_list_str,
	  getValue: (int?  val) {
	  	;
		state.setState(() {
		  model.model.project_class_id = val;
		});
	  },
	));}

	  	    Widget editPublishedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.published_budget,
	  caption: 'Published Budget',
	  hint: 'Isi dengan Money Anda',
	  required: true,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.published_budget = val;
		});
	  },
	));}

	  	    Widget editBudgetRange (State state) {
      return(   
        RangeWidget( 
          value: model.model.budget_range,
          valuemin: model.model.budget_range_min,
          valuemax: model.model.budget_range_max,
          caption: 'Range Budget',
          hint: 'Isi dengan Range penawaran Anda',
          required:true,
         min: '0',
         max: '100000000000',

          getValue1: (double? val) {
            state.setState(() {
              model.model.budget_range_min = val;
            });
          },
          getValue2: (double? val) {
            state.setState(() {
              model.model.budget_range_max = val;
            });
          },
          getValue: (String?val) {
            state.setState(() {
              model.model.budget_range = val;
            });
          },
        )
      );} 

	  	    Widget editFeePercent (State state) {
      return(
	NumberWidget(
	  value: model.model.fee_percent,
	  caption: 'Fee Percent',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.fee_percent = val;
		});
	  },
	));}

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
	  required: false,
	  idenum: model.model.service_id_list,
	  nameenum: model.model.service_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.service_id = val;
		});
	  },
	));*/
	}

	  	    Widget editPrivateWorker (State state) {
	   return(  StringView(
		value: model.model.private_worker_str,
		caption: 'Private Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.private_worker_id,
	  caption: 'Private Worker',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.private_worker_id_list,
	  nameenum: model.model.private_worker_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.private_worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editInvitedUsers (State state) {
      return(
	DisplayNameWidget(
		value: model.model.invited_users,
		caption: 'Invited Users',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.invited_users = val;
		  });
		},
    ));}

	  	    Widget editAcceptedBid (State state) {
	   return(  StringView(
		value: model.model.accepted_bid_str,
		caption: 'Accepted Bid',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_bid_id,
	  caption: 'Accepted Bid',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_bid_id_list,
	  nameenum: model.model.accepted_bid_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.accepted_bid_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedWorker (State state) {
	   return(  StringView(
		value: model.model.accepted_worker_str,
		caption: 'Accepted Worker',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_worker_id,
	  caption: 'Accepted Worker',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_worker_id_list,
	  nameenum: model.model.accepted_worker_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.accepted_worker_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.accepted_budget,
	  caption: 'Accepted Budget',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.accepted_budget = val;
		});
	  },
	));}

	  	    Widget editAcceptedWork (State state) {
	   return(  StringView(
		value: model.model.accepted_work_str,
		caption: 'Accepted Work',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.accepted_work_id,
	  caption: 'Accepted Work',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.accepted_work_id_list,
	  nameenum: model.model.accepted_work_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.accepted_work_id = val;
		});
	  },
	));*/
	}

	  	    Widget editAcceptedDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.accepted_date,
	  caption: 'Accepted Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.accepted_date = val;
		});
	  },
	));} 

	  	    Widget editAvailableBudget (State state) {
      return(
	MoneyWidget(
	  value: model.model.available_budget,
	  caption: 'Available Budget',
	  hint: 'Isi dengan Money Anda',
	  required: false,
      min: '0',
	  max: '1000000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.available_budget = val;
		});
	  },
	));}

	  	    Widget editNeedWeeklyReport (State state) {
      return(
	BooleanWidget(
	  value: model.model.need_weekly_report,
	  caption: 'Need Weekly Report',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.need_weekly_report = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportNeeded (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_needed,
	  caption: 'Weekly Report Needed',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.weekly_report_needed = val;
		});
	  },
	));} 

	  	    Widget editWeeklyReportPosted (State state) {
      return(
	BooleanWidget(
	  value: model.model.weekly_report_posted,
	  caption: 'Weekly Report Posted',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.weekly_report_posted = val;
		});
	  },
	));} 

	  	    Widget editDeadlinePassedSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_passed_sent,
	  caption: 'Deadline Passed Sent',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.deadline_passed_sent = val;
		});
	  },
	));} 

	  	    Widget editDeadlineApproachingSent (State state) {
      return(
	BooleanWidget(
	  value: model.model.deadline_approaching_sent,
	  caption: 'Deadline Approaching sent',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.deadline_approaching_sent = val;
		});
	  },
	));} 

	  	    Widget editRatingForWorker (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_worker,
		caption: 'Rating For Worker',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.rating_for_worker = val;
		  });
		},
	));}

	  	    Widget editWorkQuality (State state) {
      return(
	RatingWidget(
	  value: model.model.work_quality,
	  caption: 'Work Quality',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.work_quality = val;
		});
	  },
	));}

	  	    Widget editExpertise (State state) {
      return(
	RatingWidget(
	  value: model.model.expertise,
	  caption: 'Expertise',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.expertise = val;
		});
	  },
	));}

	  	    Widget editWorkerCommunication (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_communication,
	  caption: 'Worker Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.worker_communication = val;
		});
	  },
	));}

	  	    Widget editWorkerProfessionalism (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_professionalism,
	  caption: 'Worker Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.worker_professionalism = val;
		});
	  },
	));}

	  	    Widget editWorkerRating (State state) {
      return(
	RatingWidget(
	  value: model.model.worker_rating,
	  caption: 'Worker Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.worker_rating = val;
		});
	  },
	));}

	  	    Widget editWorkerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.worker_rating_num,
	  caption: 'Worker Rating Num',
	  hint: 'Isi dengan Double Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.worker_rating_num = val;
		});
	  },
	));}

	  	    Widget editWorkerFeedback (State state) {
      return(
	ArticleWidget(
	  value: model.model.worker_feedback,
	  caption: 'Worker Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.worker_feedback = val;
		});
	  },
	));}

	  	    Widget editRatingForOwner (State state) {
      return(
	TitleWidget(
		value: model.model.rating_for_owner,
		caption: 'Rating For Owner',
		hint: 'Isi dengan Title Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.rating_for_owner = val;
		  });
		},
	));}

	  	    Widget editClarity (State state) {
      return(
	RatingWidget(
	  value: model.model.clarity,
	  caption: 'Clarity',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.clarity = val;
		});
	  },
	));}

	  	    Widget editFriendliness (State state) {
      return(
	RatingWidget(
	  value: model.model.friendliness,
	  caption: 'Friendliness',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.friendliness = val;
		});
	  },
	));}

	  	    Widget editOwnerCommunication (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_communication,
	  caption: 'Owner Communication',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.owner_communication = val;
		});
	  },
	));}

	  	    Widget editOwnerProfessionalism (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_professionalism,
	  caption: 'Owner Professionalism',
	  hint: 'isi dengan Rating diatas.',
	  required: true,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.owner_professionalism = val;
		});
	  },
	));}

	  	    Widget editOwnerRating (State state) {
      return(
	RatingWidget(
	  value: model.model.owner_rating,
	  caption: 'Owner Rating',
	  hint: 'isi dengan Rating diatas.',
	  required: false,
	  getValue:(int?  val) {
	  
		state.setState(() {
		  model.model.owner_rating = val;
		});
	  },
	));}

	  	    Widget editOwnerRatingNum (State state) {
      return(
	  
	DoubleWidget(
	  value: model.model.owner_rating_num,
	  caption: 'Owner Rating Num',
	  hint: 'Isi dengan Double Anda',
	  required: false,
      min: '0',
	  max: '10000000',
	  getValue: (double? val) {
		state.setState(() {
		  
	     model.model.owner_rating_num = val;
		});
	  },
	));}

	  	    Widget editOwnerFeedback (State state) {
      return(
	ArticleWidget(
	  value: model.model.owner_feedback,
	  caption: 'Owner Feedback',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.owner_feedback = val;
		});
	  },
	));}

	  	    Widget editOwnerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.owner_signature_ip,
		caption: 'Owner Signature IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.owner_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editOwnerSignatureDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.owner_signature_date,
	  caption: 'Owner Signature Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.owner_signature_date = val;
		});
	  },
	));} 

	  	    Widget editWorkerSignatureIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.worker_signature_ip,
		caption: 'Worker Signature IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.worker_signature_ip = val;
		  });
		},
    ));}

	  	    Widget editWorkerSignatureDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.worker_signature_date,
	  caption: 'Worker Signature Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.worker_signature_date = val;
		});
	  },
	));} 

	  	    Widget editOwnerEscrow (State state) {
	   return(  StringView(
		value: model.model.owner_escrow_str,
		caption: 'Owner Escrow',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_escrow_id,
	  caption: 'Owner Escrow',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_escrow_id_list,
	  nameenum: model.model.owner_escrow_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.owner_escrow_id = val;
		});
	  },
	));*/
	}

	  	    Widget editWorkerCredit (State state) {
	   return(  StringView(
		value: model.model.worker_credit_str,
		caption: 'Worker Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.worker_credit_id,
	  caption: 'Worker Credit',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.worker_credit_id_list,
	  nameenum: model.model.worker_credit_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.worker_credit_id = val;
		});
	  },
	));*/
	}

	  	    Widget editArbitration (State state) {
	   return(  StringView(
		value: model.model.arbitration_str,
		caption: 'Arbitration',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.arbitration_id,
	  caption: 'Arbitration',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.arbitration_id_list,
	  nameenum: model.model.arbitration_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.arbitration_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOwnerCredit (State state) {
	   return(  StringView(
		value: model.model.owner_credit_str,
		caption: 'Owner Credit',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.owner_credit_id,
	  caption: 'Owner Credit',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.owner_credit_id_list,
	  nameenum: model.model.owner_credit_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.owner_credit_id = val;
		});
	  },
	));*/
	}

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
	  required: false,
	  idenum: model.model.registered_by_id_list,
	  nameenum: model.model.registered_by_id_list_str,
	  getValue: (int?  val) {
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
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
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
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.registered_from_ip = val;
		  });
		},
    ));}

	  	    Widget editCanceledBy (State state) {
	   return(  StringView(
		value: model.model.canceled_by_str,
		caption: 'Canceled By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.canceled_by_id,
	  caption: 'Canceled By',
	  hint: 'pilih Model',
	  required: false,
	  idenum: model.model.canceled_by_id_list,
	  nameenum: model.model.canceled_by_id_list_str,
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.canceled_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editCanceledDate (State state) {
      return(
	DateTimeWidget(
	  value: model.model.canceled_date,
	  caption: 'Canceled Date',
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
		state.setState(() {
		  model.model.canceled_date = val;
		});
	  },
	));} 

	  	    Widget editCanceledFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.canceled_from_ip,
		caption: 'Canceled From IP',
		hint: 'Isi dengan Website Anda',
		required: false,
		getValue: (String?val) {
		  state.setState(() {
			model.model.canceled_from_ip = val;
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
	  required: false,
	  idenum: model.model.published_by_id_list,
	  nameenum: model.model.published_by_id_list_str,
	  getValue: (int?  val) {
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
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
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
		required: false,
		getValue: (String?val) {
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
	  required: false,
	  idenum: model.model.rejected_by_id_list,
	  nameenum: model.model.rejected_by_id_list_str,
	  getValue: (int?  val) {
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
	  hint: 'isi dengan DateTime?  diatas.',
	  required: false,
	  getValue:(DateTime?  val) {
	  ;
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
		required: false,
		getValue: (String?val) {
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
	  getValue:(String?val) {
		state.setState(() {
		  model.model.admin_note = val;
		});
	  },
	));}

	  	    Widget editAnnounced (State state) {
      return(
	BooleanWidget(
	  value: model.model.announced,
	  caption: 'Announced',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.announced = val;
		});
	  },
	));} 

	  	    Widget editYourWishes (State state) {
      return(
	ArticleWidget(
	  value: model.model.your_wishes,
	  caption: 'Your Wishes',
	  hint: 'isi dengan Article Anda',
	  required: true,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.your_wishes = val;
		});
	  },
	));}

	  	    Widget editExtendDeadlineDays (State state) {
      return(
	NumberWidget(
	  value: model.model.extend_deadline_days,
	  caption: 'Extend Deadline Days',
	  hint: 'Isi dengan Number Anda',
	  required: false,
      min: '0',
	  max: '1000000',
	  getValue: (int?  val) {
		state.setState(() {
		  model.model.extend_deadline_days = val;
		});
	  },
	));}

	  	    Widget editTestimony (State state) {
      return(
	ArticleWidget(
	  value: model.model.testimony,
	  caption: 'Testimony',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.testimony = val;
		});
	  },
	));}

	  	    Widget editPickUserName (State state) {
      return(
	UsernameWidget(
		value: model.model.pick_user_name,
		caption: 'Pick User Name',
		hint: 'Isi dengan Username Anda',
		required: true,
		getValue: (String?val) {
		  state.setState(() {
			model.model.pick_user_name = val;
		  });
		}
	));}

	  	    Widget editEnterEmailAddress (State state) {
      return(
	 EmailWidget(
		value: model.model.enter_email_address,
		caption: 'Enter Email Address',
		hint: 'Isi dengan Email Anda',
		required: true,
		getValue: (String?val) {
		  state.setState(() {
			model.model.enter_email_address = val;
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
		getValue: (String?val) {
		  state.setState(() {
			model.model.handphone = val;
		  });
		},
	));}

	  	    Widget editBroadcastMessage (State state) {
      return(
	ArticleWidget(
	  value: model.model.broadcast_message,
	  caption: 'Broadcast Message',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.broadcast_message = val;
		});
	  },
	));}

	  	    Widget editAttachFile (State state) {
	 if(model.model.attach_file== null){
		FileField file = FileField('', '',0,0,0, '', '', '','' );
		model.model.attach_file = [file];
		}
      return(
	FileWidget(
		value: model.model.attach_file[0],
		caption: 'Attach File',
		hint: 'Isi dengan File Anda',
		required: false,
		getValue: (var val) {
		
		  state.setState(() {
			model.model.attach_file[0] = val;
		  });
		},
	));} 

	  	    Widget editAutomaticSendToNewBidder (State state) {
      return(
	BooleanWidget(
	  value: model.model.automatic_send_to_new_bidder,
	  caption: 'Automatic Send to New Bidder',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.automatic_send_to_new_bidder = val;
		});
	  },
	));} 

	  	    Widget editIsSystemMessage (State state) {
      return(
	BooleanWidget(
	  value: model.model.is_system_message,
	  caption: 'Is System Message',
	  hint: 'Isi dengan Boolean Anda',
	  required: false,
	  getValue: (bool?val) {
	  
		state.setState(() {
		  model.model.is_system_message = val;
		});
	  },
	));} 

	  	    Widget editAdminNotes (State state) {
      return(
	ArticleWidget(
	  value: model.model.admin_notes,
	  caption: 'Admin Notes',
	  hint: 'isi dengan Article Anda',
	  required: false,
	  getValue:(String?val) {
		state.setState(() {
		  model.model.admin_notes = val;
		});
	  },
	));}
	
}


@JsonSerializable()

class BrowseProjectsSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ModelBrowseProjects? model;
  BrowseProjectsSuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory BrowseProjectsSuperBase.fromJson(Map<String, dynamic> json) => _$BrowseProjectsSuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BrowseProjectsSuperBaseToJson(this);
   
}






@JsonSerializable()
class ViewModelBrowseProjects {
  int? age;
  int? cnt;
  int? page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;
  

  String?description;
  List<FileField?>? attachments;  
  String?attachments_url;
  String?attachments_name;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  int?  project_class_id;
  String?project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  String?budget_range;
  double? budget_range_min;
  String?budget_range_min_str;
  double? budget_range_max;
  String?budget_range_max_str;
  String?budget_range_str;
  double? published_budget;
  String?published_budget_str;
  int?  finish_days;
  String?finish_days_str;
  bool?need_weekly_report;
  DateTime?  published_date;
  DateTime?  select_deadline;
  int?  project_status_id;
  String?project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int?  accepted_worker_id;
  String?accepted_worker_str;
  String?accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  double? accepted_budget;
  String?accepted_budget_str;
  DateTime?  start_date;
  DateTime?  finish_date;
  int?  bid_count;
  String?bid_count_str;
  int?  owner_id;
  String?owner_str;
  String?owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  String?owner_photo_url;
  Photo? owner_photo; 
  String?owner_user_name;
  int?  owner_kabupaten_id;
  String?owner_kabupaten_str;
  int?   owner_owner_rating;
  double?  owner_owner_rating_num;
  String?owner_owner_rating_num_str;
  int?   owner_owner_point;
  String?owner_owner_point_str;
  int?   owner_owner_ranking;
  String?owner_owner_ranking_str;
  String?owner_last_seen;
  int?   owner_projects_owned;
  String?owner_projects_owned_str;
  int?   owner_projects_arbitrated;
  String?owner_projects_arbitrated_str;
  int?   owner_projects_won_in_arbitration;
  String?owner_projects_won_in_arbitration_str;
  int?   owner_projects_lost_in_arbitration;
  String?owner_projects_lost_in_arbitration_str;
  double? worker_rating_num;
  String?worker_rating_num_str;
  String?worker_feedback;
  int?   accepted_worker_worker_rating;
  int?   accepted_worker_worker_point;
  String?accepted_worker_worker_point_str;
  int?   accepted_worker_worker_ranking;
  String?accepted_worker_worker_ranking_str;
  int?   accepted_worker_projects_won;
  String?accepted_worker_projects_won_str;
  int?   accepted_worker_projects_completed;
  String?accepted_worker_projects_completed_str;
  String?owner_feedback;
   //UserBids user_bids;

	//
	  ViewModelBrowseProjects(
            this.id,
			this.description,
			this.attachments,
			this.attachments_url,	
            this.attachments_name,				
			this.channels_id,
			this.channels_str,
			this.channels_url,
			this.project_class_id,
			this.project_class_str,
			this.project_class_list,
			this.project_class_list_str,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
			this.published_budget,
			this.published_budget_str,
			this.finish_days,
			this.finish_days_str,
			this.need_weekly_report,
			this.published_date,
			this.select_deadline,
			this.project_status_id,
			this.project_status_str,
			this.project_status_list,
			this.project_status_list_str,
			this.accepted_worker_id,
			this.accepted_worker_str,
			this.accepted_worker_url,
			this.accepted_worker_list,
			this.accepted_worker_list_str,
			this.accepted_budget,
			this.accepted_budget_str,
			this.start_date,
			this.finish_date,
			this.bid_count,
			this.bid_count_str,
			this.owner_id,
			this.owner_str,
			this.owner_url,
			this.owner_list,
			this.owner_list_str,
			this.owner_photo_url,
			this.owner_photo,
			this.owner_kabupaten_id,
			this.owner_kabupaten_str,
			this.owner_owner_rating_num,
			this.owner_owner_rating_num_str,
			this.owner_owner_point,
			this.owner_owner_point_str,
			this.owner_owner_ranking,
			this.owner_owner_ranking_str,
			this.owner_projects_owned,
			this.owner_projects_owned_str,
			this.owner_projects_arbitrated,
			this.owner_projects_arbitrated_str,
			this.owner_projects_won_in_arbitration,
			this.owner_projects_won_in_arbitration_str,
			this.owner_projects_lost_in_arbitration,
			this.owner_projects_lost_in_arbitration_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_feedback,
			this.accepted_worker_worker_point,
			this.accepted_worker_worker_point_str,
			this.accepted_worker_worker_ranking,
			this.accepted_worker_worker_ranking_str,
			this.accepted_worker_projects_won,
			this.accepted_worker_projects_won_str,
			this.accepted_worker_projects_completed,
			this.accepted_worker_projects_completed_str,
			this.owner_feedback,

  );

  
   factory ViewModelBrowseProjects.fromJson(Map<String, dynamic> json) => _$ViewModelBrowseProjectsFromJson(json);

   Map<String, dynamic> toJson() => _$ViewModelBrowseProjectsToJson(this); 
  
}


class BrowseProjectsViewBase{
	var model;
	Map<String, dynamic> json;
	final List<Widget> viewChildren = <Widget>[
	];
	BrowseProjectsViewBase(this.json);
	
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
    State state, String?sendPath, String?id,  String?title, bool?account ){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){

      buttonChildren.add(ButtonViewBrowseProjectsWidget(model.buttons[i],context,  formKey, controller, browse_projects,
                                    state, sendPath, id!,  title, account ));
      }
    }

       return(
	        buttonChildren 
	   );
   } 
   
   
 SpeedDialChild ButtonViewBrowseProjectsWidget(Button button, BuildContext context,var formKey, ScrollController controller, BrowseProjectsController browse_projects,
  State state, String?sendPath, String?id,  String?title, bool?account){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.search),
                        backgroundColor: Colors.green,
                        label: button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){ showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button.selections![0]);
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
    
    if(button.url!.contains('user/my_purchases/download/')){
	return(	SpeedDialChild(
		  child: Icon(ic),
		  backgroundColor: cl,
		  label: button!.text!,
		  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        
                        browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                        sendPath! + button.url!,
                        AppAction.post,
                        id!,
                        title,
                        null,
						false);
                        final future = browse_projects.downloadFile();
                        future.then((value) {

                        state.setState(() {
                       // postBrowseProjectsResult = value;
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
			AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! ));
		  }else{
		    AppProvider.getRouter(context)!.navigateTo(context,'/login/1');
		   }
		  }
	  ));
	  }
	  
  }

}  
   
   
   
   
   
    SpeedDial	 Buttons(BuildContext context, bool?visible, var formKey, ScrollController controller, BrowseProjectsController browse_projects,
    State state, String?sendPath, String?id,  String?title, bool?account ){
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
				children:listButton(context, visible, formKey, controller, browse_projects,
                                    state, sendPath, id!,  title, account )
	    )
	 );
   } 	
	
	Widget appBar(BuildContext context, String?idHash){
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


	  viewChildren.clear();
	  
	  if(this.model.meta.before_title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_title),
	  ));}
	  if(this.model.meta.title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.title),
	  ));}
	  if(this.model.meta.after_title != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.after_title),
	  ));}
	  if(this.model.meta.warning != null){ viewChildren.add(Padding(
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

	  if(this.model.meta.before_content != null){ viewChildren.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child:  Html(data: this.model.meta.before_content),
	  ));}	  

	 	  
	   viewChildren.add(viewDescription(context)); 
	   viewChildren.add(viewAttachments(context)); 
	   viewChildren.add(viewChannels(context)); 
	   viewChildren.add(viewProjectClass(context)); 
	   viewChildren.add(viewBudgetRange(context)); 
	   viewChildren.add(viewPublishedBudget(context)); 
	   viewChildren.add(viewFinishDays(context)); 
	   viewChildren.add(viewNeedWeeklyReport(context)); 
	   viewChildren.add(viewPublishedDate(context)); 
	   viewChildren.add(viewSelectDeadline(context)); 
	   viewChildren.add(viewProjectStatus(context)); 
	   viewChildren.add(viewAcceptedWorker(context)); 
	   viewChildren.add(viewAcceptedBudget(context)); 
	   viewChildren.add(viewStartDate(context)); 
	   viewChildren.add(viewFinishDate(context)); 
	   viewChildren.add(viewBidCount(context)); 
	   viewChildren.add(viewOwner(context)); 
	   viewChildren.add(viewPhoto(context));
	   viewChildren.add(viewUserName(context));
	   viewChildren.add(viewKabupaten(context));
	   viewChildren.add(viewOwnerRating(context));
	   viewChildren.add(viewOwnerRatingNum(context));
	   viewChildren.add(viewOwnerPoint(context));
	   viewChildren.add(viewOwnerRanking(context));
	   viewChildren.add(viewLastSeen(context));
	   viewChildren.add(viewProjectsOwned(context));
	   viewChildren.add(viewProjectsArbitrated(context));
	   viewChildren.add(viewProjectsWonInArbitration(context));
	   viewChildren.add(viewProjectsLostInArbitration(context));
	   viewChildren.add(viewWorkerRatingNum(context)); 
	   viewChildren.add(viewWorkerFeedback(context)); 
	   viewChildren.add(viewWorkerRating(context));
	   viewChildren.add(viewWorkerPoint(context));
	   viewChildren.add(viewWorkerRanking(context));
	   viewChildren.add(viewProjectsWon(context));
	   viewChildren.add(viewProjectsCompleted(context));
	   viewChildren.add(viewOwnerFeedback(context)); 
		

	 //
	if(this.model.meta.after_content != null){ viewChildren.add(Padding(
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
					 					  
                       children: viewChildren
                  ) 
     ));
	} 

 
		    Widget viewDescription (BuildContext context) {  
	if(model.model.description != null){
		return(  ArticleView(
		value: model.model.description,
		caption: 'Description',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Description',
		    ));
	}		
     }
		    Widget viewAttachments (BuildContext context) {  
			if(model.model.attachments == null){
				  return(  StringView(
				value: '',
				caption: 'Attachments',
			));
			}			
			if(model.model.attachments_name != ''){
			  return(  FileView(
				value: model.model.attachments_name,
				value1: model.model.attachments_url,
				caption: 'Attachments',
			));
			}else{
			  return(  StringView(
				value: '',
				caption: 'Attachments',
			));
			}
			
    } 
	Widget viewChannels (BuildContext context) {  
	if(model.model.channels_url != null){
			return( 	ChannelRouteTagsWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
						urlroutetags: model.model.channels_url,
						getValue: (String?val) {
						 // Navigator.pushReplacementNamed(context, "/projectscoid");
						  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
						},
					  ));
	}else{
				return( 	ChannelNonURLRouteWidget(
						value: model.model.channels_id,
						caption: '',
						hint: ' ',
						required: true,
						idroutetags: model.model.channels_id,
						nameroutetags: model.model.channels_str,
					  ));
	
    }	
			  } 
	    Widget viewProjectClass (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.project_class_id,
			caption: 'Project Class',
			idenum: model.model.project_class_list,
			nameenum: model.model.project_class_str,
		));} 
		    Widget viewBudgetRange (BuildContext context) {  
	if(model.model.budget_range != null){
		return(  StringView(
		value: model.model.budget_range_str,
		caption: 'Budget Range',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Budget Range',
		    ));
	}		
     }
		    Widget viewPublishedBudget (BuildContext context) {  			
    if(model.model.published_budget != null){
		return(  MoneyView(
		value: model.model.published_budget,
		caption: 'Published Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Published Budget',
		    ));
	}			
     }
		    Widget viewFinishDays (BuildContext context) { 
    if(model.model.finish_days != null){
		return(  NumberView(
		value: model.model.finish_days,
		caption: 'Finish Days',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Finish Days',
		));
	}		
     }
		    Widget viewNeedWeeklyReport (BuildContext context) {  

	if(model.model.need_weekly_report != null){
		return(  BooleanView(
		value: model.model.need_weekly_report,
		caption: 'Need Weekly Report',
	));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Need Weekly Report',
		    ));
	}
     } 
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
		    Widget viewSelectDeadline (BuildContext context) {  
	if(model.model.select_deadline != null){
	return(  DateTimeView(
		value: model.model.select_deadline,
		caption: 'Select Deadline',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Select Deadline',
		    ));
	}			 
	 } 
	    Widget viewProjectStatus (BuildContext context) {
		  return( 
		 EnumView(
			value: model.model.project_status_id,
			caption: 'Project Status',
			idenum: model.model.project_status_list,
			nameenum: model.model.project_status_str,
		));} 
				Widget viewAcceptedWorker (BuildContext context) {  
		return(  ModelView(
			value: model.model.accepted_worker_id,
			caption: 'Accepted Worker',
			idenum: model.model.accepted_worker_list,
			nameenum: model.model.accepted_worker_str,
		));} 
		    Widget viewAcceptedBudget (BuildContext context) {  			
    if(model.model.accepted_budget != null){
		return(  MoneyView(
		value: model.model.accepted_budget,
		caption: 'Accepted Budget',
		));
	}else{
		   	return(  StringView(
			value: '',
			caption: 'Accepted Budget',
		    ));
	}			
     }
		    Widget viewStartDate (BuildContext context) {  
	if(model.model.start_date != null){
	return(  DateTimeView(
		value: model.model.start_date,
		caption: 'Start Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Start Date',
		    ));
	}			 
	 } 
		    Widget viewFinishDate (BuildContext context) {  
	if(model.model.finish_date != null){
	return(  DateTimeView(
		value: model.model.finish_date,
		caption: 'Finish Date',
	));
	}else{
	       return(  StringView(
			value: '',
			caption: 'Finish Date',
		    ));
	}			 
	 } 
		    Widget viewBidCount (BuildContext context) { 
    if(model.model.bid_count != null){
		return(  NumberView(
		value: model.model.bid_count,
		caption: 'Bid Count',
	    ));
	}else{
	   return(  StringView(
			value: '',
			caption: 'Bid Count',
		));
	}		
     }
				Widget viewOwner (BuildContext context) {  
		return(  ModelView(
			value: model.model.owner_id,
			caption: 'Owner',
			idenum: model.model.owner_list,
			nameenum: model.model.owner_str,
		));} 
	  Widget viewPhoto (BuildContext context) {  
		return(  ImageView(
			value: model.model.owner_photo_url,
			caption: 'Photo',
		));} 
		Widget viewUserName (BuildContext context) {  
	    return(  StringView(
			value: model.model.owner_user_name,
			caption: 'User Name',
		));}
	  Widget viewKabupaten (BuildContext context) {  
	  return(  StringView(
			value: model.model.owner_kabupaten_str,
			caption: 'Kabupaten',
		));}
	   Widget viewOwnerRating (BuildContext context) {
	   if(model.model.owner_owner_rating != null){
	   		return(  RatingView(
			value: model.model.owner_owner_rating,
			caption: 'Owner Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Owner Rating',
		 ));
	   }
        }
	  Widget viewOwnerRatingNum (BuildContext context) {  
	   if(model.model.owner_owner_rating_num != null){
	   	  return(  StringView(
			value: model.model.owner_owner_rating_num.toString(),
			caption: 'Owner Rating Num',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_rating_num_str,
			caption: 'Owner Rating Num',
		));
	   }
        }
	  Widget viewOwnerPoint  (BuildContext context) {
	   if(model.model.owner_owner_point  != null){
	   	  return(  StringView(
			value: model.model.owner_owner_point.toString(),
			caption: 'Owner Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_point_str,
			caption: 'Owner Point',
		));
	   }
        }
	  Widget viewOwnerRanking (BuildContext context) {  
	   if(model.model.owner_owner_ranking != null){
	   	  return(  StringView(
			value: model.model.owner_owner_ranking.toString(),
			caption: 'Owner Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_owner_ranking_str,
			caption: 'Owner Ranking',
		));
	   }
        }
		Widget viewLastSeen (BuildContext context) {  
	    return(  StringView(
			value: model.model.owner_last_seen,
			caption: 'Last Seen',
		));}
	  Widget viewProjectsOwned (BuildContext context) {  
	   if(model.model.owner_projects_owned != null){
	   	  return(  StringView(
			value: model.model.owner_projects_owned.toString(),
			caption: 'Projects Owned',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_projects_owned_str,
			caption: 'Projects Owned',
		));
	   }
        }
	  Widget viewProjectsArbitrated (BuildContext context) {  
	   if(model.model.owner_projects_arbitrated != null){
	   	  return(  StringView(
			value: model.model.owner_projects_arbitrated.toString(),
			caption: 'Projects Arbitrated',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_projects_arbitrated_str,
			caption: 'Projects Arbitrated',
		));
	   }
        }
	  Widget viewProjectsWonInArbitration (BuildContext context) {  
	   if(model.model.owner_projects_won_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.owner_projects_won_in_arbitration.toString(),
			caption: 'Projects Won in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_projects_won_in_arbitration_str,
			caption: 'Projects Won in Arbitration',
		));
	   }
        }
	  Widget viewProjectsLostInArbitration (BuildContext context) {  
	   if(model.model.owner_projects_lost_in_arbitration != null){
	   	  return(  StringView(
			value: model.model.owner_projects_lost_in_arbitration.toString(),
			caption: 'Projects Lost in Arbitration',
		));
	   } else{
	       return(  StringView(
			value: model.model.owner_projects_lost_in_arbitration_str,
			caption: 'Projects Lost in Arbitration',
		));
	   }
        }
		    Widget viewWorkerRatingNum (BuildContext context) {  
	   if(model.model.worker_rating_num != null){
	   	   	return(  DoubleView(
		    value: model.model.worker_rating_num,
			caption: 'Worker Rating Num',
		));
	   }else{
	   	   return(  StringView(
			value: '',
			caption: 'Worker Rating Num',
		    ));
	   }
      }
		    Widget viewWorkerFeedback (BuildContext context) {  
	if(model.model.worker_feedback != null){
		return(  ArticleView(
		value: model.model.worker_feedback,
		caption: 'Worker Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Worker Feedback',
		    ));
	}		
     }
	   Widget viewWorkerRating (BuildContext context) {
	   if(model.model.accepted_worker_worker_rating != null){
	   		return(  RatingView(
			value: model.model.accepted_worker_worker_rating,
			caption: 'Worker Rating',
		    ));
	   }else{
	     return(  StringView(
		 value: '',
		 caption: 'Worker Rating',
		 ));
	   }
        }
	  Widget viewWorkerPoint  (BuildContext context) {  
	   if(model.model.accepted_worker_worker_point  != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_worker_point.toString(),
			caption: 'Worker Point',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_worker_point_str,
			caption: 'Worker Point',
		));
	   }
        }
	  Widget viewWorkerRanking (BuildContext context) {  
	   if(model.model.accepted_worker_worker_ranking != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_worker_ranking.toString(),
			caption: 'Worker Ranking',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_worker_ranking_str,
			caption: 'Worker Ranking',
		));
	   }
        }
	  Widget viewProjectsWon (BuildContext context) {  
	   if(model.model.accepted_worker_projects_won != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_projects_won.toString(),
			caption: 'Projects Won',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_projects_won_str,
			caption: 'Projects Won',
		));
	   }
        }
	  Widget viewProjectsCompleted (BuildContext context) {  
	   if(model.model.accepted_worker_projects_completed != null){
	   	  return(  StringView(
			value: model.model.accepted_worker_projects_completed.toString(),
			caption: 'Projects Completed',
		));
	   } else{
	       return(  StringView(
			value: model.model.accepted_worker_projects_completed_str,
			caption: 'Projects Completed',
		));
	   }
        }
		    Widget viewOwnerFeedback (BuildContext context) {  
	if(model.model.owner_feedback != null){
		return(  ArticleView(
		value: model.model.owner_feedback,
		caption: 'Owner Feedback',
    	));
	}else{
			return(  StringView(
			value: '',
			caption: 'Owner Feedback',
		    ));
	}		
     }
  
}


@JsonSerializable()
class BrowseProjectsViewSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseProjects? model;
  BrowseProjectsViewSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );
  	


        
      
      factory BrowseProjectsViewSuperBase.fromJson(Map<String, dynamic> json) => _$BrowseProjectsViewSuperBaseFromJson(json);
      Map<String, dynamic> toJson() => _$BrowseProjectsViewSuperBaseToJson(this);
      
    }


    ///////////////////////////////////////////////////

class BrowseProjectsListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	BrowseProjectsListingBase(this.json){
		items = BrowseProjectsListingItems.fromJson(this.json);
		tools = BrowseProjectsListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemBrowseProjectsModel item,String?search, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	
  Widget viewItemId(ItemBrowseProjectsModel item,String?search, int?  index, bool?account, String? id) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	  Widget viewItemIndex (ItemBrowseProjectsModel item,String?search, int?  index, bool?account) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
	
Widget viewItem1 (ItemBrowseProjectsModel item,ItemBrowseProjectsModel item1, String?search, BuildContext context,bool?account, String?id , bool?isMax, int?  max, int?  index) {
	ShapeBorder? shape;
    double? height = 0;
	double? totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard(destination :item, search : search, shape : shape, height: height)
    );


	}	   
	


	Widget viewItemState (ItemBrowseProjectsModel item,String?search, int?  index, BuildContext context, bool?account, State st, VoidCallback onrefresh) {
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
	  height = totalHeight * 50;

	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard(destination :item, search : search, shape : shape, height : height)
    );


	}
	
   List<SpeedDialChild>	 listButton(BuildContext context, bool?account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
   // if(tools.buttons[i].text != "Table View"){

      buttonChildren.add(ListButtonBrowseProjectsWidget(tools.buttons[i],context, account));
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





class BrowseProjectsListingItems{
  List<ItemBrowseProjectsModel?>? items;
  BrowseProjectsListingItems(
      this.items,
      );

  factory BrowseProjectsListingItems.fromJson(Map<String, dynamic> json) {
  	return BrowseProjectsListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemBrowseProjectsModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class BrowseProjectsListingTools{

	String?id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemBrowseProjects?>? items;
	BrowseProjectsListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory BrowseProjectsListingTools.fromJson(Map<String, dynamic> json) => _$BrowseProjectsListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$BrowseProjectsListingToolsToJson(this);

}




class ItemBrowseProjectsCard extends StatelessWidget {
  const ItemBrowseProjectsCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemBrowseProjectsModel? destination;
  final String?search;
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
                child: ItemBrowseProjectsContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBrowseProjectsContent extends StatelessWidget {
  const ItemBrowseProjectsContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemBrowseProjectsModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> buttonChildren = <Widget>[
    ];
	  if (destination!.item.buttons != null) {
		for(var i = 0; i < destination!.item.buttons.length; i++)
		{
		  buttonChildren.add(itemBrowseProjectsButton(destination,i , context));
		}


    }
	
    final List<Widget> children = [

    ];
	 /* children.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child: Html(data: "<h3>Header</h3>"),
	  ));
	  */
	   children.add(destination!.viewPhoto(context));
	   children.add(destination!.viewUserName(context));
	   children.add(destination!.viewKabupaten(context));
	   children.add(destination!.viewOwnerRating(context));
	   children.add(destination!.viewOwnerRatingNum(context));
	   children.add(destination!.viewProjectsOwned(context));
	   children.add(destination!.viewOwnerPoint(context));
	   children.add(destination!.viewOwnerRanking(context));
	   children.add(destination!.viewOwner(context)); 
	   children.add(destination!.viewTitle(context)); 
	   children.add(destination!.viewShortDescription(context)); 
	   children.add(destination!.viewChannels(context)); 
	   children.add(destination!.viewProjectClass(context)); 
	   children.add(destination!.viewBudgetRange(context)); 
	   children.add(destination!.viewPublishedBudget(context)); 
	   children.add(destination!.viewPublishedDate(context)); 
	   children.add(destination!.viewSelectDeadline(context)); 
	   children.add(destination!.viewFinishDays(context)); 
	   children.add(destination!.viewProjectStatus(context)); 
	   children.add(destination!.viewBidCount(context)); 
	   children.add(destination!.viewNeedWeeklyReport(context)); 
      /*    children.add(Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: "<h3>footer</h3>"),
                           )
     ); */


  if (destination!.item.buttons != null) {
        if(buttonChildren.length > 4){
		if(buttonChildren.length == 5){
		children.add(
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
		children.add(
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
		if(buttonChildren.length == 6){
		children.add(
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
		children.add(
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
		if(buttonChildren.length == 7){
		children.add(
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
		children.add(
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
				if(buttonChildren.length == 8){
		children.add(
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
		children.add(
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
		children.add(
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
      children: children,
    );
  }
}

Widget itemBrowseProjectsButton(ItemBrowseProjectsModel? destination, int?  index, BuildContext context){
  BrowseProjectsController browse_projects; 
  
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
                        
                        browse_projects =  BrowseProjectsController(AppProvider.getApplication(context),
                        Env.value!.baseUrl! + destination!.item.buttons[index].url,
                        AppAction.post,
                        '',
                        'projectscoiddownloadFile',
                        null,
						false);
                        final future = browse_projects.downloadFile();
                        future.then((value) {
                       // state.setState(() {
                       // postBrowseProjectsResult = value;
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



class ItemBrowseProjectsWidget extends StatelessWidget {

	final ItemBrowseProjectsModel? item;
	final String?search;
	const  ItemBrowseProjectsWidget({Key? key, @required this.item, this.search}) : super(key: key);


	@override
	Widget build(BuildContext context) {
		return Visibility (
			// visible: (this.search == '' || this.browse_projects.item.title.contains(this.search) || this.browse_projects.items.items.article.contains(this.search)),
			visible: (this.search == '' || allModelWords(jsonEncode(this.item!.item!.toJson())).contains(this.search!)),
			child: ListTile(
				leading:  Container(
					height: 50.0,
					width : 50.0,
					child:

					ClipRRect(
						borderRadius: BorderRadius.circular(50),
						child: Image.network( this.item!.item!.pht,
						),
					),

				),
				title: Text(this.item!.item!.ttl),
				isThreeLine: true,
				subtitle: Html(
						data:item!.item!.sbttl ,
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
						"/public/browse_projects/view/" + this.item!.item!.id + "/" +
								// this.browse_projects.title.replaceAll(' ', '-'))},
								"title");},
			),
		);
	}
}


SpeedDialChild ListButtonBrowseProjectsWidget(Button button, BuildContext context, bool?account){
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
                        child: Icon(Icons.search),
                        backgroundColor: Colors.green,
                        label: button.text == 'Order by ...' ?  button.text :'Order : ' + button!.text!,
                        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                        onTap: (){

                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '28_3d-modeling-and-animation',
                            '3D Modeling & Animation',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '24_accounting-and-consultancy',
                            'Accounting & Consultancy',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '16_audio-video-and-photography',
                            'Audio Video & Photography',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '29_data-entry-and-data-mining',
                            'Data Entry & Data Mining',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '2_desktop-programming',
                            'Desktop Programming',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '31_electronis-and-robotics',
                            'Electronis & Robotics',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '8_game-programming',
                            'Game Programming',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '18_internet-marketing-and-social-media',
                            'Internet marketing & Social Media',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '10_layout-logo-and-graphic-design',
                            'Layout Logo & Graphic Design',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '4_mobile-programming',
                            'Mobile Programming',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '26_network-and-system-administration',
                            'Network & System Administration',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '14_seo-and-website-maintenance',
                            'SEO & Website Maintenance',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '6_website-development',
                            'Website Development',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '12_writing-and-translation',
                            'Writing & Translation',
                            false,

                          ));
                          button.selections?.add(Selection(
                            'tadlhxonphile',
                            'navsai1',
                            '22_others',
                            'Others',
                            false,

                          ));

                        showSearchSelectDialog(context: context,
                        caption:button!.text!,
                        initialitems: button.selections,
                        initvalue: button.selections![0]);
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
           if(button.url!.contains('/listing') || button.url!.contains('/index')){
			          AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! + '/')) ;
           }else{
             	 AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! + '//')) ;
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






  






  

