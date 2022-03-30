
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'user_arbitrations_list_item.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'user_arbitrations_list_base.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_html/style.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:photo_view/photo_view.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/core/components/utility/secure/secure.dart';

/** AUTOGENERATE OFF **/

class UserArbitrationsListingModel extends UserArbitrationsListingBase{
  Map<String, dynamic> json;
  UserArbitrationsListingModel(Map<String, dynamic> this.json):super(json);

  @override

  Widget viewItem1 (ItemUserArbitrationsModel item,ItemUserArbitrationsModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index)  {
    ShapeBorder? shape;
    double height = 0;
    // height = totalHeight * 50;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson())).contains(search)),
        child: ItemArbitrateReviewsCard1(
            destination: item, search: search, shape: shape, height: height)
    );
  }
}


class ItemArbitrateReviewsCard1 extends StatelessWidget {
  const ItemArbitrateReviewsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemUserArbitrationsModel? destination;
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
        ItemArbitrateReviewsContent1(destination: destination, account: account),
      ),

    );
  }
}


class ItemArbitrateReviewsContent1 extends StatelessWidget {
  ItemArbitrateReviewsContent1({ Key? key, this.destination, this.account }):super(key: key);
  // {//_randomizeAvatar();
  //}

  final ItemUserArbitrationsModel? destination;
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

    var md5str =    generateMd5(destination!.item.plaintiff_str.toLowerCase().trim());
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
                child:Icon(
                  Icons.person,
                  size: 35.0,
                  //  color: CurrentTheme.HomeColor,
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

                    GestureDetector(
                      onTap: (){
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.plaintiff_url));
                      },

                      child:
                      Text(readText(destination!.item.plaintiff_str, 15),
                        style: descriptionStyle!.copyWith( fontSize: 15),
                      ),
                    ),


                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child:
                      //  Flexible(
                      // child:
                        Container(
                              width: 300,
                              child:
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DescUserArbitrateInfo(info : destination)),
                                  );
                                },
                                child:
                                Text( '@' + readText(destination!.item.project_str, 100) +  ' . ' + timeago.format(destination!.item.requested_date,  locale: 'en_short'),
                                  style: descriptionStyle!.copyWith( fontSize: 12),
                                  overflow: TextOverflow.ellipsis, maxLines: 2,
                                ),
                              ),
                            ),
                  // )
                  ),

                ],
              ),
              Container(
                width: 260,
                child:
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DescUserArbitrateInfo(info : destination)),
                    );
                  },
                  child:

                  HtmlWidget( destination!.item.plaintiff_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                     // tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 6.0, right: 10),
                     // bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 13.0, right: 10)
                  ),
                ),
              )
            ],
          )

          //),





        ],
      ),

    ];



    final List<Widget> children = <Widget>[


      SizedBox(height: 8,),

      Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 5.0, 0.0, 0.0),
        child:
        GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    DescUserArbitrateInfo(info: destination)),
              );
            },
            child:
            HtmlWidget(
              // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
              destination!.item.project_str.replaceAll('&amp;', '&'),
              textStyle: TextStyle(
                fontSize: 15.75,
                letterSpacing: 1,
                fontWeight: FontWeight.w800,

              ),

            ),
          /*
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

           */

            /*
            Text(destination!.item.project_str.replaceAll('&amp;', '&'),
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontSize: 13,
                  wordSpacing: 1,
                  letterSpacing: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )

             */

        ),
      ),
      SizedBox(height: 15,),

      Padding(padding: EdgeInsets.symmetric(horizontal: 25),
        child:


        GestureDetector(
                onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DescUserArbitrateInfo(info : destination)),
                      );
                  },
               child:

                  HtmlWidget( destination!.item.plaintiff_description.trim().replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                    //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                    textStyle: TextStyle(
                      fontSize: 13,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,

                    ),
                    // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                  ),
      ),
    ),
      SizedBox(height: 10,),

      Padding(
          padding: EdgeInsets.only(left: 25),
          child:           Text('Komplain oleh:', style: descriptionStyle!.copyWith(fontSize: 17, fontWeight: FontWeight.w600),)

      ),
      //SizedBox(height: 5,),
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
                        urlToRoute(destination!.item.plaintiff_url));
                  },
                  child :
                  CircleAvatar(
                    // radius: 100,
                    // minRadius: 70,
                    // maxRadius: 70,
                    // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                    backgroundImage: new NetworkImage(destination!.item.plaintiff_avatar ?? 'https://www.gravatar.com/avatar/${md5str }' ),
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
                            urlToRoute(destination!.item.plaintiff_url));
                      },
                      child:
                      Padding(
                        padding: EdgeInsets.only(top: 17, right: 5),
                        child:Text(destination!.item.plaintiff_str, overflow: TextOverflow.ellipsis,
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
                  destination!.item.requested_date == null? '':
                  dateformat.format(destination!.item.requested_date ) + ' ' + 'WIB',
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





      ),
      SizedBox(height: 25,),

    ];

    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }



}

