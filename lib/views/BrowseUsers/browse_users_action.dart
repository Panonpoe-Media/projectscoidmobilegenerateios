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
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
/** AUTOGENERATE OFF **/

class InviteToBidBrowseUsers extends StatefulWidget {

  static const String PATH = '/public/browse_users/invite_to_bid/:id/:title';
  final String? id ;
  final String? title;
  InviteToBidBrowseUsers({Key? key, this.id, this.title}) : super(key: key);

  @override
  InviteToBidBrowseUsersState createState() => InviteToBidBrowseUsersState();
}

class InviteToBidBrowseUsersState extends State<InviteToBidBrowseUsers> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/browse_users/invite_to_bid/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/public/browse_users/add';
  String? sendPath = Env.value!.baseUrl! + '/public/browse_users/invite_to_bid/%s/%s';

  BrowseUsersController? invite_to_bid;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelInviteToBid;
  var model;
  var formData;
  var postInviteToBidResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Invite to Bid';
  final List<Widget> actionChildren = <Widget>[
	];

  List<dynamic> multiSelectedOption = [];
  final _selectedOptionsController = BehaviorSubject();
  Stream get selectedOptionsToggleStream => _selectedOptionsController.stream;

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'InviteToBid';

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
 fetchData(BrowseUsersController? invite_to_bid , BuildContext context)async {
    if (this.model == null) {
       final future = invite_to_bid!.getInviteToBidBrowseUsers('');
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
               content: Text('Unauthorized  :'+ sprintf('Invite to Bid', [widget.id!,widget.title!])),
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
								    if([ 'PlaceNewBid'].contains('InviteToBid')){
										invite_to_bid!.deleteAllInviteToBidBrowseUsers(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('InviteToBid')){
										invite_to_bid!.deleteAllInviteToBidBrowseUsers(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('InviteToBid')){
										invite_to_bid!.deleteAllInviteToBidBrowseUsers(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('InviteToBid')){
										invite_to_bid!.deleteAllInviteToBidBrowseUsers(this.model.model.model.user_id);
										}else{
										invite_to_bid!.deleteAllInviteToBidBrowseUsers('');
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
											  
												if([ 'PlaceNewBid'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.user_id);
													}else{
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('InviteToBid')){
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,this.model.model.model.user_id);
													}else{
													invite_to_bid!.saveInviteToBidBrowseUsers(this.model,'');
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



  void multiSelectOption(dynamic option) {
    // print(message);
    // if (multiSelectedMessage != null) {
    // selectedMessage =
    // message['time'] == selectedMessage['time'] ? null : message;

    if (multiSelectedOption.length == 0) {
      multiSelectedOption.add(option);
      setState(() {
       // this.model!.model!.price = this.model!.model!.price + option['price'];
      });
    } else {
      var msm = multiSelectedOption;
      bool? isSelect = true;
      int count = 0;
      for (var item in msm) {
        if (item['title'] == option['title']) {
          multiSelectedOption.removeAt(count);
          setState(() {
          //  this.model!.model!.price =
             //   this.model!.model!.price - option['price'];
          });
          isSelect = false;
          break;
        }
        count++;
      }
      if (isSelect!) {
        multiSelectedOption.add(option);
        setState(() {
         // this.model!.model!.price = this.model!.model!.price + option['price'];
        });
      }
    }

    // } else {
    //   multiSelectedMessage = [];

    //   multiSelectedMessage.add(message);
    // }

    _selectedOptionsController.add(multiSelectedOption);
  }

  IconData getIconData(List<dynamic>? multiSelectedOption, dynamic option) {
    //  print('heloooooooooo');
    if (multiSelectedOption != null) {
      if (multiSelectedOption.length == 1) {
        if (option['title'] == multiSelectedOption[0]['title']) {
          return Icons.check_box_outline_blank_sharp;
        } else {
          return Icons.check_box_outlined;
        }
      } else {
        var msm = multiSelectedOption;
        bool? isSelect = false;
        int count = 0;
        for (var item in msm) {
          if (item['title'] == option['title']) {
            isSelect = true;
          }
          count++;
        }
        if (isSelect!) {
          return Icons.check_box_outline_blank_sharp;
        } else {
          return Icons.check_box_outlined;
        }
      }
    } else {
      return Icons.check_box_outlined;
    }
  }

  List<Widget> getOptions() {
   // var maskOptions = MaskOptions()..reverse = true;
   // var formatter = StringMask('#,##0', options: maskOptions);
    List<Widget> OptionsTextFields = [];

    for (int? i = 0; i! < this.model!.model!.model!.projects.length; i++) {
      if (this.model!.model!.model!.projects[i]!.title != '') {

        OptionsTextFields.add(Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 3.0, horizontal: 18.0),
            child: StreamBuilder(
                stream: selectedOptionsToggleStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return (GestureDetector(
                    child: Row(
                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              getIconData(snapshot.data,
                                  this.model!.model.model!.projects[i].toJson()),
                              //Icons.check_box_outline_blank_sharp,
                              color: Colors.amber,
                            ),
                            Text(
                              '  ${this.model!.model!.model!.projects[i]!.title} ',
                              maxLines: 2,
                            ),
                          ],
                        ),

                        // Text(' Rp. ${formatter.apply(val)},-'),

                        //  Expanded(child: OptionViewFields(i, this.optiondata)),
                        //  SizedBox(width: 16,),
                        // we need add button at last Options row
                      ],
                    ),
                    onTap: () async {
                      multiSelectOption(
                          this.model!.model!.model!.projects[i]!.toJson());
                    },
                  ));
                })));
      }
    }

    return OptionsTextFields;
  }


  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    invite_to_bid =    BrowseUsersController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(invite_to_bid, context);
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
                                Text('Invite to Bid', style: TextStyle(color: Colors.white),),
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
                              
                                
                              this.model.viewUserName(context),
                              this.model.viewDisplayName(context),
                              this.model.viewLastSeen(context),
                              this.model.viewWorkerRating(context),
                              this.model.viewProjectsCompleted(context),
                              this.model.viewCurrentProjects(context),
                              this.model.editInvitationMessage(this),
                              ...getOptions(),
                              
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
                            isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,invite_to_bid, postInviteToBidResult, this, sendPath, widget.id!, widget.title!),
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,invite_to_bid, postInviteToBidResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class HireMeBrowseUsers extends StatefulWidget {

  static const String PATH = '/public/browse_users/hire_me/:id/:title';
  final String? id ;
  final String? title;
  HireMeBrowseUsers({Key? key, this.id, this.title}) : super(key: key);

  @override
  HireMeBrowseUsersState createState() => HireMeBrowseUsersState();
}

