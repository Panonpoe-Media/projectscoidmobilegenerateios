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


class  UserMySalesView extends StatefulWidget {
  static const String PATH = '/user/my_sales/view/:id/:title';
  final String? id ;
  final String? title;
  UserMySalesView({Key? key, this.id, this.title}) : super(key: key);	
  @override
   UserMySalesViewState createState() =>  UserMySalesViewState();
}

class  UserMySalesViewState extends State< UserMySalesView> with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_sales/view/%s/%s';		   
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   MySalesController? my_sales;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewMySales;
  var model;
  AccountController? accountController;
  bool account = true;
  
    Timer? timer;
    late BannerAd _bannerAd;
    bool _isBannerAdReady = false;
  
  
 UserMySalesViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MySales';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MySales');
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
  fetchData(MySalesController? my_sales, BuildContext context)async {
    if (this.model == null) {
	 final hash = my_sales!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = my_sales!.viewMySales();
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
    my_sales =   MySalesController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        widget.id!,
        widget.title!,		 

        null,
		false);
  
	  fetchData(my_sales, context);
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
	  if(_hasSubModel){
	    


        return  DefaultTabController(
          length: modelCount + 1,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
				  Tab(text: widget.title!),
                ],
              ),
			  title: Text(widget.title!),
            ),
            body: isLoading?Center( 
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
                : TabBarView(
              children: [
				 UserMySalesSubView(id : widget.id, title : widget.title, model:this.model),
              ],
            ),

          ),

        ); 
	  
	  }else{
	  

	  	  return Scaffold(
		 /* appBar: AppBar(
			//title: Text(widget.title.replaceAll('-', '  ')),
		  ),  */
		  appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),)
		  : scrollUp ? null : this.model.appBar(context, idHash),
		   body:isLoading?
			  Center( 
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
			 :Form(
			  key: formKey,
			  child: this.model.view(context, controller, account, _isBannerAdReady,  _bannerAd)
		  ),	  
			//floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
			 floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,my_sales,  this, Env.value!.baseUrl!, widget.id, widget.title, account)
			
			);  
		 
	  	}	
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




class  UserMySalesSubView extends StatefulWidget {
  static const String PATH = '/user/my_sales/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  UserMySalesSubView({Key? key, this.id, this.title, this.model}) : super(key: key);	
  @override
   UserMySalesSubViewState createState() =>  UserMySalesSubViewState();
}

class  UserMySalesSubViewState extends State< UserMySalesSubView> with RestorationMixin{

 MySalesController? my_sales;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewMySales;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MySales';

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,my_sales,  this, Env.value!.baseUrl!, widget.id, widget.title, account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


