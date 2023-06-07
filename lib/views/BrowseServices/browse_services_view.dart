import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'screenshots_list.dart';
import 'service_reviews_list.dart';
import 'service_comments_list.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/** AUTOGENERATE OFF **/

class  PublicBrowseServicesView extends StatefulWidget {
    static const String PATH = '/public/browse_services/view/:id/:title';
    final String? id ;
    final String? title;
    ChatBloc? cb;
    PublicBrowseServicesView({Key? key, this.id, this.title, this.cb}) : super(key: key);
    @override
    PublicBrowseServicesViewState createState() =>  PublicBrowseServicesViewState();
}

class  PublicBrowseServicesViewState extends State< PublicBrowseServicesView>{
    String getPath = Env.value!.baseUrl! + '/public/browse_services/view/%s/%s';

    final double _appBarHeight = 230.0;
    AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    BrowseServicesController? browse_services;
    final formKey = GlobalKey<FormState>();
    var controller =  ScrollController() ;
    final _scrollThreshold = 200.0;
    double lastScroll = 0;
    bool scrollUp = false;
    var isLoading = true;
    String idHash = '';
    String  userid = '';
    // var viewBrowseServices;
    var model;
    AccountController? accountController;
    bool account = true;

    Timer? timer;
    bool isEnd = false;
    bool _isSetAds = true;
    StateSetter? _setState;
    late BannerAd _bannerAd;
    bool _isBannerAdReady = false;
    late BannerAd _bannerAd1;
    bool _isBannerAdReady1 = false;

    late BannerAd _bannerAd2;
    bool _isBannerAdReady2 = false;
    late BannerAd _bannerAd3;
    bool _isBannerAdReady3 = false;
    InterstitialAd? _interstitialAd;
    int _numInterstitialLoadAttempts = 0;
    int? maxFailedLoadAttempts = 2;
    PublicBrowseServicesViewState(){
        controller.addListener(_onScroll);
    }

