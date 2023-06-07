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
import 'points_pesta_index.dart';
import 'points_worker_index.dart';
import 'points_owner_index.dart';
import 'points_seller_index.dart';
import 'points_buyer_index.dart';
import 'points_affiliate_index.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class  UserMyPointsView extends StatefulWidget {
  static const String PATH = '/user/my_points/view';
  UserMyPointsView({Key? key}) : super(key: key);	
  @override
   UserMyPointsViewState createState() =>  UserMyPointsViewState();
}

class  UserMyPointsViewState extends State< UserMyPointsView> with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_points/view';	   
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   MyPointsController? my_points;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewMyPoints;
  var model;
  AccountController? accountController;
  bool account = true;
  
    Timer? timer;
    late BannerAd _bannerAd;
    bool _isBannerAdReady = false;
  
  
 UserMyPointsViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyPoints';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyPoints');
  }



  @override
  initState(){
    super.initState();
   // controller = ScrollController();
   WidgetsBinding.instance.addPostFrameCallback((_) async {
      _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.mediumRectangle,
        listener: BannerAdListener(
          onAdLoaded: (_) {

             setState(() {
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
      _bannerAd.load();
      //setState(() { });
    });
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(MyPointsController? my_points, BuildContext context)async {
    if (this.model == null) {
	 final hash = my_points!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = my_points!.viewMyPoints();
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
    my_points =   MyPointsController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
		'',
		'',

        null,
		false);
  
	  fetchData(my_points, context);
	  	accountController =  AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	  List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account = false;
      }else{
        account = true;
      }

    });
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsPesta = Env.value!.baseUrl! + '/user/my_points/points_pesta_index/'+idHash +'/' + 'points_pesta' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsWorker = Env.value!.baseUrl! + '/user/my_points/points_worker_index/'+idHash +'/' + 'points_worker' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsOwner = Env.value!.baseUrl! + '/user/my_points/points_owner_index/'+idHash +'/' + 'points_owner' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsSeller = Env.value!.baseUrl! + '/user/my_points/points_seller_index/'+idHash +'/' + 'points_seller' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsBuyer = Env.value!.baseUrl! + '/user/my_points/points_buyer_index/'+idHash +'/' + 'points_buyer' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPointsAffiliate = Env.value!.baseUrl! + '/user/my_points/points_affiliate_index/'+idHash +'/' + 'points_affiliate' + '?';	   
	  // model id user
	     return Theme(
			  data: ThemeData(
				brightness: Brightness.light,
				primaryColor: CurrentTheme.BackgroundColor,
				platform: Theme.of(context).platform,
			  ),
			  child: Scaffold(
				key: _scaffoldKey,
				body: isLoading?
						  Center( 
					   child:CircularProgressIndicator(
					   valueColor:  AlwaysStoppedAnimation<Color>(
						Colors.green),)) : this.model.body(context, controller, scrollUp, _scaffoldKey, this),
			 floatingActionButton: isLoading? null :this.model.model.buttons.length == 0? null:  this.model.Buttons(context, _dialVisible, formKey, controller,my_points,  this, Env.value!.baseUrl!, '', 'MyPoints', account),
			 ),
			);
	  
  }

  void _onScroll() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    cs.value = currentScroll;
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
  }
}




class  UserMyPointsSubView extends StatefulWidget {
  static const String PATH = '/user/my_points/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  UserMyPointsSubView({Key? key, this.id, this.title, this.model}) : super(key: key);	
  @override
   UserMyPointsSubViewState createState() =>  UserMyPointsSubViewState();
}

class  UserMyPointsSubViewState extends State< UserMyPointsSubView> with RestorationMixin{

 MyPointsController? my_points;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewMyPoints;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MyPoints';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,my_points,  this, Env.value!.baseUrl!, '', 'MyPoints',account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


