
import 'package:json_annotation/json_annotation.dart';
import 'show_conversation_list_item.dart';
import 'show_conversation_list_item_base.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'show_conversation_list_item.dart';
import 'show_conversation_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';

import 'show_conversation_list_base.dart';
import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/views/components/uploadprovider.dart';

import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:camera/camera.dart' ;

//import 'package:flutter_icons/flutter_icons.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:filesize/filesize.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/MyProjects/my_projects_action.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/core/components/utility/widget/ListThread.dart';


/** AUTOGENERATE OFF **/

class ShowConversationListingModel extends ShowConversationListingBase {
  Map<String, dynamic> json;

  ShowConversationListingModel(Map<String, dynamic> this.json) :super(json);

  bool isImage(String ext) {
    bool isImage = false;
    if (['.tif', '.tiff', '.bmp', '.jpg', 'jpeg', 'gif', 'png', 'eps'].contains(
        p.extension(ext))) {
      isImage = true;
    }
    return isImage;
  }


  Widget viewItem2(ItemShowConversationModel item,
      ItemShowConversationModel item1, String search, BuildContext context,
      bool account, String id, bool isMax, int max, int index,VoidCallback? onSelect, List<int> selectedItemsIndex, List<String> selectedItems ) {
    bool isDifDate = false;
    var formatter = new DateFormat('dd MMMM yyyy');
    var formatter1 = new DateFormat('HH : mm');
    bool darkMode = false;
    bool isSameUser = false;
    final themeManager = Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark ? darkMode = true : darkMode =
    false;
    final date1 = item1.item.post_date;
    final date2 = item.item.post_date;
    final difference = date2
        .difference(date1)
        .inDays;
    if (difference != 0) {
      isDifDate = true;
    } else {
      if (DateFormat('EEEE').format(date1) !=
          DateFormat('EEEE').format(date2)) {
        isDifDate = true;
      };
    }
   // if(item.item.user_user_name ==  item1.item.user_user_name){
   //   isSameUser = true;
   // }
   // if(max  == index){
   //   isDifDate = true;
   // }
     // print('cek posisiiiiiiiiiiiiiiiiiiiiiiii${id.split('*')[1]} and ${item.item.user_user_name.toLowerCase()}');

    if (item.item.user_user_name == 'System') {
      //center
      return Center(
          child:

          Padding(
              padding: EdgeInsets.only(left: 30, right: 30.0, top: 5.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  max  == index ? Container(
                    //width: 250,
                      height: 32,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!!,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                      message: item.item.message, userType: 2, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                  /*
                  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.no,
                      color: darkMode ? Colors.black12 : Colors.orange[100],
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          item.item.message.contains('<')|| item.item.message.contains('://') ?
                          HtmlWidget(item.item.message,
                            textStyle: TextStyle(fontSize: 15),
                            onTapUrl: (url) async {
                              if (url.contains('projects.co.id')) {
                                if (url.contains(new RegExp(r'[0-9]'))) {
                                  if (url.contains('show_conversation')) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/'));
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url)).catchError((
                                        onError) {
                                      AppProvider.getRouter(context)!.pop(
                                          context);
                                    });
                                  }
                                } else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(url + '/listing/'));
                                }
                              } else {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                            },
                            onTapImage: (src) =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowItemScreenshots1(image: '$src')),),
                          ) :
                          Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                          Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(formatter1.format(item.item.post_date),
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                          ]
                      )
                  ),
                  
                   */

                  isDifDate ?
                  Container(
                    //width: 250,
                      height: 50,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  isMax ? index == max
                      ? Container(width: 0.0, height: 90,)
                      : Container(width: 0.0, height: 0.0,) : Container(
                    width: 0.0, height: 0.0,),
                  index == 0 ? Container(width: 0.0, height: 100,) : Container(
                    width: 0.0, height: 0.0,),


                ],
              )
          )
      );
    } else {
      if (id.split('*')[3] == 'l') {
         print('cek posisiiiiiiiiiiiiiiiiiiiiiiii1234');
        if (id.split('*')[1].toLowerCase() == item.item.user_user_name.toLowerCase()) {
          return Padding(
              padding: EdgeInsets.only(left: 10, top: 10.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  max  == index ? Container(
                    //width: 250,
                      height: 32,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                    message: item.item.message, userType: isSameUser? 4 : 1, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                  /*
                  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.leftTop,
                      color: darkMode ? Colors.black : Colors.white,
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          item.item.message.contains('<')|| item.item.message.contains('://') ?
                          HtmlWidget(item.item.message,
                            textStyle: TextStyle(fontSize: 15),
                            onTapUrl: (url) async {
                              if (url.contains('projects.co.id')) {
                                if (url.contains(new RegExp(r'[0-9]'))) {
                                  if (url.contains('show_conversation')) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/'));
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url)).catchError((
                                        onError) {
                                      AppProvider.getRouter(context)!.pop(
                                          context);
                                    });
                                  }
                                } else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(url + '/listing/'));
                                }
                              } else {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                            },
                            onTapImage: (src) =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowItemScreenshots1(image: '$src')),),
                          ) :
                          Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(formatter1.format(item.item.post_date),
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],

                      )

                  ),

                   */
                  isDifDate ?
                  Container(
                    //width: 250,
                      height: 50,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  item.item.attachments == null ? Container(
                    height: 0.0, width: 0.0,) : isImage(
                      item.item.attachments_url) ?
                  Html(data: '<img src=${item.item.attachments_url} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap: (src, _, __, ___) {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => ShowImage2(image: '$src')));
                    },

                  )
                      :

                  Bubble(
                    margin: BubbleEdges.only(top: 5),
                    nip: BubbleNip.leftTop,
                    color: darkMode ? Colors.black : Colors.white,
                    child:
                    GestureDetector(
                      child:

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(

                            children: [
                              Icon(Icons.file_download),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.item.attachments_name}'),
                                  Text('${filesize(
                                      item.item.attachments[0].size)}'),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),


                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowThreadFile(file: item.item.attachments_url,
                                  fz: filesize(item.item.attachments[0].size),
                                  basename: item.item.attachments_name,)));
                      },
                    ),

                  ),


                  isMax ? index == max
                      ? Container(width: 0.0, height: 90,)
                      : Container(width: 0.0, height: 0.0,) : Container(
                    width: 0.0, height: 0.0,),
                  index == 0 ? Container(width: 0.0, height: 100,) : Container(
                    width: 0.0, height: 0.0,),
                ],
              )
          );
        } else {
            print('cek posisiiiiiiiiiiiiiiiiiiiiiiii12345678');
          return Padding(
              padding: EdgeInsets.only(right: 10, top: 10.0, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[

                  max  == index ? Container(
                    //width: 250,
                      height: 32,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                      message: item.item.message, userType: isSameUser? 5 : 3, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                  /*
                  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color: darkMode ? Colors.black45 : Color.fromARGB(
                          255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          item.item.message.contains('<')|| item.item.message.contains('://') ?
                          HtmlWidget(item.item.message,
                            textStyle: TextStyle(fontSize: 15),
                            onTapUrl: (url) async {
                              if (url.contains('projects.co.id')) {
                                if (url.contains(new RegExp(r'[0-9]'))) {
                                  if (url.contains('show_conversation')) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/'));
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url)).catchError((
                                        onError) {
                                      AppProvider.getRouter(context)!.pop(
                                          context);
                                    });
                                  }
                                } else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(url + '/listing/'));
                                }
                              } else {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                            },
                            onTapImage: (src) =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowItemScreenshots1(image: '$src')),),
                          ) :
                          Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(formatter1.format(item.item.post_date),
                                  style: TextStyle(
                                      fontSize: 10)),
                            ],
                          ),

                        ],

                      )
                  ),
                  
                   */
                  isDifDate ?
                  Container(
                    //width: 250,
                      height: 50,
                      color: Colors.transparent,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))
                            ),
                            child:
                            Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                child: Center(
                                  child: Text('${formatter.format(
                                      item1.item.post_date)}', style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                                )
                            ),


                          )
                        ],
                      )


