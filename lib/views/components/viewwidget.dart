import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:intl/intl.dart';
import 'dart:io';
//import 'package:downloads_path_provider/downloads_path_provider!.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'dart:io';
import 'package:projectscoid/models/file_fields.dart';
import 'package:projectscoid/models/option_fields.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:badges/badges.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_html/style.dart';

 buildDivider(Size screenSize) {
  return Column(
    children: <Widget>[
      Container(
        color: CurrentTheme.ShadeColor,
        width: screenSize.width,
        height: 0.25,
      ),
    ],
  );
 }


 buildViewHeader(String value) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 12.0,
    ),
    child: Text(
      value,
      style: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20)
    ),
  );
 }

 buildViewData(String value) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 12.0,
    ),
    child: Text(value,
      style: TextStyle(
         fontSize: 20
      ),
    ),
  );
 }


class UsernameView extends StatelessWidget{
   final String? value;
   String? caption;
   UsernameView({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
   Widget build(BuildContext context) {
          Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

     return
       ItemListString(
         // icon: Icons.calendar_today,
           tooltip: 'Send message',
           isDark: themeManager.themeMode == ThemeMode.dark? true : false,

           onPressed: (){
           },
           lines: <String>[
             caption!,
             value??'',
           ]
       );
      /*
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
                 child: buildViewHeader(caption!),
             ),
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                 child:  buildViewData DIOProvider? 
             ),
             buildDivider(screenSize),
           ]
       );

       */
   }
}


class StringView extends StatelessWidget{
   final String? value;
   String? caption;
   StringView({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
   Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

     return

       ItemListWidget(
         tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


         onPressed: (){
         },
         lines:
         caption!,
         wgt:
         Padding(
           padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
           child:   value ==''? Container(width: 0, height: 0) : Html(data: value!,   style: {
             "html": Style(
               fontSize: FontSize.medium,
             ),
             "a" : Style(color: Colors.red),
           },
               onLinkTap: (url, _, __, ___) async{
                 if(url!.contains('projects.co.id')){
                   if(url.contains(RegExp(r'[0-9]'))){
                     if(url.contains('show_conversation')){
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
                     AppProvider.getRouter(context)!.navigateTo(
                         context,
                         url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

       );

     /*
       ItemListString(
         // icon: Icons.calendar_today,
           tooltip: 'Send message',
           isDark: themeManager.themeMode == ThemeMode.dark? true : false,
           onPressed: (){
           },
           lines: <String>[
             caption!,
             value,
           ]
       );

      */
     /*
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
                 child: buildViewHeader(caption!),
             ),
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                 child:  buildViewData DIOProvider? 
             ),
             buildDivider(screenSize),
           ]
       );

      */
   }
}

class IdView extends StatelessWidget{
  final String? value;
  String? caption;
  IdView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class PasswordView extends StatelessWidget{
  String? value;
  String? caption;
  String? hidevalue;
  PasswordView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
    int? val  = value!.length;
    hidevalue = '';
    for (var i=0;i < val; i++){
      hidevalue = hidevalue! + '*';
    }
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider?.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            hidevalue??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(hidevalue ),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}
class DisplayNameView extends StatelessWidget{
  final String? value;
  String? caption;
  bool? nullvalue = false;
  DisplayNameView ({this.value, this.caption}){
    if(value == null){
      nullvalue = true;
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    TextStyle ts = TextStyle(fontSize: 14);
    return

      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child:  nullvalue!? buildViewData('') : Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                 "a" : Style(color: Colors.red),
                                                                },
              onLinkTap: (url, _, __, ___) async{
                if(url!.contains('projects.co.id')){
                  if(url.contains(RegExp(r'[0-9]'))){
                    if(url.contains('show_conversation')){
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
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  nullvalue!? buildViewData('') : Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                }, backgroundColor: CurrentTheme.BackgroundColor,
                  onLinkTap: (url) async{
                    if(url!.contains('projects.co.id')){
                      if(url!.contains(RegExp(r'[0-9]'))){
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
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            url!.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
            buildDivider(screenSize),
          ]
      );

     */
  }
}
class TitleView extends StatelessWidget{
  final String? value;
  String? caption;
  TitleView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class EmailView extends StatelessWidget{
  final String? value;
  String? caption;
  EmailView({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
     /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

      */
  }
}

class ModelView extends StatelessWidget{
  final int? value;
  String? caption;
  List<String?>? selection = [];
  List<int?>? idenum = [];
  String? nameenum ;
  String? enumname;
  ModelView ({this.value, this.caption, this.idenum, this.nameenum}){
    // _idenum.clear();
    if(value == null){
      enumname = '';
      //this.caption = this.caption + ':';
    }else {
      if(value == 0){
        enumname = '';
        //this.caption = this.caption + ':';
      }else {
        enumname = nameenum ;
        //this.caption = this.caption + ':';
      }
    }

    //items = getDropDownMenuItems();
  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    TextStyle ts = TextStyle(fontSize: 12, color: CurrentTheme.InvertedTextColor);
    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child:   Html(data: enumname,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                 "a" : Style(color: Colors.red),
                                                                },
              onLinkTap: (url, _, __, ___) async{
                if(url!.contains('projects.co.id')){
                  if(url.contains(RegExp(r'[0-9]'))){
                    if(url.contains('show_conversation')){
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
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

      );

    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 2.0, 8.0, 6.0),
              child:   Html(data: enumname,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                }, backgroundColor: CurrentTheme.BackgroundColor,
                  onLinkTap: (url) async{
                    if(url!.contains('projects.co.id')){
                      if(url!.contains(RegExp(r'[0-9]'))){
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
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            url!.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class EnumView extends StatelessWidget{
  final int? value;
  String? caption;
  List<String?>? selectionlist;
  List<String?>? selection = [];
  List<int?>? idenum = [];
  String? nameenum = '';
  String? enumname;
  EnumView ({this.value, this.caption, this.idenum, this.nameenum}){
    if(value == null){
      enumname = '';
      //this.caption = this.caption + ':';
    }else {
      if(value == 0){
        enumname = '';
        //this.caption = this.caption + ':';
      }else {
        enumname = nameenum;
        //this.caption = this.caption + ':';
      }
    }
    //items = getDropDownMenuItems();
  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    TextStyle ts = TextStyle(fontSize: 12, color: CurrentTheme.InvertedTextColor);
    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child:   Html(data: enumname,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                              "a" : Style(color: Colors.red),
                                                                },
              onLinkTap: (url, _, __, ___)async{
                if(url!.contains('projects.co.id')){
                  if(url.contains(RegExp(r'[0-9]'))){
                    if(url.contains('show_conversation')){
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
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 2.0, 8.0, 6.0),
              child:   Html(data: enumname,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                }, backgroundColor: CurrentTheme.BackgroundColor,
                  onLinkTap: (url) async{
                    if(url!.contains('projects.co.id')){
                      if(url!.contains(RegExp(r'[0-9]'))){
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
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            url!.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
            buildDivider(screenSize),
          ]
      );

     */
  }
}
class AddressView extends StatelessWidget{
  final String? value;
  String? caption;
  AddressView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}




class MultilineView extends StatelessWidget{
  final String? value;
  String? caption;
  MultilineView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    TextStyle ts = TextStyle(fontSize: 12);
    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child:  Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                 "a" : Style(color: Colors.red),
                                                                },
              onLinkTap: (url, _, __, ___)async{
                if(url!.contains('projects.co.id')){
                  if(url.contains(RegExp(r'[0-9]'))){
                    if(url.contains('show_conversation')){
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
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                }, backgroundColor: CurrentTheme.BackgroundColor,
                  onLinkTap: (url) async{
                    if(url!.contains('projects.co.id')){
                      if(url!.contains(RegExp(r'[0-9]'))){
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
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            url!.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class DateView extends StatelessWidget{
  final DateTime? value;
  String? caption;
  bool? nullvalue = false;
  DateView({this.value, this.caption}){
    if(value == null){
      nullvalue = true;
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            nullvalue!? '': DateFormat('dd/MM/yyyy').format (value!),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: nullvalue!? buildViewData('')  : buildViewData(DateFormat('dd/MM/yyyy').format(value!)),
            ),
            buildDivider(screenSize),
          ]
      );
      */

  }
}

class DateTimeView extends StatelessWidget{
  final DateTime? value;
  String? caption;
  bool? nullvalue = false;
  DateTimeView ({this.value, this.caption}){
    if(value == null){
      nullvalue = true;
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            nullvalue!? '': DateFormat('dd/MM/yyyy HH:mm:ss').format (value!),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: nullvalue!? buildViewData('')  : buildViewData(DateFormat('dd/MM/yyyy HH:mm:ss').format(value!)),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class TimeView extends StatelessWidget{
  final DateTime? value;
  String? caption;
  bool? nullvalue = false;
  TimeView ({this.value, this.caption}){
    if(value == null){
      nullvalue = true;
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            nullvalue!? '': DateFormat('h:mm a').format (value!),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: nullvalue!? buildViewData('')  :buildViewData(DateFormat('h:mm a').format(value!)),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class RatingView extends StatelessWidget{
  final int? value;
  String? caption;
  double? rat;
  RatingView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
    rat = value! * 0.50 - 0.01;

  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
            child:// <Widget>[

            Container(
              // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                alignment: Alignment.center,
                height: 46.0,

                child:
                RatingBarIndicator(
                  rating: rat!,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: CurrentTheme.PrimaryLightColor,
                  ),
                  itemCount: 5,
                  itemSize: 35.0,
                  unratedColor: Colors.black26,
                  direction:  Axis.horizontal,
                ),

            )

        ),

      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
              Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:// <Widget>[

                    Container(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                    alignment: Alignment.center,
                    height: 46.0,

                    child:  SmoothStarRating(
                            rating: rat!,
                            size: 35,
                            starCount: 5,
                            // allowHalfRating: true,
                            allowHalfRating: false,
                            )
          )

    ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class NumberView extends StatelessWidget{
  final int? value;
  String? caption;
  NumberView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value!.toString(),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(value.toString()),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}
class MoneyView extends StatelessWidget{
  final double? value;

  String? val;
  String? caption;
  MoneyView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
    this.val = value!.toString().replaceAll('.0', '');
    print('my val $val');

   }
  Widget build(BuildContext context) {
    var maskOptions = MaskOptions()
      ..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            'Rp ' + formatter.apply(val??''),// + ' ,-',
          ]
      );
       /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData('Rp. ' + formatter.apply(val) + ' ,-'),
            ),
            buildDivider(screenSize),
          ]
      );

        */
  }
}
class DoubleView extends StatelessWidget{
  final double? value;
  String? caption;
  DoubleView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value!.toString(),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(value.toString()),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class BooleanView extends StatelessWidget{
  final bool? value;
  String? caption;
  String? boolval;
  int? val;
  BooleanView({this.value, this.caption}){
    //this.caption = this.caption + ':';
    if(value!) boolval = 'Yes';
        else  boolval = 'No';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            boolval??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(boolval),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class PercentView extends StatelessWidget{
  final int? value;
  String? caption;
  PercentView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value!.toString(),
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(value.toString() + ' %'),
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class WebsiteView extends StatelessWidget{
  final String? value;
  String? caption;
  bool? isnull = false;
  WebsiteView ({this.value, this.caption}){
    if(value == null){
      isnull = true;
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            isnull!?  '': value!,
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: isnull!? buildViewData(''): buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

class ArticleView extends StatelessWidget{
 String? value;
  String? caption;
  ArticleView ({this.value, this.caption}){
    if(value == null){
      value = '';
      //this.caption = this.caption + ':';
    }
    //this.caption = this.caption + ':';
  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    TextStyle ts = TextStyle(fontSize: 12);
    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
            ),
            child:   Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                 "a" : Style(color: Colors.red),
                                                                },
                onLinkTap: (url, _, __, ___)async{
                  if(url!.contains('projects.co.id')){
                    if(url.contains(RegExp(r'[0-9]'))){
                      if(url.contains('show_conversation')){
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
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

        ),
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: Padding(
                              padding: const EdgeInsets.only(
                              left: 12.0,
                              ),
                              child:   Html(data: value!,   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,          
                                                                 ),
                                                                }, backgroundColor: CurrentTheme.BackgroundColor,
                                  onLinkTap: (url) async{
                                    if(url!.contains('projects.co.id')){
                                      if(url!.contains(RegExp(r'[0-9]'))){
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
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            url!.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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

            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}


class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key? key,
    this.label,
    this.children,
  }) : super(key: key);

  final String? label;
  final List<Widget?>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[

    ];
    if (children!.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children!.map<Widget>((Widget? chip) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: chip,
            );
          }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(
          Semantics(
            container: true,
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
              padding: const EdgeInsets.all(8.0),
              child: Text('', style: textStyle),
            ),
          ));
    }



    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Column(
          children: //null,
            // const SectionTitle(title: ''),
            cardChildren,
            // ),



        ),
      ),
    );


  /*  return Card(
        semanticContainer: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,
        )
    ); */
  }
}


class InlineTagsView extends StatelessWidget{
  List<int?>? value;
  String? caption;
  List<Widget?>? chips;
  List<int?>? idtags = [];
  List<String?>? nametags = [];
  List<String?>? tagsname = [];
  final Set<String?>? temp = Set<String?>();
  InlineTagsView ({this.value, this.caption, this.idtags, this.nametags}){
    for (var  tag in value!) {
      tagsname!.add(nametags![value!.indexOf(tag)]);
    }
  }
  static Color _nameToColor(String name) {
    assert(name.length > 1);
    final int? hash = name.hashCode & 0xffff;
    final double? hue = (360.0 * hash! / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue!, 0.4, 0.90).toColor();
  }

  static String _capitalize(String? name) {
    assert(name != null && name.isNotEmpty);
    return name!.substring(0, 1).toUpperCase() + name.substring(1);
  }
  Widget build(BuildContext context) {
    temp!.clear();
    temp!.addAll(tagsname!);
    chips = temp!.map<Widget>((String? name) {
      return Chip(
        key: ValueKey<String>(name!),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),

      );
    }).toList();
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
            child: _ChipsTile(label: '', children: chips)
            ),

            buildDivider(screenSize),
          ]
      );
  }
}

class HandphoneView extends StatelessWidget{
  final String? value;
  String? caption;
  HandphoneView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}

_buildImage(String url) {
  //TabController imagesController =
  //TabController(length: 1, vsync: this);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 250.0,
      child: Center(
        child: DefaultTabController(
          length: 1,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                  child: Image.network(
                    //imageUrl: 'https://upload.projects.co.id/upload/temp/' + url,
					 url,
                  )
              ),


              Container(
                alignment: FractionalOffset(0.5, 0.95),
                child: TabPageSelector(
                  //controller: imagesController,
                  selectedColor: Colors.grey,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class ImageView extends StatelessWidget{
  final String? value;
  String? caption;
  ImageView({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListWidget(
        tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        wgt:
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 6.0),
          child:  _buildImage(value!),
        ),
      );
    /*
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  _buildImage DIOProvider? 
            ),
            buildDivider(screenSize),
          ]
      );

     */
  }
}



class FileView extends StatefulWidget {
  DIOProvider? provider;
  final String? value;
  final String? value1;
  String? caption;

  FileView({this.value, this.value1, this.caption}) {
    //this.caption = this.caption + ':';
  }
  @override
  State<StatefulWidget> createState() {
    return _FileViewState();
  }
}

class _FileViewState extends State<FileView>{
  DIOProvider? provider;
  String? caption;
  Directory? _downloadsDirectory;
  @override
  initState(){
    super.initState();
    initDownloadsDirectoryState();
  }

  Future<void> initDownloadsDirectoryState() async {
    Directory? downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
  /*  try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

   */

    if (Platform.isAndroid) {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });
  }


  Future _downloadFile(String? dp, String? df) async {
    this.provider = await _init();
    await provider!.downloadFile(dp!, df!).then(( response) {
      return response;
    });


  }


  Future<DIOProvider?> _init()async{
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider? provider = await DIOProvider(appDocDir.path);
    return provider;
  }
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic, fontSize: 20,decoration: TextDecoration.underline, color: Colors.blue);
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);


    return
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(widget.caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child: GestureDetector(
                 onTap: (){

                   //'${_downloadsDirectory!.path}/${widget.value}'
                   _downloadFile('${_downloadsDirectory!.path}/${widget.value}',widget.value1);
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(
                     left: 12.0,
                   ),
                   child: Text(widget.value!, style:  textStyle),

                 ),
               )

               ),
            buildDivider(screenSize),
          ]
      );
  }
}


class FileViewAtt extends StatefulWidget {
  DIOProvider?provider;
  final String? value;
  final String? value1;
  String? caption;
  BuildContext? ctx;
  var platform;
  FileViewAtt({this.value, this.value1, this.caption, this.ctx}) {
    platform = Theme.of(ctx!).platform;
    caption = caption! + ' : ';
  }
  //@override
  //State<StatefulWidget> createState() {
  //  return _FileViewStateAtt();
  //}
  @override
  _FileViewStateAtt createState() => _FileViewStateAtt();
}

class _FileViewStateAtt extends State<FileViewAtt>{

  List<_TaskInfo?>? _tasks;
  List<_ItemHolder?>? _items;
  bool? _isLoading;
  bool? _permissionReady;
  String? _localPath;
  ReceivePort _port = ReceivePort();
  bool? debug = true;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  initState(){
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    _prepare();



  }


  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }



  void _bindBackgroundIsolate() {
    bool? isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug!) {
        print('UI Isolate Callback: $data');
      }
      String? id = data[0];
      DownloadTaskStatus status = data[1];
      int? progress = data[2];

      final task = _tasks?.firstWhere((task) => task?.taskId == id);
      if (task != null) {
        //_isLoading = false;
        setState(() {
          _isLoading = false;
          task.status = status;
          task.progress = progress;
        });

      }
      if (task != null) {
        //_isLoading = false;

        if(progress == 100){
          setState(() {

          });
        }

      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }


  static void downloadCallback(
      String? id, DownloadTaskStatus status, int? progress) {
    if (true) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');

    }

    final SendPort? send =
    IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }


  String? appSugestion(String ext ){
    String? install = 'Please install ';
    String? open = 'To open your file ';

    if(['.xls','.xlsb','.xlsm','.xlsx'].contains(p.extension(ext))){
      return open + install + 'Excel application';

    }else if(['.pdf'].contains(p.extension(ext))){
      return open + install + 'PDF application';

    }else if(['.doc', '.docm', '.docx', '.dot', '.dotm', '.dotx', '.odt', '.html', '.rtf', '.xps', '.txt'].contains(p.extension(ext))){
      return open + install + 'Word application';
    }else if(['.ppt', '.pptx', '.docx', '.dot', '.dotm', '.dotx', '.odt', '.html'].contains(p.extension(ext))){
      return open + install + 'Powerpoint application';

    }else{
      return open + install + 'application suitable with your file';
    }

  }
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;

      return

        ButtonBarTheme(
          data: ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.9 * width,
          ),
          child: ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
              children: <Widget>[

                _isLoading!
                    ?
                Container(
                  height: 55.0,
                  width: 0.9 * width,
                  child:
                          const Center(
                             child: CircularProgressIndicator(),
                        )
                )
                    : _permissionReady!
                    ? Container(
                  height:_items == null ||_items == [] ? 55 : _items![0]!.task!.status == DownloadTaskStatus.complete? 80.0 : 50.0,
                  width: 0.9 * width,
                  child:
                        Container(
                        height: 36.0,
                          width: 0.7 * width,
                          child: ListView(

                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            children: _items!
                                .map((item) => item!.task == null
                                ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 1.0),
                              child: Text(
                                item.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 18.0),
                              ),
                            )
                                : Container(
                              decoration:ShapeDecoration(
                                shadows:const [
                                  BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                                ],

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(
                                      width: 3,
                                      color: Colors.lightGreen
                                  ),
                                ),

                              ),
                              height:  item.task!.status ==
                                  DownloadTaskStatus.complete
                                  ? 80 : 50.0,
                              // color: Colors.white12,
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 8.0),
                              child:
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: item.task!.status ==
                                            DownloadTaskStatus.complete
                                            ? () {
                                          _openDownloadedFile(item.task!)
                                              .then((success) {
                                            if (!success) {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text( widget.platform == TargetPlatform.android?
                                                  'Cannot open this file. \nFilename :  ${item.task!.name}. \nFile folder : Download' + Platform.pathSeparator + ' \nSuggestion : ${appSugestion(item.task!.name!)}'  : 'Cannot open this file' )));
                                            }
                                          });
                                        }
                                            : null,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              // color: Colors.white12,
                                              width: double.infinity,
                                              height: 38.0,

                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      item.name!,
                                                      maxLines: 1,
                                                      softWrap: true,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 8.0),
                                                    child: item.task!.status ==
                                                        DownloadTaskStatus.complete
                                                        ? _buildActionForTask1(
                                                        item.task!) : _buildActionForTask(
                                                        item.task!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            item.task!.status ==
                                                DownloadTaskStatus
                                                    .running ||
                                                item.task!.status ==
                                                    DownloadTaskStatus.paused
                                                ? Positioned(
                                              left: 0.0,
                                              right: 0.0,
                                              bottom: 0.0,
                                              child:
                                              LinearProgressIndicator(
                                                value: item.task!.progress! /
                                                    100,
                                              ),
                                            )
                                                : Container()
                                          ]
                                              .where((child) => child != null)
                                              .toList(),
                                        ),
                                      ),
                                      item.task!.status ==
                                          DownloadTaskStatus.complete
                                          ? widget.platform == TargetPlatform.android? Html(data :'Filepath: Download/${item.task!.name}',
                                                                                                              style: {
                                                                                                                "html": Style(
                                                                                                                  fontSize: FontSize.small,
                                                                                                                ),
                                                                                                                "a" : Style(color: Colors.red),
                                                                                                              },
                                                                                        )
                                          : Container(width: 0.0, height: 0.0,)
                                          : Container(width: 0.0, height: 0.0,),
                                    ],
                                  ),



                            ))
                                .toList(),
                          ),
                        ),


                )
                    : Container(
                  height: 200.0,
                  width: 0.9 * width,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Please grant accessing storage permission to continue -_-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 12.0),
                          ),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        FlatButton(
                            onPressed: () {
                              _checkPermission().then((hasGranted) {
                                setState(() {
                                  _permissionReady = hasGranted;
                                });
                              });
                            },
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ))
                      ],
                    ),
                  ),
                )
              ]
          ),
        )

        ;

  }



  Widget? _buildActionForTask(_TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined) {
      return RawMaterialButton(
        onPressed: () {
          _requestDownload(task);
        },
        child: Icon(Icons.file_download),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return RawMaterialButton(
        onPressed: () {
          _pauseDownload(task);
        },
        child: Icon(
          Icons.pause,
          color: Colors.red,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return RawMaterialButton(
        onPressed: () {
          _resumeDownload(task);
        },
        child: Icon(
          Icons.play_arrow,
          color: Colors.green,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.complete || task.progress == 100) {
      _prepare();
      setState(() {
        //_isLoading = false;
      });
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Ready',
            style: TextStyle(color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              _delete(task);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return Text('Canceled', style: TextStyle(color: Colors.red));
    } else if (task.status == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Failed', style: TextStyle(color: Colors.red)),
          RawMaterialButton(
            onPressed: () {
              _retryDownload(task);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.green,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else {
      return null;
    }
  }

  Widget _buildActionForTask1(_TaskInfo task) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Ready',
          style: TextStyle(color: Colors.black),
        ),
        RawMaterialButton(
          onPressed: () {
            _delete(task);
          },
          child: Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        )
      ],
    );
  }

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link!,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath!,
        showNotification: true,
        openFileFromNotification: true);
   // await _prepare();
   // setState(() {});

  }

  void _cancelDownload(_TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId!);
  }

  void _pauseDownload(_TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  void _resumeDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  void _retryDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId!);
  }

  void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: true);
    await _prepare();
    setState(() {});
  }

  Future<bool> _checkPermission() async {
    /*
    if (widget.platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;

     */

    var prm = Permission.values
        .where((permission) {
      if (Platform.isIOS) {
        return permission != Permission.unknown &&
            permission != Permission.sms &&
            permission != Permission.storage &&
            permission != Permission.ignoreBatteryOptimizations &&
            permission != Permission.accessMediaLocation &&
            permission != Permission.activityRecognition &&
            permission != Permission.manageExternalStorage &&
            permission != Permission.systemAlertWindow &&
            permission != Permission.requestInstallPackages &&
            permission != Permission.accessNotificationPolicy &&
            permission != Permission.bluetoothScan &&
            permission != Permission.bluetoothAdvertise &&
            permission != Permission.bluetoothConnect;
      } else {

        return permission == Permission.storage;
            //||
           // permission == Permission.manageExternalStorage;
      }
    }).toList();//.map((permission)async{ await _requestPermission(permission);});
   // prm.forEach((element)async{ return await _requestPermission(element);

   // });

    return await _requestPermission(prm[0]);



  }


  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
  //  print('haloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
   // setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    if(_permissionStatus.isGranted){return true;}else{
      return false;
    }
   // });

  }


  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    final _documents = [
      {
        'name': '${widget.value}',
        'link':
        '${widget.value1}'
      }
    ];
    _items = [];

    _tasks!.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    //_items!.add(_ItemHolder(name: 'Documents'));
    for (int i = count; i < _tasks!.length; i++) {
      _items!.add(_ItemHolder(name: _tasks![i]!.name!, task: _tasks![i]!));
      count++;
    }


    tasks?.forEach((task) {
      for (_TaskInfo? info in _tasks!) {
        if (info?.link == task.url) {
          info?.taskId = task.taskId;
          info?.status = task.status;
          info?.progress = task.progress;
        }
      }
    });
    _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
      });
    });
    //_permissionReady = await _checkPermission();
    widget.platform == TargetPlatform.android ? _localPath = (_findLocalPath()): _localPath = (_findLocalPath())! + Platform.pathSeparator + 'ProjectscoidDownload';
   // _localPath = (_findLocalPath()) ;

    final savedDir = Directory(_localPath!);
    bool? hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  /*
  Future<Directory> initDownloadsDirectoryState() async {
    Directory? downloadsDirectory;
    List<Directory> dd;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
      // print( 'path ===== ${downloadsDirectory}');
    } on PlatformException {
      print('Could not get the downloads directory');
    }

    /* if (Platform.isAndroid) {
     // downloadsDirectory  = await getDownloadsDirectory();
     // print( 'path ===== ${dd[0]}');
     // print( 'path ===== ${dd[1]}');
     // print( 'path ===== ${dd[3]}');
     // print( 'path ===== ${downloadsDirectory}');

    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return null;
    return downloadsDirectory;

   // setState(() {
    //  _downloadsDirectory = downloadsDirectory;
   // });
  }

   */

  String? _findLocalPath() {
  //  final directory = widget.platform == TargetPlatform.android
     //   ? await  initDownloadsDirectoryState()
      //  ? await getExternalStorageDirectory()
       // : await getApplicationDocumentsDirectory();
    return '/storage/emulated/0/Download';//directory.path;
  }




}


