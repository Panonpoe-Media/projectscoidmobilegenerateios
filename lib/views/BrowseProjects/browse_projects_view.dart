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
import 'user_bids_list.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/** AUTOGENERATE OFF **/
class  PublicBrowseProjectsView extends StatefulWidget {
  static const String PATH = '/public/browse_projects/view/:id/:title';
  final String? id ;
  final String? title;
  ChatBloc? cb;
  PublicBrowseProjectsView({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
   PublicBrowseProjectsViewState createState() =>  PublicBrowseProjectsViewState();
}

class  PublicBrowseProjectsViewState extends State< PublicBrowseProjectsView>{
  String getPath = Env.value!.baseUrl! + '/public/browse_projects/view/%s/%s';
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   BrowseProjectsController? browse_projects;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
  String? userid;
 // var viewBrowseProjects;
  BrowseProjectsViewModel? model;
  PastProjectsViewModel? model1;
  bool isPastProject = false;
  AccountController? accountController;
  bool account = true;
  String strValue = '';

  Timer? timer;
  bool isEnd = false;
  bool _isSetAds = true;
  StateSetter? _setState;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int? maxFailedLoadAttempts = 2;


  PublicBrowseProjectsViewState(){
    controller.addListener(_onScroll);
  }


  @override
  initState(){
    super.initState();

   // getAdsStatus;

    WidgetsBinding.instance.addPostFrameCallback((_) async {


     // await getAdsStatus();
      final future = getAdsStatus();
      future.then((val) {
        if(_isSetAds){
          //print('apakah bisa man????');
          Future.delayed(Duration.zero, () => _createInterstitialAd());
          //  WidgetsBinding.instance.addPostFrameCallback((_) {
          //   showAds();
          // });

        }
      });

      //setState(() { });
    });

    // controller = ScrollController();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
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
    var ts, fd;
    var delay;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('appads_timestamp')) {
      //print('apakah bisa man123????');
      ts =  prefs.getInt('appads_timestamp');
      fd =  prefs.getBool('first_delay');
      final date1 = DateTime.fromMillisecondsSinceEpoch(ts).toUtc();
      final date2 = DateTime.fromMillisecondsSinceEpoch(tm).toUtc();
      double difference = double.parse(date2.difference(date1).inMinutes.toString());
      if(fd){
        if(difference <= AdHelper.FirstDelay){
          _isSetAds = false;
          // delay = AdHelper.FirstDelay;
        }else{
          prefs.setBool('first_delay', false);
          //delay = AdHelper.delaySet;
          _isSetAds = true;
        }

      }else{

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
          _isSetAds = true;
          // print('apakah bisa 2 ${difference}');
        }

      }
    } else {
      //print('apakah bisa 3');
      _isSetAds = true;
    }

    return true;

  }

