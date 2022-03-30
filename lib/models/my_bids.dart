import 'package:flutter/cupertino.dart';

import 'my_bids_item.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/models/my_bids_base.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:convert';
import 'package:projectscoid/app/Env.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/sent_message_widget.dart';
import 'package:filesize/filesize.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/api/api.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/** AUTOGENERATE OFF **/

class CancelBidMyBidsModel extends CancelBidMyBidsBase{

  Map<String, dynamic> json;
  CancelBidMyBidsModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget injectAction(BuildContext context, bool?visible, var formKey, ScrollController controller, MyBidsController my_bids,
      var postCancelBidResult, State state, String? sendPath, String? id,  String? title, bool?isLoading ) {
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    Future<void> _showNotification( String msg, int id, String title) async {
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
          'your channel id', 'your channel name',
          importance: Importance.max, priority: Priority.high, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
      await AppProvider.getApplication(context).flutterLocalNotificationsPlugin!.show(
          id, title, msg, platformChannelSpecifics,
          payload: title);
    }

    void showProgress(received, total) {
      if (total != -1) {
        state.setState(() {
          _showNotification("Download " + (received / total * 100).toStringAsFixed(0) + "%", 3,
              'My Bids');
        });

        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    }


    return(

        SingleChildScrollView(
            controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CategoryWidget(
                title: 'Cancel Bid',
                subtitle : 'Pembatalan bid pada project yang telah dibid.',
                isDark: darkMode,

                children: <Widget>[
                               ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                     isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'PROJECT',
                                        model.model.project_str,
                                      ]
                                  ),

                                  ItemListWidget(
                                    //  icon: Icons.calendar_today,
                                      isDark: darkMode,
                                      tooltip: 'Send message',
                                      onPressed: (){
                                      },
                                      lines:
                                      'Bid Date',

                                      wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(model.model.date))
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      isDark: darkMode,
                                      tooltip: 'Send message',

                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'Amount',
                                        model.model.amount_str,
                                      ]
                                  ),
                                  ItemListWidget(
                                   // icon: Icons.event_note,
                                    tooltip: 'Send message',
                                    onPressed: (){
                                    },
                                    lines:
                                    'Message',

                                    wgt:model.model.message != null ? HtmlWidget(
                                      model.model.message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                                      onTapUrl: (url) async{
                                        if(url.contains('projects.co.id')){


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
                                                urlToRoute(url + '/listing/'));
                                          }


                                        }else
                                        {

                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }


                                        }

                                        throw 'Could not launch ';
                                      },
                                    ) : Container(height: 0.0, width: 0.0,),
                                  ),
                                  /*
                                  RangeWidget(
                                    value: value,
                                    valuemin: valueMin,
                                    valuemax: valueMax,
                                    caption: 'Publised Budget',
                                    hint: 'Isi dengan Money Anda',
                                    required:true,
                                    min: '0',
                                    max: '100000000',

                                    getValue1: (double val) {
                                      state.setState(() {
                                        valueMin = val;
                                      });
                                    },
                                    getValue2: (double val) {
                                      state.setState(() {
                                        valueMax = val;
                                      });
                                    },
                                    getValue: (String val) {
                                      state.setState(() {
                                        value = val;
                                      });
                                    },
                                  ),

                                   */
                                  CaptchaWidget(
                                    value: model.model.captcha,
                                    caption: 'Captcha',
                                    hint: '',
                                    required: true,
                                    getValue:(String val) {
                                      state.setState(() {
                                        model.model.captcha = val;
                                      });
                                    },
                                  ),
                                   model.model.attachments == null ? Container(width: 0.0, height: 0.0,):
                                  LinkViewWidget(
                                      icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      onPressed: ()async {
                                        MyBidsController my_bids;
                                        my_bids =  MyBidsController(AppProvider.getApplication(context),
                                            Env.value!.baseUrl! + model.model.attachments_url,
                                            AppAction.post,
                                            '',
                                            'projectscoiddownloadFile',
                                            null,
                                            false);
                                        final future = my_bids.downloadFile1(showProgress);
                                        future.then((value) {
                                          state.setState(() {

                                            _showNotification("Filepath : Download/ $value " , 4,
                                                'My Bids : Download complete');
                                          });
                                        }).catchError((Error){
                                          AppProvider.getRouter(context)!.pop(context);
                                        });



                                      } ,
                                      lines: model.model.attachments_name ,
                                  ),


                ]
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child:  GFButtonBar(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.start,

                      children: <Widget>[
                        GFButton(
                          color: CurrentTheme.SecondaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                        ),
                        GFButton(
                          color: CurrentTheme.SecondaryColor,
                          onPressed:
                              ()async{
                            //st.setState(() {

                            //});

                                {
                                  {
                                    controller.animateTo(controller.position.minScrollExtent,
                                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                    if (formKey.currentState.validate()) {
                                      //Map<String, dynamic> res = model.toJson();
                                      //print('json result == $res');
                                      var formData = await convertFormDataAction(model, 'Cancel Bid' );
                                      my_bids =  MyBidsController(AppProvider.getApplication(context),
                                          sendPath,
                                          AppAction.post,
                                          id,
                                          title,
                                          formData,
                                          false);
                                      final future = my_bids.postMyBids();
                                      future.then((value) {
                                        state.setState(() {
                                          postCancelBidResult = value;
                                        });
                                      }).catchError((Error){
                                        //AppProvider.getRouter(context)!.pop(context);
                                      });

                                    } else {}
                                  }
                                }
                          },
                          text: 'Done',
                        ),
                      ],
                    ),
                  ),

                ],
              ),

               ]
            )
        )

    );
  }
	  
}