class FileViewAttFix extends StatefulWidget {
 DIOProvider? provider;
  final String? value;
  final String? value1;
  final String? fz;
  String? caption;
  BuildContext? ctx;

  State? st;
  var platform;
  final ValueChanged<int?>? getValue;
  FileViewAttFix({this.st, this.value, this.value1, this.fz, this.caption, this.ctx, this.getValue}) {
    platform = Theme.of(ctx!).platform;
    this.caption = this.caption! + ' : ';
  }
  //@override
  //State<StatefulWidget> createState() {
  //  return _FileViewStateAtt();
  //}
  @override
  _FileViewStateAttFix createState() => _FileViewStateAttFix();
}

class _FileViewStateAttFix extends State<FileViewAttFix>{

  List<_TaskInfo?>? _tasks;
  List<_ItemHolder?>? _items;
  bool? _isLoading;
  bool? _permissionReady;
  String? _localPath;
  ReceivePort? _port = ReceivePort();
  bool? debug = true;
  PermissionStatus? _permissionStatus = PermissionStatus.denied;
  bool? fileExists = false;

  @override
  initState(){
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    _prepare();



  }


  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void progress (int? value){
    widget.getValue!(value);
  }

  void _bindBackgroundIsolate() {
    bool? isSuccess = IsolateNameServer.registerPortWithName(
        _port!.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;

    }
    _port!.listen((dynamic data) {
      /*
      if (debug!) {
        print('UI Isolate Callback: $data');
      }

       */
     // String? id = data[0];
     // DownloadTaskStatus status = data[1];
     // int? progress = data[2];

        final task = _tasks![0];//  _tasks?.firstWhere((task) => task.taskId == data[0]);
        if (task != null) {

          widget.st!.setState(() {
            progress(data[2]);
            task.taskId = data[0];
            task.status = data[1];
            task.progress = data[2];
          });


        }{

      }



    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }


  static void downloadCallback(
      String? id, DownloadTaskStatus status, int? progress) {
    if (true) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');

    }

    final SendPort? send =
    IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);


  }


