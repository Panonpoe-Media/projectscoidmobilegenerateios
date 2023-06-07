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
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  late BannerAd _bannerAd1;
  bool _isBannerAdReady1 = false;

 PublicBrowseProductsViewState(){
    controller.addListener(_onScroll);
  }

  @override
  initState(){
    super.initState();
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
      final future = getAdsStatus();
      future.then((val) {
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
        }
      });

      //setState(() { });
    });
   // controller = ScrollController();
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
    timer?.cancel();
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


