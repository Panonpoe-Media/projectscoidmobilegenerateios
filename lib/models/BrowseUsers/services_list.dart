
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'services_list_item.dart';
import 'services_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:json_annotation/json_annotation.dart';
import 'services_list_base.dart';
import 'package:flutter_html/style.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';

/** AUTOGENERATE OFF **/

class ServicesListingModel extends ServicesListingBase{
  Map<String, dynamic> json;
  String serviceID = '';
  bool isLogin = false;
  ServicesListingModel(Map<String, dynamic> this.json):super(json);

  //@override
  Widget viewItem2 (ItemServicesModel item,ItemServicesModel item1, String search, BuildContext context,bool account, String id ,  String title, String userid, bool isMax, int max, int index, ChatBloc cb) {
    ShapeBorder? shape;
    double height = 0;
    serviceID = id;
    isLogin = account;
    // height = totalHeight * 50;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        child:  ItemUserServiceCard(destination :item, search : search, shape : shape, account: account, height: height, idHash: userid, title : title, idSeller: id, cb: cb)
    );

  }

  @override
  List<SpeedDialChild>	 listButton(BuildContext context, String id){
    AccountController accountController;
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];


    // for(var i = 0; i < tools.buttons.length; i++)
    //{
    /*
    buttonChildren.add(SpeedDialChild(
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
        label: 'Replay',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: ()=>

        {
          if(isLogin){

            AppProvider.getRouter(context)!.navigateTo(context,
                '/public/browse_services/service_comments_new_reply/' + serviceID +'/' + tools.meta.title)
          }else
            {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  '/login/1')
            }
        }

    ));

     */
    // }

    return(
        buttonChildren
    );
  }

  @override
  SpeedDial	 Buttons(BuildContext context, bool visible, String id){
    return(
        SpeedDial(
            childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
            backgroundColor: CurrentTheme.SecondaryColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children: <SpeedDialChild>[
              SpeedDialChild(
                  child: Icon(Icons.save),
                  backgroundColor: Colors.green,
                  label: 'Replay',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: ()

                  {
                    isLogin == true ?

                      AppProvider.getRouter(context)!.navigateTo(context,
                          '/public/browse_services/service_comments_new_reply/' + serviceID +'/' + '123')
                    :

                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            '/login/1');

                  }
              )
            ]
        )
    );
  }

}



class ItemUserServiceCard extends StatelessWidget {
  ItemUserServiceCard({ Key? key, @required this.destination, this.search, this.shape, this.height, this.account, this.idHash, this.title, this.idSeller, this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemServicesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;
  final String? idHash;
  final String? title;
  final String? idSeller ;
  final ChatBloc? cb;



  @override
  Widget build(BuildContext context) {

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
            child:

            ItemUserServiceContent(destination: destination, account : account, idHash: this.idHash, title: this.title, idSeller: this.idSeller, cb: this.cb),

          ),
          //  margin: EdgeInsets.all(5.0),

        )
    );

    /*
    return Card(
      //padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 5.0,
      child: Center(
        child:

        ItemUserServiceContent(destination: destination, account : account),

      ),
      margin: EdgeInsets.all(5.0),
    );

     */



  }
}

class ItemUserServiceContent extends StatelessWidget {
   ItemUserServiceContent({ Key? key, @required this.destination, this.account, this.idHash, this.title, this.idSeller, this.cb })
      : assert(destination != null),
        super(key: key);

  final ItemServicesModel? destination;

