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
/** AUTOGENERATE OFF **/

//////////////////


class EditProfileMyProfile extends StatefulWidget {

  final String? id ;
  final String? title;
  final bool? appbar;
  static const String PATH = '/user/my_profile/edit_profile/:id/:title';
  EditProfileMyProfile({Key? key, this.id, this.title, this.appbar}) : super(key: key);

  @override
  EditProfileMyProfileState createState() => EditProfileMyProfileState();
}

class EditProfileMyProfileState extends State<EditProfileMyProfile> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/edit_profile/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_profile/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_profile/edit_profile/%s/%s';

  MyProfileController? edit_profile;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelEditProfile;
  var model;
  var formData;
  var postEditProfileResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Edit Profile';
   RewardedAd? _rewardedAd;

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

            //  setState(() {
                _isRewardedAdReady = false;
            //  });
             // _loadRewardedAd();
            },
          );

        //  setState(() {
            _isRewardedAdReady = true;

        //  });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        //  setState(() {
            _isRewardedAdReady = false;
       //   });
        },
      ),
    );
  }
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'EditProfile';

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
 fetchData(MyProfileController? edit_profile , BuildContext context)async {
    if (this.model == null) {
       final future = edit_profile!.getEditProfileMyProfile('');
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
               content: Text('Unauthorized  :'+ sprintf('Edit Profile', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('EditProfile')){
										edit_profile!.deleteAllEditProfileMyProfile(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('EditProfile')){
										edit_profile!.deleteAllEditProfileMyProfile(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('EditProfile')){
										edit_profile!.deleteAllEditProfileMyProfile(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('EditProfile')){
										edit_profile!.deleteAllEditProfileMyProfile(this.model.model.model.user_id);
										}else{
										edit_profile!.deleteAllEditProfileMyProfile('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.photo = null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.user_id);
													}else{
													edit_profile!.saveEditProfileMyProfile(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditProfile')){
													edit_profile!.saveEditProfileMyProfile(this.model,this.model.model.model.user_id);
													}else{
													edit_profile!.saveEditProfileMyProfile(this.model,'');
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
    edit_profile =    MyProfileController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(edit_profile, context);
	
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,

                appBar: widget.appbar == null?
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
                                Text('Edit Profile', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ): null,




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
                              
                                
                              this.model.viewUserName(context),
                              this.model.viewEmail(context),
                              this.model.editPhoto(this), 							  
                              this.model.editDisplayName(this), 							  
                              this.model.editBirthDate(this), 							  
                              this.model.editJenisKelamin(this), 							  
                              this.model.editAddress(this), 							  
                              this.model.editCountry(this), 							  
                              this.model.editProvinsi(this), 							  
                              this.model.editKabupaten(this), 							  
                              this.model.editKecamatan(this), 							  
                              this.model.editKelurahan(this), 							  
                              this.model.editPostCode(this), 							  
                              this.model.editSelfIntroduction(this), 							  
                              this.model.editWebsite(this), 							  
                              this.model.editLanguage(this), 							  
                              this.model.editNotifyMeNewProjects(this), 							  
                              this.model.editSkills(this), 							  
                              
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
							
							   isLoading!? [] : isError? null: this.model.RButtons(_rewardedAd,_isRewardedAdReady, context, _dialVisible, formKey, controller,edit_profile, postEditProfileResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,edit_profile, postEditProfileResult, this, sendPath, widget.id!, widget.title!),
                    

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

class PortofolioMyProfile extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_profile/portofolio/:id/:title';
  PortofolioMyProfile({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  PortofolioMyProfileState1 createState() => PortofolioMyProfileState1();
}

class  PortofolioMyProfileState1 extends State<PortofolioMyProfile> with TickerProviderStateMixin<PortofolioMyProfile>, RestorationMixin{
  String? title = 'Portofolio'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/';
  
   ScrollController?  scrollController;
  
  MyProfileController? portofolio;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  int titleindex = 0;
  String? tempheader = '';
   double initscroll = 0.0;
  AccountController? accountController;
	final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
	   List<Map> listAccount = [];
	   
   
	
	
	int firstIndex = 0;
	var _keys = {};
   List<int> _selectedItemsIndex = [];
   List<String> _selectedItems = [];
   bool isMultiSelected = false;

  PortofolioMyProfileState1() {
   // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'Portofolio';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Portofolio');
  }

  

  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
	}
	      final prefs = SharedPreferences.getInstance();
		   prefs.then((val){
			 initscroll = val.getDouble("position")!;
			 if(initscroll != 0.0 || initscroll != null ){
			   scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
			   scrollController!.addListener(_onScroll);
			 } else {
			   scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
			   scrollController!.addListener(_onScroll);
			 }
		   });
	
	
    portofolio =  MyProfileController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	portofolio!.listMyProfilePortofolio();
    portofolio!.listingPortofolio!.add(PortofolioMyProfileList());
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	
	
	    final future = accountController!.getAccount();
		future.then((val){
		 //List<Map> listAccount = [];
		  listAccount.addAll(val);
		  if(listAccount.length == 0){
			account = false;
		  }else{
			  account = true;
			
		  }
		});
	
	
	///////////
	
    return Scaffold(
	 backgroundColor: darkMode? Colors.black : Colors.white,
        appBar: AppBar(
		  iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				  ),
	  leading:    IconButton(
              icon:    Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setDouble("position", 0.0);

                  Navigator.pop(context);

                // Navigator.pop(context);

              }
          ),
          actions: <Widget>[
            IconButton(

                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (!selected) {
                    setState(() {
                      selected = true;
                    });
                  } else {
                    setState(() {
                      selected = false;
                    });
                  }
                }
            )
          ],
          title: selected? buildSearchBar(title!) : Text(title!, style: TextStyle(color: Colors.white))  ,
        ),
        body: buildListingBar()
    );
  }

 
  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }
  
  
	 
	 
  
  
  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style:    TextStyle(
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

           // hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  

    		var listViewKey = RectGetter.createGlobalKey();

   // @override
   Widget buildListingBar2(){  
  
    return BlocBuilder<PortofolioMyProfileListing, PortofolioMyProfileState>(
      bloc: portofolio!.listingPortofolio,

      builder: (BuildContext context, state) {
        if (state is PortofolioMyProfileListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
		 /*
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
		  */
				 return    Center( 
					   child:CircularProgressIndicator(
					   valueColor:    AlwaysStoppedAnimation<Color>(
						Colors.green),
					  ));
        }
        if (state is PortofolioMyProfileListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is PortofolioMyProfileListingLoaded) {
          if (state.portofolio!.items.items.isEmpty) {
		  if (state.portofolio!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
					floatingActionButton: state.portofolio!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.portofolio!.tools.buttons.length == 0){ 
			var sc = [];
              sc.addAll(state.portofolio!.items.items.reversed);
			   
				  return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length ?
								       state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserPortofolioMyProfileBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					
							
                   
			 );				
			}
			var sc = [];
			 sc.addAll(state.portofolio!.items.items.reversed);
			
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length ?
								       state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserPortofolioMyProfileBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.portofolio!.Buttons(context, _dialVisible, widget.id!)
							
                   
			 );
        }
		
		
		return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }
  
  
  
  
  
   Widget buildListingBar(){  
  
    return BlocBuilder<PortofolioMyProfileListing, PortofolioMyProfileState>(
      bloc: portofolio!.listingPortofolio,

      builder: (BuildContext context, state) {
        if (state is PortofolioMyProfileListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is PortofolioMyProfileListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is PortofolioMyProfileListingLoaded) {
          if (state.portofolio!.items.items.isEmpty) {
		  if (state.portofolio!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
				   
					
					floatingActionButton: state.portofolio!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.portofolio!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length?  
									  state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  
									  UserPortofolioMyProfileBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
			var sc = [];
              sc.addAll(state.portofolio!.items.items.reversed);
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length ?
								       state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserPortofolioMyProfileBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.portofolio!.Buttons(context, _dialVisible, widget.id!)
							
                   
			 );
        }
		
		return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    portofolio!.listingPortofolio!.dispose();
	
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    portofolio!.listingPortofolio!.add(PortofolioMyProfileListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll()async{
    final maxScroll = scrollController!.position.maxScrollExtent;
    double currentScroll = scrollController!.position.pixels;
	    final prefs = await SharedPreferences.getInstance();
         prefs.setDouble("position", scrollController!.position.pixels);
	
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      portofolio!.listingPortofolio!.add(PortofolioMyProfileList());
    }

  }

}

class  UserPortofolioMyProfileBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}


//////////////////


class ChangePasswordMyProfile extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_profile/change_password/:id/:title';
  ChangePasswordMyProfile({Key? key, this.id, this.title}) : super(key: key);

  @override
  ChangePasswordMyProfileState createState() => ChangePasswordMyProfileState();
}

class ChangePasswordMyProfileState extends State<ChangePasswordMyProfile> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/change_password/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_profile/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_profile/change_password/%s/%s';

  MyProfileController? change_password;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelChangePassword;
  var model;
  var formData;
  var postChangePasswordResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Change Password';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ChangePassword';

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
 fetchData(MyProfileController? change_password , BuildContext context)async {
    if (this.model == null) {
       final future = change_password!.getChangePasswordMyProfile('');
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
               content: Text('Unauthorized  :'+ sprintf('Change Password', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('ChangePassword')){
										change_password!.deleteAllChangePasswordMyProfile(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('ChangePassword')){
										change_password!.deleteAllChangePasswordMyProfile(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('ChangePassword')){
										change_password!.deleteAllChangePasswordMyProfile(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ChangePassword')){
										change_password!.deleteAllChangePasswordMyProfile(this.model.model.model.user_id);
										}else{
										change_password!.deleteAllChangePasswordMyProfile('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_password!.saveChangePasswordMyProfile(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangePassword')){
													change_password!.saveChangePasswordMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_password!.saveChangePasswordMyProfile(this.model,'');
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
    change_password =    MyProfileController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(change_password, context);
	
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                //

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
                          
                    child:    this.model.injectAction(context, _dialVisible, formKey, controller,change_password, postChangePasswordResult, this, sendPath, widget.id!, widget.title!, isLoading)
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,change_password, postChangePasswordResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class ChangeEmailMyProfile extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_profile/change_email/:id/:title';
  ChangeEmailMyProfile({Key? key, this.id, this.title}) : super(key: key);

  @override
  ChangeEmailMyProfileState createState() => ChangeEmailMyProfileState();
}

class ChangeEmailMyProfileState extends State<ChangeEmailMyProfile> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/change_email/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_profile/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_profile/change_email/%s/%s';

  MyProfileController? change_email;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelChangeEmail;
  var model;
  var formData;
  var postChangeEmailResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Change Email';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ChangeEmail';

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
 fetchData(MyProfileController? change_email , BuildContext context)async {
    if (this.model == null) {
       final future = change_email!.getChangeEmailMyProfile('');
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
               content: Text('Unauthorized  :'+ sprintf('Change Email', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('ChangeEmail')){
										change_email!.deleteAllChangeEmailMyProfile(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('ChangeEmail')){
										change_email!.deleteAllChangeEmailMyProfile(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('ChangeEmail')){
										change_email!.deleteAllChangeEmailMyProfile(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ChangeEmail')){
										change_email!.deleteAllChangeEmailMyProfile(this.model.model.model.user_id);
										}else{
										change_email!.deleteAllChangeEmailMyProfile('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_email!.saveChangeEmailMyProfile(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangeEmail')){
													change_email!.saveChangeEmailMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_email!.saveChangeEmailMyProfile(this.model,'');
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
    change_email =    MyProfileController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(change_email, context);
	
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                //

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
                          
                    child:    this.model.injectAction(context, _dialVisible, formKey, controller,change_email, postChangeEmailResult, this, sendPath, widget.id!, widget.title!, isLoading)
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,change_email, postChangeEmailResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class ChangeHandphoneMyProfile extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_profile/change_handphone/:id/:title';
  ChangeHandphoneMyProfile({Key? key, this.id, this.title}) : super(key: key);

  @override
  ChangeHandphoneMyProfileState createState() => ChangeHandphoneMyProfileState();
}

class ChangeHandphoneMyProfileState extends State<ChangeHandphoneMyProfile> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/change_handphone/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_profile/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_profile/change_handphone/%s/%s';

  MyProfileController? change_handphone;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelChangeHandphone;
  var model;
  var formData;
  var postChangeHandphoneResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Change Handphone';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ChangeHandphone';

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
 fetchData(MyProfileController? change_handphone , BuildContext context)async {
    if (this.model == null) {
       final future = change_handphone!.getChangeHandphoneMyProfile('');
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
               content: Text('Unauthorized  :'+ sprintf('Change Handphone', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('ChangeHandphone')){
										change_handphone!.deleteAllChangeHandphoneMyProfile(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('ChangeHandphone')){
										change_handphone!.deleteAllChangeHandphoneMyProfile(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('ChangeHandphone')){
										change_handphone!.deleteAllChangeHandphoneMyProfile(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ChangeHandphone')){
										change_handphone!.deleteAllChangeHandphoneMyProfile(this.model.model.model.user_id);
										}else{
										change_handphone!.deleteAllChangeHandphoneMyProfile('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_handphone!.saveChangeHandphoneMyProfile(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ChangeHandphone')){
													change_handphone!.saveChangeHandphoneMyProfile(this.model,this.model.model.model.user_id);
													}else{
													change_handphone!.saveChangeHandphoneMyProfile(this.model,'');
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
    change_handphone =    MyProfileController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(change_handphone, context);
	
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                //

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
                          
                    child:    this.model.injectAction(context, _dialVisible, formKey, controller,change_handphone, postChangeHandphoneResult, this, sendPath, widget.id!, widget.title!, isLoading)
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,change_handphone, postChangeHandphoneResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

