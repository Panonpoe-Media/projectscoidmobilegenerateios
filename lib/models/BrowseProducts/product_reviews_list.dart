
import 'product_reviews_list_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'product_reviews_list_item.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/AppProvider.dart';

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
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'product_reviews_list_item.dart';
import 'product_reviews_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
/** AUTOGENERATE OFF **/


ProductReviewsListingToolsRev _$ProductReviewsListingToolsRevFromJson(
    Map<String, dynamic> json) {
  return ProductReviewsListingToolsRev(

      json['id'] as String?,

      (json['buttons'] as List)
          ?.map((e) =>
      e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),


      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),



      (json['items'] as List)
          ?.map((e) => e == null
          ? null
          : ItemProductReviewsRev.fromJson(e as Map<String, dynamic>))
          ?.toList())


          ;

}

Map<String, dynamic> _$ProductReviewsListingToolsRevToJson(
    ProductReviewsListingToolsRev instance) =>
    <String, dynamic>{

      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,


      'paging': instance.paging,



      'items': instance.items


    };

class ProductReviewsListingToolsRev{

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  Paging? paging;



  List<ItemProductReviewsRev?>? items;


  ProductReviewsListingToolsRev(

      this.id,

      this.buttons,
      this.meta,


      this.paging,



      this.items,


      );


  factory ProductReviewsListingToolsRev.fromJson(Map<String, dynamic> json) => _$ProductReviewsListingToolsRevFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewsListingToolsRevToJson(this);

}


class ProductReviewsListingModel extends ProductReviewsListingBase{
  Map<String, dynamic> json;
  ProductReviewsListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItem1 (ItemProductReviewsModel item,ItemProductReviewsModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
    ShapeBorder? shape;
    double height = 0;
   // height = totalHeight * 50;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        child: index == 0 ? ItemProductReviewsCard2(
            destination: item, search: search, shape: shape, height: height)
            : ItemProductReviewsCard1(
            destination: item, search: search, shape: shape, height: height)
    );


  }
}






class ItemProductReviewsCard2 extends StatelessWidget {
  const ItemProductReviewsCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemProductReviewsModel? destination;
  final String? search;
  final ShapeBorder? shape;
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

              child:    Card(
                elevation : 3.0,
                borderOnForeground: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin : EdgeInsets.only(left:25, top: 0, right:25, bottom: 15),
                child:
                ItemProductReviewsContent1(destination: destination, account: account),
              ),
            )
          ]

      );



  }

}