  String? appSugestion(String ext ){
    String? install = 'Please install ';
    String? open = 'To open your file ';

    if(['.xls','.xlsb','.xlsm','.xlsx'].contains(p.extension(ext))){
      return open + install + 'Excel application';

    }else if(['.pdf'].contains(p.extension(ext))){
      return open + install + 'PDF application';

    }else if(['.doc', '.docm', '.docx', '.dot', '.dotm', '.dotx', '.odt', '.html', '.rtf', '.xps', '.txt'].contains(p.extension(ext))){
      return open + install + 'Word application';
    }else if(['.ppt', '.pptx', '.docx', '.dot', '.dotm', '.dotx', '.odt', '.html'].contains(p.extension(ext))){
      return open + install + 'Powerpoint application';

    }else{
      return open + install + 'application suitable with your file';
    }

  }
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;

    return

      ButtonBarTheme(
        data: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
        ),
        child: ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.9 * width,
            children: <Widget>[

              _isLoading!
                  ?
              Container(
                  height: 55.0,
                  width: 0.9 * width,
                  child:
                  Center(
                    child: CircularProgressIndicator(),
                  )
              )
                  : _permissionReady!
                  ? Container(
                height:_items == null ||_items == [] ? 55 : _items![0]!.task!.status == DownloadTaskStatus.complete? 80.0 : 50.0,
                width: 0.9 * width,
                child:
                Container(
                  height: 36.0,
                  width: 0.7 * width,
                  child: ListView(

                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    children: _items!
                        .map((item) => item!.task == null
                        ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 1.0),
                      child: Text(
                        item.name! ,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18.0),
                      ),
                    )
                        : Container(
                      decoration:ShapeDecoration(
                        shadows:const [
                          BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                        ],

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              width: 3,
                              color: Colors.lightGreen
                          ),
                        ),

                      ),
                      height:  item.task!.status ==
                          DownloadTaskStatus.complete
                          ? 120 : 50.0,
                      // color: Colors.white12,
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 8.0),
                      child:
                      Column(
                        children: <Widget>[
                          InkWell(
                            onTap: item.task!.status ==
                                DownloadTaskStatus.complete
                                ? () {
                              _openDownloadedFile(item.task!)
                                  .then((success) {
                                if (!success) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text( widget.platform == TargetPlatform.android?
                                      'Cannot open this file. \nFilename :  ${item.task!.name}. \nFile folder : Download' + Platform.pathSeparator + ' \nSuggestion : ${appSugestion(p.basename(item.task!.link!))}'  : 'Cannot open this file' )));
                                }
                              });
                            }
                                : null,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  // color: Colors.white12,
                                  width: double.infinity,
                                  height: 38.0,

                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child:
                                        item.fz == '' ?

