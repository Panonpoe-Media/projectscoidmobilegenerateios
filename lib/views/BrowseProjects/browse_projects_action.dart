import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter/rendering.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:intl/intl.dart' as inter;
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart'as intl1;
import 'package:filesize/filesize.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/views/Chat/widgets/emoji_picker.dart';
import 'package:projectscoid/core/components/utility/tool/reply-input.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:camera/camera.dart' ;
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/models/MyProjects/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list_item_base.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item_base.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//////////////////

class PlaceNewBidBrowseProjects extends StatefulWidget {

  static const String PATH = '/public/browse_projects/place_new_bid/:id/:title';
  final String? id ;
  final String? title;
  PlaceNewBidBrowseProjects({Key? key, this.id, this.title}) : super(key: key);

  @override
  PlaceNewBidBrowseProjectsState createState() => PlaceNewBidBrowseProjectsState();
}

class PlaceNewBidBrowseProjectsState extends State<PlaceNewBidBrowseProjects> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/browse_projects/place_new_bid/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/add';
  String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/place_new_bid/%s/%s';

  BrowseProjectsController? place_new_bid;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelPlaceNewBid;
  var model;
  var formData;
  var postPlaceNewBidResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Place New Bid';
  late RewardedAd _rewardedAd;

  // TODO: Add _isRewardedAdReady
  bool _isRewardedAdReady = false;

  // TODO: Implement _loadRewardedAd()
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {

              setState(() {
                _isRewardedAdReady = false;
              });
             // _loadRewardedAd();
            },
          );

          setState(() {
            _isRewardedAdReady = true;

          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
          setState(() {
            _isRewardedAdReady = false;
          });
        },
      ),
    );
  }
 
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'PlaceNewBid';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
    _loadRewardedAd();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(BrowseProjectsController? place_new_bid , BuildContext context)async {
    if (this.model == null) {
       final future = place_new_bid!.getPlaceNewBidBrowseProjects('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Place New Bid', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }

   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('PlaceNewBid')){
										place_new_bid!.deleteAllPlaceNewBidBrowseProjects(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('PlaceNewBid')){
										place_new_bid!.deleteAllPlaceNewBidBrowseProjects(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('PlaceNewBid')){
										place_new_bid!.deleteAllPlaceNewBidBrowseProjects(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PlaceNewBid')){
										place_new_bid!.deleteAllPlaceNewBidBrowseProjects(this.model.model.model.user_id);
										}else{
										place_new_bid!.deleteAllPlaceNewBidBrowseProjects('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.attachments= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PlaceNewBid')){
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													place_new_bid!.savePlaceNewBidBrowseProjects(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}

  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    place_new_bid =    BrowseProjectsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);

	 fetchData(place_new_bid, context);
	 if(_isRewardedAdReady){
     setState(() {
       _isRewardedAdReady = false;
     });
     _rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
       // Reward the user for watching an ad.
     });
   }
      return

     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Place New Bid', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewProjectTitle(context),
                              this.model.viewProjectOwner(context),
                              this.model.viewDescription(context),
                              this.model.viewPublishedBudget(context),
                              this.model.editAmount(this), 							  
                              this.model.editMessage(this), 							  
                              this.model.editAttachments(this), 							  
                              this.model.editCaptcha(this), 							  
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
                            isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,place_new_bid, postPlaceNewBidResult, this, sendPath, widget.id!, widget.title!),
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,place_new_bid, postPlaceNewBidResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
  
   
}




//////////////////


class AskOwnerBrowseProjects extends StatefulWidget {

  static const String PATH = '/public/browse_projects/ask_owner/:id/:title';
  final String? id ;
  final String? title;
  AskOwnerBrowseProjects({Key? key, this.id, this.title}) : super(key: key);

  @override
  AskOwnerBrowseProjectsState createState() => AskOwnerBrowseProjectsState();
}