/*

class ItemArbitrateReviewsCard1 extends StatelessWidget {
  const ItemArbitrateReviewsCard1({ Key key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double height;
  final ItemUserArbitrationsModel destination;
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
              height: destination!.item.plaintiff_description == null ? 100 : destination!.item.plaintiff_description.length < 80 ? 220 + ('<p>'.allMatches(readText(destination!.item.plaintiff_description,80)).length)*10.0 : 180.0 + ('<p>'.allMatches(readText(destination!.item.plaintiff_description,150)).length)*4.0 + (readText(destination!.item.plaintiff_description,150).length / 40) * 20 ,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemArbitrateReviewsContent1(destination: destination),
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
                 //   color:CurrentTheme.ListColor,
                //  ),
                )
              ],
            ),
            Container(

              padding: const EdgeInsets.fromLTRB(0.0, 0.0,  0.0, 0.0),
              height: 10.0,
            //  decoration: new BoxDecoration(

                //color: Colors.lightBlue[100],
            //    color:Colors.white,
             // ),
            )
            // ),


          ],
        ),
      ),
    );
  }
}


class ItemArbitrateReviewsContent1 extends StatelessWidget {
  const ItemArbitrateReviewsContent1({ Key key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemUserArbitrationsModel destination;

  Widget _readMore(BuildContext context) {
    TextStyle readTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Colors.blue,
      fontSize: 18.0,
    );
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescUserArbitrateInfo(info : destination)),
                );
              } ,
              child: Text('Read more',
                  textAlign: TextAlign.start,
                  style:readTextStyle ),
            )

          ]
      ),
    );
  }


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
                    data :  destination!.item.project_str,defaultTextStyle: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child :
                  Html(
                    data : destination!.item.status_str + ' Arbitration' ,defaultTextStyle: TextStyle( fontSize: 14, fontWeight:FontWeight.w800 ),
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
                                 // color: CurrentTheme.HomeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          destination!.item.plaintiff_str,
                                          style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
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

                                Text('Date of complaint ' , style: descriptionStyle!.copyWith(fontSize: 12 )),

                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          dateformat.format(destination!.item.requested_date),
                                          style: descriptionStyle!.copyWith(fontSize: 12 ),
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

                Html(data: readText(destination!.item.plaintiff_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),

                _readMore(context),

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



class DescUserArbitrateInfo extends StatelessWidget {
  final ItemUserArbitrationsModel? info;
  ScrollController? controller;
  DescUserArbitrateInfo({this.info});


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    TextStyle readTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Colors.blue,
      fontSize: 18.0,
    );
    String sts = info!.item.status_str.split('>')[1].split('<')[0];

   // var data = document.getElementsByClassName('span');
   // String sts = data[0].text;

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
           // backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                /*
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0 , 0.0),
                  child: Icon(
                    Icons.person,
                    size: 35.0,
                  //  color: CurrentTheme.HomeColor,
                  ),
                ),
                 */
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text(
                          readText(info!.item.project_str, 30),
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 13.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Arbitration Detail',
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),

                      ]),
                ),
              ],
            )


        ),
        body:
        SingleChildScrollView(
            controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child:
            Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20.0, 8.0, 8.0, 20.0),
                      child:

                      Column(
                          children: <Widget>[
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child :

                              GestureDetector(
                                onTap: (){
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(info!.item.project_url));} ,
                                child:
                                Html(
                                  // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                                    data:info!.item.project_str,
                                    style: {
                                      "html": Style(
                                          fontSize: FontSize.xLarge,
                                          fontWeight: FontWeight.w600
                                      ),
                                    }

                                ),

                              ),
                            ),
                            info!.item.plaintiff_description == null? Container(width: 0.0, height: 0.0,):
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child : Html(data: '${info!.item.plaintiff_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ?? ''}',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  },
                                  onImageTap:(src, _, __, ___){
                                    // print('print source : $src');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ShowItemScreenshotsAbr(image:'$src')),
                                    );

                                  }
                              ),
                            ),
                            /*
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(info!.item.plaintiff_url));} ,
                                      child:   
                                      Text(
                                        '~ ${info!.item.plaintiff_str} / Complaint ',
                                        style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),

                             */
                            Divider(height: 30,),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    
                                    Text(
                                      'Complaint by',
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute(info!.item.plaintiff_url));} ,
                                        child:

                                        Text(
                                            '${info!.item.plaintiff_str}',
                                            style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                          ),
                                    )

                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                    Text(
                                      'Reported by',
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),

                                    Text(
                                      '${info!.item.type_str.replaceAll('Reported by', '')}',
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),

                                  ]
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                    Text(
                                      'Arbitration',
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),

                                    Text(
                                    '$sts',
                                    style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),
                                    /*
                                  Container(
                                    width: 105,
                                    child:  Html(
                                      data : info!.item.status_str ,
                                      // defaultTextStyle: TextStyle(fontSize: 14, fontWeight:FontWeight.w800 ),
                                      style: {
                                        "html": Style(
                                          fontSize: FontSize(14),
                                          fontWeight: FontWeight.w500,
                                         // alignment: Alignment.bottomRight,

                                        ),
                                      },
                                    ),
                                  ),

                                     */


                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    
                                    Text(
                                      'Request date',
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),
                                    
                                    Text(
                                      dateformat.format(info!.item.requested_date  ),
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                    ),
                                  ]
                              ),
                            ),

                            Divider(height: 20.0,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(info!.item.defendant_url));} ,
                                      child:
                                      Text(
                                        ' Defendant by ${info!.item.defendant_str} ',
                                        style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            info!.item.defendant_description == null? Container(width: 0.0, height: 0.0,):
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child : info!.item.defendant_description == ''?
                              Html(data: 'Defendant tidak memberikan respons balasan.',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              )

                              :Html(data: '${info!.item.defendant_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ?? ''}',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              ),
                            ),

                            Divider(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(info!.item.plaintiff_url));} ,
                                      child:
                                      Text(
                                        'Wished by ${info!.item.plaintiff_str}  ',
                                        style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            info!.item.plaintiff_wishes == null? Container(width: 0.0, height: 0.0,):
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child : info!.item.plaintiff_wishes == ''?
                              Html(data: 'Pengaju arbitrase tidak mengajukan harapan.',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              )

                                  :Html(data: '${info!.item.plaintiff_wishes.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ?? ''}',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(info!.item.defendant_url));} ,
                                      child:
                                      Text(
                                        'Wished by ${info!.item.defendant_str}  ',
                                        style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            info!.item.plaintiff_wishes == null? Container(width: 0.0, height: 0.0,):
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child : info!.item.defendant_wishes == ''?
                              Html(data: 'Defendant tidak mengajukan harapan.',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              )

                                  :Html(data: '${info!.item.defendant_wishes.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ?? ''}',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                      Text(
                                        'Analyzed by Arbitration Teams ',
                                        style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                      ),

                                  ]
                              ),
                            ),
                            info!.item.analysis == null? Container(height: 0.0, width: 0.0, color: Colors.white,)
                            :Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child : info!.item.analysis == ''?
                              Html(data: 'Tidak ada analisa dari team arbitrase karena arbitrase diselesaikan secara musyawarah oleh kedua belah pihak (self-mediated).',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              )

                                  :Html(data: '${info!.item.analysis.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ?? ''}',
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  }
                              ),
                            ),
                            Divider(),

                            Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child :
                                Container(
                                  height: 100,
                                  color: CurrentTheme.PrimaryLightColor,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[

                                              Text(
                                                'Defendant',
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                              ),

                                              Text(
                                                '${info!.item.defendant_str}',
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                              ),

                                            ]
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[

                                              Text(
                                                'Owner rating',
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                              ),

                                              // three line description
                                             /*
                                              SmoothStarRating(
                                                rating: info!.item.owner_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                              */
                                              RatingBarIndicator(
                                                rating: info!.item.owner_rating.toDouble()/2-0.01,
                                                itemBuilder: (context, index) => Icon(
                                                  Icons.star,
                                                  color: CurrentTheme.PrimaryColor,
                                                ),
                                                itemCount: 5,
                                                itemSize: 18.0,
                                                unratedColor: Colors.black26,
                                                direction:  Axis.horizontal,
                                              ),

                                            ]
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[

                                              Text(
                                                'Worker rating',
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                                              ),

                                              /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                                              RatingBarIndicator(
                                                rating: info!.item.worker_rating.toDouble()/2-0.01,
                                                itemBuilder: (context, index) => Icon(
                                                  Icons.star,
                                                  color: CurrentTheme.PrimaryColor,
                                                ),
                                                itemCount: 5,
                                                itemSize: 18.0,
                                                unratedColor: Colors.black26,
                                                direction:  Axis.horizontal,
                                              ),

                                            ]
                                        ),
                                      ),
                                    ],
                                  )
                                )
                            ),



                            info!.item.status_id == 7?
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child :
                              Html(
                                data : 'Tim Arbitrator sudah memberikan keputusan berdasarkan fakta-fakta yang tercatat di sistem kami. ' ,  style: {
                                "html": Style(
                                  fontSize: FontSize.large,
                                  fontWeight: FontWeight.w800,
                                  color: CurrentTheme.DarkAccentColor,
                                ),
                              },
                              ),
                            )
                                :
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 2.0),
                              child: Html( data : 'Kedua belah pihak mencapai kesepakatan bersama penyelesaian arbitrase di mana Worker menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%). Dengan ini arbitrase dinyatakan selesai.<p>Bandung, ${dateformat.format(info!.item.decided_date)}</p> ' ,

                                style: {
                                  "html": Style(
                                      color: CurrentTheme.NormalTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: FontSize.large,
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 2.0),
                                      backgroundColor: CurrentTheme.PrimaryLightColor
                                  ),
                                },
                              ),
                            ),
                            info!.item.status_id == 7? info!.item.type_id == 1?
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 2.0),
                              child: Html( data : 'Worker  ${info!.item.defendant_str} menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner ${info!.item.plaintiff_str} menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%).<p> Worker ${info!.item.defendant_str} rating ${info!.item.worker_rating.toString()}/10 dan point  ${info!.item.worker_point.toString()} sedangkan Owner ${info!.item.plaintiff_str} rating ${info!.item.owner_rating.toString()}/10 dan point  ${info!.item.owner_point.toString()}. </p>',
                                style: {
                                  "html": Style(
                                      color: CurrentTheme.NormalTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: FontSize.large,
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 2.0),
                                      backgroundColor: CurrentTheme.PrimaryLightColor
                                  ),
                                },
                              ),
                            )
                                :
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 2.0),
                              child: Html( data : 'Worker ${info!.item.plaintiff_str} menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner ${info!.item.defendant_str} menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%).<p> Worker ${info!.item.plaintiff_str}  rating ${info!.item.worker_rating.toString()}/10 dan point  ${info!.item.worker_point.toString()} sedangkan Owner ${info!.item.defendant_str} rating ${info!.item.owner_rating.toString()}/10 dan point  ${info!.item.owner_point.toString()}. </p>',
                                style: {
                                  "html": Style(
                                      color: CurrentTheme.NormalTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: FontSize.large,
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 2.0),
                                      backgroundColor: CurrentTheme.PrimaryLightColor
                                  ),
                                },),
                            )
                                : Container(width: 0.0, height: 0.0, color: Colors.white,),
                            info!.item.status_id == 7?  Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child :
                              Html(
                                data : 'Keputusan ini bersifat final dan tidak dapat diganggu gugat. Dengan demikian project kami nyatakan ditutup.<p>Bandung, ${dateformat.format(info!.item.decided_date)}</p>'  ,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.large,
                                    fontWeight: FontWeight.w800,
                                    color: CurrentTheme.DarkAccentColor,
                                  ),
                                },
                              ),
                            ): Container(width: 0.0, height: 0.0, color: Colors.white,),

                            Divider(),
                          ]
                      )
                  ),
                  /*
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child : Html(
                          // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                          data :  info!.item.project_str,
                          //defaultTextStyle: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                          style: {
                            "html": Style(
                              fontSize: FontSize.medium,
                              fontWeight: FontWeight.w800,
                             // color: CurrentTheme.DarkAccentColor,
                            ),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child :
                        Html(
                          data : info!.item.status_str + ' Arbitration' ,
                         // defaultTextStyle: TextStyle(fontSize: 14, fontWeight:FontWeight.w800 ),
                          style: {
                            "html": Style(
                              fontSize: FontSize.medium,
                              fontWeight: FontWeight.w800,

                            ),
                          },
                        ),
                      ),

   /*
                            DateTime decided_date;
                            int status_id;
                            String status_str;
                            List<int> status_list;
                            List<String> status_list_str;
                            int type_id;
                            String type_str;
                            List<int> type_list;
                            List<String> type_list_str;
                            int owner_rating;
                            int owner_point;
                            String owner_point_str;
                            double owner_amount;
                            String owner_amount_str;
                            int owner_percentage;
                            int worker_rating;
                            int worker_point;
                            String worker_point_str;
                            double worker_amount;
                            String worker_amount_str;
                            int worker_percentage;
                           */

                          Text('Complaint',
                              textAlign: TextAlign.start,
                              style:readTextStyle ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child :
                        Text(
                           info!.item.type_str  ,style: readTextStyle ),
                        ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child :
                        Text(
                            info!.item.plaintiff_str  ,style: readTextStyle ),
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
                                      //  color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                info!.item.plaintiff_str,
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
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

                                      Text('Date of complaint ' , style: descriptionStyle!.copyWith(fontSize: 12 )),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(info!.item.requested_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child :
                        Html(data: info!.item.plaintiff_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child :
                        Html(data: info!.item.plaintiff_wishes.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')),
                      ),

                      Text('Defend',
                          textAlign: TextAlign.start,
                          style:readTextStyle ),
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
                                                info!.item.defendant_str,
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
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
                        info!.item.defendant_response_date == null? Container(height: 0.0, width: 0.0, color: Colors.white,):  SizedBox(
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

                                      Text('Date of response ' , style: descriptionStyle!.copyWith(fontSize: 12 )),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(info!.item.defendant_response_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
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
                        info!.item.defendant_response_date == null? Container(height: 0.0, width: 0.0, color: Colors.white,): Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child :
                        Html(data: info!.item.defendant_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')),
                      ),
                        info!.item.defendant_response_date == null? Container(height: 0.0, width: 0.0, color: Colors.white,): Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child :
                        Html(data: info!.item.defendant_wishes.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')),
                      ),

                       info!.item.analysis == null? Container(height: 0.0, width: 0.0, color: Colors.white,): Text('Analytics',
                          textAlign: TextAlign.start,
                          style:readTextStyle ),
                       info!.item.analysis == null? Container(height: 0.0, width: 0.0, color: Colors.white,):Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        child :
                        Html(data : info!.item.analysis,
                          //  defaultTextStyle:readTextStyle
                          style: {
                          "html": Style(
                          fontFamily: 'Spectral',
                          fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                          fontSize: FontSize.medium,
                          ),
                          },
                        ),
                      ),


                      Text('Result',
                          textAlign: TextAlign.start,
                          style:readTextStyle ),
                      info!.item.status_id == 7?
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child :
                        Html(
                          data : 'Tim Arbitrator sudah memberikan keputusan berdasarkan fakta-fakta yang tercatat di sistem kami. ' ,  style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800,
                                                                      color: CurrentTheme.DarkAccentColor,
                                                                 ),
                                                                },
                        ),
                      )

                          :

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 10.0, 0.0, 2.0),
                        child: Html( data : 'Kedua belah pihak mencapai kesepakatan bersama penyelesaian arbitrase di mana Worker menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%). Dengan ini arbitrase dinyatakan selesai.<p>Bandung, ${dateformat.format(info!.item.decided_date)}</p> ' ,

                            style: {
                              "html": Style(
                                  color: CurrentTheme.NormalTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSize.small,
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 2.0),
                                  backgroundColor: CurrentTheme.PrimaryLightColor
                              ),
                            },
                         ),
                      ),

                      info!.item.status_id == 7? info!.item.type_id == 1?
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 10.0, 0.0, 2.0),
                        child: Html( data : 'Worker  ${info!.item.defendant_str} menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner ${info!.item.plaintiff_str} menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%).<p> Worker ${info!.item.defendant_str} rating ${info!.item.worker_rating.toString()}/10 dan point  ${info!.item.worker_point.toString()} sedangkan Owner ${info!.item.plaintiff_str} rating ${info!.item.owner_rating.toString()}/10 dan point  ${info!.item.owner_point.toString()}. </p>',
                          style: {
                            "html": Style(
                                color: CurrentTheme.NormalTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.small,
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 2.0),
                                backgroundColor: CurrentTheme.PrimaryLightColor
                            ),
                          },
                        ),
                      )
                          :
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 10.0, 0.0, 2.0),
                        child: Html( data : 'Worker ${info!.item.plaintiff_str} menerima ${info!.item.worker_amount_str} (${info!.item.worker_percentage.toString()}%) dan Owner ${info!.item.defendant_str} menerima ${info!.item.owner_amount_str} (${info!.item.owner_percentage.toString()}%).<p> Worker ${info!.item.plaintiff_str}  rating ${info!.item.worker_rating.toString()}/10 dan point  ${info!.item.worker_point.toString()} sedangkan Owner ${info!.item.defendant_str} rating ${info!.item.owner_rating.toString()}/10 dan point  ${info!.item.owner_point.toString()}. </p>',
                          style: {
                            "html": Style(
                                color: CurrentTheme.NormalTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.small,
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 2.0),
                                backgroundColor: CurrentTheme.PrimaryLightColor
                            ),
                          },),
                      )
                          : Container(width: 0.0, height: 0.0, color: Colors.white,),

                      info!.item.status_id == 7?  Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child :
                        Html(
                          data : 'Keputusan ini bersifat final dan tidak dapat diganggu gugat. Dengan demikian project kami nyatakan ditutup.<p>Bandung, ${dateformat.format(info!.item.decided_date)}</p>'  ,
                            style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800,
                                                                      color: CurrentTheme.DarkAccentColor,
                                                                 ),
                                                                },
                        ),
                      ): Container(width: 0.0, height: 0.0, color: Colors.white,),



                    ],
                  ),

                   */
                ]
            )

        )


    );

  }
}



class ShowItemScreenshotsAbr extends StatelessWidget {
  final String? image;
  ShowItemScreenshotsAbr({this.image});
  var _appbar = AppBar(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Text(
        'View',
        style: TextStyle(
            fontFamily: "Gotik",
            fontSize: 20.0,
            color: Colors.white,
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
          this.image!,
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


  

