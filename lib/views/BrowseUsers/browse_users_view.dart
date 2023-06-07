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
import 'services_list.dart';
import 'products_list.dart';
import 'portofolio_list.dart';
import 'as_project_worker_list.dart';
import 'as_project_owner_list.dart';
import 'user_arbitrations_list.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/** AUTOGENERATE OFF **/

class  PublicBrowseUsersView extends StatefulWidget {
  static const String PATH = '/public/browse_users/view/:id/:title';
  final String? id ;
  final String? title;
  ChatBloc? cb;
  PublicBrowseUsersView({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
   PublicBrowseUsersViewState createState() =>  PublicBrowseUsersViewState();
}

class  PublicBrowseUsersViewState extends State< PublicBrowseUsersView> with RestorationMixin{
  String getPath =   Env.value!.baseUrl! + '/public/browse_users/view/%s/%s';
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   BrowseUsersController? browse_users;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewBrowseUsers;
  var model;
  var data;
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

 PublicBrowseUsersViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'BrowseUsers';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'BrowseUsers');
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
         // print('apakah bisa man????');
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
  fetchData(BrowseUsersController? browse_users, BuildContext context)async {
    if (this.model == null) {
	 final hash = browse_users!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = browse_users!.viewBrowseUsers();
      future.then((value) {

          this.model = value;


           try{
             getApplicationDocumentsDirectory().then((value) {
               APIProvider projectsAPIProvider = APIProvider(value.path);
               final future = projectsAPIProvider.getData(
                     Env.value!.baseUrl! + '/public/browse_users/user_arbitrations_list/'+widget.id!+'/'+'1234' + '?arbitrationpage=1');
               future.then((value) {

                 try {
                  // data = UserArbitrationsListingModel(value);
                   if(value['items'].length > 0){
                     print('saya ada disini ya ${value['items'][0]['project_str']}');
                     data = value['items'][0];
                   }else{
                     print('sakittttt');
                   }

                   setState(() {
                     isLoading = false;
                   });
                 } catch (e) {}
               });
             });
           }catch (e) {

             setState(() {
               isLoading = false;
             });
           }







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
    browse_users = new  BrowseUsersController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        widget.id!,
        widget.title,
        null,
		false);
  
	  fetchData(browse_users, context);
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
      }

    });
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathServices =   Env.value!.baseUrl! + '/public/browse_users/services_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathProducts =   Env.value!.baseUrl! + '/public/browse_users/products_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPortofolio =   Env.value!.baseUrl! + '/public/browse_users/portofolio_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathAsProjectWorker =   Env.value!.baseUrl! + '/public/browse_users/as_project_worker_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathAsProjectOwner =   Env.value!.baseUrl! + '/public/browse_users/as_project_owner_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathUserArbitrations =   Env.value!.baseUrl! + '/public/browse_users/user_arbitrations_list/'+widget.id!+'/'+widget.title! + '?';
	  // model id user
	  _hasSubModel	= false; 
	  if(_hasSubModel){
	    


        return new DefaultTabController(
          length: modelCount + 1,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
				  Tab(text: widget.title!),
				  Tab(text: 'Services'),
				  Tab(text: 'Products'),
				  Tab(text: 'Portofolio'),
				  Tab(text: 'AsProjectWorker'),
				  Tab(text: 'AsProjectOwner'),
				  Tab(text: 'UserArbitrations'),
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
				 PublicBrowseUsersSubView(id : widget.id!, title : widget.title!, model:this.model),
                   ServicesList(id : widget.id!, title : widget.title!, url : getSubPathServices),					
                   ProductsList(id : widget.id!, title : widget.title!, url : getSubPathProducts),					
                   PortofolioList(id : widget.id!, title : widget.title!, url : getSubPathPortofolio),					
                   AsProjectWorkerList(id : widget.id!, title : widget.title!, url : getSubPathAsProjectWorker),					
                   AsProjectOwnerList(id : widget.id!, title : widget.title!, url : getSubPathAsProjectOwner),					
                   UserArbitrationsList(id : widget.id!, title : widget.title!, url : getSubPathUserArbitrations),					
              ],
            ),

          ),

        ); 
	  
	  }else{
	  

	  	  return Scaffold(
		 /* appBar: AppBar(
			//title: Text(widget.title!.replaceAll('-', '  ')),
		  ),  */
		  appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),)
		  : scrollUp ? null : this.model.appBar(context, idHash),
		   body:isLoading?
			  Center( 
           child:CircularProgressIndicator(
           valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
			 :Form(
			  key: formKey,
			  child: this.model.view1(context, controller, account, widget.cb, data)
		  ),	  
			//floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
			 floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,browse_users,  this,   Env.value!.baseUrl!, widget.id!, widget.title!, account)
			
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
    timer?.cancel();
  }
}




class  PublicBrowseUsersSubView extends StatefulWidget {
  static const String PATH = '/public/browse_users/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  PublicBrowseUsersSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
  @override
   PublicBrowseUsersSubViewState createState() =>  PublicBrowseUsersSubViewState();
}

class  PublicBrowseUsersSubViewState extends State< PublicBrowseUsersSubView> with RestorationMixin{

 BrowseUsersController? browse_users;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewBrowseUsers;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'BrowseUsers';

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,browse_users,  this,   Env.value!.baseUrl!, widget.id!, widget.title!, account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


