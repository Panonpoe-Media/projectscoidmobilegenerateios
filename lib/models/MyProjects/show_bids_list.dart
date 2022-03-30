
import 'package:json_annotation/json_annotation.dart';
import 'show_bids_list_base.dart';
//import 'package:getflutter/size/gf_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'show_bids_list_item.dart';
import 'show_bids_list_item_base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/sent_message_widget.dart';
import 'package:filesize/filesize.dart';

/** AUTOGENERATE OFF **/

class ShowBidsListingModel extends ShowBidsListingBase{
  Map<String, dynamic> json;
  ShowBidsListingModel(Map<String, dynamic> this.json):super(json);


  @override
  Widget viewItem (ItemShowBidsModel item,String? search, bool? account, String? id) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemShowBidsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemShowBidsCard1(destination :item, search : search, shape : shape, height : height, account : account, username: id)
    );
  }

  Widget viewItemcb(ItemShowBidsModel item,String search, bool account, String id, ChatBloc cb) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        //  child:  ItemShowBidsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemShowBidsCard1(destination :item, search : search, shape : shape, height : height, account : account, username: id, cb : cb)
    );
  }

  @override
  Widget viewItem1 (ItemShowBidsModel item,ItemShowBidsModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        //  child:  ItemShowBidsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemShowBidsCard1(destination :item, search : search, shape : shape, height : height, account : account, username: id)
    );
  }
}






//class ItemShowBids extends class ItemShowBidsBase{
//
//}

////////////////////////////

class ItemShowBidsCard1 extends StatelessWidget {
  ItemShowBidsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.username, this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemShowBidsModel? destination;
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

              Container(
                // height:index == 0 ?  315 : height,
                // height: destination!.item.published_date == null? 315 : destination!.item.short_description.length < 100? 240 :destination!.item.short_description.length < 200? 285 : 330,
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
                child: ItemShowBidsContent2(destination: destination,  account : account, username: username, cb : cb) ,
                //  child: index == 0 ? ItemShowBidsContent2(destination: destination,  account : account) :ItemShowBidsContent1(destination: destination, account : account),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration:    BoxDecoration(
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

          child: ItemShowBidsContent2(destination: destination,  account : account, username: username, cb : cb) ,

        ),

      ),
    );
  }
}

class ItemShowBidsContent2 extends StatelessWidget {
       ItemShowBidsContent2(
      { Key? key, @required this.destination, this.account, this.username, this.cb })
      : assert(destination != null),
        super(key: key);

  final ItemShowBidsModel? destination;
  final bool? account;

