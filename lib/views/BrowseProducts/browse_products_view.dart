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
import 'product_reviews_list.dart';
import 'product_comments_list.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/** AUTOGENERATE OFF **/
class  PublicBrowseProductsView extends StatefulWidget {
  static const String PATH = '/public/browse_products/view/:id/:title';
  final String? id ;
  final String? title;
  ChatBloc? cb;
  PublicBrowseProductsView({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
   PublicBrowseProductsViewState createState() =>  PublicBrowseProductsViewState();
}

class  PublicBrowseProductsViewState extends State< PublicBrowseProductsView>{
  String getPath = Env.value!.baseUrl! + '/public/browse_products/view/%s/%s';
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   BrowseProductsController? browse_products;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
  String  userid = '';
 // var viewBrowseProducts;
  var model;
  AccountController? accountController;
  bool account = true;

  Timer? timer;
  bool isEnd = false;
  bool _isSetAds = true;
  StateSetter? _setState;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int? maxFailedLoadAttempts = 2;

 PublicBrowseProductsViewState(){
    controller.addListener(_onScroll);
  }

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {


      // await getAdsStatus();
      final future = getAdsStatus();
      future.then((val) {
        if(_isSetAds){
        //  print('apakah bisa man????');
          Future.delayed(Duration.zero, () =>  _createInterstitialAd());
          //  WidgetsBinding.instance.addPostFrameCallback((_) {
          //   showAds();
          // });

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


            _showInterstitialAd();
            //  Future.delayed(Duration.zero, () => _showInterstitialAd());



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
    _setAdsStatus();
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
    var ts, fd;
    var delay;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
      fd =  prefs.getBool('first_delay');
      if(fd){
        final date11 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
        final date21 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
        double difference1 = double.parse(date21.difference(date11).inMinutes.toString());
        if(difference1 <= AdHelper.FirstDelay){
          prefs.setBool('first_delay', false);
          delay = AdHelper.FirstDelay;
        }else{
          delay = AdHelper.delaySet;
        }

      }else{
        delay = AdHelper.delaySet;
      }


      // print('apakah bisa man123${tm}????${ts}');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(difference <= delay){
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
  fetchData(BrowseProductsController? browse_products, BuildContext context)async {
    if (this.model == null) {
	 final hash = browse_products!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
	  // print('Test 1234');
      final future = browse_products!.viewBrowseProducts();
     // print('test12345');
      future.then((value) {
        setState(() {
          isLoading = false;
        });
          this.model = value;

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
    bool _hasSubModel = false;
	int modelCount = 0;
	String getSubPath = '';
    bool _dialVisible = true;
    browse_products = new  BrowseProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        widget.id!,
        widget.title!,
        null,
		false);
  
	  fetchData(browse_products, context);
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
	  String getSubPathScreenshots = Env.value!.baseUrl! + '/public/browse_products/screenshots_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id product
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathProductReviews = Env.value!.baseUrl! + '/public/browse_products/product_reviews_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id product
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathProductComments = Env.value!.baseUrl! + '/public/browse_products/product_comments_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id product
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
				  Tab(text: 'ProductReviews'),
				  Tab(text: 'ProductComments'),
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
				 PublicBrowseProductsSubView(id : widget.id!, title : widget.title!, model:this.model),
                   ScreenshotsList(id : widget.id!, title : widget.title!, url : getSubPathScreenshots),					
                   ProductReviewsList(id : widget.id!, title : widget.title!, url : getSubPathProductReviews),					
                   ProductCommentsList(id : widget.id!, title : widget.title!, url : getSubPathProductComments),					
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
		  : scrollUp ? null : this.model.appBar1(context, idHash, widget.cb),

           */

		   body:isLoading?
			  Center( 
           child:CircularProgressIndicator(
           valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
			 :Form(
			  key: formKey,
			  child: this.model.view1(context, controller, account, userid, widget.cb, idHash)
		  ),	  
			//floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
			// floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,browse_products,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)
			
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
    if(_isSetAds) {
      _interstitialAd?.dispose();
    }
  }
}




class  PublicBrowseProductsSubView extends StatefulWidget {
  static const String PATH = '/public/browse_products/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  PublicBrowseProductsSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
  @override
   PublicBrowseProductsSubViewState createState() =>  PublicBrowseProductsSubViewState();
}

class  PublicBrowseProductsSubViewState extends State< PublicBrowseProductsSubView>{

 BrowseProductsController? browse_products;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewBrowseProducts;
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
			  child: widget.model.view(context, controller, account)
		  ),	  
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,browse_products,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