                                        Text(
                                          item.name!  ,
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow:
                                           TextOverflow.ellipsis,
                                        )
                                        :
                                               GestureDetector(
                                              onTap:(){
                                                if(_tasks![0]!.status !=
                                                    DownloadTaskStatus.complete && !fileExists! && _tasks![0]!.status != DownloadTaskStatus.running){
                                                  _requestDownload(item.task!);
                                                print('halooooo1');
                                                }
                                                //print('halooooo');
                                              },
                                              child:  Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name! ,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    item.fz! ,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                          ) ,


                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 8.0),
                                        child: _tasks![0]!.status ==
                                            DownloadTaskStatus.complete && fileExists!
                                            ? _buildActionForTask1(
                                            item.task!) : _buildActionForTask(
                                            item.task!),
                                      ),
                                    ],
                                  ),
                                ),
                                item.task!.status ==
                                    DownloadTaskStatus
                                        .running ||
                                    item.task!.status ==
                                        DownloadTaskStatus.paused
                                    ? Positioned(
                                  left: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  child:
                                  LinearProgressIndicator(
                                    value: item.task!.progress! /
                                        100,
                                  ),
                                )
                                    : Container()
                              ]
                                  .where((child) => child != null)
                                  .toList(),
                            ),
                          ),
                          item.task!.status ==
                              DownloadTaskStatus.complete && fileExists!
                              ? widget.platform == TargetPlatform.android? Html(data :'Filepath: Download/${p.basename(item.task!.name!)}',
                            style: {
                              "html": Style(
                                fontSize: FontSize.small,
                              ),
                              "a" : Style(color: Colors.red),
                            },
                          )
                              : Container(width: 0.0, height: 0.0,)
                              : Container(width: 0.0, height: 0.0,),
                        ],
                      ),



                    ))
                        .toList(),
                  ),
                ),


              )
                  : Container(
                height: 50.0,
                width: 0.9 * width,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Please grant accessing storage permission to continue -_-',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      FlatButton(
                          onPressed: () {
                            _checkPermission().then((hasGranted) {
                              setState(() {
                                _permissionReady = hasGranted;
                              });
                            });
                          },
                          child: Text(
                            'Retry',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ))
                    ],
                  ),
                ),
              )
            ]
        ),
      )

    ;

  }



  Future<void> changeFileNameOnly(String oldFileName, String? newFileName)async{
   // _permissionReady = await _checkPermission();
    //widget.platform == TargetPlatform.android ? _localPath = (_findLocalPath()): _localPath = (_findLocalPath()) + Platform.pathSeparator + 'ProjectscoidDownload';
    var file = File(_localPath! + Platform.pathSeparator + oldFileName);
    var path = file.path;
    print('filepath  === ${file.path}');
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName!;
    await file.rename(newPath);

   // setState(() {
   //   _isLoading = false;
   // });
  }


  Widget? _buildActionForTask(_TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined || (!fileExists! && (task.status != DownloadTaskStatus.running) && (task.status != DownloadTaskStatus.paused))) {
     // fileExists! ? print('aku ini 123'):print('aku ini ');
      return RawMaterialButton(
        onPressed: () {
          _requestDownload(task);
        },
        child: Icon(Icons.file_download),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return RawMaterialButton(
        onPressed: () {
          _pauseDownload(task);
        },
        child: Icon(
          Icons.pause,
          color: Colors.red,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return RawMaterialButton(
        onPressed: () {
          _resumeDownload(task);
        },
        child: Icon(
          Icons.play_arrow,
          color: Colors.green,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if ((task.status == DownloadTaskStatus.complete || task.progress == 100) && fileExists!) {
      //_prepare();
     // print('filepath123  === $_localPath');
     // changeFileNameOnly(task.taskId, task.name);
     // _permissionReady = await _checkPermission();
     // widget.platform == TargetPlatform.android ? _localPath = (_findLocalPath()): _localPath = (_findLocalPath()) + Platform.pathSeparator + 'ProjectscoidDownload';

      print('aku disini');
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Ready',
            style: TextStyle(color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              _delete(task);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return Text('Canceled', style: TextStyle(color: Colors.red));
    } else if (task.status == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Failed', style: TextStyle(color: Colors.red)),
          RawMaterialButton(
            onPressed: () {
              _retryDownload(task);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.green,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else {
      return null;
    }
  }

  Widget _buildActionForTask1(_TaskInfo task) {

   // print('filepath123  === ${task.link}');
   // changeFileNameOnly(p.basename(task.link), task.name);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Ready',
          style: TextStyle(color: Colors.black),
        ),
        RawMaterialButton(
          onPressed: ()async{
            var file = File(_localPath! + Platform.pathSeparator + task.name!);
            try{
              await file.delete();
              _delete(task);
            }catch(e){
              _delete(task);
            }

          },
          child: Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        )
      ],
    );
  }

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link!,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath!,
        showNotification: true,
        openFileFromNotification: true);
        setState(() {
          fileExists = true;
        });

     //await _prepare();
     //widget.st.setState(() {});

  }

  void _cancelDownload(_TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId!);
  }

  void _pauseDownload(_TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  void _resumeDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  void _retryDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId!);
  }

  void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: false);
   await _prepare();
   // setState(() {});
  }

  Future<bool> _checkPermission() async {
    /*
    if (widget.platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;

     */

    var prm = Permission.values
        .where((permission) {
      if (Platform.isIOS) {
        return permission != Permission.unknown &&
            permission != Permission.sms &&
            permission != Permission.storage &&
            permission != Permission.ignoreBatteryOptimizations &&
            permission != Permission.accessMediaLocation &&
            permission != Permission.activityRecognition &&
            permission != Permission.manageExternalStorage &&
            permission != Permission.systemAlertWindow &&
            permission != Permission.requestInstallPackages &&
            permission != Permission.accessNotificationPolicy &&
            permission != Permission.bluetoothScan &&
            permission != Permission.bluetoothAdvertise &&
            permission != Permission.bluetoothConnect;
      } else {

        return permission == Permission.storage;
        //||
        // permission == Permission.manageExternalStorage;
      }
    }).toList();//.map((permission)async{ await _requestPermission(permission);});
    // prm.forEach((element)async{ return await _requestPermission(element);

    // });

    return await _requestPermission(prm[0]);



  }


  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    //  print('haloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
    // setState(() {
    print(status);
    _permissionStatus = status;
    print(_permissionStatus);
    if(_permissionStatus!.isGranted){return true;}else{
      return false;
    }
    // });

  }

  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    final _documents = [
      {
        'name': '${widget.value}',
        'link':
        '${widget.value1}'
       // '${widget.value1.replaceAll('upload.', 'cdn.')}'
      }
    ];
    _items = [];

    _tasks!.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    //_items!.add(_ItemHolder(name: 'Documents'));
    for (int i = count; i < _tasks!.length; i++) {
      _items!.add(_ItemHolder(name: _tasks![i]!.name, fz:widget.fz, task: _tasks![i]!));
      count++;
    }


    tasks?.forEach((task) {
      for (_TaskInfo? info in _tasks!) {
        if (info?.link == task.url) {
          info?.taskId = task.taskId;
          info?.status = task.status;
          info?.progress = task.progress;
        }
      }
    });
    _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
      });
    });
   // _permissionReady = await _checkPermission();
    widget.platform == TargetPlatform.android ? _localPath = (_findLocalPath()): _localPath = (_findLocalPath()) ! + Platform.pathSeparator + 'ProjectscoidDownload';
    // _localPath = (_findLocalPath()) ;

    final savedDir = Directory(_localPath!);
    print('_localPath ==== $_localPath');
    bool? hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    if(_tasks![0]!.status == DownloadTaskStatus.complete){
      //if (await File('$_localPath/${widget.value}').exists()) {
      if  (FileSystemEntity.typeSync('$_localPath/${widget.value}') != FileSystemEntityType.notFound) {
        print("File exists");
        setState(() {
          fileExists = true;
        });
      } else {

        if  (FileSystemEntity.typeSync('$_localPath/${widget.value!.replaceAll('_', '')}') != FileSystemEntityType.notFound) {
          print("File exists");
          setState(() {
            fileExists = true;
          });
        }else{
          print("File don't exists $_localPath/${widget.value}");
          setState(() {
            fileExists = false;
          });
        }

      }
    }



    setState(() {
      _isLoading = false;
    });
  }