class MyBidsModel extends MyBidsBase{
  Map<String, dynamic> json;
  MyBidsModel(Map<String, dynamic> this.json):super(json);

}
 


///////////////////////////////////////////////////


class MyBidsListingModel extends MyBidsListingBase{
  Map<String, dynamic> json;
  MyBidsListingModel(Map<String, dynamic> this.json):super(json);

  //@override
  Widget viewItemId1 (ItemMyBidsModel item,String? search, int? index, bool? account, String? id, ChatBloc? cb) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemMyProjectsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemMyBidsCard1(destination :item, search : search, shape : shape, height : height, account : account, username: id, cb: cb!)
    );
  }

}

//class ItemMyBids extends class ItemMyBidsBase{
//
//}
////////////////////////////
class ItemMyBidsCard1 extends StatelessWidget {
   ItemMyBidsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.username, this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyBidsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final String? username;
  ChatBloc? cb;

  @override
  Widget build(BuildContext context) {
    /*
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Column(
            children: <Widget>[
              // const SectionTitle(title: ''),

              SizedBox(
                // height:index == 0 ?  315 : height,
                height: destination!.item.date == null? 315 : (destination!.item.message.length < 100) && (destination!.item.project_str.length < 100)? 225 : ((destination!.item.message.length >= 100) && (destination!.item.project_str.length < 100))||((destination!.item.message.length <= 100) && (destination!.item.project_str.length > 100))? 230 :destination!.item.message.length < 150? 245 : 295,
                /*  height: destination!.item.short_description.length < 200 ?  destination!.item.short_description.length.toDouble()*3.3
                     : destination!.item.short_description.length < 400 ?  destination!.item.short_description.length.toDouble()*3.7/4
                     : destination!.item.short_description.length < 600 ?  destination!.item.short_description.length.toDouble()*3.4/4
                     : destination!.item.short_description.length.toDouble()*3.6/4 ,
                     */

                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                 child: ItemMyBidsContent1(destination: destination, account: account, username : username, cb: cb!) ,
                //  child: index == 0 ? ItemMyBidsContent2(destination: destination,  account : account) :ItemMyBidsContent1(destination: destination, account : account),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration: BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color:CurrentTheme.ListColor,
                ),
              )
            ],
          )
      ),
    );


     */
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child:
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //  shadowColor: CurrentTheme.ListColor,

          child: ItemMyBidsContent1(destination: destination, account: account, username : username, cb: cb!) ,

        ),

      ),
    );
  }
}
class ItemMyBidsContent1 extends StatelessWidget {
  ItemMyBidsContent1({ Key? key, @required this.destination, this.account, this.username, this.cb })
      : assert(destination != null),
        super(key: key);

