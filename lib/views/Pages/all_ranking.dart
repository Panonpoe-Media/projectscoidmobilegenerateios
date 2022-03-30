import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';


const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';
class  AllRankingView extends StatefulWidget {

  static const String PATH = '/public/pages/:title';
  final int? id  ;
  final String? title;
  AllRankingView({Key? key, this.title, this.id}) : super(key: key);
  @override
  AllRankingViewState createState() =>  AllRankingViewState();
}

class  AllRankingViewState extends State< AllRankingView>{

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  String getPath = Env.value!.baseUrl! + '/public/pages/';

  PagesController? page;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var viewPage;
  var isLoading = true;

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    getPath = getPath + widget.title!;
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  fetchData(PagesController? page, BuildContext context)async {
    if (this.viewPage == null) {

      final future = page!.viewPage();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.viewPage = Page1.fromJson(value);

      }).catchError((Error){
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;

    page = new  PagesController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        widget.title!);

    fetchData(page, context);
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title![0].toUpperCase() + widget.title!.substring(1).replaceAll('_',' '),style : TextStyle( color: Colors.white, )),
        iconTheme: IconThemeData(
          color: Colors.white, ),//change your color here

        //  actions: <Widget>[
        //  NavigationControls(_controller.future),
        //  SampleMenu(_controller.future),
        //  ],
      ),
      body:


      isLoading?Center(
          child:CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.green),
          ))
          :
      Form(
          key: formKey,
          child: SingleChildScrollView(
            // controller: controller,
            // physics: const AlwaysScrollableScrollPhysics(),
            // reverse: false,
            //  child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //    children: <Widget>[
            //header
            //     new Padding(
            //       padding: const EdgeInsets.fromLTRB(
            //         8.0, 14.0, 8.0, 2.0),

            child:


/*
                             HtmlWidget(this.viewPage.content.replaceAll('.png">', '.png"> <br>'),

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


                              onTapImage:(src) =>
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                                 )



                               )

 */
            Html(data:this.viewPage.content.replaceAll('.png">', '.png"> <br>'),
              style:{
                "html" :Style(fontSize: FontSize.medium),
                "code" :Style(backgroundColor: Colors.grey[500], padding: EdgeInsets.all(10.0)),
                "pre" :Style(backgroundColor: Colors.grey[500], padding: EdgeInsets.all(10.0)),
              },
              //  HtmlWidget('<span>abcd<br>"defrrr"<br>sdsdsdsdsd<br></span>', textStyle : TextStyle(fontSize: 14),
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
              },
              onImageTap: (src, _, __, ___) =>
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                  ),
            ),




            //  ),



            //  ]
            // )

          )


      ),



    );


  }


  @override
  void dispose() {
    super.dispose();
  }
}

class ShowItemScreenshots extends StatelessWidget {
  final String? image;
  ShowItemScreenshots({this.image});
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