/*
  Future<Directory> initDownloadsDirectoryState() async {
    Directory? downloadsDirectory;
    List<Directory> dd;
    StorageDirectory typeku;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
      dd = await getExternalStorageDirectories();
      // downloadsDirectory  = await getDownloadsDirectory();
       print( 'path ===== ${dd[0].path}');
       print( 'path ===== ${dd[1].path}');

     //  print( 'path ===== ${dd[7].path}');
       print( 'path ===== ${downloadsDirectory.path}');

    } on PlatformException {
      print('Could not get the downloads directory');
    }

    /* if (Platform.isAndroid) {
     // downloadsDirectory  = await getDownloadsDirectory();
     // print( 'path ===== ${dd[0]}');
     // print( 'path ===== ${dd[1]}');
     // print( 'path ===== ${dd[3]}');
     // print( 'path ===== ${downloadsDirectory}');

    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return null;
    return downloadsDirectory;

    // setState(() {
    //  _downloadsDirectory = downloadsDirectory;
    // });
  }

 */

  String? _findLocalPath() {
   // final directory = widget.platform == TargetPlatform.android
    //    ? await  initDownloadsDirectoryState()
    //  ? await getExternalStorageDirectory()
     //   : await getApplicationDocumentsDirectory();
    return '/storage/emulated/0/Download';
  }




}


