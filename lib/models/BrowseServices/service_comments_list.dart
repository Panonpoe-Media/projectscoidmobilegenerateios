
import 'package:json_annotation/json_annotation.dart';
import 'service_comments_list_base.dart';
import 'package:json_annotation/json_annotation.dart';
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
import 'package:flutter_html/flutter_html.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'service_comments_list_item.dart';
import 'service_comments_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:intl/intl.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
/** AUTOGENERATE OFF **/

class ServiceCommentsListingModel extends ServiceCommentsListingBase{
  Map<String, dynamic> json;
  String serviceID = '';
  bool isLogin = false;
  ServiceCommentsListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem1 (ItemServiceCommentsModel item,ItemServiceCommentsModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
    ShapeBorder? shape;
    double height = 0;
    serviceID = id;
    isLogin = account;
    // height = totalHeight * 50;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        child: index == 0 ? ItemServiceCommentsCard2(
            destination: item, search: search, shape: shape, height: height)
            : ItemServiceCommentsCard1(
            destination: item, search: search, shape: shape, height: height)
    );
  }


  @override
  List<SpeedDialChild>	 listButton(BuildContext context , String id){
    AccountController accountController;
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];


    // for(var i = 0; i < tools.buttons.length; i++)
    //{
    buttonChildren.add(SpeedDialChild(
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
        label: 'Reply',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: ()

            {
            isLogin == true ?

            AppProvider.getRouter(context)!.navigateTo(context,
                '/public/browse_services/service_comments_new_reply/' + serviceID +'/' + tools.meta.title)
          :
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  '/login/1');

        }

    ));
    // }

    return(
        buttonChildren
    );
  }

  @override
  SpeedDial	 Buttons(BuildContext context, bool visible , String id){
    return(
        SpeedDial(
            childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
                  label: 'Reply',
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



class ItemServiceCommentsCard2 extends StatelessWidget {
  const ItemServiceCommentsCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemServiceCommentsModel?  destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;



  @override
  Widget build(BuildContext context) {
    return

      Stack(
          children: [
            Container(
              color: CurrentTheme.MainAccentColor,

              width: MediaQuery.of(context).size.width,
              height: 60,
              /*
								 child:
								 Padding(
								   padding: EdgeInsets.only(left: 25, top: 20),
								   child: Text('What People say', style: TextStyle(fontSize: 20, color: Colors.white),),
								 )

								  */


            ),

            Center(
              child: Card(
                elevation : 3.0,
                borderOnForeground: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin : EdgeInsets.only(left:25, top: 0, right:25, bottom: 15),

                child:
                ItemServiceCommentsContent1(destination: destination, account: account),
              ),

            )
          ]

      );



  }
}


class ItemServiceCommentsCard1 extends StatelessWidget {
  const ItemServiceCommentsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemServiceCommentsModel?  destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin : EdgeInsets.only(left:25, top: 0, right:25, bottom: 15),
        color: Colors.white,
        child:
        ItemServiceCommentsContent1(destination: destination, account: account),
      ),

    );
  }
}


class ItemServiceCommentsContent1 extends StatelessWidget {
  ItemServiceCommentsContent1({ Key? key, this.destination, this.account }):super(key: key);
  // {//_randomizeAvatar();
  //}

  final ItemServiceCommentsModel? destination;
  final bool? account ;

  // Avataaar _avatar;
  //void _randomizeAvatar() => _avatar = Avataaar.random(skin: Skin.pale,
  //  style: Style.circle,);

  @override
  Widget build(BuildContext context) {
    //  print('url photo  === ${destination!.item.user_photo_url}');
    // print('url photo name === ${destination!.item.user_photo.name}');
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy hh:mm');
/*
    final List<Widget> children1 = <Widget>[

      Divider(
        thickness: 2.0,
        height: 2.0,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Padding(
              padding : EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
              child: destination!.item.user_photo_url == null ? Container(width: 0.0, height: 0.0,):
              Container(
                width: 38,
                height: 38,
                decoration: new ShapeDecoration(
                  shadows:[
                    BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                  ],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(
                        width: 3,
                        color: Colors.white
                    ),
                  ),


                  image: new DecorationImage(
                    image: new NetworkImage(destination!.item.user_photo_url),
                    fit: BoxFit.contain,

                  ),
                ),
              )
            // user_photo_url
            /*
          AvataaarImage(
            avatar: _avatar,
            errorImage: Icon(Icons.error),
            placeholder: Container(height: 0.0, width: 35.0,),
            width: 35.0,
          ),
          */
          ),



