
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/app/Env.dart';
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
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'as_project_owner_list_item.dart';
import 'as_project_owner_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'as_project_owner_list_base.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_html/style.dart';
/** AUTOGENERATE OFF **/

class AsProjectOwnerListingModel extends AsProjectOwnerListingBase{
  Map<String, dynamic> json;
  AsProjectOwnerListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem1 (ItemAsProjectOwnerModel item,ItemAsProjectOwnerModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
    ShapeBorder? shape;
    double height = 0;
    // height = totalHeight * 50;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        child:  ItemAsProjectOwnerCard1(destination :item, search : search, shape : shape, height: height, account: account)
    );


  }
}



class ItemAsProjectOwnerCard1 extends StatelessWidget {
  const ItemAsProjectOwnerCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemAsProjectOwnerModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;



  @override
  Widget build(BuildContext context) {
    return Center(
      child:    Card(
        elevation : 3.0,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin : EdgeInsets.only(left:25, top: 0, right:25, bottom: 15),

        child:
        ItemAsProjectOwnerContent1(destination: destination, account: account),
      ),

    );
  }
}

class ItemAsProjectOwnerContent1 extends StatelessWidget {
  ItemAsProjectOwnerContent1({ Key? key, this.destination, this.account }):super(key: key);
  // {//_randomizeAvatar();
  //}

