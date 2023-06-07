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

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class  UserMyProfileView extends StatefulWidget {
  static const String PATH = '/user/my_profile/view';
  UserMyProfileView({Key? key}) : super(key: key);	
  @override
   UserMyProfileViewState createState() =>  UserMyProfileViewState();
}

class  UserMyProfileViewState extends State< UserMyProfileView> with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_profile/view';	   
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   MyProfileController? my_profile;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewMyProfile;
  var model;
  AccountController? accountController;
  bool account = true;
  
    Timer? timer;
    late BannerAd _bannerAd;
    bool _isBannerAdReady = false;
  
  
 UserMyProfileViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyProfile';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyProfile');
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
  fetchData(MyProfileController? my_profile, BuildContext context)async {
    if (this.model == null) {
	 final hash = my_profile!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = my_profile!.viewMyProfile();
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
    my_profile =   MyProfileController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
		'',
		'',

        null,
		false);
  
	  fetchData(my_profile, context);
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
			 ),
			);
	  
  }

  void _onScroll() {
	 final isNotExpanded = controller.hasClients &&
        controller.offset > _appBarHeight - kToolbarHeight;
    if (isNotExpanded != scrollUp) {
      setState(() {
        scrollUp = isNotExpanded;
      });
    }

	
	
  }

  @override
  void dispose() {
    super.dispose();
  }
}




class  UserMyProfileSubView extends StatefulWidget {
  static const String PATH = '/user/my_profile/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  UserMyProfileSubView({Key? key, this.id, this.title, this.model}) : super(key: key);	
  @override
   UserMyProfileSubViewState createState() =>  UserMyProfileSubViewState();
}

class  UserMyProfileSubViewState extends State< UserMyProfileSubView> with RestorationMixin{

 MyProfileController? my_profile;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewMyProfile;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MyProfile';

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,my_profile,  this, Env.value!.baseUrl!, '', 'MyProfile',account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