  final ItemMyBidsModel? destination;
  final bool? account ;
  final String? username;
  ChatBloc? cb;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');

    final size =MediaQuery.of(context).size;
    final width =size.width;

    String sts = destination!.item.project_project_status_str.split('>')[1].split('<')[0];
    String sts1 = destination!.item.status_str.split('>')[1].split('<')[0];

    final List<Widget> children = <Widget>[


      Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // three line description
              Container(
                width: 250,
                child: Stack(

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,2.0, 0.0, 0.0),
                      child: DefaultTextStyle(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: descriptionStyle!,
                        child: Container(
                          width: 250,
                          child:
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child:    Html(data: sts1.toUpperCase(),
                              //  defaultTextStyle: TextStyle(color: CurrentTheme.ErrorColor),
                              style: {
                                "html": Style(
                                  color: CurrentTheme.SecondaryColor,
                                  fontSize: FontSize.xLarge,
                                ),
                              },
                            ) ,

                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height:  120.0,
                        padding:  const EdgeInsets.fromLTRB(8.0, 32.0, 16.0, 0.0),
                        child:
                            Text('Bid Status' , style: TextStyle(fontSize: 14)),


                    ),
                  ],
                ),
              ),




              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    destination!.item.buttons != null?
                    destination!.item.buttons.length == 2?
                    PopupMenuButton<int>(
                      onSelected: (int value) {
                        if(value == 1) {
                          String url = '';
                          /*
                         //   url = destination!.item.buttons[0].url.substring(0, destination!.item.buttons[0].url.length - 1) +'${destination!.item.worker_str}*${destination!.item.worker_str}*0*1234*r';
                             url = destination!.item.buttons[0].url   +'/${destination!.item.worker_str}*${destination!.item.worker_str}*${destination!.item.worker_str}*1234*r';

                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                url);

                             */


                          url = '${destination!.item.buttons[0].url}\/*${destination!.item.worker_str}*${destination!.item.worker_str}*1234*r';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowConversationMyBids(id : '${url.split('\/')[4]}', title : '${url.split('\/')[5]}', id1: '${url.split('\/')[6]}', cb: cb!)),
                          );


                          //  urlToRoute(destination!.item.buttons[0].url  + '/**'));
                        }