  fetchData2(SubModelController? browse_projects, BuildContext context)async {
    String getPath = Env.value!.baseUrl! + '/public/past_projects/view/${widget.id!}/${widget.title!}';
    browse_projects = new  SubModelController(AppProvider.getApplication(context),
        getPath,
        null);
    if (this.model1 == null) {
      final hash = browse_projects!.getHash();
      hash.then((value) {
        this.idHash = value!;
      });
      final future = browse_projects!.getData();

      future.then((value) {
        Map<String, dynamic> json = value;
        this.model1 = PastProjectsViewModel(json);


        setState(() {
          isLoading = false;
        });
        // this.model1 = value;
      }).catchError((Error) {
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        }
        );
      });
    }

  }

  fetchData(SubModelController? browse_projects, BuildContext context)async {
    String getPath = Env.value!.baseUrl! + '/public/browse_projects/view/${widget.id!}/${widget.title!}';
    browse_projects = new  SubModelController(AppProvider.getApplication(context),
        getPath,
        null);
    if (this.model == null) {
      final hash = browse_projects!.getHash();
      hash.then((value) {
        this.idHash = value!;
      });
      final future = browse_projects!.getData();

      future.then((value) {
        //strValue = value;
        // Map<String, dynamic> json = value;
        print('disini saja');
        model = BrowseProjectsViewModel(value);
        print('disini saja ya');
        if(model!.model!.model!.project_status_id != 3){
          Map<String, dynamic> json = value;
          this.model1 = PastProjectsViewModel(json);
          isPastProject = true;
          print('PastProjectsViewModel1');
        }
        print('PastProjectsViewModel');
        setState(() {
          isLoading = false;
        });

        // this.model = BrowseProjectsViewModel(json);
        // this.model = value;
      }).catchError((Error) {
        isPastProject = true;
        print('PastProjectsViewModel3');
       // fetchData2(browse_projects, context);
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    bool _hasSubModel = false;
    int modelCount = 0;
    String getSubPath = '';
    bool _dialVisible = true;
    SubModelController? projects;

    print('PastProjectsViewModel4');

    fetchData(projects, context);
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
    String getSubPathUserBids = Env.value!.baseUrl! + '/public/browse_projects/user_bids_list/'+widget.id!+'/'+widget.title! + '?';
    // model id project
    _hasSubModel	= false;

   // Future.delayed(Duration.zero, () => showAds(context));

    if(_hasSubModel){



      return new DefaultTabController(
        length: modelCount + 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: widget.title!),
                Tab(text: 'UserBids'),
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
              PublicBrowseProjectsSubView(id : widget.id!, title : widget.title!, model:this.model),
              UserBidsList(id : widget.id!, title : widget.title!, url : getSubPathUserBids),
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
            : scrollUp ? null : isPastProject?  AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text('', style : TextStyle( color: Colors.white, )),
        ) :
        AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text('',style : const TextStyle( color: Colors.white, )),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Share.share('${widget.title} https://projects.co.id/public/browse_projects/view/${widget.id}/project', subject: '${widget.title}');
                    },
                    child: Icon(
                      Icons.share,
                      size: 26.0,
                    ),
                  )
              ),
              /*
              PopupMenuButton<int>(
                onSelected: (int?value) {

                  if(value == 1) {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('public/browse_projects/ask_owner/${this.model!.model!.project_id}/${this.model!.meta.title}'));
                  }

                  if(value == 2) {

                    if(idHash.isNotEmpty){
                      _chatBloc =   ChatBloc();
                      // if(widget.id == '')

                      _chatBloc.wsSetHandlers();
                      //_chatBloc.lgn(widget.id);
                      _chatBloc.lg(idHash!);
                      //$idHash/${encode(this.model!.model!.owner_id)}
                      String? thread = '';
                      if(decode(idHash!)>this.model!.model!.owner_id ){
                        thread = '${encode(this.model!.model!.owner_id)}/$idHash';
                      }else{
                        thread = '$idHash/${encode(this.model!.model!.owner_id)}';
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              user: {

                                "thread":"$thread",
                                "username":"${this.model!.model!.owner_user_name}",
                                "userid":"${encode(this.model!.model!.owner_id)}",
                                "display":"${this.model!.model!.owner_str}",
                                "avatar":"${this.model!.model!.owner_photo_url}",
                                "lastmessage":""


                              },
                              userID : idHash,
                              chatBloc : _chatBloc,
                              trans : true,
                              ctx: context,
                            ),
                          )
                      );
                    }else{
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          '/login/1');
                    }



                }


                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Ask owner'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Chat owner'),
                  ),


                ],
              ),

               */
            ]
        ),



        body:isLoading!?
        Center(
            child:CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ))
            :Form(
            key: formKey,
            child: isPastProject? this.model1!.view(context, controller, account, _isBannerAdReady,_bannerAd ) : this.model!.view1(context, controller, account, this, userid, widget.cb)
        ),
        //floatingActionButton: isLoading? null :  this.model!.Buttons(context, _dialVisible)
        // floatingActionButton: isLoading? null : this.model!.model!.buttons.length == 0? null: this.model!.Buttons(context, _dialVisible, formKey, controller,browse_projects,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)

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
    // timer?.cancel();
  }
}




class  PublicBrowseProjectsSubView extends StatefulWidget {
  static const String PATH = '/public/browse_projects/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  PublicBrowseProjectsSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
  @override
   PublicBrowseProjectsSubViewState createState() =>  PublicBrowseProjectsSubViewState();
}

class  PublicBrowseProjectsSubViewState extends State< PublicBrowseProjectsSubView>{

 BrowseProjectsController? browse_projects;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewBrowseProjects;
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
			  child: widget.model!.view(context, controller, account)
		  ),	  
			 floatingActionButton: isLoading? null :  widget.model!.Buttons(context, _dialVisible, formKey, controller,browse_projects,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