  final ItemAsProjectOwnerModel? destination;
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
              child:
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



                ),
               child:
               GestureDetector
                 (
                   onTap: (){
                     AppProvider.getRouter(context)!.navigateTo(
                         context,
                         urlToRoute(destination!.item.accepted_worker_url ));
                   },
                   child:

                   Icon(
                     Icons.person,
                     size: 35.0,
                     //color: CurrentTheme.HomeColor,
                   )

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
                    child:
                    GestureDetector
                      (
                        onTap: (){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.accepted_worker_url ));
                        },
                        child:
                        Text(readText( destination!.item.accepted_worker_str, 15),
                          style: descriptionStyle!.copyWith( fontSize: 15),
                        ),                    )
                  ),
                  RatingBarIndicator(
                    rating:  destination!.item.owner_rating.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),
                  /*
                  SmoothStarRating(
                    rating: destination!.item.owner_rating.toDouble(),
                    size: 15,
                    starCount: 5,
                    color: CurrentTheme.PrimaryDarkColor,
                    // allowHalfRating: true,
                    allowHalfRating: true,

                  ),

                   */
                  Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child:  Text(
                                destination!.item.project_ending_str + ' Project'
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child:
                    GestureDetector(
                      onTap: (){
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute( Env.value!.baseUrl! + '/public/past_projects/view/'+ destination!.item.project_id+ '/zzz' ));
                      },
                      child:  destination!.item.finish_date == null?  Text( '@' + readText(destination!.item.title, 28) ) : Text( '@' + readText(destination!.item.title, 28) +  ' . ' + timeago.format(destination!.item.finish_date,  locale: 'en_short'),
                        style: descriptionStyle.copyWith( fontSize: 12),
                      )
                    ),
                  ),

                ],
              ),
              Container(
                width: 260,
                child:
                        destination!.item.owner_feedback == null? Container(height: 0.0, width: 0.0, color: Colors.white,):
                        HtmlWidget( destination!.item.owner_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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


    final List<Widget> children = <Widget>[

      ListTile(
        isThreeLine: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 2),
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
                        urlToRoute(destination!.item.accepted_worker_url ));
                  },
                  child :
                  CircleAvatar(
                    // radius: 100,
                    // minRadius: 70,
                    // maxRadius: 70,
                    // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                    backgroundImage: new NetworkImage(destination!.item.accepted_worker_avatar),
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
                            urlToRoute(destination!.item.accepted_worker_url ));
                      },
                      child:
                      Padding(
                        padding: EdgeInsets.only(top: 17, right: 5),
                        child:Text(destination!.item.accepted_worker_str, overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: descriptionStyle.copyWith(fontSize: 17,  letterSpacing: 1, fontWeight: FontWeight.w700),
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
                  destination!.item.finish_date == null? '':
                  dateformat.format(destination!.item.finish_date) + ' ' + 'WIB',
                  style: descriptionStyle.copyWith(fontSize: 12 ),
                ),

              )
              /*
              Padding(
                padding: const EdgeInsets.only( top: 4),
                child:
                SmoothStarRating(
                  rating: destination!.item.owner_rating.toDouble(),
                  size: 18,
                  starCount: 5,
                  color: CurrentTheme.PrimaryLightColor,
                  // allowHalfRating: true,
                  allowHalfRating: true,

                ),
              ),

               */

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





      ),
      SizedBox(height: 10,),
      Center(
        child:
        RatingBarIndicator(
          rating: destination!.item.owner_rating.toDouble()/2-0.01,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: CurrentTheme.PrimaryLightColor,
          ),
          itemCount: 5,
          itemSize: 30.0,
          unratedColor: Colors.black26,
          direction:  Axis.horizontal,
        ),


      ),
      SizedBox(height: 5,),

      Center(
        child: Text(destination!.item.owner_rating.toString() + '/10', style: TextStyle(fontSize: 12)),
      ),
      SizedBox(height: 8,),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
        child:
        GestureDetector(
          onTap: (){
            AppProvider.getRouter(context)!.navigateTo(
                context,
                urlToRoute( destination!.item.project_url));
          },
          child:
          Html(
            // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
              data:destination!.item.title,
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
        child:                         destination!.item.owner_feedback == null? Container(height: 0.0, width: 0.0, color: Colors.white,):

        HtmlWidget( destination!.item.owner_feedback.replaceAll('%;\"><\/div>', '%;background-color: #FF8000;\"><\/div>').replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
class ItemAsProjectOwnerCard1 extends StatelessWidget {
  const ItemAsProjectOwnerCard1({ Key key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double height;
  final ItemAsProjectOwnerModel destination;
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
              height: destination!.item.owner_feedback == null ? 150 : destination!.item.owner_feedback.length < 80 ? 250 + ('<p>'.allMatches(destination!.item.owner_feedback).length)*10.0
                  : 150.0 + ('<p>'.allMatches(destination!.item.owner_feedback).length)*4.0 + (destination!.item.owner_feedback.length / 40) * 20 ,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemAsProjectOwnerContent1(destination: destination),
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
                 // decoration: new BoxDecoration(

                    //color: Colors.lightBlue[100],
                   // color:CurrentTheme.ListColor,
                  //),
                )
              ],
            ),
            Container(

              padding: const EdgeInsets.fromLTRB(0.0, 0.0,  0.0, 0.0),
              height: 10.0,
              //decoration: new BoxDecoration(

                //color: Colors.lightBlue[100],
                //color:Colors.white,
             // ),
            )
            // ),


          ],
        ),
      ),
    );
  }
}


class ItemAsProjectOwnerContent1 extends StatelessWidget {
  const ItemAsProjectOwnerContent1({ Key key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemAsProjectOwnerModel destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    var dateformat = DateFormat('dd/MM/yyyy');

    final List<Widget> children = [
      Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child : Html(
                    // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                    data :  destination!.item.title,defaultTextStyle: descriptionStyle.copyWith(color: Colors.black,fontSize: 15, fontWeight:FontWeight.w800 ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child :
                  Html(
                    data : destination!.item.project_ending_str + ' Project' ,defaultTextStyle: TextStyle( fontSize: 14, fontWeight:FontWeight.w800 ),
                  ),
                ),

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
                                Icon(
                                  Icons.person,
                                  size: 35.0,
                                  //color: CurrentTheme.HomeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          destination!.item.accepted_worker_str,
                                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
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
                                  rating: destination!.item.owner_rating.toDouble(),
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
                                        Text(destination!.item.finish_date == null? '':
                                        dateformat.format(destination!.item.finish_date),
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

                  destination!.item.owner_feedback == null? Container(height: 0.0, width: 0.0, color: Colors.white,): Html(data: destination!.item.project_ending_id == 2? destination!.item.owner_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') : readText(destination!.item.owner_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),



              ],
            ),
          ]
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










  

