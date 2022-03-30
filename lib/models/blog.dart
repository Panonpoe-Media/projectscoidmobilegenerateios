
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'blog_item.dart';
import 'package:projectscoid/models/blog_base.dart';
import 'package:projectscoid/views/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_html/style.dart';

/** AUTOGENERATE OFF **/

class BlogModel extends BlogBase{
  Map<String, dynamic> json;
  BlogModel(Map<String, dynamic> this.json):super(json); 	

  
}

class BlogViewModel  extends BlogViewBase{
  Map<String, dynamic> json;
  BlogViewModel(Map<String, dynamic> this.json):super(json){model = BlogViewSuperBase.fromJson(this.json);}

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
    var formatter = new DateFormat('MMMM dd, yyyy');

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
        new Padding(
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
                  const Divider(thickness: 1.0,),
                  Html(data: str.substring(startIndex + start.length, endIndex),
                      style: {
                        "html": Style(
                            color: Colors.grey,
                            fontSize: FontSize.medium,
                        ),
                      },
                      onLinkTap: (url,_,__,___)async{
                        if(url!.contains('projects.co.id')){
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
                                url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
                  /*

                  HtmlWidget(model.model.content, textStyle : TextStyle(fontSize: 14),

                      onTapUrl: (url) async{
                        if(url!.contains('projects.co.id')){
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
                                url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
                          MaterialPageRoute(builder: (context) => ShowItemScreenshotsBlog(image:'$src')),
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
                    onLinkTap: (url,_,__,___) async{
                      if(url!.contains('projects.co.id')){
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
                              url.contains('/listing')? urlToRoute(url + '/'):urlToRoute(url + '/listing/'));
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
                    onImageTap:(src, _, __, ___)=>
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshotsBlog(image:'$src')),
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
  
}

class ShowItemScreenshotsBlog extends StatelessWidget {
  final String? image;
  ShowItemScreenshotsBlog({Key? key, this.image}) : super(key: key);
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
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          // Appropriate logging or analytics, e.g.
          // myAnalytics.recordError(
          //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
          //   exception,
          //   stackTrace,
          // );
          return  const Center(
            child: CircularProgressIndicator(),
          );
        },


      ),
    );

  }
}
///////////////////////////////////////////////////

class BlogListingModel extends BlogListingBase{
  Map<String, dynamic> json;
  BlogListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItemIndex(ItemBlogModel item,String? search, int? index, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBlogCard2(destination :item, search : search, shape : shape, height : height, index : index,account : account)
    );
  }
}

class ItemBlogCard2 extends StatelessWidget {
  const ItemBlogCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);
  final double? height ;
  final ItemBlogModel? destination;
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
            MaterialPageRoute(builder: (context) => PublicBlogView(id: destination!.item.article_id, title:destination!.item.title)),
          );
        },
        child: Card(
          elevation : 10.0,

          borderOnForeground: false,
          margin : EdgeInsets.all(6.0),
          child:
          [1,3,6,8,9].contains(index)?  ItemBlogContent1(destination: destination, account: account) : ItemBlogContent2(destination: destination, account: account),
        ),
      ),
    );
  }
}

class ItemBlogContent1 extends StatelessWidget {
  const ItemBlogContent1({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemBlogModel? destination;
  final bool? account ;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1!;
    final List<Widget> children = <Widget>[
      SizedBox(
        height: 240.0,

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
                          child: Html(data: readText(destination!.item.teaser.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 180) ,
                                      style: {
                                        "html": Style(

                                          fontSize: FontSize.small,
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
                      style: descriptionStyle,
                      child:
                      ClipRRect(
                        borderRadius:  new BorderRadius.circular(10),
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
          style: descriptionStyle,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

}

class ItemBlogContent2 extends StatelessWidget {
  const ItemBlogContent2({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemBlogModel? destination;
  final bool? account ;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1!;
    final List<Widget> children = <Widget>[
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
                  style: descriptionStyle,
                  child:  ClipRRect(
                    borderRadius:  new BorderRadius.only(
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
        child: Html(data: destination!.item.teaser.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
          style: descriptionStyle,
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
                destination!.item.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
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
    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

}
//class ItemBlog extends class ItemBlogBase{
//
//}



////////////////////////////
