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
import 'referals_index.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';


class  UserMyReferalsView extends StatefulWidget {
  static const String PATH = '/user/my_referals/view';
  UserMyReferalsView({Key? key}) : super(key: key);	
  @override
   UserMyReferalsViewState createState() =>  UserMyReferalsViewState();
}

class  UserMyReferalsViewState extends State< UserMyReferalsView> with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_referals/view';	   
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   MyReferalsController? my_referals;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewMyReferals;
  var model;
  AccountController? accountController;
  bool account = true;
 UserMyReferalsViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyReferals';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyReferals');
  }



  @override
  initState(){
    super.initState();
   // controller = ScrollController();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(MyReferalsController? my_referals, BuildContext context)async {
    if (this.model == null) {
	 final hash = my_referals!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = my_referals!.viewMyReferals();
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
    my_referals =   MyReferalsController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
		'',
		'',

        null,
		false);
  
	  fetchData(my_referals, context);
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
	  String getSubPathReferals = Env.value!.baseUrl! + '/user/my_referals/referals_index/'+idHash +'/' + 'referals' + '?';	   
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
			 floatingActionButton: isLoading? null :this.model.model.buttons.length == 0? null:  this.model.Buttons(context, _dialVisible, formKey, controller,my_referals,  this, Env.value!.baseUrl!, '', 'MyReferals', account),
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




class  UserMyReferalsSubView extends StatefulWidget {
  static const String PATH = '/user/my_referals/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  UserMyReferalsSubView({Key? key, this.id, this.title, this.model}) : super(key: key);	
  @override
   UserMyReferalsSubViewState createState() =>  UserMyReferalsSubViewState();
}

class  UserMyReferalsSubViewState extends State< UserMyReferalsSubView> with RestorationMixin{

 MyReferalsController? my_referals;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewMyReferals;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MyReferals';

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,my_referals,  this, Env.value!.baseUrl!, '', 'MyReferals',account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