  final String? username;
  ChatBloc? cb;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final size =MediaQuery.of(context).size;
    final width =size.width;
    var dateformat = DateFormat('dd/MM/yyyy  hh:mm:ss');
    Color getColor(Set<MaterialState> states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.focused,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.blue;
          }
          return Colors.green;
        }
    final List<Widget> children = <Widget>[
      //  destination!.viewChannels(context),
      // Photo and title.
      /*
      SizedBox(
        height: 35.0,

        child: Stack(
          children: <Widget>[

            //  Positioned.fill(
            // In order to have the ink splash appear above the image, you
            // must use Ink.image. This allows the image to be painted as part
            // of the Material and display ink effects above it. Using a
            // standard Image will obscure the ink splash.

            //child: //Ink.image(
            // alignment: FractionalOffset.centerLeft,

            // image: AssetImage(destination!.UserName, package: destination!.assetPackage),
            //fit: BoxFit.cover,
            //height: 41.0,
            //width: 30.0,
            //   child:    Container()

            //  ),
            //  ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              //top: 0.0,
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          destination!.item.owner_photo_url,
                          fit: BoxFit.cover,
                          height: 22.0,
                          width: 22.0,
                        ),
                      ),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination!.item.owner_str,
                                      style: descriptionStyle.copyWith(color: Colors.black,fontSize: 12 ),
                                    ),

                                  ]

                              ),
                            ),
                            Padding(
                                padding:
                                EdgeInsets.only(left: 12.0, top: 0.0),
                                child:  SmoothStarRating(
                                  rating: destination!.item.owner_owner_rating.toDouble(),
                                  size: 12,
                                  starCount: 5,
                                  // allowHalfRating: true,
                                  allowHalfRating: true,

                                )
                            ),
                          ]
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

       */

      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // three line description
                    GestureDetector(

                      child:  ClipRRect(
                                 borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                    destination!.item.worker_photo_url,
                                    fit: BoxFit.cover,
                                    height: 50.0,
                                    width: 50.0,
                                    ),
                                ),
                      onTap: (){ AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(destination!.item.buttons[0].url));}
                    ),


                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: (){AppProvider.getRouter(context)!.navigateTo(
                                                context,
                                                urlToRoute(destination!.item.buttons[0].url));},
                                      child: Text(
                                      destination!.item.worker_user_name,
                                              style: descriptionStyle.copyWith(fontSize: 12),
                                              ),
                                  )


                                ]

                            ),
                          ),
                          Padding(
                              padding:
                              EdgeInsets.only(left: 12.0, top: 0.0),
                              child:
                              Row(
                                  children:<Widget>[
                                    Padding(
                                      padding:
                                      EdgeInsets.only( top: 2.0),
                                      child:
                                      RatingBarIndicator(
                                        rating: destination!.item.worker_worker_rating_num.toDouble()/2-0.01,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: CurrentTheme.PrimaryLightColor,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        unratedColor: Colors.black26,
                                        direction:  Axis.horizontal,
                                      ),
                                      /*
                                        SmoothStarRating(
                                          rating: this.model.model.seller_seller_rating.toDouble()/2-0.01,
                                          size: 18,
                                          color: CurrentTheme.PrimaryLightColor,
                                          starCount: 5,
                                          allowHalfRating: true,
                                        )

                                             */
                                    ),
                                    Text(
                                      '(${destination!.item.worker_worker_rating_num.toStringAsPrecision(2)}/10)',
                                      style: TextStyle(fontSize: 15),
                                    ),

                                  ]

                              ),

                             /*
                              SmoothStarRating(
                                rating: destination!.item.worker_worker_rating_num,
                                size: 12,
                                color: CurrentTheme.PrimaryLightColor,
                                starCount: 5,

                                // allowHalfRating: true,
                                allowHalfRating: true,

                              )

                              */
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${destination!.item.worker_worker_point.toString()} points' ,
                                    style: descriptionStyle.copyWith(fontSize: 12),
                                  ),

                                ]

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${destination!.item.worker_kabupaten_str} ' ,
                                    style: descriptionStyle.copyWith(fontSize: 12),
                                  ),

                                ]

                            ),
                          ),
                        ]
                    ),

                       Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                            destination!.item.buttons != null ?
                            destination!.item.buttons.length == 1 ?
                            PopupMenuButton<int>(
                              onSelected: (int value) {
                                if (value == 1) {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[0].url));
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[

                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(destination!.item.buttons[0].text),
                                ),
                              ],
                            ) :
                            destination!.item.buttons.length == 2 ?
                            PopupMenuButton<int>(
                              onSelected: (int value) {
                                if (value == 1) {
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id


                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[0].url));

                                }
                                if (value == 2) {
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id
                                  String url = '';
                                  if (destination!.item.buttons[1].text
                                      .toLowerCase() == 'show conversation') {
                                    url =
                                    '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                        .worker_worker_rating_num.round().toString()}*${destination!.item
                                        .worker_photo_url!.split('?')[0].replaceAll(
                                        'https:\/\/cdn.projects.co.id\/upload\/',
                                        '').replaceAll(
                                        'https:\/\/www.gravatar.com\/avatar\/',
                                        'gravatar').replaceAll('\/', 'ccc')}';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          ShowConversationMyProjects(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb : cb)),
                                    );

                                    // AppProvider.getRouter(context)!.navigateTo(
                                    //  context,
                                    //  url);
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item.buttons[1].url));
                                  }
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[

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
                            destination!.item.buttons.length == 3 ?
                            PopupMenuButton<int>(
                              onSelected: (int value) {
                                if (value == 1) {

                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id


                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[0].url));

                                }
                                if (value == 2) {
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id
                                  String url = '';
                                  if (destination!.item.buttons[1].text
                                      .toLowerCase() == 'show conversation') {
                                    url =
                                    '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                        .worker_worker_rating_num.round().toString()}*${destination!.item
                                        .worker_photo_url!.split('?')[0].replaceAll(
                                        'https:\/\/cdn.projects.co.id\/upload\/',
                                        '').replaceAll(
                                        'https:\/\/www.gravatar.com\/avatar\/',
                                        'gravatar').replaceAll('\/', 'ccc')}';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          ShowConversationMyProjects(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb : cb)),
                                    );

                                    // AppProvider.getRouter(context)!.navigateTo(
                                    //    context,
                                    //    url);
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item.buttons[1].url));
                                  }
                                }
                                if (value == 3) {
                                  /*


                             */
                                  if(destination!.item.buttons[2].text == 'Accept Bid'){
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item.buttons[2].url));

                                  }else{
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('${destination!.item.buttons[2].text}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        content: Text('Apakah Anda yakin akan ${destination!.item.buttons[2].text}?'),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () => Navigator.of(context).pop(false),
                                            /*Navigator.of(context).pop(true)*/
                                            child: Text('Tidak'),
                                          ),
                                          FlatButton(
                                            onPressed: ()async{
                                              SubModelController del;
                                              String delPath = Env.value!.baseUrl! + destination!.item.buttons[2].url ;
                                              del =     SubModelController(AppProvider.getApplication(context),
                                                  delPath,
                                                  null);
                                              await del.getData();
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text('Ya'),
                                          ),

                                        ],
                                      ),
                                    );

                                  }




                                }

                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[

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
                            ) : destination!.item.buttons.length == 4 ?
                            PopupMenuButton<int>(
                              onSelected: (int value) async{
                                if (value == 1) {

                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id


                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[0].url));

                                }
                                if (value == 2) {
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                                  //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                                  //destination!.item.project_id
                                  String url = '';
                                  if (destination!.item.buttons[1].text
                                      .toLowerCase() == 'show conversation') {
                                    url =
                                    '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                        .worker_worker_rating_num.round().toString()}*${destination!.item
                                        .worker_photo_url!.split('?')[0].replaceAll(
                                        'https:\/\/cdn.projects.co.id\/upload\/',
                                        '').replaceAll(
                                        'https:\/\/www.gravatar.com\/avatar\/',
                                        'gravatar').replaceAll('\/', 'ccc')}';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          ShowConversationMyProjects(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb : cb)),
                                    );

                                    // AppProvider.getRouter(context)!.navigateTo(
                                    //    context,
                                    //    url);
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item.buttons[1].url));
                                  }
                                }
                                if (value == 3) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Add to Short listed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      content: Text('Apakah Anda yakin akan menambahkan bid ini ke short listed?'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          /*Navigator.of(context).pop(true)*/
                                          child: Text('Tidak'),
                                        ),
                                        FlatButton(
                                          onPressed: ()async{
                                            SubModelController del;
                                            String delPath = Env.value!.baseUrl! + destination!.item.buttons[2].url ;
                                            del =     SubModelController(AppProvider.getApplication(context),
                                                delPath,
                                                null);
                                            await del.getData();
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text('Ya'),
                                        ),

                                      ],
                                    ),
                                  );
                                  /*
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url));
                                */

                                }
                                if (value == 4) {

                                  /*
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Accept Bid', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                content: Text('Apakah Anda yakin akan menerima bid worker ${destination!.item.worker_user_name}?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    /*Navigator.of(context).pop(true)*/
                                    child: Text('Tidak'),
                                  ),
                                  FlatButton(
                                    onPressed: ()async{
                                      SubModelController del;
                                      String delPath = Env.value!.baseUrl! + destination!.item.buttons[3].url ;
                                      del =     SubModelController(AppProvider.getApplication(context),
                                          delPath,
                                          null);
                                      await del.getData();
                                    },
                                    child: Text('Ya'),
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    /*Navigator.of(context).pop(true)*/
                                    child: Text('Tidak'),
                                  ),
                                ],
                              ),
                            );

                            */


                                  // _onEmpty();



                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[3].url));


                                }

                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[

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
                                PopupMenuItem<int>(
                                  value: 4,
                                  child: Text(destination!.item.buttons[3].text),
                                ),
                              ],
                            ):
                            Container(
                              height: 0.0, width: 0.0, color: Colors.white,) :
                            Container(height: 0.0, width: 0.0, color: Colors.white,),

                          ]
                      ),
                      //settingsRow,
                    ),


                  ],
          ),
        ),
      ),
      // Photo and title.



      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () async{
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Add to Short listed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  content: Text('Apakah Anda yakin akan menambahkan bid ini ke short listed?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      /*Navigator.of(context).pop(true)*/
                      child: Text('Tidak'),
                    ),
                    FlatButton(
                      onPressed: ()async{
                        SubModelController del;
                        String delPath = Env.value!.baseUrl! + destination!.item.buttons[2].url ;
                        del =     SubModelController(AppProvider.getApplication(context),
                            delPath,
                            null);
                        await del.getData();
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Ya'),
                    ),

                  ],
                ),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(
                      destination!.item.buttons[destination!.item.buttons.length -
                          1].url));

               */
            },
            child:
            Ink(
                child: Html(data:
                    destination!.item.message.replaceAll('<div>', '')
                        .replaceAll('<\/div>', '')
                        .replaceAll('<br>', ' ').replaceAll('<p>', '')
                        .replaceAll('<\/p>', '<br>'),
                 // useRichText: true,
                  style: {
                    "html": Style(
                      fontSize: FontSize.medium,
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


                  },
                  onImageTap:(src, _, __, ___) =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowItemScreenshotsbid(image:'$src')),
                  ),
                )

            )
        ),
      ),

      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('${destination!.item.amount_str},-' , style: TextStyle(fontSize: 20, color: Colors.red))
      ),
      SizedBox(height: 10,),

      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('Current Projects: ${destination!.item.worker_current_projects.toString()}' , style: TextStyle(fontSize: 15))
      ),
      SizedBox(height: 10,),
      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('Jumlah Project: ${destination!.item.worker_projects_won_str??'0'}' , style: TextStyle(fontSize: 15))
      ),
      SizedBox(height: 10,),
      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('Prosentase Penyelesaian: ${destination!.item.worker_completion_rate_str == null?'-': destination!.item.worker_completion_rate_str.split('<')[0]}' , style: TextStyle(fontSize: 15))
      ),
      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('Matching Skills: ${destination!.item.matching_skills}%' , style: TextStyle(fontSize: 15))
      ),

      Container(
        // height:  120.0,
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 5.0, 0.0),
          child: Text('Rank:  ${destination!.item.worker_worker_ranking_str} ', style: TextStyle(fontSize: 15))

      ),

      SizedBox(height: 10,),
      ButtonBarTheme(
        data: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.6 * width,
        ),
        child: ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.6 * width,
            children: <Widget>[
              ElevatedButton(
                  child: Text('Chat With Worker'),
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith(getColor)),
                 // textColor: Colors.white,
                 // splashColor : CurrentTheme.ShadeColor,
                 // color : Colors.green,
                 // shape: RoundedRectangleBorder(
                 //     side: BorderSide(color: Colors.white, width: 1)
                 // ),

                  onPressed: () {
                    String idHash = '';
                    int peer ;
                    String peerUsername;
                    String peerLink;
                    String bidderID = destination!.item.buttons[0].url!.split('/')[6];

                    idHash = username!;
                    peer = decode(bidderID);
                    peerLink = destination!.item.worker_photo_url;
                    peerUsername= destination!.item.worker_user_name;

                    //  _chatBloc =    ChatBloc();
                    // if(widget.id == '')

                    // _chatBloc.wsSetHandlers();
                    //_chatBloc.lgn(widget.id);
                    // _chatBloc.lg(idHash);
                    //$idHash/${encode(this.model.model.owner_id)}
                    String thread = '';
                    if(decode(idHash) > peer ){
                      thread = '${encode(peer)}/$idHash';
                    }else{
                      thread = '$idHash/${encode(peer)}';
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {

                              "thread":"$thread",
                              "username":"${peerUsername}",
                              "userid":"${encode(peer)}",
                              "display":"${peerUsername}",
                              "avatar":"${peerLink}",
                              "lastmesssage":"",
                              "lastseen":1606880840,
                              "lasttime":1234567890

                            },
                            userID : idHash,
                            chatBloc : cb,
                            trans : true,
                            ctx: context,
                          ),
                        )
                    ).then((value)async{
                      // _chatBloc.dispose();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('chatlink', true );
                    });




                  }
              )
            ]
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

              decoration:    ShapeDecoration(
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

      /*

      FileViewRev(
        value: destination!.item.attachments_name,
        value1: destination!.item.attachments_url,
        caption: 'Attachments',
      ),

       */

      // Description and share/explore buttons.
      /*
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(

            children: <Widget>[
              // three line description
               Text(
                'Bid Amount . ',
                style: descriptionStyle.copyWith(fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                   '${destination!.item.amount_str},-'
                  ,
                  style: descriptionStyle.copyWith(fontSize: 13),
                ),
              ),
               Text(
                ' . ',
                style: descriptionStyle.copyWith(fontSize: 13),
              ),

               Text(
                 '${destination!.item.worker_current_projects_str == null? 0: destination!.item.worker_current_projects_str} current projects',
                style: descriptionStyle.copyWith(fontSize: 13),
              ),
             /*
                 Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      destination!.item.buttons != null ?
                      destination!.item.buttons.length == 1 ?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if (value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url));
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),
                        ],
                      ) :
                      destination!.item.buttons.length == 2 ?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if (value == 1) {
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id


                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[0].url));

                          }
                          if (value == 2) {
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id
                            String url = '';
                            if (destination!.item.buttons[1].text
                                .toLowerCase() == 'show conversation') {
                                url =
                                '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                    .worker_worker_rating_num.round().toString()}*${destination!.item
                                    .worker_photo_url!.replaceAll(
                                    'https:\/\/cdn.projects.co.id\/upload\/',
                                    '').replaceAll(
                                    'https:\/\/www.gravatar.com\/avatar\/',
                                    'gravatar').replaceAll('\/', 'ccc')}';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowConversationMyProjects(id: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[0]}',
                                          title: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[1]}',
                                          id1: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[2]}' )),
                                );

                             // AppProvider.getRouter(context)!.navigateTo(
                                //  context,
                                //  url);
                            } else {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[1].url));
                            }
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<int>>[

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
                      destination!.item.buttons.length == 3 ?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if (value == 1) {

                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id


                            AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[0].url));

                            }
                          if (value == 2) {
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id
                            String url = '';
                            if (destination!.item.buttons[1].text
                                .toLowerCase() == 'show conversation') {
                              url =
                              '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                  .worker_worker_rating_num.round().toString()}*${destination!.item
                                  .worker_photo_url!.replaceAll(
                                  'https:\/\/cdn.projects.co.id\/upload\/',
                                  '').replaceAll(
                                  'https:\/\/www.gravatar.com\/avatar\/',
                                  'gravatar').replaceAll('\/', 'ccc')}';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowConversationMyProjects(id: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[0]}',
                                          title: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[1]}',
                                          id1: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[2]}')),
                                      );

                             // AppProvider.getRouter(context)!.navigateTo(
                              //    context,
                              //    url);
                            } else {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[1].url));
                            }
                          }
                          if (value == 3) {
                            /*


                             */
                            if(destination!.item.buttons[2].text == 'Accept Bid'){
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[2].url));

                            }else{
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('${destination!.item.buttons[2].text}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  content: Text('Apakah Anda yakin akan ${destination!.item.buttons[2].text}?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      /*Navigator.of(context).pop(true)*/
                                      child: Text('Tidak'),
                                    ),
                                    FlatButton(
                                      onPressed: ()async{
                                        SubModelController del;
                                        String delPath = Env.value!.baseUrl! + destination!.item.buttons[2].url ;
                                        del =     SubModelController(AppProvider.getApplication(context),
                                            delPath,
                                            null);
                                        await del.getData();
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text('Ya'),
                                    ),

                                  ],
                                ),
                              );

                            }




                          }

                         },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<int>>[

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
                      ) : destination!.item.buttons.length == 4 ?
                      PopupMenuButton<int>(
                        onSelected: (int value) async{
                          if (value == 1) {

                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id


                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url));

                          }
                          if (value == 2) {
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/show_bids\/show_thread\/97e116\/zzz",
                            //destination!.item.project_id
                            String url = '';
                            if (destination!.item.buttons[1].text
                                .toLowerCase() == 'show conversation') {
                              url =
                              '${destination!.item.buttons[1].url}*${destination!.item.worker_user_name}*${destination!.item
                                  .worker_worker_rating_num.round().toString()}*${destination!.item
                                  .worker_photo_url!.replaceAll(
                                  'https:\/\/cdn.projects.co.id\/upload\/',
                                  '').replaceAll(
                                  'https:\/\/www.gravatar.com\/avatar\/',
                                  'gravatar').replaceAll('\/', 'ccc')}';
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    ShowConversationMyProjects(id: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[0]}',
                                        title: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[1]}',
                                        id1: '${url!.replaceAll('https:\/\/api.projects.co.id\/user\/my_projects\/show_conversation\/', '').split('\/')[2]}')),
                              );

                              // AppProvider.getRouter(context)!.navigateTo(
                              //    context,
                              //    url);
                            } else {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[1].url));
                            }
                          }
                          if (value == 3) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Add to Short listed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                content: Text('Apakah Anda yakin akan menambahkan bid ini ke short listed?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    /*Navigator.of(context).pop(true)*/
                                    child: Text('Tidak'),
                                  ),
                                  FlatButton(
                                    onPressed: ()async{
                                      SubModelController del;
                                      String delPath = Env.value!.baseUrl! + destination!.item.buttons[2].url ;
                                      del =     SubModelController(AppProvider.getApplication(context),
                                          delPath,
                                          null);
                                      await del.getData();
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text('Ya'),
                                  ),

                                ],
                              ),
                            );
                            /*
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url));
                                */

                          }
                          if (value == 4) {

                           /*
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Accept Bid', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                content: Text('Apakah Anda yakin akan menerima bid worker ${destination!.item.worker_user_name}?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    /*Navigator.of(context).pop(true)*/
                                    child: Text('Tidak'),
                                  ),
                                  FlatButton(
                                    onPressed: ()async{
                                      SubModelController del;
                                      String delPath = Env.value!.baseUrl! + destination!.item.buttons[3].url ;
                                      del =     SubModelController(AppProvider.getApplication(context),
                                          delPath,
                                          null);
                                      await del.getData();
                                    },
                                    child: Text('Ya'),
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    /*Navigator.of(context).pop(true)*/
                                    child: Text('Tidak'),
                                  ),
                                ],
                              ),
                            );

                            */


                             // _onEmpty();



                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url));


                          }

                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<int>>[

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
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),
                        ],
                      ):
                      Container(
                        height: 0.0, width: 0.0, color: Colors.white,) :
                      Container(height: 0.0, width: 0.0, color: Colors.white,),

                    ]
                ),
                //settingsRow,
              ),

              */




            ],
          ),
        ),
      ),

       */

      SizedBox(height: 30,),
    ];


    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}



class ShowItemScreenshotsbid extends StatelessWidget {
  final String? image;
  ShowItemScreenshotsbid({this.image});
  var _appbar = AppBar(
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Text(
        'View',
        style: TextStyle(
            fontFamily: "Gotik",
            fontSize: 20.0,
            color: Colors.black54,
            fontWeight: FontWeight.w700),
      ),
    ),

  );
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _appbar,
      //resizeToAvoidBottomPadding: false,
      body: PhotoView(
        imageProvider: NetworkImage(
          this.image!
          ,
        ),
        // Contained = the smallest possible size to fit one dimension of the screen
        minScale: PhotoViewComputedScale.contained * 0.8,
        // Covered = the smallest possible size to fit the whole screen
        maxScale: PhotoViewComputedScale.covered * 2.7,
        enableRotation: true,
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );

  }
}












  