                    //child:
                  )
                      : Container(width: 0.0, height: 0.0,),
                  item.item.attachments == null ? Container(
                    height: 0.0, width: 0.0,) : isImage(
                      item.item.attachments_url) ?
                  Html(data: '<img src=${item.item.attachments_url} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap: (src, _, __, ___) {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => ShowImage2(image: '$src')));
                    },

                  )
                      :


                  Bubble(
                    margin: BubbleEdges.only(top: 5),
                    color: darkMode ? Colors.black45 : Color.fromARGB(
                        255, 225, 255, 199),
                    nip: BubbleNip.rightTop,
                    child:
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(

                          children: [
                            Icon(Icons.file_download),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item.item.attachments_name}'),
                                Text('${filesize(
                                    item.item.attachments[0].size)}'),
                              ],
                            ),

                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowThreadFile(file: item.item.attachments_url,
                                  fz: filesize(item.item.attachments[0].size),
                                  basename: item.item.attachments_name,)));
                      },
                    ),
                  ),


                  isMax ? index == max
                      ? Container(width: 0.0, height: 90,)
                      : Container(width: 0.0, height: 0.0,) : Container(
                    width: 0.0, height: 0.0,),
                  index == 0 ? Container(width: 0.0, height: 100,) : Container(
                    width: 0.0, height: 0.0,),
                ],
              )
          );
        }
      } else {
        //left
        //  print('cek dimananannana');
        if (id.split('*')[3].indexOf('1234') == 0) {
          if (id.split('*')[1].toLowerCase() != item.item.user_user_name.toLowerCase()) {
           // print('cek dimananannana1');
            return Padding(
                padding: EdgeInsets.only(left: 10, top: 10.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 4 : 1, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5),
                        nip: BubbleNip.leftTop,
                        color: darkMode ? Colors.black : Colors.white,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message,
                              textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async {
                                if (url.contains('projects.co.id')) {
                                  if (url.contains(new RegExp(r'[0-9]'))) {
                                    if (url.contains('show_conversation')) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url + '/'));
                                    } else {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url)).catchError((
                                          onError) {
                                        AppProvider.getRouter(context)!.pop(
                                            context);
                                      });
                                    }
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }
                                } else {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                              },
                              onTapImage: (src) =>
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        ShowItemScreenshots1(image: '$src')),),
                            ) :
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date),
                                    style: TextStyle(fontSize: 10)),
                              ],
                            )
                          ],

                        )
                    ),
                    
                     */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(
                      height: 0.0, width: 0.0,) : isImage(
                        item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap: (src, _, __, ___) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowImage2(image: '$src')));
                      },

                    )
                        : Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.leftTop,
                      color: darkMode ? Colors.black : Colors.white,
                      child:
                      GestureDetector(
                        child:

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(

                              children: [
                                Icon(Icons.file_download),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item.item.attachments_name}'),
                                    Text('${filesize(
                                        item.item.attachments[0].size)}'),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),


                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowThreadFile(
                                    file: item.item.attachments_url,
                                    fz: filesize(item.item.attachments[0].size),
                                    basename: item.item.attachments_name,)));
                        },
                      ),

                    ),
                    isMax ? index == max
                        ? Container(width: 0.0, height: 90,)
                        : Container(width: 0.0, height: 0.0,) : Container(
                      width: 0.0, height: 0.0,),
                    index == 0
                        ? Container(width: 0.0, height: 100,)
                        : Container(
                      width: 0.0, height: 0.0,),
                  ],
                )
            );
          } else {
             //  print('cek dimananannana2');
            return Padding(
                padding: EdgeInsets.only(right: 10, top: 10.0, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 5 : 3, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    /*    
                    Bubble(
                        margin: BubbleEdges.only(top: 5),
                        color: darkMode ? Colors.black45 : Color.fromARGB(
                            255, 225, 255, 199),
                        nip: BubbleNip.rightTop,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message,
                              textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async {
                                if (url.contains('projects.co.id')) {
                                  if (url.contains(new RegExp(r'[0-9]'))) {
                                    if (url.contains('show_conversation')) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url + '/'));
                                    } else {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url)).catchError((
                                          onError) {
                                        AppProvider.getRouter(context)!.pop(
                                            context);
                                      });
                                    }
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }
                                } else {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                              },
                              onTapImage: (src) =>
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        ShowItemScreenshots1(image: '$src')),),
                            ) :
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date),
                                    style: TextStyle(fontSize: 10)),
                              ],
                            )
                          ],

                        )
                    ),
                    
                     */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(
                      height: 0.0, width: 0.0,) : isImage(
                        item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap: (src, _, __, ___) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowImage2(image: '$src')));
                      },

                    )
                        : Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color: darkMode ? Colors.black45 : Color.fromARGB(
                          255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(

                            children: [
                              Icon(Icons.file_download),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.item.attachments_name}'),
                                  Text('${filesize(
                                      item.item.attachments[0].size)}'),
                                ],
                              ),

                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowThreadFile(
                                    file: item.item.attachments_url,
                                    fz: filesize(item.item.attachments[0].size),
                                    basename: item.item.attachments_name,)));
                        },
                      ),
                    ),
                    isMax ? index == max
                        ? Container(width: 0.0, height: 90,)
                        : Container(width: 0.0, height: 0.0,) : Container(
                      width: 0.0, height: 0.0,),
                    index == 0
                        ? Container(width: 0.0, height: 100,)
                        : Container(
                      width: 0.0, height: 0.0,),
                  ],
                )
            );
          }
        } else {
          if (id.split('*')[1].toLowerCase() == item.item.user_user_name.toLowerCase()) {
           // print('cek dimananannana1');
            return Padding(
                padding: EdgeInsets.only(left: 10, top: 10.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    max  == index ? Container(
                      //width: 250,
                        height: 32,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 4 : 1, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5),
                        nip: BubbleNip.leftTop,
                        color: darkMode ? Colors.black : Colors.white,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message,
                              textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async {
                                if (url.contains('projects.co.id')) {
                                  if (url.contains(new RegExp(r'[0-9]'))) {
                                    if (url.contains('show_conversation')) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url + '/'));
                                    } else {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url)).catchError((
                                          onError) {
                                        AppProvider.getRouter(context)!.pop(
                                            context);
                                      });
                                    }
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }
                                } else {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                              },
                              onTapImage: (src) =>
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        ShowItemScreenshots1(image: '$src')),),
                            ) :
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date),
                                    style: TextStyle(fontSize: 10)),
                              ],
                            )
                          ],

                        )
                    ),
                    
                     */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(
                      height: 0.0, width: 0.0,) : isImage(
                        item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap: (src, _, __, ___) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowImage2(image: '$src')));
                      },

                    )
                        : Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.leftTop,
                      color: darkMode ? Colors.black : Colors.white,
                      child:
                      GestureDetector(
                        child:

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(

                              children: [
                                Icon(Icons.file_download),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item.item.attachments_name}'),
                                    Text('${filesize(
                                        item.item.attachments[0].size)}'),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),


                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowThreadFile(
                                    file: item.item.attachments_url,
                                    fz: filesize(item.item.attachments[0].size),
                                    basename: item.item.attachments_name,)));
                        },
                      ),

                    ),
                    isMax ? index == max
                        ? Container(width: 0.0, height: 90,)
                        : Container(width: 0.0, height: 0.0,) : Container(
                      width: 0.0, height: 0.0,),
                    index == 0
                        ? Container(width: 0.0, height: 100,)
                        : Container(
                      width: 0.0, height: 0.0,),
                  ],
                )
            );
          } else {
             //  print('cek dimananannana2');
            return Padding(
                padding: EdgeInsets.only(right: 30, top: 10.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    max  == index ? Container(
                      //width: 250,
                        height: 32,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 5 : 3, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                       /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5),
                        color: darkMode ? Colors.black45 : Color.fromARGB(
                            255, 225, 255, 199),
                        nip: BubbleNip.rightTop,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message,
                              textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async {
                                if (url.contains('projects.co.id')) {
                                  if (url.contains(new RegExp(r'[0-9]'))) {
                                    if (url.contains('show_conversation')) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url + '/'));
                                    } else {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url)).catchError((
                                          onError) {
                                        AppProvider.getRouter(context)!.pop(
                                            context);
                                      });
                                    }
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }
                                } else {
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                              },
                              onTapImage: (src) =>
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        ShowItemScreenshots1(image: '$src')),),
                            ) :
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date),
                                    style: TextStyle(fontSize: 10,)),
                              ],
                            )
                          ],

                        )
                    ),
                    
                        */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(
                      height: 0.0, width: 0.0,) : isImage(
                        item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap: (src, _, __, ___) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ShowImage2(image: '$src')));
                      },

                    )
                        :
                    Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color: darkMode ? Colors.black45 : Color.fromARGB(
                          255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(

                            children: [
                              Icon(Icons.file_download),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.item.attachments_name}'),
                                  Text('${filesize(
                                      item.item.attachments[0].size)}'),
                                ],
                              ),

                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowThreadFile(
                                    file: item.item.attachments_url,
                                    fz: filesize(item.item.attachments[0].size),
                                    basename: item.item.attachments_name,)));
                        },
                      ),
                    ),
                    isMax ? index == max
                        ? Container(width: 0.0, height: 90,)
                        : Container(width: 0.0, height: 0.0,) : Container(
                      width: 0.0, height: 0.0,),
                    index == 0
                        ? Container(width: 0.0, height: 100,)
                        : Container(
                      width: 0.0, height: 0.0,),
                  ],
                )
            );
          }
        }
      }

    }
  }

  //@override
  Widget ButtonsXX1(BuildContext context, bool visible, String id,
      bool isShowEG, String id1, bool bid, ChatBloc cb) {
    final mediaQueryData = MediaQuery.of(context);


    if (tools.buttons.length == 1) {
      return (
          Container()
      );
    } else {
      return (


          SpeedDial(

              childMargin: EdgeInsets.symmetric(horizontal: 5, vertical: isShowEG ? mediaQueryData.size.height / 2.2 : 10),
              animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: IconThemeData(size: 22.0),
              // this is ignored if animatedIcon is non null
              // child: Icon(Icons.add),
              visible: visible,
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
              children: listButton11(context, id, id1, bid,  cb)
          )


      );
    }
  }

  // @override



  SpeedDialChild ListButtonShowConversationWidget1(Button button,
      BuildContext context, ChatBloc cb) {
    if (button.type == 'custom_filter') {
      return (
          SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: () =>
            { showSearchSelectDialog(context: context,
                caption: button.text,
                initialitems: button.selections,
                initvalue: button.selections![0])
              //AppProvider.getRouter(context)!.navigateTo(context,
            },
          )

      );
    }
    else
    if(button.url!.contains('show_bids/')){
     // print('i am here');
      return (
          SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${urlToRoute(button.url!).split('\/')[4]}', title : '${button.text}', cb: cb),)
              );
            },
          )

      );
    }
    else {
     // print('i am here1');
      return (SpeedDialChild(
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
          label: button.text,
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          onTap: () =>
          {
            AppProvider.getRouter(context)!.navigateTo(
                context, urlToRoute(button.url!))
          }
      ));
    }
  }

  //@override
  Widget Buttons12(BuildContext context, bool visible, String id,
       String id1, bool bid, ChatBloc cb) {
    final mediaQueryData = MediaQuery.of(context);


    if (tools.buttons.length == 1) {
      return (
          Container()
      );
    } else {
      return (


          SpeedDial(

              childMargin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: IconThemeData(size: 22.0),
              // this is ignored if animatedIcon is non null
              // child: Icon(Icons.add),
              visible: visible,
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
              children: listButton11(context, id, id1, bid,  cb)
          )


      );
    }
  }

  List<SpeedDialChild> listButton11(BuildContext context, String id, String id1, bool bid,
      ChatBloc cb) {
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
    var idtemp = id1 + '123';
    for (var i = 0; i < tools.buttons.length; i++) {
      if (tools.buttons[i].url == 'javascript:gotoNewReply();') {
        // tools.buttons[i].url = id;
        //  print('sungguhhhhh');
       if(bid){
         tools.buttons[i].url =
         '${Env.value!.baseUrl}/user/my_bids/show_conversation_new_reply/$id/buat-artikel-1-saja';

       }else{
         tools.buttons[i].url =
         '${Env.value!.baseUrl}/user/my_projects/show_conversation_new_reply/$id/buat-artikel-1-saja/$id1/annncncncncnc';

       }
      }
      buttonChildren.add(
          ListButtonShowConversationWidget1(tools.buttons[i], context, cb));
    }
    return (
        buttonChildren
    );
  }


}







  