          // Text(getImageLink(this.model)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Text(readText(destination!.item.user_user_name, 15),
                      style: descriptionStyle.copyWith( fontSize: 15),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child:
                    GestureDetector(
                      onTap: (){
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
                      },
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // three line description
                          SmoothStarRating(
                            rating: destination!.item.user_seller_rating.toDouble(),
                            size: 15,
                            starCount: 5,
                            color: CurrentTheme.PrimaryLightColor,
                            // allowHalfRating: true,
                            allowHalfRating: true,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    dateformat.format(destination!.item.post_date),
                                    style: descriptionStyle.copyWith(fontSize: 12 ),
                                  ),

                                ]

                            ),
                          ),

                        ],
                      ),

                    ),
                  ),

                ],
              ),
              Container(
                width: 260,
                child:HtmlWidget( destination!.item.message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                   // tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 6.0, right: 10),
                   // bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 13.0, right: 10)
                ),
              )


            ],
          )

          //),





        ],
      ),

    ];
    */

    final List<Widget> children = <Widget>[

      ListTile(
        isThreeLine: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 1),
        //enabled: false,
        onLongPress: () {},
        //onTap: () => Navigator.of(context).pushNamed('chat'),
        onTap: () {

        },


        leading: Container(
          width: 80,
          height: 80,
          /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                top: 13,
                left: 30,
                child:


                GestureDetector(
                  onTap: (){
                    /*
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('public/browse_users/view/'+encode(destination!.item.user_user_id) + '/z'));

                     */
                  },
                  child :
                  CircleAvatar(
                    // radius: 100,
                    // minRadius: 70,
                    // maxRadius: 70,
                    // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                    backgroundImage: new NetworkImage(destination!.item.user_photo_url),
                  ),
                ),
              ),



            ],
          ),
        ),



        /*
              title: Text(
                '${widget._jsonMessage['display']}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

               */
        subtitle:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                //crossAxisAlignment: CrossAxisAlignment.s,
                children: <Widget>[
                  Expanded(
                    child:
                    GestureDetector(
                      onTap: (){
                        /*
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('public/browse_users/view/'+encode(destination!.item.user_user_id) + '/z'));

                         */
                      },
                      child:
                      Padding(
                        padding: EdgeInsets.only(top: 17, right: 5),
                        child:Text(destination!.item.user_user_name, overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: descriptionStyle!.copyWith(fontSize: 17,   letterSpacing: 1, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  //FractionallySizedBox(heightFactor: 0.05),

                  /*
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 5),
                    child:   Text(timeago.format(destination!.item.date), softWrap: true, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),

                  */


                ],
              ),
              Padding(
                padding: const EdgeInsets.only( top: 4),
                child:
                Text(
                  dateformat.format(destination!.item.post_date) + ' ' + 'WIB',
                  style: descriptionStyle.copyWith(fontSize: 12 ),
                ),
               /*
                SmoothStarRating(
                  rating: destination!.item.user_seller_rating.toDouble(),
                  size: 18,
                  starCount: 5,
                  color: CurrentTheme.PrimaryLightColor,
                  // allowHalfRating: true,
                  allowHalfRating: true,

                ),

                */
              ),

              /*
              Html(


                  data :"${destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')}",
                  shrinkWrap: false,
                  style: {
                    "html": s.Style(
                        fontSize: s.FontSize.medium,
                        textAlign: TextAlign.left,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 0.0, bottom: 0.0, top: 0),
                        fontWeight: FontWeight.w100,
                        lineHeight: 0.0,
                    ),
                  }

              ),

               */

              /*

              Container(
                width: 260,
                child:HtmlWidget( destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                    tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                    bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5)),
              )

               */

            ]
        ),




        /*
              Html(


              data :"${readText(widget._jsonMessage['lastmessage'], 100)}",
              style: {
                "html": Style(
                    fontSize: FontSize.medium,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NotoColorEmoji',
                    wordSpacing: -8
                ),
              }

            ),

               */
        // trailing: Text(readTimestamp(widget._jsonMessage['lasttime'])),
        /*
              trailing: Container(
                //  width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          /*
                        widget._jsonMessage['unread'] > 0
                            ? Icon(
                          Icons.check,
                          size: 10,
                        )
                            : Container(height: 10, width: 10),

                         */

                          Text("${readTimestamp(widget._jsonMessage['lasttime'])}",
                              style: TextStyle(fontSize: 13, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    widget._jsonMessage['unread'] > 0
                        ? Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        shape: BoxShape.circle,
                      ),
                      child:  Text(
                        "${widget._jsonMessage['unread'].toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                        : Container(
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),

             */


      ),
      SizedBox(height: 8,),
      Padding(padding: EdgeInsets.symmetric(horizontal: 25),
        child: HtmlWidget( destination!.item.message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
          //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
          textStyle: TextStyle(
            fontSize: 13,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,

          ),
          // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
        ),
      ),
      SizedBox(height: 20,),

    ];

    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }



}
/*
class ItemServiceCommentsCard1 extends StatelessWidget {
  const ItemServiceCommentsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double height;
  final ItemServiceCommentsModel destination;
  final String search;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.5, 0.0, 15.0),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            SizedBox(
              height: destination!.item.message == null ? 100 : destination!.item.message.length < 80 ? 160 + ('<p>'.allMatches(destination!.item.message).length)*10.0 + ('<br>'.allMatches(destination!.item.message).length)*10.0 : 80.0 + ('<p>'.allMatches(destination!.item.message).length)*18.0 + ('<br>'.allMatches(destination!.item.message).length)*10.0+ (destination!.item.message.length / 40) * 20 ,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemServiceCommentsContent1(destination: destination),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // padding: const EdgeInsets.all(8.0),

                  padding: const EdgeInsets.fromLTRB(0.0, 0.0,  0.0, 0.0),
                  height: 1.0,
                  width: mediaQueryData.size.width * 0.12,
                //  decoration: new BoxDecoration(

                    //color: Colors.lightBlue[100],
                 //   color:CurrentTheme.ListColor,
                 // ),
                )
              ],
            ),
            Container(
              // padding: const EdgeInsets.all(8.0),

              padding: const EdgeInsets.fromLTRB(0.0, 0.0,  0.0, 0.0),
              height: 10.0,
             // decoration: new BoxDecoration(

                //color: Colors.lightBlue[100],
            //    color:Colors.white,
            //  ),
            )

            // ),


          ],
        ),
      ),
    );
  }
}


class ItemServiceCommentsContent1 extends StatelessWidget {
  const ItemServiceCommentsContent1({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemServiceCommentsModel destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    var dateformat = DateFormat('dd/MM/yyyy');

    final List<Widget> children = [
      Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 16.0,
                  //top: 0.0,
                  child:    Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                              destination!.item.user_photo_url,
                              fit: BoxFit.cover,
                              height: 35.0,
                              width: 35.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination!.item.user_user_name,
                                    style: descriptionStyle.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                  ),

                                ]

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  //top: 0.0,
                  child:    Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: DefaultTextStyle(
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: descriptionStyle,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // three line description
                          SmoothStarRating(
                            rating: destination!.item.user_seller_rating.toDouble(),
                            size: 15,
                            starCount: 5,
                            color: CurrentTheme.PrimaryDarkColor,
                            // allowHalfRating: true,
                            allowHalfRating: true,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    dateformat.format(destination!.item.post_date),
                                    style: descriptionStyle.copyWith(fontSize: 12 ),
                                  ),

                                ]

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Html(data: readText(destination!.item.message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
        ],
      )
    ];





    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}


 */








  