class _TaskInfo {
  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link});
}

class _ItemHolder {
  final String? name;
  final String? fz;
  final _TaskInfo? task;

  _ItemHolder({this.name, this.fz, this.task});
}



class FileViewRev extends StatefulWidget {
  DIOProvider?provider;
  final String? value;
  final String? value1;
  String? caption;

  FileViewRev({this.value, this.value1, this.caption}) {
    this.caption = this.caption! + ' : ';
  }
  @override
  State<StatefulWidget> createState() {
    return _FileViewStateRev();
  }
}

class _FileViewStateRev extends State<FileViewRev>{
  DIOProvider?provider;
  String? caption;
  Directory? _downloadsDirectory;
  double? progressCount = 0;
  bool? failed = false;

  @override
  initState(){
    super.initState();
    //initDownloadsDirectoryState();
  }
 /*
  Future<void> initDownloadsDirectoryState() async {
    Directory? downloadsDirectory;
    List<Directory> dd;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
     // print( 'path ===== ${downloadsDirectory}');
    } on PlatformException {
      print('Could not get the downloads directory');
    }

   /* if (Platform.isAndroid) {
     // downloadsDirectory  = await getDownloadsDirectory();
     // print( 'path ===== ${dd[0]}');
     // print( 'path ===== ${dd[1]}');
     // print( 'path ===== ${dd[3]}');
     // print( 'path ===== ${downloadsDirectory}');

    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });
  }

  */


