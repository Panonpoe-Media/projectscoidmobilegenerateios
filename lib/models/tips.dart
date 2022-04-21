import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:timeago/timeago.dart' as timeago;
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
import 'tips_item.dart';
import 'tips_item_base.dart';
import 'photo.dart';
import 'tips_item_base.dart';
import 'package:projectscoid/models/tips_base.dart';
import 'package:projectscoid/views/route.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/** AUTOGENERATE OFF **/


class TipsModel extends TipsBase{
  Map<String, dynamic> json;
  TipsModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class TipsViewModel  extends TipsViewBase{
  Map<String, dynamic> json;
  TipsViewModel(Map<String, dynamic> this.json):super(json){model = TipsViewSuperBase.fromJson(this.json);}


@override
  Widget viewImage (BuildContext context) {

  return(

      Container(
            height: 300,
            decoration: BoxDecoration(
            image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.model.image_url),
            ),
      ),
  )
  );
  }


  @override
  Widget viewPublishedDate (BuildContext context) {
    var formatter = DateFormat('MMMM dd, yyyy');

    return(

        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top:30.0, bottom: 0.0),

              child: Text('${formatter.format(model.model.published_date)}', style: TextStyle(fontSize: 15))
        )
    );
  }


  @override
  Widget viewAuthor (BuildContext context) {


    return(

        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top:25.0, bottom: 15.0),

            child:

                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text('by ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                     Text(model.model.author_str, style: TextStyle(fontSize: 18, color: Colors.red)),

                   ],
                 )

        )
    );
  }



  Widget viewTitle(BuildContext context){
    return(
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
            ),
            child:
                Text(model.meta.title, style: TextStyle(fontSize: 34),),





          ),

        )
    );

  }


  Widget viewBeforeContent(BuildContext context){
    String? str = model.model.content;
    const start = '<p>';
    const end = '</p>';

    final startIndex = str!.indexOf(start);
    final endIndex = str!.indexOf(end, startIndex + start.length);

    return(
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 15.0, 23.0, 0.0),
          child: Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
              ),
              child:

              Column(
                children: <Widget>[
                  Divider(thickness: 1.0,),
                  startIndex == -1 ? Container(width:0.0, height: 0.0): Html(data: str.substring(startIndex + start.length, endIndex),
                      style: {
                        "html": Style(
                            fontSize: FontSize.medium,
                            color: Colors.grey,
                          //  backgroundColor: CurrentTheme.BackgroundColor
                        ),
                      },
                     // useRichText: true, defaultTextStyle : TextStyle(fontSize: 20, color: Colors.grey,),
                     // padding: const EdgeInsets.only(left: 0.0,),
                      onLinkTap: (url, _, __, ___) async{
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
                  Divider(thickness: 1.0,),
                ],
              )


          ),

        )
    );

  }

  @override
  Widget viewContent(BuildContext context){


    return(
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 23.0, 0.0),
          child: Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
              ),
              child:

              Column(
                children: <Widget>[
             //   Text(model.model.content.toString().replaceAll('<br>', '<br/>')),



/*
                  HtmlWidget(model.model.content.replaceAll('pre>', 'p>'), textStyle : TextStyle(fontSize: 14),
                //  HtmlWidget('<span>abcd<br>"defrrr"<br>sdsdsdsdsd<br></span>', textStyle : TextStyle(fontSize: 14),
                      onTapUrl: (url) async{
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
                      },
                    onTapImage:(src) =>
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshotsTip(image:'$src')),
                        ),
                  ),



*/




                  Html(data:model.model.content,
                    style:{
                    "html" :Style(fontSize: FontSize.medium),
                    "code" :Style(backgroundColor: Colors.grey[500], padding: EdgeInsets.all(10.0)),
                      "pre" :Style(backgroundColor: Colors.grey[500], padding: EdgeInsets.all(10.0)),
                    },
                    //  HtmlWidget('<span>abcd<br>"defrrr"<br>sdsdsdsdsd<br></span>', textStyle : TextStyle(fontSize: 14),
                    onLinkTap: (url, _, __, ___) async{
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
                    },
                    onImageTap:(src, _, __, ___) =>
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshotsTip(image:'$src')),
                        ),
                  ),




                ],
              )


          ),

        )
    );

  }



  @override
  Widget view (BuildContext context, ScrollController controller, bool? account) {


    viewChildren.clear();
    viewChildren.add(viewTitle(context));
    viewChildren.add(viewImage(context));
    viewChildren.add(viewPublishedDate(context));
    viewChildren.add(viewBeforeContent(context));
    viewChildren.add(viewAuthor(context));


    viewChildren.add(viewContent(context));
   // viewChildren.add(viewFiles(context));

    return(  SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: viewChildren
        )
    ));
  }

 // MyProjectsViewModel(Map<String, dynamic> this.json):super(json){model = MyProjectsViewSuperBaseRev.fromJson(this.json);}
  
}