class AskOwnerBrowseProjectsState extends State<AskOwnerBrowseProjects> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/browse_projects/ask_owner/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/add';
  String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/ask_owner/%s/%s';

  BrowseProjectsController? ask_owner;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelAskOwner;
  var model;
  var formData;
  var postAskOwnerResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Ask Owner';
 
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'AskOwner';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(BrowseProjectsController? ask_owner , BuildContext context)async {
    if (this.model == null) {
       final future = ask_owner!.getAskOwnerBrowseProjects('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Ask Owner', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('AskOwner')){
										ask_owner!.deleteAllAskOwnerBrowseProjects(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('AskOwner')){
										ask_owner!.deleteAllAskOwnerBrowseProjects(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('AskOwner')){
										ask_owner!.deleteAllAskOwnerBrowseProjects(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AskOwner')){
										ask_owner!.deleteAllAskOwnerBrowseProjects(this.model.model.model.user_id);
										}else{
										ask_owner!.deleteAllAskOwnerBrowseProjects('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.attachments= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													ask_owner!.saveAskOwnerBrowseProjects(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AskOwner')){
													ask_owner!.saveAskOwnerBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													ask_owner!.saveAskOwnerBrowseProjects(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    ask_owner =    BrowseProjectsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(ask_owner, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Ask Owner', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewProject(context),
                              this.model.editMessage(this), 							  
                              this.model.editAttachments(this), 							  
                              this.model.editCaptcha(this), 							  
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
                            isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,ask_owner, postAskOwnerResult, this, sendPath, widget.id!, widget.title!),
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,ask_owner, postAskOwnerResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


//////////////////


class GuestCreateProjectBrowseProjects extends StatefulWidget {

  static const String PATH = '/public/browse_projects/guest_create_project/:id/:title';
  final String? id ;
  final String? title;
  GuestCreateProjectBrowseProjects({Key? key, this.id, this.title}) : super(key: key);

  @override
  GuestCreateProjectBrowseProjectsState createState() => GuestCreateProjectBrowseProjectsState();
}

class GuestCreateProjectBrowseProjectsState extends State<GuestCreateProjectBrowseProjects> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/browse_projects/guest_create_project/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/add';
  String? sendPath = Env.value!.baseUrl! + '/public/browse_projects/guest_create_project/%s/%s';

  BrowseProjectsController? guest_create_project;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelGuestCreateProject;
  var model;
  var formData;
  var postGuestCreateProjectResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Guest Create Project';
 
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'GuestCreateProject';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(BrowseProjectsController? guest_create_project , BuildContext context)async {
    if (this.model == null) {
       final future = guest_create_project!.getGuestCreateProjectBrowseProjects('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Guest Create Project', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('GuestCreateProject')){
										guest_create_project!.deleteAllGuestCreateProjectBrowseProjects(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('GuestCreateProject')){
										guest_create_project!.deleteAllGuestCreateProjectBrowseProjects(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('GuestCreateProject')){
										guest_create_project!.deleteAllGuestCreateProjectBrowseProjects(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('GuestCreateProject')){
										guest_create_project!.deleteAllGuestCreateProjectBrowseProjects(this.model.model.model.user_id);
										}else{
										guest_create_project!.deleteAllGuestCreateProjectBrowseProjects('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.attachments= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('GuestCreateProject')){
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,this.model.model.model.user_id);
													}else{
													guest_create_project!.saveGuestCreateProjectBrowseProjects(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    guest_create_project =    BrowseProjectsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(guest_create_project, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Guest Create Project', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.editPickUserName(this), 							  
                              this.model.editEnterEmailAddress(this), 							  
                              this.model.editHandphone(this), 							  
                              this.model.editTitle(this), 							  
                              this.model.editDescription(this), 							  
                              this.model.editAttachments(this), 							  
                              this.model.editFinishDays(this), 							  
                              this.model.editBudgetRange(this), 							  
                              this.model.editChannels(this), 							  
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
                            isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,guest_create_project, postGuestCreateProjectResult, this, sendPath, widget.id!, widget.title!),
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,guest_create_project, postGuestCreateProjectResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