  Future _downloadFile(String? dp, String? df,  ProgressDlCallback pgr) async {
    this.provider = await _init();

    int? response ;
     try{
      response =  await provider!.downloadFile1(dp!, df!, pgr);
      }catch(e) {
      // print('errror${response.dir}');
       //   print('errorrr');

          failed = true;
      }

    return response;
  }

  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
        progressCount = received / total ;

      });

      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
  Future<DIOProvider?> _init()async{
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider? provider = await DIOProvider(appDocDir.path);
    return provider;
  }
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic, fontSize: 20,decoration: TextDecoration.underline, color: Colors.blue);
    final size =MediaQuery.of(context).size;
    final width =size.width;
    return


            ButtonBarTheme(
                data: ButtonBarThemeData(
                  alignment: MainAxisAlignment.center,
                  buttonMinWidth: 0.9 * width,
                ),
                child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[ OutlinedButton(
                        child: Text(readText(widget.value!,40)),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                         // textColor: Colors.green,
                          //splashColor : CurrentTheme.ShadeColor,
                         // color : Colors.white,
                          side: BorderSide(
                            color: Colors.grey, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 0.4,
                          ),
                        ),
                        /*
                        textColor: Colors.green,
                        splashColor : CurrentTheme.ShadeColor,
                        color : Colors.white,
                        borderSide: BorderSide(
                          color: Colors.grey, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: 0.4, //width of the border
                        ),

                         */


                        onPressed: () async{

                          await  _downloadFile('${'/storage/emulated/0/Download'}/${widget.value}', widget.value1, showProgress);

                        }
                    ),

                      Container(
                          width: 0.89 * width,
                          padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                          child: Column(
                            children: <Widget>[
                              failed! ? const LinearProgressIndicator(value: 0.0,) : LinearProgressIndicator(value: progressCount,) ,
                              failed! ? const Text('Failed') : progressCount == 1.0?
                              Column(
                              children: <Widget>[
                                   Text((progressCount! * 100).toStringAsFixed(0) + "%" + " " + 'completed'),
                                   Text('Folder: Download/${widget.value}')
                                    ]
                              )
                                  :
                              Text((progressCount! * 100).toStringAsFixed(0) + "%") ,
                            ],
                          )
                      ),


                    ]



                )
            );







  }
}



class CaptchaView extends StatelessWidget{
  final String? value;
  String? caption;
  CaptchaView ({this.value, this.caption}){
    //this.caption = this.caption + ':';
   }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: buildViewHeader(caption!),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:  buildViewData(value!),
            ),
            buildDivider(screenSize),
          ]
      );
  }
}


class _ChipsTile1 extends StatelessWidget {
  const _ChipsTile1({
    Key? key,
    this.children,
  }) : super(key: key);


  final List<Widget?>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[

    ];
    if (children!.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children!.map<Widget>((Widget? chip) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
              child: chip,
            );
          }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(
          Semantics(
            container: true,
            child: Container(
              //alignment: Alignment.center,
            // constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 1.0, 0.0),
              child: Text('Tags: No', style: const TextStyle(fontSize: 15),),
            ),
          ));
    }



    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Column(
          children: cardChildren,
          // const SectionTitle(title: ''),
          // cardChildren,
          // ),



        ),
      ),
    );
 /*   return Card(
        semanticContainer: false,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,
        )
    ); */
  }
}



class ChannelRouteTagsWidget extends StatefulWidget {
  List<int?>? value;

  List<Widget?>? chips;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  String? oldcaption;
  List<int?>? tempValue = [];
  String? checkval;
  List<int?>? idroutetags = [];
  List<String?>? nameroutetags = [];
  List<String?>? routetagsname = [];
  List<String?>? urlroutetags  = [];
  final ValueChanged<String?>? getValue;



  ChannelRouteTagsWidget({ this.value,  this.caption, this.hint, this.required, this.idroutetags, this.nameroutetags,  this.urlroutetags, this.getValue}){

    if(this.required!){
      this.oldcaption = this.caption;
      this.caption = this.caption! + '*';
    }



    for (var  tag in value!) {
      routetagsname!.add(nameroutetags![idroutetags!.indexOf(tag)]);
    }
    if(value!.isEmpty){
      tempValue = [];
      checkval ='';
    }else{
      tempValue!.addAll(value!);
      checkval ='1';
    }


  }


  @override
  State<StatefulWidget> createState(){
    return _ChannelRouteTagsWidgetState();
  }

}

class _ChannelRouteTagsWidgetState extends State<ChannelRouteTagsWidget> {

  final Set<String?>? temp = Set<String?>();
  bool? validation = true;
  bool? isvalid = true;
  String? link = '';
  String? errormessage = 'Error.';
  @override
  void initState() {
    // TODO: implement

    super.initState();
  }


  String? validateChannelRouteTags(_value, _require) {
    List<int?>? value = _value;
    bool?   require = _require;
    String? result = '' ;
    isvalid = true;
    if(require!){
      if (value!.isEmpty){
        result = 'No List selected';
        isvalid= false;
      }
    } else{
      if (value!.isEmpty){
        result = null;
        isvalid = true;
      }
    }

    return result;
  }




  static Color _nameToColor(String name) {
    /*assert(name.length > 1);
    final int? hash = name.hashCode & 0xffff;
    final double? hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();*/
    return Colors.black45;
  }

  static String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  void _removeTemp(String name) {
    setState(() {
      temp!.remove(name);
    });

  }
  void selectitem (String value){

  //  widget.urlroutetags[widget.nameroutetags.indexOf(value)];
   // widget.getValue(widget.idroutetags[widget.nameroutetags.indexOf(value)] );
    widget.getValue!(widget.urlroutetags![widget.nameroutetags!.indexOf(value)]);
  }

  Future<void> _selectRouteTags(BuildContext context) async {
    List<String?>? tempRouteTags = [];

  }

  @override
  Widget build (BuildContext context){
    temp!.clear();
    temp!.addAll(widget.routetagsname!);

    widget.chips = temp!.map<Widget?>((String? name) {
      return
       /*
        InputChip(
        key: ValueKey<String>(name),
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.only(left: 4, right: 4, top: 0),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1.9) , side: BorderSide(color:Colors.white10)),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name), style: TextStyle(fontSize: 11, color: Colors.white),),
        onPressed: () {
          setState(() {
           // _removeTemp(name);
          });
          selectitem(name);
        },
      );

        */
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: GestureDetector(
            onTap: (){
              widget.getValue!(widget.urlroutetags![widget.nameroutetags!.indexOf(name)]);
            },
            child:
            Badge(
              toAnimate: false,
              elevation: 0,
              shape: BadgeShape.square,
              badgeColor: Colors.black26,
              padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
              borderRadius: BorderRadius.circular(8),
              badgeContent: Text(' ' +_capitalize(name!) + ' ', style:TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w300) ),
            ),
            /*
                            Chip(
                              key: ValueKey<String>(destination.item!.channels_str[0]),
                                padding: const EdgeInsets.only(top : 0,bottom : 0),
                              shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                              backgroundColor: Colors.white70,
                              label: Text(_capitalize(destination.item!.channels_str[0]), style:TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300) ),
                            ),
                            */


            /*
                            Text(destination.item!.channels_str[0], style: TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300))

                             */
          )
        );


    }).toList();

    // InputComponent password;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :
        <Widget> [


          Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: _ChipsTile1( children: widget.chips)
          ),


        ]
    );


  }
}