                        if(value == 2) {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[1].url ));
                        }

                      },
                      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                        PopupMenuItem<int>(
                          value: 1,
                          child: Text(destination!.item.buttons[0].text),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Text(destination!.item.buttons[1].text),
                        ),


                      ],
                    ) :
                    destination!.item.buttons.length == 3?
                    PopupMenuButton<int>(
                      onSelected: (int value) {
                        if(value == 1) {
                          String url = '';

                          url = '${destination!.item.buttons[0].url}\/*${destination!.item.worker_str}*${destination!.item.worker_str}*1234*r';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowConversationMyBids(id : '${url.split('\/')[4]}', title : '${url.split('\/')[5]}', id1: '${url.split('\/')[6]}', cb: cb!)),
                          );
                          //  urlToRoute(destination!.item.buttons[0].url  + '/**'));
                        }

                        if(value == 2) {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[1].url ));
                        }
                        if(value == 3) {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[2].url ));
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                        PopupMenuItem<int>(
                          value: 1,
                          child: Text(destination!.item.buttons[0].text),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Text(destination!.item.buttons[1].text),
                        ),
                        PopupMenuItem<int>(
                          value: 3,
                          child: Text(destination!.item.buttons[2].text),
                        ),
                      ],
                    )

                        :Container(height: 0.0, width: 0.0, color: Colors.white,):
                    Container(height: 0.0, width: 0.0, color: Colors.white,),

                    //settingsRow,
                  ],
                ),

              )
            ],
          ),
        ),
      ),

      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              if(destination!.item.project_url.contains('past_projects')){
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(destination!.item.project_url ));

              }else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      PublicBrowseProjectsView(id: '${urlToRoute(
                          destination!.item.project_url).split('/')[4]}',
                          title: '${urlToRoute(
                              destination!.item.project_url).split('/')[5]}',
                          cb: cb!)),
                );
              }



              /*
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(destination!.item.buttons[destination!.item.buttons.length - 1].url ));


                 */
            },
            child:
            Ink(
                child: Html(data: readText(destination!.item.project_str , 400) ,
                  // useRichText: true, defaultTextStyle : titleStyle )
                  style: {
                    "html": Style(
                      display: Display.BLOCK,
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.w500,

                    ),
                  },
                )

            )
        ),
      ),

      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              if(destination!.item.project_url.contains('past_projects')){
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(destination!.item.project_url ));

              }else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      PublicBrowseProjectsView(id: '${urlToRoute(
                          destination!.item.project_url).split('/')[4]}',
                          title: '${urlToRoute(
                              destination!.item.project_url).split('/')[5]}',
                          cb: cb!)),
                );
              }
            },
            child:
            Ink(
                child: Html(data: destination!.item.message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
                  // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
                  style: {
                    "html": Style(
                      display: Display.BLOCK,
                      fontSize: FontSize.medium,
                    ),
                  },
                )

            )
        ),
      ),

      destination!.item.attachments == null ? Container(height: 0.0, width: 0.0,):
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child:
        GestureDetector(
          child:
          Container(
            width: width * 3/4,
            height: 70,

            decoration: ShapeDecoration(
              color:Colors.red[50],
              shadows:[
                BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
              ],

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                    width: 1,
                    color: Colors.white
                ),
              ),

            ),
            child:

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Attachment: ', style: TextStyle(fontSize: 10),),
                  Text('${destination!.item.attachments_name}', style: TextStyle(color: Colors.red, fontSize: 12),),
                  Text('(${filesize(destination!.item.attachments[0].size)}, ${dateformat.format(DateTime.fromMillisecondsSinceEpoch(destination!.item.attachments[0].modified*1000))} WIB)', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),

          ),
          /*
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Attachment: ', style: TextStyle(fontSize: 10),),
                              Text('$basename', style: TextStyle(color: Colors.red, fontSize: 12),),
                              Text('(${filesize(fileSize)}, ${dateformat.format(date)} WIB)', style: TextStyle(fontSize: 12)),
                            ],
                          ),

                           */



          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShowFile(file:destination!.item.attachments_url,fz:filesize(destination!.item.attachments[0].size), basename: destination!.item.attachments_name,)));

          },
        ),
      ),

      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {

            },
            child:
            Text('Project Status: $sts'),
          )
      ),

      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {

            },
            child:
            Text('Shortlisted: ${destination!.item.shortlisted ? 'No': 'Yes'}'),
          )
      ),

      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {

            },
            child:
            Text('Date: ${dateformat.format(destination!.item.date)}'),
          )
      ),

      SizedBox(height: 20,),

      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {

            },
            child:
            Text('Amount: ${destination!.item.amount_str}'),
          )
      ),

      SizedBox(height: 20,),

      ButtonBarTheme(
        data: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.43 * width,
        ),
        child:
        ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.43 * width,
            children: <Widget>[
              RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.messenger_outline, size: 20, color:Colors.white),
                      SizedBox(width: 5,),
                      Text('Chat With Owner')
                    ],
                  ),
                  textColor: Colors.white,
                  splashColor : CurrentTheme.ShadeColor,
                  color : Color(0xFF037f51),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF037f51), width: 1)
                  ),

                  onPressed: () async{

                    getApplicationDocumentsDirectory().then((value){
                      APIProvider projectsAPIProvider = APIProvider(value.path);
                      final future = projectsAPIProvider.getData(
                          '${Env.value!.baseUrl!}${urlToRoute(destination!.item.project_url)}');
                      future.then((value) {
                        try {
                          // var rsl = jsonDecode(value);
                          var idHash = encode(value['model']['owner_id']);
                          var peername = value['model']['owner_user_name'];
                          var avatar = value['model']['owner_photo_url'];
                          var dt = DateTime.parse(value['model']['owner_last_seen'] as String).toLocal();
                          print('ini date : ${dt.microsecondsSinceEpoch.toString()}');
                          var peer = destination!.item.worker_id;

                          String thread = '';
                          if (decode(idHash) > peer) {
                            thread = '${encode(peer)}/$idHash';
                          } else {
                            thread = '$idHash/${encode(peer)}';
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ChatScreen(
                                      user: {

                                        "thread": "$thread",
                                        "username": "${peername}",
                                        "userid": "${encode(peer)}",
                                        "display": "${peername}",
                                        "avatar": "${avatar}",
                                        "lastmesssage": "",
                                        "lastseen": (dt.millisecondsSinceEpoch/1000).round(),
                                        "lasttime": (dt.millisecondsSinceEpoch/1000).round()
                                      },
                                      userID: idHash,
                                      chatBloc: cb,
                                      trans: false,
                                      ctx: context,
                                    ),
                              )
                          ).then((value) async {
                            // _chatBloc.dispose();
                            SharedPreferences prefs = await SharedPreferences
                                .getInstance();
                            prefs.setBool('chatlink', true);
                          });
                        } catch (e) {
                          final ftr = projectsAPIProvider.getData(
                              '${Env.value!.baseUrl!}${urlToRoute(destination!.item
                                  .project_url.replaceAll(
                                  'browse_projects', 'past_projects'))}');
                          ftr.then((value) {
                            try {
                              // var rsl = jsonDecode(value);
                              var idHash = encode(value['model']['owner_id']);
                              var peername = value['model']['owner_user_name'];
                              var avatar = value['model']['owner_photo_url'];
                              var peer = destination!.item.worker_id;
                              var dt = DateTime.parse(value['model']['owner_last_seen'] as String).toLocal();
                              print('ini date : ${dt.microsecondsSinceEpoch.toString()}');

                              String thread = '';
                              if (decode(idHash) > peer) {
                                thread = '${encode(peer)}/$idHash';
                              } else {
                                thread = '$idHash/${encode(peer)}';
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ChatScreen(
                                          user: {

                                            "thread": "$thread",
                                            "username": "${peername}",
                                            "userid": "$idHash}",
                                            "display": "${peername}",
                                            "avatar": "${avatar}",
                                            "lastmesssage": "",
                                            "lastseen": (dt.millisecondsSinceEpoch/1000).round(),
                                            "lasttime": (dt.millisecondsSinceEpoch/1000).round()
                                          },
                                          userID: encode(peer),
                                          chatBloc: cb,
                                          trans: false,
                                          ctx: context,
                                        ),
                                  )
                              ).then((value) async {
                                // _chatBloc.dispose();
                                SharedPreferences prefs = await SharedPreferences
                                    .getInstance();
                                prefs.setBool('chatlink', true);
                              });
                            } catch (e) {

                            }
                          });
                        }
                      });

                    });




                  }
              )
            ]
        ),
      ),

      SizedBox(height: 30,),


    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }



}