  final bool? account;
  final String? idHash;
  final String? title;
  final String? idSeller;
  ChatBloc? cb;
  static String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }
  String readDate(DateTime dt) {
    var now = DateTime.now();
    var format = DateFormat('dd MMMM yyyy');
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(dt);
    var time = '';
    var day =  DateFormat('EE').format(dt);

    time = '  $day, ${format.format(dt)}';
    return time;
  }
  String filterShortcodes(String input,
      {String opening = '(', String closing = ')'}) {
    assert(opening.runes.length == 1);
    assert(closing.runes.length == 1);
    final openingRune = opening.runes.first;
    final closingRune = closing.runes.first;
    bool filter = false;
    final buf = StringBuffer();
    for (final rune in input.runes) {
      if (filter == false && rune == openingRune) {
        filter = true;
      } else if (filter == true && rune == closingRune) {
        filter = false;
      } else if (!filter) {
        buf.write(String.fromCharCode(rune));
      }
    }
    var str = buf.toString();
    return input.replaceAll(str, '').replaceAll('(', '').replaceAll(')', '');
  }
  @override
  void dispose() {
   // _chatBloc.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);

    // int owner_id1 = destination!.item.seller_id;
    // var ownerID = encode(owner_id1);
    int seller_id = decode(idSeller!);
    /*
    final List<Widget> children = <Widget>[
      // Photo and title!.
      SizedBox(
        height: mediaQueryData.size.height < 720 ?  100 : 130,
        child: Stack(

          children: <Widget>[
            Positioned.fill(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                top : 0.0,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child:
                Image.network(
                  destination!.item.logo_url,
                  fit: BoxFit.none,
                )
            ),


            Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('/public/browse_services/view/${destination!.item.service_id}/${destination!.item.title}'));
                      },
                    )
                )
            ),
            /*
            Positioned.fill(
                bottom: 17,
                left: 0.22 * mediaQueryData.size.width - destination!.item.price_str.length.toDouble() * 0.35,
                top:  75,
                right: 15,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child:
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 10.0,
                  decoration: new BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color:CurrentTheme.NormalTextColor,
                  ),
                  child: Text( destination!.item.price_str ,style: TextStyle(color: CurrentTheme.BackgroundColor, fontSize: 10),

                  ),
                )
            ),

             */
          ],
        ),
      ),


    ];

    final List<Widget> children1 = <Widget>[
      // Photo and title!.

      SizedBox(
          height: 55,
          //padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0 , 0.0),
          child:
          Stack(

              children: <Widget>[
                Positioned.fill(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top : 0.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child:   Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // three line description


                        //newly added
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0 , 0.0),
                                child: Column(
                                    children : <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute('/public/browse_services/view/${destination!.item.service_id}/${destination!.item.title}'));
                                        },
                                        child: Text(
                                            destination!.item.title, style: TextStyle(fontSize: 10),
                                            overflow: TextOverflow.ellipsis ,
                                            maxLines: 1,
                                        ),

                                        /*

                                        Html(

                                            data :readText(destination!.item.title , 30),
                                             style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.black,
                                                                 ),
                                                                },
                                        ),

                                         */
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                          children: <Widget>[
                                            // three line description
                                            Text(
                                              ratingMean(destination!.item.rating_num)  + ' . ' ,
                                              style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 9),
                                            ),

                                            Text(
                                              destination!.item.sales_count.toString() + ' sales' + ' . ',
                                              style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 9),
                                            ),
                                            Text(
                                              destination!.item.price_str  ,
                                              style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 9),
                                            ),


                                          ]
                                      ),

                                    ]
                                )
                            )
                        )

                      ]

                  ),

                ),
                Positioned.fill(
                    bottom: 0.0,
                    left:mediaQueryData.size.width < 350 ?  mediaQueryData.size.width * 1/3 : mediaQueryData.size.width * 1/2.8,
                    right: 0.0,
                    top : 0.0,
                    // In order to have the ink splash appear above the image, you
                    // must use Ink.image. This allows the image to be painted as part
                    // of the Material and display ink effects above it. Using a
                    // standard Image will obscure the ink splash.
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0 , 0.0),
                        child: Column(
                            children : <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                                child: PopupMenuButton<int>(
                                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 12.0),
                                  onSelected: (int value) {

                                    if(value == 1) {
                                      if(account){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(destination!.item.buttons[0].url ));
                                      }else{
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            '/login/1');
                                      }
                                    }

                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute('/public/browse_services/view/${destination!.item.service_id}/${destination!.item.title}'));
                                    }


                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                    const PopupMenuItem<int>(
                                      value: 1,
                                      child: Text('Chat with seller'),
                                    ),
                                    const PopupMenuItem<int>(
                                      value: 2,
                                      child: Text('View'),
                                    ),


                                  ],
                                ),
                              ),
                            ])
                    )

                ),
              ])
        /*
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              // three line description


              //newly added
              Flexible(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0 , 0.0),
                      child: Column(
                          children : <Widget>[
                            GestureDetector(
                              onTap: () {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.buttons[2].url ));
                              },
                              child: Html(

                                  data :readText(destination!.item.title , 40),
                                   style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.black,
                                                                 ),
                                                                },
                              ),
                            ),

                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    destination!.item.seller_str ,
                                    style: descriptionStyle.copyWith(color: Colors.black87, fontSize: 8),
                                  ),



                                ]
                            ),
                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    ratingMean(destination!.item.rating_num)  + ' . ' ,
                                    style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                  ),

                                  Text(
                                    destination!.item.sales_count.toString() + ' sales' + ' . ',
                                    style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                  ),
                                  Text(
                                    destination!.item.price_str  ,
                                    style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                  ),


                                ]
                            ),

                          ]
                      )
                  )
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0 , 0.0),
                  child: Column(
                      children : <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                          child: PopupMenuButton<int>(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 12.0),
                            onSelected: (int value) {

                              if(value == 1) {
                                if(account){
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[0].url ));
                                }else{
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      '/login/1');
                                }
                              }

                              if(value == 3) {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.buttons[1].url ));
                              }


                            },
                            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                              const PopupMenuItem<int>(
                                value: 1,
                                child: Text('Chat with seller'),
                              ),
                              const PopupMenuItem<int>(
                                value: 2,
                                child: Text('View'),
                              ),


                            ],
                          ),
                        ),
                      ])
              )

            ]

        ),

         */

      )

    ];

    return GridTile(
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children1,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );

     */


    final List<Widget> children = <Widget>[
      //viewHeader(context, account, _chatBloc),
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[

            Row(
              children:<Widget>[
                GestureDetector(
                  onTap: () {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('/public/browse_users/view/$idHash/$title'));
                  },
                  child:
                  Padding(
                    padding: EdgeInsets.only( top: 5, bottom:5, left:12),
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        destination!.item.logo_url,
                        fit: BoxFit.cover,
                        height: 63.0,
                        width: 60.0,
                      ),
                    ),

                  ),

                ),
                GestureDetector(
                  onTap: () {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('/public/browse_services/view/${destination!.item.service_id}/123' ));
                  },
                  child:
                  Padding(
                    padding: EdgeInsets.only( top: 1),
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 165,
                                    child:
                                    Text(destination!.item.title!.replaceAll('&amp;', '&'), maxLines:3, overflow: TextOverflow.clip, style: TextStyle(fontSize:13, fontWeight: FontWeight.w600)),

                                  ),

                                  /*
                                  Text(
                                    '${filterShortcodes(readText(title!.replaceAll('&amp;','&'), 40))} ',
                                    style: descriptionStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w800),
                                  ),

                                   */
                                 /*
                                  Row(
                                      children:<Widget>[
                                        Padding(
                                            padding:
                                            EdgeInsets.only(left: 8.0, top: 2.0),
                                            child:  SmoothStarRating(
                                              rating: destination!.item.rating_num.toDouble(),
                                              size: 12,
                                              color: CurrentTheme.PrimaryLightColor,
                                              starCount: 5,
                                              allowHalfRating: true,
                                            )
                                        ),
                                        Text(
                                          '(${destination!.item.sales_count.toString()})',
                                          style: descriptionStyle.copyWith(fontSize: 13),
                                        ),

                                      ]

                                  ),

                                  */

                                ]
                            ),
                          ),
                          /*
                          Row(
                            children:<Widget>[
                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 8.0, top: 2.0),
                                  child:  SmoothStarRating(
                                    rating: destination!.item.rating.toDouble(),
                                    size: 12,
                                    color: CurrentTheme.PrimaryLightColor,
                                    starCount: 5,
                                    allowHalfRating: true,
                                  )
                              ),

                            ]
                          )

                           */

                          //owner_owner_point
                        ]),
                  ),
                ),
              ],
            ),
            Expanded(
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children:<Widget>[


                    GestureDetector(
                      onTap: (){
                        if(account!){


                          //  var owner_id_str = destination!.item.buttons[0].url.replaceAll(new RegExp(r'[^0-9]'),'');

                          // int owner_id = int.parse(owner_id_str);
                        //  _chatBloc = new ChatBloc();

                          // if(widget.id == '')

                        //  _chatBloc.wsSetHandlers();
                          //_chatBloc.lgn(widget.id);
                        //  _chatBloc.lg(idHash);
                          //$idHash/${encode(this.model.model.owner_id)}
                          String thread = '';
                          if(decode(idHash!)> seller_id ){
                            thread = '${encode(seller_id)}/$idHash';
                          }else{
                            thread = '$idHash/${encode(seller_id)}';
                          }

                          if(cb != null){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    user: {

                                      "thread":"$thread",
                                      "username":"${filterShortcodes(readText(title!.replaceAll('&amp;','&'), 40))}",
                                      "userid":"${encode(seller_id)}",
                                      "display":"${filterShortcodes(readText(title!.replaceAll('&amp;','&'), 40))}",
                                      "avatar":"${destination!.item.logo_url}",
                                      "lastmessage":"<b>Konteks Percakapan: ${destination!.item.title!.replaceAll('&amp;', '&')}</b>",                                    "lastseen":1606880840,
                                      "lasttime":1234567890

                                    },
                                    userID : idHash,
                                    chatBloc : cb,
                                    trans : true,
                                    ctx: context,
                                  ),
                                )
                            ).then((value)async{
                              //  _chatBloc.dispose();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('chatlink', true );
                            });
                          }else{
                            var cb1 =  AppProvider.getApplication(context).chat;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    user: {

                                      "thread":"$thread",
                                      "username":"${filterShortcodes(readText(title!.replaceAll('&amp;','&'), 40))}",
                                      "userid":"${encode(seller_id)}",
                                      "display":"${filterShortcodes(readText(title!.replaceAll('&amp;','&'), 40))}",
                                      "avatar":"${destination!.item.logo_url}",
                                      "lastmessage":"<b>Konteks Percakapan: ${destination!.item.title!.replaceAll('&amp;', '&')}</b>",                                    "lastseen":1606880840,
                                      "lasttime":1234567890

                                    },
                                    userID : idHash,
                                    chatBloc : cb1,
                                    trans : true,
                                    ctx: context,
                                  ),
                                )
                            ).then((value)async{
                              //  _chatBloc.dispose();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('chatlink', true );
                            });
                          }

                        }else{
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              '/login/1');
                        }

                      },
                      child:
                      Container(
                        height: 60.0,
                        width: 37.0,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.only(bottom: 6),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                size: 20.0,
                                color: Colors.black38,
                              ),
                            ),
                            Text('Chat',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300)
                            ),

                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap:(){
                        if(account!){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute('/user/browse_services/place_order/${destination!.item.service_id}/zzzzz'));
                        }else{
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              '/login/1');
                        }
                      },
                      child:
                      Container(
                        height: 60.0,
                        width: 53.0,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.only( bottom: 8),
                              child: Icon(
                                Icons.add_shopping_cart,
                                size: 19.0,
                                color: Colors.green,
                              ),
                            ),
                            Text('Order',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w300)
                            ),

                          ],
                        ),
                      ),
                    ),


                  ]
              ),

            ),



          ]
      ),
      Container(
        height: 0.3,
        color: Colors.grey,
      ),
      /*
      GestureDetector(
        onTap: () {
          AppProvider.getRouter(context)!.navigateTo(
              context,
              urlToRoute('/public/browse_services/view/${destination!.item.service_id}/123' ));
        },
        child:
        Padding(
          padding:  const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
          child:
          Text(destination!.item.title!.replaceAll('&amp;', '&'), maxLines:1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize:13, fontWeight: FontWeight.w600)),

        ),

      ),

       */
      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
        child:
        GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute('/public/browse_services/view/${destination!.item.service_id}/123' ));
            },
            child: Ink(
              // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
              child:
              HtmlWidget(readText(destination!.item.short_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),250) ,
                //bodyPadding: EdgeInsets.only(left:0.0,  bottom: 12, top: 1),
                textStyle: TextStyle(fontSize:12),
                onTapUrl: (url) async{
                  if(url.contains('projects.co.id')){


                    if(url.contains(new RegExp(r'[0-9]'))){
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
                          urlToRoute(url + '/'));
                    }


                  }else
                  {

                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }


                  }
                  throw 'Could not launch';

                },
              ),
              /*
                Html(data: readText(destination!.item.short_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),400) ,
                    //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 )
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                      ),
                    }
                )

                 */
            )
        ),
      ),
      Container(
        height: 0.3,
        color: Colors.grey,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              Expanded(
                child:
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.only( right: 4),
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(  right: 6),
                              child:
                              Text('Start from',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300)
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only( top: 3.0, right: 10, bottom: 6),
                              child:
                              Text(
                                destination!.item.price_str,
                                style: descriptionStyle!.copyWith( fontSize: 11),
                              ),

                            )
                          ]
                      ),


                    ],
                  ),
                ),
              ),
              Container(
                width: 0.3,
                height:52,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only( right: 4),
                      child: Icon(
                        Icons.av_timer,
                        size: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(  right: 6),
                            child:
                            Text('Rating',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300)
                            ),
                          ),
                          Row(
                              children:<Widget>[
                                Padding(
                                    padding:
                                    EdgeInsets.only( top: 3.0,),
                                    child:  RatingBarIndicator(
                                      rating: destination!.item.rating.toDouble(),
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: CurrentTheme.PrimaryLightColor,
                                      ),
                                      itemCount: 5,
                                      itemSize: 12.0,
                                      unratedColor: Colors.black26,
                                      direction:  Axis.horizontal,
                                    ),

                                ),
                                Text('(${destination!.item.sales_count.toString()})',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w300)
                                ),


                              ]
                          )


                        ]
                    ),


                  ],
                ),

              ),
              Container(
                width: 0.3,
                height:52,
                color: Colors.grey,
              ),
              Expanded(
                child:
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.only( right: 4),
                        child: Icon(
                          Icons.av_timer,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(  right: 6),
                              child:
                              Text('Deadline',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300)
                              ),
                            ),

                            Padding(
                                padding: EdgeInsets.only( top: 3.0, right: 10, bottom: 6),
                                child:
                                Text(
                                    '${destination!.item.finish_days.toString()} days', style: descriptionStyle.copyWith(  fontSize: 11))

                            )
                          ]
                      ),


                    ],
                  ),
                ),
              ),


            ]
        ),
      ),

    ];

    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );


  }

}












  