class ChannelNonURLRouteWidget extends StatefulWidget {
  List<int?>? value;

  List<Widget?>? chips;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  String? oldcaption;
  List<int?>? tempValue = [];
  String? checkval;
  List<int?>? idroutetags = [];
  List<String?>? nameroutetags = [];
  List<String?>? routetagsname = [];




   ChannelNonURLRouteWidget({ this.value,  this.caption, this.hint, this.required, this.idroutetags, this.nameroutetags}){

    if(this.required!){
      this.oldcaption = this.caption;
      this.caption = this.caption! + '*';
    }



    for (var  tag in value!) {
      routetagsname!.add(nameroutetags![idroutetags!.indexOf(tag)]);
    }
    if(value!.isEmpty){
      tempValue = [];
      checkval ='';
    }else{
      tempValue!.addAll(value!);
      checkval ='1';
    }


  }


  @override
  State<StatefulWidget> createState(){
    return _ChannelNonURLRouteWidgetState();
  }

}

class _ChannelNonURLRouteWidgetState extends State< ChannelNonURLRouteWidget> {

  final Set<String?>? temp = Set<String?>();
  bool? validation = true;
  bool? isvalid = true;
  String? link = '';
  String? errormessage = 'Error.';
  @override
  void initState() {
    // TODO: implement

    super.initState();
  }


  String? validateChannelRouteTags(_value, _require) {
    List<int?>? value = _value;
    bool?   require = _require;
    String? result = '' ;
    isvalid = true;
    if(require!){
      if (value!.isEmpty){
        result = 'No List selected';
        isvalid= false;
      }
    } else{
      if (value!.isEmpty){
        result = null;
        isvalid = true;
      }
    }

    return result;
  }




  static Color _nameToColor(String name) {
    assert(name.length > 1);
   /* final int? hash = name.hashCode & 0xffff;
    final double? hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();

    */
    return Colors.white70;
  }

  static String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  void _removeTemp(String name) {
    setState(() {
      temp!.remove(name);
    });

  }
  void selectitem (String value){

  //  widget.urlroutetags[widget.nameroutetags.indexOf(value)];
   // widget.getValue(widget.idroutetags[widget.nameroutetags.indexOf(value)] );
   // widget.getValue(widget.urlroutetags[widget.nameroutetags.indexOf(value)]);
  }

  Future<void> _selectRouteTags(BuildContext context) async {
    List<String?>? tempRouteTags = [];

  }

  @override
  Widget build (BuildContext context){
    temp!.clear();
    temp!.addAll(widget.routetagsname!);

    widget..chips = temp!.map<Widget>((String? name) {
      return InputChip(
        key: ValueKey<String>(name!),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        onPressed: () {
          setState(() {
           // _removeTemp(name);
          });
         // selectitem(name);
        },
      );
    }).toList();

    // InputComponent password;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :
        <Widget> [
          _ChipsTile1( children: widget.chips),
          /*
          Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
              child: _ChipsTile1( children: widget.chips)
          ),

           */


        ]
    );


  }
}

class RangeView extends StatelessWidget{
  final String? value;
  String? caption;
  RangeView({this.value, this.caption}){
    //this.caption = this.caption + ':';
  }
  Widget build(BuildContext context) {
         Size screenSize = MediaQuery.of(context).size; final themeManager =  Provider.of<ThemeManager>(context);

    return
      ItemListString(
        // icon: Icons.calendar_today,
          tooltip: 'Send message',             isDark: themeManager.themeMode == ThemeMode.dark? true : false,



          onPressed: (){
          },
          lines: <String>[
            caption!,
            value??'',
          ]
      );
    /*
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
                 child: buildViewHeader(caption!),
             ),
             Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                 child:  buildViewData DIOProvider? 
             ),
             buildDivider(screenSize),
           ]
       );

      */
  }
}


class OptionView extends StatelessWidget {
  List<OptionField?>? value;
  String? caption;
  List<OptionField?>? optiondata = []  ;
  OptionView({ this.value, this.caption}) {
    if (value != null) {
      if (value!.isEmpty) {
        value = [];
      }
      // if(value.isNotEmpty){
      optiondata!.addAll(this.value!);

      // }
    }else{

        value = [];
        optiondata!.addAll(this.value!);
    }
  }

  List<Widget> _getOptions(){
    List<Widget> OptionsTextFields = [];
    bool? testOptions = false;
    for(int i=0; i< this.optiondata!.length; i++){

     if(this.optiondata![i]!.description != ''){
       testOptions = true;
        OptionsTextFields.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(child: OptionViewFields(i, this.optiondata!)),
                  SizedBox(width: 16,),
                  // we need add button at last Options row
                ],
              ),
            )
        );
      }

    }


    if(!testOptions!){
      this.optiondata!.clear();
      this.optiondata!.add(OptionField('Basic Option', 0.toString()));
      OptionsTextFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: OptionViewFields(0,this.optiondata!)),
                SizedBox(width: 16,),
                // we need add button at last Options row
              ],
            ),
          )
      );
    }
    return OptionsTextFields;
  }
  @override
  Widget build (BuildContext context){
    final themeManager =  Provider.of<ThemeManager>(context);

    return value == [] ? Container(height: 0.0, width: 0.0) :
      ItemListWidget(
        tooltip: 'Send message',   isDark: themeManager.themeMode == ThemeMode.dark? true : false,


        onPressed: (){
        },
        lines:
        caption!,
        lines1:
        '',
        isdivided: false,
        wgt:
        Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
            child:
            Container(
              // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                alignment: Alignment.center,
                // height: widget.Optionname == '' || widget.Optionname == null ? 140.0 : 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: const Color(0xFF000000), width: 1.0),
                  //color: CurrentTheme.ShadeColor,
                ),
                child :
                Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                          child: Column(

                            children: <Widget>[
                              ..._getOptions(),
                            ],
                          )


                      ),
                    ]

                )
            )
        ),


      );


  }

}

class OptionViewFields extends StatelessWidget {
  final int? index;
  List<OptionField?>? optionproperty;
  OptionViewFields(this.index, this.optionproperty);
  String? value = '';
  double? value1 = 0 ;
  OptionField? v ;
  // TextEditingController _nameController1;


  @override
  Widget build(BuildContext context) {
    v = optionproperty![index!]?? null;
    if(v != null){
      value = optionproperty![index!]!.description;
      value1 = double.parse(optionproperty![index!]!.price!);
    }else{
      value = '';
      value1 = 0;
    }

    return
      Column(
        children: <Widget>[
          TitleView(
            value: value!,
            caption: 'description',
          ),
          MoneyView(
            value: value1,
            caption: 'price',
          )
        ],
      );

  }


}



