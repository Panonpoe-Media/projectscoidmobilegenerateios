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


class ReportaViolation extends StatefulWidget {

  static const String PATH = '/public/support/contact_form/:id/:title';
  final String? id ;
  final String? title;
  final String? url;
  ReportaViolation({Key? key, this.id, this.title, this.url}) : super(key: key);

  @override
  ReportaViolationState createState() => ReportaViolationState();
}

class ReportaViolationState extends State<ReportaViolation> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/public/support/contact_form/%s/%s';
  // String? sendPath = Env.value!.baseUrl! + '/public/support/add';
  String? sendPath = Env.value!.baseUrl! + '/public/support/contact_form/%s/%s';

  SupportController? contact_form;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelContactForm;
  var model;
  var formData;
  var postContactFormResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Report a Violation';
  final List<Widget> actionChildren = <Widget>[
  ];

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ContactForm';

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
  fetchData(SupportController? contact_form , BuildContext context)async {
    if (this.model == null) {
      final future = contact_form!.getContactFormSupport('');
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        try{
          this.model = value;
          /*
          Permintaan Peninjauan

              Saya ingin melaporkan URL ini:
              https://.........

              Alasan:
           */
          this.model.model.model.question = 'Permintaan Peninjauan \n \n  Saya ingin melaporkan URL ini: \n ${widget.url} \n Alasan : \n';
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
               content: Text('Unauthorized  :'+ sprintf('Contact Form', [widget.id!,widget.title!])),
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
                    if([ 'PlaceNewBid'].contains('ContactForm')){
                      contact_form!.deleteAllContactFormSupport(this.model.model.model.project_title!);
                    }else if(['AskOwner'].contains('ContactForm')){
                      contact_form!.deleteAllContactFormSupport(this.model.model.model.project_id.toString());
                    }else if(['HireMe'].contains('ContactForm')){
                      contact_form!.deleteAllContactFormSupport(this.model.model.model.private_worker_id.toString());

                    }else if(['InviteToBid'].contains('ContactForm')){
                      contact_form!.deleteAllContactFormSupport(this.model.model.model.user_id);
                    }else{
                      contact_form!.deleteAllContactFormSupport('');
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

                      if([ 'PlaceNewBid'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.project_title!);
                      }else if(['AskOwner'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.project_id.toString());
                      }else if(['HireMe'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.private_worker_id.toString());

                      }else if(['InviteToBid'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.user_id);
                      }else{
                        contact_form!.saveContactFormSupport(this.model,'');
                      }
                    }else{
                      if([ 'PlaceNewBid'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.project_title!);
                      }else if(['AskOwner'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.project_id.toString());
                      }else if(['HireMe'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.private_worker_id.toString());

                      }else if(['InviteToBid'].contains('ContactForm')){
                        contact_form!.saveContactFormSupport(this.model,this.model.model.model.user_id);
                      }else{
                        contact_form!.saveContactFormSupport(this.model,'');
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
    contact_form =    SupportController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
        false);

    fetchData(contact_form, context);

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
                    Text('Report a Violation', style: TextStyle(color: Colors.white),),
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


                          this.model.editYourName(this),
                          this.model.editEmailAddress(this),
                          this.model.editQuestion(this),
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

                          isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,contact_form, postContactFormResult, this, sendPath, widget.id!, widget.title!),


                          Container(
                            height: 60,
                          ),

                        ]

                    )

                )
            ),
            //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,contact_form, postContactFormResult, this, sendPath, widget.id!, widget.title!),


          )
      );


  }


  @override
  void dispose() {
    super.dispose();
  }


}




//////////////////