class HireMeBrowseUsersState extends State<HireMeBrowseUsers> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/browse_users/hire_me/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/public/browse_users/add';
  String? sendPath = Env.value!.baseUrl! + '/public/browse_users/hire_me/%s/%s';

  BrowseUsersController? hire_me;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelHireMe;
  var model;
  var formData;
  var postHireMeResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Hire Me';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'HireMe';

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
 fetchData(BrowseUsersController? hire_me , BuildContext context)async {
    if (this.model == null) {
       final future = hire_me!.getHireMeBrowseUsers('');
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
               content: Text('Unauthorized  :'+ sprintf('Hire Me', [widget.id!,widget.title!])),
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
								    if([ 'PlaceNewBid'].contains('HireMe')){
										hire_me!.deleteAllHireMeBrowseUsers(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('HireMe')){
										hire_me!.deleteAllHireMeBrowseUsers(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('HireMe')){
										hire_me!.deleteAllHireMeBrowseUsers(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('HireMe')){
										hire_me!.deleteAllHireMeBrowseUsers(this.model.model.model.user_id);
										}else{
										hire_me!.deleteAllHireMeBrowseUsers('');
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
								
								  this.model.model.model.attachments= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.user_id);
													}else{
													hire_me!.saveHireMeBrowseUsers(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('HireMe')){
													hire_me!.saveHireMeBrowseUsers(this.model,this.model.model.model.user_id);
													}else{
													hire_me!.saveHireMeBrowseUsers(this.model,'');
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
    hire_me =    BrowseUsersController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(hire_me, context);
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
                                Text('Hire Me', style: TextStyle(color: Colors.white),),
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
                              
                                
                              this.model.viewPrivateWorker(context),
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
                            isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,hire_me, postHireMeResult, this, sendPath, widget.id!, widget.title!),
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,hire_me, postHireMeResult, this, sendPath, widget.id!, widget.title!),
                    

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

