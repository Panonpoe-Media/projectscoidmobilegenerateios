import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
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
import 'cerita_sukses_item.dart';
import 'cerita_sukses_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'cerita_sukses_item_base.dart';
import 'package:projectscoid/models/cerita_sukses_base.dart';
import 'package:projectscoid/views/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
/** AUTOGENERATE OFF **/


class CeritaSuksesModel extends CeritaSuksesBase{
  Map<String, dynamic> json;
  CeritaSuksesModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class CeritaSuksesViewModel  extends CeritaSuksesViewBase{
  Map<String, dynamic> json;
 // CeritaSuksesViewModel(Map<String, dynamic> this.json):super(json);
  CeritaSuksesViewModel(Map<String, dynamic> this.json):super(json){model = CeritaSuksesSuperBase.fromJson(this.json);}

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
    var formatter =DateFormat('MMMM dd, yyyy');

    return(

        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top:30.0, bottom: 0.0),

            child: Text(model.model.published_date == null ? '18 January, 2017':'${formatter.format(model.model.published_date)}', style: TextStyle(fontSize: 15))
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
                Text(model.model.author_str == null ? 'Heru': model.model.author_str , style: TextStyle(fontSize: 18, color: Colors.red)),

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
    String str = model.model.content;
    const start = '<p>';
    const end = '</p>';

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

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
                  Html(data: str.substring(startIndex + start.length, endIndex),
                      style: {
                        "html": Style(
                          fontSize: FontSize.medium,
                          color: Colors.grey,
                        ),
                      },
                      onLinkTap: (url, _, __, ___) async{
                        if(url!.contains('projects.co.id')){
                          if(url!.contains(new RegExp(r'[0-9]'))){
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

                  HtmlWidget(model.model.content, textStyle : TextStyle(fontSize: 14),

                      onTapUrl: (url) async{
                        if(url!.contains('projects.co.id')){
                          if(url!.contains(new RegExp(r'[0-9]'))){
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
                          throw 'Could not launch';
                        }
                        throw 'Could not launch';
                      }
                  ),

                ],
              )


          ),

        )
    );

  }

  @override
  Widget view (BuildContext context, ScrollController controller, bool? account, bool _isBannerAdReady,  _bannerAd) {


    viewChildren.clear();
    viewChildren.add(viewTitle(context));
    viewChildren.add(viewImage(context));
    viewChildren.add(viewPublishedDate(context));
  //  viewChildren.add(viewBeforeContent(context));
    viewChildren.add(viewAuthor(context));


    viewChildren.add(viewContent(context));
    viewChildren!.add(

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              const SizedBox(
                height: 10,
              ),
            if (_isBannerAdReady)
              Center(
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),


            if (_isBannerAdReady)
              const SizedBox(
                height: 10,
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
    );
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



}


///////////////////////////////////////////////////


class CeritaSuksesListingModel extends CeritaSuksesListingBase{
  Map<String, dynamic> json;
  CeritaSuksesListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem(ItemCeritaSuksesModel item,String? search,  bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemCeritaSuksesCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemCeritaSuksesCard2(destination :item, search : search, shape : shape, height : height, account : account)
    );
  }

}

//class ItemCeritaSukses extends class ItemCeritaSuksesBase{
//
//}

class ItemCeritaSuksesCard2 extends StatelessWidget {
  const ItemCeritaSuksesCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemCeritaSuksesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;


  @override
  Widget build(BuildContext context) {
    return Center(
      child :   GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PublicCeritaSuksesView(id: destination!.item.article_id, title:destination!.item.title)),
          );
        },
        child: Card(
          elevation : 10.0,

          borderOnForeground: false,
          margin : EdgeInsets.all(6.0),
          child:
          ItemCeritaSuksesContent2(destination: destination, account: account) ,
        ),
      ),
    );
  }
}

class ItemCeritaSuksesContent1 extends StatelessWidget {
  const ItemCeritaSuksesContent1({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemCeritaSuksesModel? destination;
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
        height: 200.0,

        child: Stack(
          children: <Widget>[

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
                          child: Text(destination!.item.title.replaceAll('&#039;', "'"), style: TextStyle(fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 5.0),
                          child: Html(data: readText(destination!.item.teaser.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 200) ,
                          //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor,
                            style: {
                              "html": Style(
                                fontSize: FontSize.small,
                                color: Colors.black87,
                                  backgroundColor: CurrentTheme.BackgroundColor
                              ),
                            },
                          ),
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

                        borderRadius: BorderRadius.circular(10),
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
              Icon(Icons.description, color: Colors.blueAccent,),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                Text(
                  '  ' + destination!.item.author_str,
                  style: descriptionStyle!.copyWith(color: Colors.black,fontSize: 12 ),
                ),
              ),

              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                destination!.item.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
                  ' - ',
                  style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 13),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:destination!.item.published_date == null?  Container(height: 0.0, width: 0.0, color: Colors.white ,): Text(timeago.format(destination!.item.published_date)
                  ,
                  style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 13),
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

class ItemCeritaSuksesContent2 extends StatelessWidget {
  const ItemCeritaSuksesContent2({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemCeritaSuksesModel? destination;
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
        height: 250.0,

        child: Stack(
          children: <Widget>[
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
                    borderRadius: BorderRadius.only(
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
        child: Html(data: destination!.item.teaser.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
          style: {
            "html": Style(
                fontSize: FontSize.small,
            ),
          },
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
                  style: descriptionStyle!.copyWith(fontSize: 12 ),
                ),
              ),

              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:
                destination!.item.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
                  ' - ',
                  style: descriptionStyle!.copyWith( fontSize: 13),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 5.0),
                child:destination!.item.published_date == null?  Container(height: 0.0, width: 0.0, color: Colors.white ,): Text(timeago.format(destination!.item.published_date)
                  ,
                  style: descriptionStyle!.copyWith( fontSize: 13),
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

////////////////////////////