    @override
    initState(){

        super.initState();
        _createInterstitialAd();
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

            _bannerAd2 = BannerAd(
                adUnitId: AdHelper.bannerAdUnitId,
                request: AdRequest(),
                size: AdSize.mediumRectangle,
                listener: BannerAdListener(
                    onAdLoaded: (_) {


                        setState(() {
                            _isBannerAdReady2= true;
                        });
                    },
                    onAdFailedToLoad: (ad, err) {
                        print('Failed to load a banner ad: ${err.message}');
                        _isBannerAdReady2 = false;
                        ad.dispose();
                    },
                ),
            );

            _bannerAd3 = BannerAd(
                adUnitId: AdHelper.bannerAdUnitId,
                request: AdRequest(),
                size: AdSize.mediumRectangle,
                listener: BannerAdListener(
                    onAdLoaded: (_) {


                        setState(() {
                            _isBannerAdReady3 = true;
                        });
                    },
                    onAdFailedToLoad: (ad, err) {
                        print('Failed to load a banner ad: ${err.message}');
                        _isBannerAdReady3 = false;
                        ad.dispose();
                    },
                ),
            );


            _bannerAd.load();
            _bannerAd1.load();
            _bannerAd2.load();
            _bannerAd3.load();
            // await getAdsStatus();
            final future = getAdsStatus();
            future.then((val) {
               // print('berhasil ${this.model.model.model.price.toString()}');
                if(_isSetAds){
                  //  print('apakah bisa man????');
                    Future.delayed(Duration.zero, () => showAds());
                    //  WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   showAds();
                    // });
                    timer = Timer(
                         Duration(seconds: AdHelper.timerSet),
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
                }else{

                }
            });

            //setState(() { });
        });
        // controller = ScrollController();
    }

    void _createInterstitialAd() {
        InterstitialAd.load(
            adUnitId: AdHelper.interstitialAdUnitId,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
                onAdLoaded: (InterstitialAd ad) {
                    print('$ad loaded');
                    _interstitialAd = ad;
                    _numInterstitialLoadAttempts = 0;
                    _interstitialAd!.setImmersiveMode(true);
                   // print('berhasil 1234 ${this.model.model.model.price.toString()}');
                    if(this.model.model.model.price <= 100000.00){

                        _showInterstitialAd();
                        //  Future.delayed(Duration.zero, () => _showInterstitialAd());
                    }


                },
                onAdFailedToLoad: (LoadAdError error) {
                    print('InterstitialAd failed to load: $error.');
                _numInterstitialLoadAttempts += 1;
                    _interstitialAd = null;
                    if (_numInterstitialLoadAttempts < maxFailedLoadAttempts!) {
                        _createInterstitialAd();
                    }
                },
            ));
    }
    void _showInterstitialAd() {
        if (_interstitialAd == null) {
            print('Warning: attempt to show interstitial before loaded.');
            return;
        }
        _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (InterstitialAd ad) =>
                print('ad onAdShowedFullScreenContent.'),
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
                print('$ad onAdDismissedFullScreenContent.');
                ad.dispose();
               // _createInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
                //_createInterstitialAd();
            },
        );
        _interstitialAd!.show();
        _interstitialAd = null;
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
                                                    onTap: () async{
                                                        await _setAdsStatus();

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
            if(difference <= AdHelper.delaySet){
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
    fetchData(BrowseServicesController? browse_services, BuildContext context)async {
        if (this.model == null) {
            final hash = browse_services!.getHash();
            hash.then((value) {
                this.idHash = value;
            });
            //print('gagal');
            final future = browse_services!.viewBrowseServices();
            future.then((value) {
              //  print('berhasil 1234 ${value.model.model.price.toString()}');
                if(value.model.model.price <= 100000.00){
                   // _showInterstitialAd();
                  //  Future.delayed(Duration.zero, () => _showInterstitialAd());
                }

                setState(() {
                    isLoading = false;
                });
                this.model = value;

            }).catchError((Error){
                _onWidgetDidBuild(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
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
        bool _hasSubModel = false;
        int modelCount = 0;
        String getSubPath = '';

        bool _dialVisible = true;
        browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
            getPath,
            AppAction.view,
            widget.id!,
            widget.title!,
            null,
            false);
        print('PastProjectsViewModel45');
        fetchData(browse_services, context);
        accountController = new AccountController(AppProvider.getApplication(context),
            AppAction.view   );
        List listAccount = [];
        final future = accountController!.getAccount();
        future.then((val){

            listAccount.addAll(val);
            if(listAccount.length == 0){
                account = false;
            }else{
                account = true;
                userid = val.asMap()[0]['user_hash'];
            }

        });
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathScreenshots = Env.value!.baseUrl! + '/public/browse_services/screenshots_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathServiceReviews = Env.value!.baseUrl! + '/public/browse_services/service_reviews_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathServiceComments = Env.value!.baseUrl! + '/public/browse_services/service_comments_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= false;
        if(_hasSubModel){



            return new DefaultTabController(
                length: modelCount + 1,
                child: Scaffold(
                    appBar: AppBar(
                        bottom: TabBar(
                            tabs: [
                                Tab(text: widget.title!),
                                Tab(text: 'Screenshots'),
                                Tab(text: 'ServiceReviews'),
                                Tab(text: 'ServiceComments'),
                            ],
                        ),
                        title: Text(widget.title!),
                    ),
                    body: isLoading?Center(
                        child:CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Colors.green),
                        ))
                        : TabBarView(
                        children: [
                            PublicBrowseServicesSubView(id : widget.id!, title : widget.title!, model:this.model),
                            ScreenshotsList(id : widget.id!, title : widget.title!, url : getSubPathScreenshots),
                            ServiceReviewsList(id : widget.id!, title : widget.title!, url : getSubPathServiceReviews),
                            ServiceCommentsList(id : widget.id!, title : widget.title!, url : getSubPathServiceComments),
                        ],
                    ),

                ),

            );

        }else{


            return Scaffold(
                /* appBar: AppBar(
			//title: Text(widget.title!.replaceAll('-', '  ')),
		  ),  */
                /*
		  appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),)
		  : scrollUp ? null : this.model.appBar(context, idHash),

           */

                body:isLoading?
                Center(
                    child:CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.green),
                    ))
                    :Form(
                    key: formKey,
                    child: this.model.view1(context, controller, account, this, idHash, widget.cb, _isBannerAdReady2, _isBannerAdReady3, _bannerAd2, _bannerAd3)
                ),
                //floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
                // floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,browse_services,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)

            );

        }
    }

    void _onScroll() {
        final maxScroll = controller.position.maxScrollExtent;
        final currentScroll = controller.position.pixels;
        if(lastScroll > currentScroll){
            setState(() {
                scrollUp = false;
            });
        }else{
            setState(() {
                scrollUp = true;
            });
        }
        lastScroll = currentScroll;



    }

    @override
    void dispose() {
        super.dispose();
        _interstitialAd?.dispose();
        timer?.cancel();
    }
}




class  PublicBrowseServicesSubView extends StatefulWidget {
    static const String PATH = '/public/browse_services/view/:id/:title';
    final String? id ;
    final String? title;
    var model;
    PublicBrowseServicesSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
    @override
    PublicBrowseServicesSubViewState createState() =>  PublicBrowseServicesSubViewState();
}

class  PublicBrowseServicesSubViewState extends State< PublicBrowseServicesSubView>{

    BrowseServicesController? browse_services;
    final formKey = GlobalKey<FormState>();
    ScrollController? controller;
    var isLoading = true;
    // var viewBrowseServices;
    AccountController? accountController;
    bool account = true;

    @override
    initState(){
        super.initState();
        controller = ScrollController();
    }

    @override
    Widget build(BuildContext context) {

        bool _dialVisible = true;

        return Scaffold(
            appBar: null,
            body:Form(
                key: formKey,
                child: widget.model.view1(context, controller, account, this)
            ),
            floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,browse_services,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)
        );


    }

    @override
    void dispose() {
        super.dispose();
    }
}