class ShowItemScreenshotsTip extends StatelessWidget {
  final String? image;
  ShowItemScreenshotsTip({this.image});
  final _appbar = AppBar(
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: const Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
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
          image!
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

///////////////////////////////////////////////////


class TipsListingModel extends TipsListingBase{
  Map<String, dynamic> json;
  TipsListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItemIndex(ItemTipsModel item,String? search, int? index, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemTipsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemTipsCard2(destination :item, search : search, shape : shape!, height : height!, index : index!,account : account)
    );
  }
  @override
  Widget viewItem (ItemTipsModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemTipsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemTipsCard1(destination :item, search : search!, shape : shape!, height : height!, account : account!)
    );
  }
}

//class ItemTips extends class ItemTipsBase{
//
//}



////////////////////////////

class ItemTipsCard1 extends StatelessWidget {
  const ItemTipsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemTipsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;


  @override
  Widget build(BuildContext context) {
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
                height: destination!.item.published_date == null? 315 : destination!.item.teaser.length < 100? 240 :destination!.item.teaser.length < 200? 285 : 330,
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
                child: ItemTipsContent2(destination: destination!,  account : account) ,
                //  child: index == 0 ? ItemTipsContent2(destination: destination!,  account : account) :ItemTipsContent1(destination: destination!, account : account),
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
  }
}

class ItemTipsCard2 extends StatefulWidget {
  const ItemTipsCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemTipsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;

  @override
  _ItemTipsCard2State createState() => _ItemTipsCard2State();
}


class _ItemTipsCard2State extends State<ItemTipsCard2>  {

  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  void initState() {

    super.initState();
    //  print('halooo aku index ${widget.index.toString()}');
    if(widget.index! % 10 == 0){

      _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isBannerAdReady = true;
            });
          },
          onAdFailedToLoad: (ad, err) {
            print('Failed to load a banner ad: ${err.message}');
            _isBannerAdReady = false;
            ad.dispose();
          },
        ),
      );

      _bannerAd.load();
    }
  }

  @override
  void dispose() {
    if(widget.index! % 10 == 0) {
      _bannerAd.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
               child :   GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PublicTipsView(id: widget.destination!.item.article_id, title:widget.destination!.item.title)),
                    );
                  },
                  child: Card(
                    elevation : 10.0,

                    borderOnForeground: false,
                    margin : EdgeInsets.all(6.0),
                    child:
                    [1,3,6,8,9].contains(widget.index)?  ItemTipsContent1(destination: widget.destination!, account: widget.account) :_isBannerAdReady? ItemTipsContent2(bannerAd: _bannerAd, isBanner:_isBannerAdReady,destination: widget.destination!, account: widget.account):
                    ItemTipsContent2(bannerAd: null, isBanner:_isBannerAdReady,destination: widget.destination!, account: widget.account),
                  ),
              ),
    );
  }
}