class ItemProductReviewsCard1 extends StatelessWidget {
  const ItemProductReviewsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemProductReviewsModel? destination;
  final String? search;
  final ShapeBorder? shape;
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
        color: Colors.white,
        child:
        ItemProductReviewsContent1(destination: destination, account: account),
      ),
    );
  }

}
/*
class ItemProductReviewsCard1 extends StatelessWidget {
  const ItemProductReviewsCard1({ Key key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double height;
  final ItemProductReviewsModel destination;
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
                height: destination!.item.testimony == null ? 100 : destination!.item.testimony.length < 80 ? 160 + ('<p>'.allMatches(destination!.item.testimony).length)*10.0 : 80.0 + ('<p>'.allMatches(destination!.item.testimony).length)*4.0 + (destination!.item.testimony.length / 40) * 20 ,
                // child: Card(
                // This ensures that the Card's children are clipped correctly.
                //   clipBehavior: Clip.antiAlias,
                //   shape: shape,
                //  margin: EdgeInsets.all(0.0),
                child: ItemProductReviewsContent1(destination: destination),
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
                //    decoration: new BoxDecoration(

                 //     //color: Colors.lightBlue[100],
                      color:CurrentTheme.ListColor,
                  //  ),
                  )
                ],
              ),
                Container(

                padding: const EdgeInsets.fromLTRB(0.0, 0.0,  0.0, 0.0),
                height: 10.0,
              //  decoration: new BoxDecoration(

                //color: Colors.lightBlue[100],
              //  color:Colors.white,
             //   ),
                )
              // ),


            ],
          ),
      ),
    );
  }
}
*/
class ItemProductReviewsContent1 extends StatelessWidget {
  const ItemProductReviewsContent1({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemProductReviewsModel? destination;
  final bool? account ;


  @override
  Widget build(BuildContext context) {
    //  print('url photo  === ${destination!.item.user_photo_url}');
    // print('url photo name === ${destination!.item.user_photo.name}');
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy hh:mm');
    /*
    final List<Widget> children = <Widget>[

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
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: Icon(
                  Icons.person,
                  size: 35.0,
                  //  color: CurrentTheme.HomeColor,
                ),
              ),


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

                    child:  Text(readText(destination!.item.buyer_str, 15)

                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Row(
                      children: [
                        SmoothStarRating(
                          rating: destination!.item.rating.toDouble(),
                          size: 15,
                          starCount: 5,
                          color: CurrentTheme.PrimaryLightColor,
                          // allowHalfRating: true,
                          allowHalfRating: true,

                        ),
                        Text(   ' . ' + dateformat.format(destination!.item.date),
                          style: descriptionStyle.copyWith( fontSize: 12),
                        ),
                      ],
                    )
                        /*
                    GestureDetector(
                      onTap: (){
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('public/past_projects/view/'+encode(destination!.item.project_id) + '/z'));
                      },
                      child:
                      Text( '@' + readText(destination!.item.p, 28) +  ' . ' + timeago.format(destination!.item.date,  locale: 'en_short'),
                        style: descriptionStyle.copyWith( fontSize: 12),
                      ),
                    ),

                         */
                  ),

                ],
              ),
              Container(
                width: 260,
                child:HtmlWidget( destination!.item.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                  //  tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 6.0, right: 10),
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
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('public/browse_users/view/'+encode(destination!.item.buyer_id) + '/z'));
                  },
                  child :

                  CircleAvatar(
                    // radius: 100,
                    // minRadius: 70,
                    // maxRadius: 70,
                    // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                    backgroundImage: new NetworkImage(destination!.item.buyer_photo_url),
                  ),
                      /*
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    // radius: 20,
                    child: Icon(
                      Icons.person,
                      size: 45.0,
                      //  color: CurrentTheme.HomeColor,
                    ),
                  ),

                       */
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
                            urlToRoute('public/browse_users/view/'+encode(destination!.item.buyer_id) + '/z'));
                      },
                      child:
                      Padding(
                        padding: EdgeInsets.only(top: 17, right: 5),
                        child:Text(destination!.item.buyer_str, overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: descriptionStyle!.copyWith(fontSize: 17,  letterSpacing: 1, fontWeight: FontWeight.w700),
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
                  dateformat.format(destination!.item.date) + ' ' + 'WIB',
                  style: descriptionStyle.copyWith(fontSize: 12 ),
                ),

              ),



            ]
        ),




      ),
      SizedBox(height: 10,),
      Center(
        child:
        RatingBarIndicator(
          rating:  (destination!.item.rating/2)-0.01,
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
        child: Text(destination!.item.rating.toString() + '/10', style: TextStyle(fontSize: 12)),
      ),
      SizedBox(height: 8,),

      Padding(padding: EdgeInsets.symmetric(horizontal: 25),
        child: HtmlWidget( destination!.item.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
          //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
          textStyle: TextStyle(
            fontSize: 15,
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

  /*
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
                          Icon(
                            Icons.person,
                            size: 35.0,
                            //  color: CurrentTheme.HomeColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination!.item.buyer_str,
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
                            rating: destination!.item.rating.toDouble(),
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
                                    dateformat.format(destination!.item.date),
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
          Html(data: readText(destination!.item.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
        ],
      )
    ];





    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

   */
}
/*
class ItemProductReviewsContent1 extends StatelessWidget {
  const ItemProductReviewsContent1({ Key key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final ItemProductReviewsModel destination;

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
                            Icon(
                              Icons.person,
                              size: 35.0,
                            //  color: CurrentTheme.HomeColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination!.item.buyer_str,
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
                              rating: destination!.item.rating.toDouble(),
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
                                      dateformat.format(destination!.item.date),
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
            Html(data: readText(destination!.item.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
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







  

