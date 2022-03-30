import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
//import 'package:avataaar_image/avataaar_image.dart';
import 'testimonial_item_base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'testimonial_item.dart';
import 'testimonial_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:projectscoid/models/testimonial_base.dart';
import 'package:flutter_html/style.dart' as s;
import 'package:flutter_html/style.dart';

/** AUTOGENERATE OFF **/


class TestimonialModel extends TestimonialBase{
  Map<String, dynamic> json;
  TestimonialModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class TestimonialViewModel  extends TestimonialViewBase{
  Map<String, dynamic> json;
  TestimonialViewModel(Map<String, dynamic> this.json):super(json){model = TestimonialSuperBase.fromJson(this.json);}
  
}


///////////////////////////////////////////////////


class TestimonialListingModel extends TestimonialListingBase{
  Map<String, dynamic> json;
  TestimonialListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItem (ItemTestimonialModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemTestimonialCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemTestimonialCard1(destination :item, search : search, shape : shape, height : height, account : account)
    );
  }

  @override
  Widget viewItemIndex(ItemTestimonialModel item,String? search, int? index, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemTestimonialCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemTestimonialCard1(destination :item, search : search, shape : shape, height : height, index  : index,account : account)
    );
  }
}

class ItemTestimonialCard1 extends StatelessWidget {
  const ItemTestimonialCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemTestimonialModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;



  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      /*
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Column(
          children: <Widget>[
            index == 0? Container(height: 30,): Container(),
            // const SectionTitle(title: ''),
            Container(
             // height: height,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemTestimonialContent1(destination: destination, account: account),
            ),
            // ),
            Container(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              alignment: Alignment.center,
              height: 20.0,

            )
          ],
        ),
      ),

       */

      Card(
        elevation : 3.0,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin : EdgeInsets.only(left:25, top: 0, right:25, bottom: 15),
        color: Colors.white,
        child:
        ItemTestimonialContent1(destination: destination, account: account),
      ),


    );
  }
}


class ItemTestimonialContent1 extends StatelessWidget {
   ItemTestimonialContent1({ Key? key, this.destination, this.account }):super(key: key);
     // {//_randomizeAvatar();
      //}