class ItemTipsContent1 extends StatelessWidget {
  const ItemTipsContent1({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemTipsModel? destination;
  final bool? account ;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[
      //  destination!.viewChannels(context),
      // Photo and title.
      SizedBox(
        height: 220.0,

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
            //   child: Container()

            //  ),
            //  ),
            Positioned(
              bottom: 0.0,
              left: 10.0,
              right: 10.0,
              top: 5.0,
              //top: 0.0,
              child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[


                        Flexible(
                          child: Column(
                                     children: <Widget>[
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 0.0),
                                         child: Text(destination!.item.title, style: TextStyle(fontSize: 16),),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                                         child: Html(data: readText(destination!.item.teaser, 140) ,
                                           style: {
                                             "html": Style(
                                                 fontSize: FontSize.small,
                                                // color: Colors.black87,
                                                // backgroundColor: CurrentTheme.BackgroundColor
                                             ),
                                           },
                                         ),
                                           //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ), ),
                                       ),
                                     ],
                          )
                          ,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
                          child: DefaultTextStyle(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: descriptionStyle!,
                            child:


                            ClipRRect(

                              borderRadius:  BorderRadius.circular(10),
                              child: Image.network(
                                destination!.item.image_url,
                                fit: BoxFit.cover,
                                height:125.0,
                                width: 120.0,
                                // width: .0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



            ),
          ],
        ),
      ),
      // Photo and title.


      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 18.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(Icons.description, color: Colors.blueAccent,),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                Text(
                  '  ' + destination!.item.author_str,
                  style: descriptionStyle.copyWith(fontSize: 12 ),
                ),
              ),

              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                destination!.item.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
                  ' - ',
                  style: descriptionStyle.copyWith( fontSize: 13),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:destination!.item.published_date == null?  Container(height: 0.0, width: 0.0, color: Colors.white ,): Text(timeago.format(destination!.item.published_date)
                  ,
                  style: descriptionStyle.copyWith(fontSize: 13),
                ),
              ),

            ],
          ),
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

class ItemTipsContent2 extends StatelessWidget {
  const ItemTipsContent2({ Key? key, this.bannerAd, this.isBanner, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemTipsModel? destination;
  final bool? account ;
  final BannerAd? bannerAd;
  final bool? isBanner;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[
      //  destination!.viewChannels(context),
      // Photo and title.
      SizedBox(
        height: 250.0,

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
            //   child: Container()

            //  ),
            //  ),
            Positioned(
              bottom: 0.0,
              left: 10.0,
              right: 10.0,
              top: 5.0,
              //top: 0.0,
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
                  child:  ClipRRect(
                      borderRadius:  BorderRadius.only(
                        topLeft:  const  Radius.circular(10.0),
                        topRight: const  Radius.circular(10.0)),
                        child: Image.network(
                          destination!.item.image_url,
                          fit: BoxFit.cover,
                          height: 300.0,
                         // width: .0,
                        ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Photo and title.
    Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
           child: Text(destination!.item.title, style: TextStyle(fontSize: 16),),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 15.0, 5.0),
      child: Html(data: destination!.item.teaser ,
          style: {
            "html": Style(
                fontSize: FontSize.small,
               // color: Colors.black87,
               // backgroundColor: CurrentTheme.BackgroundColor
            ),
          },
         // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 )
      ),
    ),

      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 18.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.description, color: Colors.blueAccent,),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                Text(
                  '  ' + destination!.item.author_str,
                  style: descriptionStyle.copyWith(fontSize: 12 ),
                ),
              ),

              // three line description
              Padding(
                  padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                  child:
                  destination!.item.published_date == null? Container(height: 0.0, width: 0.0) :  Text(
                    ' - ',
                    style: descriptionStyle.copyWith( fontSize: 13),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:destination!.item.published_date == null?  Container(height: 0.0, width: 0.0, color: Colors.white ,): Text(timeago.format(destination!.item.published_date)
                  ,
                  style: descriptionStyle.copyWith( fontSize: 13),
                ),
              ),

            ],
          ),
        ),
      ),
      if (isBanner! )
        Center(
          child: Container(
            width: bannerAd!.size.width.toDouble(),
            height: bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: bannerAd!),
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