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
import 'package:webview_flutter/webview_flutter.dart' as wv;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/views/BrowseUsers/browse_users_view.dart';
import 'package:html/dom.dart' as dom;
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/route.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:projectscoid/app/signin.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:in_app_review/in_app_review.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
class  PublicPageView extends StatefulWidget {

  static const String PATH = '/public/pages/:title';
  final int? id  ;
  final String? title;
  final bool? isDark;
  final ChatBloc? cb;
  final String? cookies;
   PublicPageView({Key? key, this.title, this.id, this.isDark, this.cb, this.cookies}) : super(key: key);
  @override
   PublicPageViewState createState() =>  PublicPageViewState();
}

class  PublicPageViewState extends State< PublicPageView>{

  final Completer<wv.WebViewController> _controller =
  Completer<wv.WebViewController>();
  String getPath = Env.value!.baseUrl! + '/public/pages/';

   PagesController? page;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var viewPage;
  var recentNews;
  var isLoading = true;
  Timer? timer;
  bool isEnd = false;
  bool _isSetAds = true;
  StateSetter? _setState;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  late BannerAd _bannerAd1;
  bool _isBannerAdReady1 = false;

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    getPath = getPath + widget.title!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.mediumRectangle,
        listener: BannerAdListener(
          onAdLoaded: (_) {

            _setState!(() {
              _isBannerAdReady = true;
            });
            //  setState(() {
            //  _isBannerAdReady = true;
            // });
          },
          onAdFailedToLoad: (ad, err) {
            print('Failed to load a banner ad: ${err.message}');
            _isBannerAdReady = false;
            ad.dispose();
          },
        ),
      );

      _bannerAd1 = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.mediumRectangle,
        listener: BannerAdListener(
          onAdLoaded: (_) {

            _setState!(() {
              _isBannerAdReady1 = true;
            });
            //  setState(() {
            //  _isBannerAdReady = true;
            // });
          },
          onAdFailedToLoad: (ad, err) {
            print('Failed to load a banner ad: ${err.message}');
            _isBannerAdReady1 = false;
            ad.dispose();
          },
        ),
      );

      _bannerAd.load();
      _bannerAd1.load();
      // await getAdsStatus();

      //  print('apakah bisa man????');
      Future.delayed(Duration.zero, () => showAds());
      //  WidgetsBinding.instance.addPostFrameCallback((_) {
      //   showAds();
      // });
      timer = Timer(
        const Duration(seconds: 15),
            () {
          if (!mounted) {
            _setState!(() {
              isEnd = true;
            });
            // Navigator.pop(dialogContext);
            // showAds(ctx!);
          }else{
            _setState!(() {
              isEnd = true;
            });

            // Navigator.pop(dialogContext);
            // showAds(ctx!);
          }

        },
      );


      //setState(() { });
    });
  }

  void showAds() {

    showDialog(
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
              scrollable: true,
              content:StatefulBuilder(  // You need this, notice the parameters below:
                  builder: (BuildContext context1, StateSetter setState)
                  {

                    _setState = setState;
                    return  Column(
                      //clipBehavior : Clip.none,
                      children: <Widget>[
                        Row(

                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            isEnd?
                            Container(
                              decoration: new BoxDecoration(
                                  color:   const Color(0xFFFFFFFF).withOpacity(0.5)//here i want to add opacity
                              ),


                              child:  GestureDetector(

                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                 // await _setAdsStatus();

                                  // Navigator.of(context).pop();
                                  // Navigator.of(context1).pop();
                                  Navigator.of(context).pop();

                                },
                                child: const  CircleAvatar(

                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                )
                                ,

                              ),
                            )


                                :
                            Container(
                                decoration: new BoxDecoration(
                                    color:   const Color(0xFFFFFFFF).withOpacity(0.5)//here i want to add opacity

                                ),


                                child:
                                const  CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.grey,
                                )
                            ),
                          ],
                        ),

                        SingleChildScrollView(
                          child:   Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Hard Work, Work Smarter",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),
                              ),
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


                              if (_isBannerAdReady1)
                                const SizedBox(
                                  height: 10,
                                ),
                              if (_isBannerAdReady1)
                                const SizedBox(
                                  height: 10,
                                ),
                              if (_isBannerAdReady1)
                                Center(
                                  child: Container(
                                    width: _bannerAd1.size.width.toDouble(),
                                    height: _bannerAd1.size.height.toDouble(),
                                    child: AdWidget(ad: _bannerAd1),
                                  ),
                                ),


                              if (_isBannerAdReady1)
                                const SizedBox(
                                  height: 10,
                                ),
                            ],
                          ),
                        ),





                      ],
                    );
                  }


              )
          );
        },


        context: context);
  }
  Future<void> _setAdsStatus() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('appads_timestamp', tm);
    ///print('apakah bisa man123456????');
    //setState(() {
    //  _isSetAds = false;
    //});
  }
  Future<bool> getAdsStatus() async {
    var ts;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
      // print('apakah bisa man123${tm}????${ts}');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(difference <= 4.00){
        // if (!mounted) {
        // print('apakah bisa 1 ${difference}');
        //setState(() {
        _isSetAds = false;
        //});
        // }else{
        // print('apakah bisa 2');
        // _isSetAds = false;
        //  }
      }else{
        // print('apakah bisa 2 ${difference}');
      }
    } else {
      //print('apakah bisa 3');
      _isSetAds = true;
    }

    return true;

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

  fetchDataRanking(PagesController? page, BuildContext context)async {
    if (this.viewPage == null) {

      final future = page!.viewPage();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.viewPage = Page1.fromJson(value);
        var document = parse(this.viewPage.content);
        recentNews = document.getElementsByClassName('col-md-4 col-sm-4 recent-news');
      //  recentNews[0].children[1].querySelectorAll("img");



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

  List<Widget> _listRanking(){
    List<Widget> listViewRanking = [];
    for(int i=0; i< recentNews.length; i++){
      listViewRanking.add(
          Container(
          decoration:
          widget.isDark!?
          const BoxDecoration(
            color:  Colors.black12,
          ):
          BoxDecoration(
            color: CurrentTheme.BackgroundColor,
            image: DecorationImage( image: ExactAssetImage('assets/img/elegant-white.jpg'),
              fit: BoxFit.cover,),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      20.0, 10.0, 8.0, 10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PublicBrowseUsersListing(id:'12', cb: widget.cb )),
                        );
                        /*
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('public/browse_users/listing/12'));

                         */

                      },
                      child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(recentNews[i].children[0].children[0].text,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                            Icon(Icons.arrow_forward, size: 18.0)
                          ]
                      )
                  )
              ),
              Container(
                height: 210.0,
                padding: const EdgeInsets.fromLTRB(
                    0.0, 0.0, 0.0, 0.0),
                /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                /// To set FlashSale Scrolling horizontal
                child:  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= recentNews[i].children.length - 1
                        ? Container()
                        :  WorkerItem(model: recentNews[i].children[index + 1], cb : widget.cb );
                    //    : BrowseProjectsFrontCard(destination: state.browse_projects.items.items[index], shape: shape);
                    //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                  },
                  itemCount: recentNews[i].children.length - 1,
                 // controller: controller4,
                ),
              ),

            ],
          ),
      ));

  }
  return listViewRanking;
  }


  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;

    page =  PagesController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        widget.title!);

      widget.id == 6 ?
      fetchDataRanking(page, context)
      : widget.id == 26 ?  setState(() {
        isLoading = false;
      }) :
      fetchData(page, context);



    final cookieManager = WebviewCookieManager();
      return Scaffold(
          appBar: AppBar(

            title: Text(widget.title![0].toUpperCase() + widget.title!.substring(1).replaceAll('_',' '),style : TextStyle( color: Colors.white, )),
        iconTheme: IconThemeData(
        color: Colors.white, ),//change your color here

          //  actions: <Widget>[
          //  NavigationControls(_controller!.future),
          //  SampleMenu(_controller!.future),
          //  ],
          ),
          body:


          isLoading?Center(
           child:CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
              :
          [4, 5,9].contains(widget.id)? wv.WebView(
            initialUrl: getPath.replaceAll('api.', ''),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (wv.WebViewController webViewController) {
              _controller!.complete(webViewController);
            },
            // TODO(iskakaushik): Remove this when collection literals makes it to stable.
            // ignore: prefer_collection_literals
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
            navigationDelegate: (wv.NavigationRequest request) {
              if (request.url!.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return wv.NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return wv.NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          )
        : [26].contains(widget.id)?
          widget.cookies == ''? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('Silahkan Login terlebih dahulu.'),// Text('failed to ' + widget.title!),
                    GestureDetector(
                      onTap:(){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
                              (Route<dynamic> route) => true,
                        );
                      },
                      child: Text('Login', style: TextStyle(color: Colors.blue)),
                    ),
                  ]
              )

          ):
          wv.WebView(
            // initialUrl: widget.urlCC,
            // initialUrl: 'https://projects.co.id' ,
            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (wv.WebViewController webViewController)async {
              await cookieManager.clearCookies();
              // await WebviewCookieManager().setCookies(

              // );
              // print('cookie   ${widget.cartCookies}; pro_v=6628968bb49ff10aaecce3d9788e6365124d5bf1026468c661284f9b10d19964; pro_s=4bbc1f017b4cf4af37f63abaa12d3c951f106b0473536e9e8975dd1e54a57e17; _gat=1');


              print('ini cookiesnya ==== ${widget.cookies}');

              Map<String, String> header = {'Cookie':'${widget.cookies}'};

              await webViewController.loadUrl('https://projects.co.id/${widget.title!}/', headers:header);

              _controller!.complete(webViewController);
            },
            onWebResourceError: (WebResourceError error){
              print('errorrr = ${error.description} ');

            },
            // TODO(iskakaushik): Remove this when collection literals makes it to stable.
            // ignore: prefer_collection_literals
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
            navigationDelegate: (wv.NavigationRequest request) {
              if (request.url!.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return wv.NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return wv.NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          )

        : [6].contains(widget.id)?
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
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(
                //         8.0, 14.0, 8.0, 2.0),

                child:
                    Column(
                      children: <Widget>[
                        ..._listRanking(),
                      ],
                    ),




                //  ),



                //  ]
                // )

              )


          )
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
                   //     Padding(
                   //       padding: const EdgeInsets.fromLTRB(
                     //         8.0, 14.0, 8.0, 2.0),

                          child:


/*
                             HtmlWidget(this.viewPage.content.replaceAll('.png">', '.png"> <br>'),

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
                    "a" : Style(color: Colors.red),
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
    timer?.cancel();
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<wv.WebViewController>(
        future: _controller!.future,
        builder: (BuildContext context,
            AsyncSnapshot<wv.WebViewController> controller) {
          if (controller!.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String? url = await controller!.data!.currentUrl();
                ScaffoldMessenger.of(context!).showSnackBar( SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
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


/*

                                Container(
                                    decoration:
                                    widget.isDark?
                                    BoxDecoration(
                                      color:  Colors.black12,
                                    ):
                                    BoxDecoration(
                                      color: CurrentTheme.BackgroundColor,
                                      image: DecorationImage( image: ExactAssetImage('assets/img/elegant-white.jpg'),
                                        fit: BoxFit.cover,),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 8.0, 10.0),
                                            child: InkWell(
                                                onTap: () {
                                                  AppProvider.getRouter(context)!.navigateTo(
                                                      context,
                                                      urlToRoute('public/browse_users/listing/12'));
                                                },
                                                child:
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text(this.viewHome.workers.title,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                                                      Icon(Icons.arrow_forward, size: 18.0)
                                                    ]
                                                )
                                            )
                                        ),
                                        Container(
                                          height: 210.0,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                                          /// To set FlashSale Scrolling horizontal
                                          child:  ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return index >= this.viewHome.workers.items.length
                                                  ? ProjectsBottomLoader()
                                                  :WorkerItem(model: this.viewHome.workers.items[index] );
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: this.viewHome.workers.items.length == 10
                                                ? this.viewHome.workers.items.length
                                                : this.viewHome.workers.items.length + 1,
                                            controller: controller4,
                                          ),
                                        ),

                                      ],
                                    )

                                ),

 */




class WorkerItem extends StatelessWidget {
  var model;
  ChatBloc? cb;

  WorkerItem({this.model, this.cb});
//recentNews[i].children[index + 1]
  /*
   print('user image'+ recentNews[0].children[1].children[0].children[0].attributes["src"]);
        print('user link'+ recentNews[0].children[1].children[1].children[0].children[0].attributes["href"]);
        print('user name'+ recentNews[0].children[1].children[1].children[0].children[0].text);
        print('star p'+ recentNews[0].children[1].children[1].children[1].text.replaceAll(recentNews[0].children[1].children[1].children[1].children[0].text,''));
        print('star'+ recentNews[0].children[1].children[1].children[1].text.replaceAll(recentNews[0].children[1].children[1].children[1].children[0].text,'').replaceAll('/10.00',''));
        print('point dan projects'+ recentNews[0].children[1].children[1].children[1].children[0].text);
      /
   */
  String toProject(String text){
 //   var tempText;
    var index =   text.indexOf('/');

    return text.substring(index + 1,  text.length);

  //  return double.parse(tempText);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id:'${urlToRoute(model.children[1].children[0].children[0].attributes["href"] ).split('/')[4]}', title: '${urlToRoute(model.children[1].children[0].children[0].attributes["href"]).split('/')[5]}', cb: cb)),
                );
                /*
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(model.children[1].children[0].children[0].attributes["href"]));

                 */

                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850))); */
              },
                child: ShowWorkerWithRating(username : model.children[1].children[0].children[0].text,
                avatar: model.children[0].children[0].attributes["src"],
                rating: toRating(model.children[1].children[1].text.replaceAll(model.children[1].children[1].children[0].text,'')),
                viewRating: model.children[1].children[1].text.replaceAll(model.children[1].children[1].children[0].text,''),
                projects: toProject(model.children[1].children[1].children[0].text.replaceAll('points', '/')),
           )

            )
          ],
        )
      ],
    );
  }
}




enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
}

class SampleMenu extends StatelessWidget {
  SampleMenu(this.controller);

  final Future<wv.WebViewController> controller;
  final wv.CookieManager cookieManager = wv.CookieManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<wv.WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<wv.WebViewController> controller) {
        return PopupMenuButton<MenuOptions>(
          onSelected: (MenuOptions value) {
            switch (value) {
              case MenuOptions.showUserAgent:
                _onShowUserAgent(controller!.data, context);
                break;
              case MenuOptions.listCookies:
                _onListCookies(controller!.data, context);
                break;
              case MenuOptions.clearCookies:
                _onClearCookies(context);
                break;
              case MenuOptions.addToCache:
                _onAddToCache(controller!.data, context);
                break;
              case MenuOptions.listCache:
                _onListCache(controller!.data, context);
                break;
              case MenuOptions.clearCache:
                _onClearCache(controller!.data, context);
                break;
              case MenuOptions.navigationDelegate:
                _onNavigationDelegateExample(controller!.data, context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              child: const Text('Show user agent'),
              enabled: controller!.hasData,
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCookies,
              child: Text('List cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCookies,
              child: Text('Clear cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.addToCache,
              child: Text('Add to cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCache,
              child: Text('List cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCache,
              child: Text('Clear cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.navigationDelegate,
              child: Text('Navigation Delegate example'),
            ),
          ],
        );
      },
    );
  }

  void _onShowUserAgent(
      wv.WebViewController? controller, BuildContext context) async {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    await controller!.evaluateJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');
  }

  void _onListCookies(
      wv.WebViewController? controller, BuildContext context) async {
    final String cookies =
    await controller!.evaluateJavascript('document.cookie');
    ScaffoldMessenger.of(context!).showSnackBar( SnackBar(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Cookies:'),
          _getCookieList(cookies),
        ],
      ),
    ));
  }

  void _onAddToCache(wv.WebViewController? controller, BuildContext context) async {
    await controller!.evaluateJavascript(
        'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
    ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
      content: Text('Added a test entry to cache.'),
    ));
  }

  void _onListCache(wv.WebViewController? controller, BuildContext context) async {
    await controller!.evaluateJavascript('caches.keys()'
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  void _onClearCache(wv.WebViewController? controller, BuildContext context) async {
    await controller!.clearCache();
    ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
      content: Text("Cache cleared."),
    ));
  }

  void _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    ScaffoldMessenger.of(context!).showSnackBar( SnackBar(
      content: Text(message),
    ));
  }

  void _onNavigationDelegateExample(
      wv.WebViewController? controller, BuildContext context) async {
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    await controller!.loadUrl('data:text/html;base64,$contentBase64');
  }

  Widget _getCookieList(String cookies) {
    if (cookies == null || cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
    cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<wv.WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<wv.WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<wv.WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final wv.WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoBack()) {
                  await controller!.goBack();
                } else {
                  ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text("No back history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoForward()) {
                  await controller!.goForward();
                } else {
                  ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
                        content: Text("No forward history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                controller!.reload();
              },
            ),
          ],
        );
      },
    );
  }
}