  final ItemTestimonialModel? destination;
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
    var dateformat = DateFormat('dd/MM/yyyy');
    final mediaQueryData = MediaQuery.of(context);
/*
    final List<Widget> children = <Widget>[

      Divider(
        thickness: 2.0,
        height: 2.0,
        color: Colors.white,
      ),
      Row(
       // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisSize: MainAxisSize.min,
        children: <Widget>[

        Padding(
          padding : EdgeInsets.only(left: 25.0, right: 20.0, top: 0.0),
          child: destination!.item.user_photo_url == null ? Container(width: 0.0, height: 0.0,):
          Container(
            width: 60,
            height: 65,
            decoration: new ShapeDecoration(


              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),

              ),


              image: new DecorationImage(
                image: new NetworkImage(destination!.item.user_photo_url),
                fit: BoxFit.cover,

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
            //  mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              AnimatedDefaultTextStyle(
              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
              duration: kThemeChangeDuration,
              child:

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        //crossAxisAlignment: CrossAxisAlignment.s,
                        children: <Widget>[
                      // Expanded(
                       //  child:
                         GestureDetector(
                            onTap: (){
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute('public/browse_users/view/'+encode(destination!.item.user_id) + '/z'));
                            },
                            child: Text(destination!.item.user_str, overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),
                         // ),
                          //FractionallySizedBox(heightFactor: 0.05),

                          Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 5),
                              child:   Text(timeago.format(destination!.item.date), softWrap: true, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w300),
                              ),
                          ),


                        ],
                      ),
                    ),


                        Padding(
                        padding: const EdgeInsets.only(bottom: 3.0, top: 6),
                        child:
                              GestureDetector(
                                onTap: (){
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
                                },
                                child:
                                        Text( '@' + destination!.item.project_str, maxLines: 1, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,

                                          style: descriptionStyle.copyWith( fontSize: 14),
                                        ),
                              ),
                        ),



                 Container(
                    width: 260,
                    child:HtmlWidget( destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                        tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 6.0, right: 10),
                        bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 13.0, right: 10)),
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
                //left: 30,
                left: 10,
                child:


                GestureDetector(
                onTap: (){
                AppProvider.getRouter(context)!.navigateTo(
                context,
                urlToRoute('public/browse_users/view/'+encode(destination!.item.user_id) + '/z'));
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
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute('public/browse_users/view/'+encode(destination!.item.user_id) + '/z'));
                        },
                        child:
                        Padding(
                          padding: EdgeInsets.only(top: 17, right: 5),
                          child:Text(destination!.item.user_str, overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.w700),
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
                    destination!.item.date == null? '':
                    dateformat.format(destination!.item.date) + ' ' + 'WIB',
                    style: descriptionStyle!.copyWith(fontSize: 12 ),
                    ),
              )



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

      /*



      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
        child :
        GestureDetector(
          onTap: (){
            AppProvider.getRouter(context)!.navigateTo(
                context,
                urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
          },
          child:
          Html(
            // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
              data:destination!.item.project_str.replaceAll('&amp;', '&'),
              style: {
                "html": Style(
                    fontSize: FontSize.large,
                    fontWeight: FontWeight.w800
                ),
              }

          ),

        ),
      ),

      SizedBox(height: 1,),
      Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: HtmlWidget( destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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

       */
    Container(
   // height: destination!.item.feedback.length > 150 ? destination!.item.feedback.length > 200? 340: 290 : 240,//340.0,
    width: mediaQueryData.size.width ,
    color: Colors.transparent,
    child:

          Stack(
          children: [
                  Column(
                      children:<Widget>[
                        destination!.item.feedback.length < 60 ?
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:<Widget>[
                              Text( ' ❝', style: TextStyle(fontSize: 35, color: Colors.grey[300], fontWeight: FontWeight.w300)),
                            ]
                        )
                        :Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:<Widget>[
                              Text( ' ❝', style: TextStyle(fontSize: 55, color: Colors.grey[300], fontWeight: FontWeight.w300)),
                            ]
                        ),
                        destination!.item.feedback.length < 60 ? Container() : destination!.item.feedback.length < 100 ?Container(height: 30) :destination!.item.feedback.length < 150 ? Container(height: 40) : Container(height: 65) ,
                        destination!.item.feedback.length < 60 ?
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                              Text( '❞ ', style: TextStyle(fontSize: 35, color: Colors.grey[300], fontWeight: FontWeight.w300)),
                            ]
                        )
                            :Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                              Text( '❞ ', style: TextStyle(fontSize: 55, color: Colors.grey[300], fontWeight: FontWeight.w300)),
                            ]
                        ),

                      ]
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                /*


                             */

                Padding(
                    padding: destination!.item.feedback.length > 150 ? const EdgeInsets.only(top: 20.0) : EdgeInsets.only(top: 25.0),
                    child:
                    Center(
                      // width: mediaQueryData.size.width - 50.0 ,
                      child: Html(data: readText(destination!.item.feedback.trim().replaceAll('<p></p>', '').replaceAll('<div></div>', ''),250),

                        style: {
                          "html": Style(
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              textAlign: TextAlign.center,
                              color: Colors.black,
                              fontSize: destination!.item.feedback.length > 150 ? destination!.item.feedback.length > 200? FontSize(16.0) : FontSize(17.0):FontSize(18.0), fontWeight: FontWeight.w400, fontStyle: FontStyle.italic
                          ),

                        },
                      ),
                    )



                ),

                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Center(

                        child:
                        InkWell(
                            onTap: () {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
                            },

                            child :
                            Padding(
                              padding:  EdgeInsets.only(top: 15, left: 20,  bottom: 50, right: 20),
                              child:
                              Center(
                                child:Text( destination!.item.project_str.replaceAll('&amp;', '&'),
                                  maxLines: 2,
                                  overflow : TextOverflow.ellipsis,

                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,  ),
                                ),
                              ),

                            )



                        ),
                      ),


                    ]
                )


              ],
            ),

/*
            Align(
                alignment: Alignment.bottomCenter,


                child :
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Center(

                        child:
                        InkWell(
                            onTap: () {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
                            },

                            child :
                            Padding(
                              padding: EdgeInsets.only( left: 20,  bottom: 30, right: 20),
                              child:
                              Center(
                                child:Text( destination!.item.project_str.replaceAll('&amp;', '&'),
                                  maxLines: 2,
                                  overflow : TextOverflow.ellipsis,

                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,  ),
                                ),
                              ),

                            )



                        ),
                      ),


                    ]
                )
              /*
                           Text( '0${this.index.toString()}  ――――  04' ,
                             style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500 ),
                           ),

                                */


            ),

 */


            ]
          ),
    ),
      ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }



}

//class ItemTestimonial extends class ItemTestimonialBase{
//
//}



////////////////////////////
