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
import 'credit_history_index.dart';
import 'payment_history_index.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/route.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

/** AUTOGENERATE OFF **/

class  UserMyFinanceView extends StatefulWidget {
  static const String PATH = '/user/my_finance/view';
  UserMyFinanceView({Key? key}) : super(key: key);	
  @override
   UserMyFinanceViewState createState() =>  UserMyFinanceViewState();
}

class  UserMyFinanceViewState extends State< UserMyFinanceView> with TickerProviderStateMixin,RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_finance/view';	   
  
  final double _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
   MyFinanceController? my_finance;
  final formKey = GlobalKey<FormState>();
 var controller =  ScrollController() ;
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String idHash = '';
 // var viewMyFinance;
  var model;
  BehaviorSubject<bool>? _financeController;
  // final _cartController = BehaviorSubject();
  // var viewCart;
  Stream<bool> get onMessage => _financeController!.stream;
  AccountController? accountController;
  TabController? _tabController;
  bool account = true;


 UserMyFinanceViewState(){
    controller.addListener(_onScroll);
  }


final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyFinance';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyFinance');
  }



  @override
  initState(){
    super.initState();
    _tabController = new TabController(vsync: this, length: 3, initialIndex: 0);
   // _tabController.addListener(_handleTabSelection);
    _financeController = new BehaviorSubject<bool>.seeded(false);
   // controller = ScrollController();
  }


  Future<void> _handleTabSelection()async{



    setState(() {
    });
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(MyFinanceController? my_finance, BuildContext context)async {
    bool bl = false;

    if (this.model == null) {

	 final hash = my_finance!.getHash();
	   hash.then((value) {
          this.idHash = value;
        });
      final future = my_finance!.viewMyFinance();
      future.then((value) {
      //  _financeController!.add(bl);
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

  fetchData1(MyFinanceController? my_finance, BuildContext context)async {

    bool bl = false;

      final future = my_finance!.viewMyFinance();
      future.then((value) {
        //  _financeController!.add(bl);
       // setState(() {
          this.model = value;
          _financeController!.add(bl);

       //   isLoading = false;
       // });


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
  @override
  Widget build(BuildContext context) {
    bool _hasSubModel = false;
	int modelCount = 0;
	String getSubPath = '';
    bool _dialVisible = true;

    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    my_finance = new  MyFinanceController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
		'',
		'',

        null,
		false);
    print('haloooo');
  
	  fetchData(my_finance, context);
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
	  String getSubPathCreditHistory = Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+idHash +'/' + 'credit_history' + '?';	   
	  // model id user
      _hasSubModel	= true;  
	  modelCount = modelCount + 1;
	  String getSubPathPaymentHistory = Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+idHash +'/' + 'payment_history' + '?';	   
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
					   valueColor: new AlwaysStoppedAnimation<Color>(
						Colors.green),)) :
        StreamBuilder<bool>(//
            stream: onMessage,
            initialData: false,
            builder: (context, AsyncSnapshot<bool>  snapshot) {
              if( snapshot.hasData) {


                print('disini yahhhhhh');
                return(

                    DefaultTabController(

                        length: 3,
                        child: NestedScrollView(

                          controller: controller,
                          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverAppBar(
                                //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                                //  centerTitle: false,
                                elevation: 4.0,
                                backgroundColor:darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                                expandedHeight: _appBarHeight,
                                forceElevated : true,
                                pinned: true,
                                leading: new IconButton(
                                  icon: new Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                                  onPressed: (){
                                      Navigator.pop(context);
                                  },
                                ),
                                //pinned: _appBarBehavior == AppBarBehavior.pinned,
                                floating: false,
                                // snap: _appBarBehavior == AppBarBehavior.snapping,

                                flexibleSpace:
                                ExpandSpaceBar(
                                  title: InkWell(
                                      onTap : (){
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(model.model.buttons[0].url));
                                      },
                                      child : new Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text('My Finance', style: TextStyle(fontSize: 20.0, color:  CurrentTheme.BackgroundColor  ,)),
                                          ])
                                  ),
                                  titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                                  collapseMode: CollapseBarMode.parallax,
                                  // centerTitle: true,
                                  background: Stack(
                                    fit: StackFit.passthrough,
                                    children: <Widget>[
                                      InkWell(
                                        //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                                        child: Image.asset(
                                          'assets/img/profesional.png',
                                          fit: BoxFit.cover,
                                          // height: 100,
                                          // width: 100,
                                        ),

                                      ),
                                      // This gradient ensures that the toolbar icons are distinct
                                      // against the background image.

                                      const DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment(0.0, -1.0),
                                            end: Alignment(0.0, -0.4),
                                            colors: <Color>[
                                              Color(0x60000000),
                                              Color(0x00000000)
                                            ],
                                          ),
                                        ),
                                      ),



                                      // This gradient ensures that the toolbar icons are distinct
                                      // against the background image.

                                    ],
                                  ), centerTitle: null,

                                ),
                                bottom:
                                new TabBar(
                                  labelColor: CurrentTheme.PrimaryDarkColor,
                                  unselectedLabelColor: CurrentTheme.DisableTextColor,
                                  indicatorColor : CurrentTheme.PrimaryDarkColor,
                                  indicatorWeight: 3.0,
                                  controller: _tabController,
                                  isScrollable: true,
                                  indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                                  indicatorSize : TabBarIndicatorSize.label,

                                  tabs: [
                                    Tab( text: "Finance Info ",),
                                    Tab( text: "Credit History"),
                                    Tab( text: "Payment History"),
                                    //  Tab( text: "Change Payment Settings "),
                                    //  Tab( text: "Withdraw Payment"),
                                    //  Tab( text: "Deposit Balance"),
                                  ],
                                ),


                              ),

                            ];
                          },
                          body: TabBarView(
                            controller: _tabController,

                            children: [

                            //  snapshot.data == true ? UserMyFinanceView2():UserMyFinanceView1(),

                  Container(
                    color:   CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(

                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              // elevation: 1.0,

                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'My Finance',
                                subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                                isDark: darkMode,
                                children: <Widget>[
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'AVAILABLE BALANCE',
                                        model.model.model.available_balance_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BANK',
                                        model.model.model.bank_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BRANCH',
                                        model.model.model.branch,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CITY',
                                        model.model.model.city,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NUMBER',
                                        model.model.model.account_number,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NAME',
                                        model.model.model.account_name,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF PERIOD',
                                        model.model.model.cutoff_period_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isdivided: false,
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF AMOUNT',
                                        model.model.model.cutoff_amount_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),


                              CreditHistoryList(id: model.model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+model.model.model.user_id +'/' + 'credit_history' + '?'),
                              PaymentHistoryList(id: model.model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+model.model.model.user_id +'/' + 'payment_history' + '?'),
                              //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                              //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                              //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                            ],

                          ),
                        )
                    )
                );
              }
             // _financeController!.add(false);
              print('disini yahhhhhh1');
              return(

                  DefaultTabController(

                      length: 3,
                      child: NestedScrollView(

                        controller: controller,
                        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                              //  centerTitle: false,
                              elevation: 4.0,
                              backgroundColor:  CurrentTheme.BackgroundColor,
                              expandedHeight: _appBarHeight,
                              forceElevated : true,
                              pinned: true,
                              leading: new IconButton(
                                icon: new Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                              //pinned: _appBarBehavior == AppBarBehavior.pinned,
                              floating: false,
                              // snap: _appBarBehavior == AppBarBehavior.snapping,

                              flexibleSpace:
                              ExpandSpaceBar(
                                title: InkWell(
                                    onTap : (){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(model.buttons[0].url));
                                    },
                                    child : new Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text('My Finance', style: TextStyle(fontSize: 20.0, color:  Colors.black87 ,)),
                                        ])
                                ),
                                titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                                collapseMode: CollapseBarMode.parallax,
                                // centerTitle: true,
                                background: Stack(
                                  fit: StackFit.passthrough,
                                  children: <Widget>[
                                    InkWell(
                                      //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                                      child: Image.asset(
                                        'assets/img/profesional.png',
                                        fit: BoxFit.cover,
                                        // height: 100,
                                        // width: 100,
                                      ),

                                    ),
                                    // This gradient ensures that the toolbar icons are distinct
                                    // against the background image.

                                    const DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.0, -1.0),
                                          end: Alignment(0.0, -0.4),
                                          colors: <Color>[
                                            Color(0x60000000),
                                            Color(0x00000000)
                                          ],
                                        ),
                                      ),
                                    ),



                                    // This gradient ensures that the toolbar icons are distinct
                                    // against the background image.

                                  ],
                                ), centerTitle: null,

                              ),
                              bottom:
                              new TabBar(
                                labelColor: CurrentTheme.PrimaryDarkColor,
                                unselectedLabelColor: CurrentTheme.DisableTextColor,
                                indicatorColor : CurrentTheme.PrimaryDarkColor,
                                indicatorWeight: 3.0,
                                controller: _tabController,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                                indicatorSize : TabBarIndicatorSize.label,

                                tabs: [
                                  Tab( text: "Finance Info ",),
                                  Tab( text: "Credit History"),
                                  Tab( text: "Payment History"),
                                  //  Tab( text: "Change Payment Settings "),
                                  //  Tab( text: "Withdraw Payment"),
                                  //  Tab( text: "Deposit Balance"),
                                ],
                              ),


                            ),

                          ];
                        },
                        body: TabBarView(
                          controller: _tabController,

                          children: [

                            UserMyFinanceView1(),
                            CreditHistoryList(id: model.model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+ model.model.model.user_id +'/' + 'credit_history' + '?'),
                            PaymentHistoryList(id: model.model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+ model.model.model.user_id +'/' + 'payment_history' + '?'),
                            //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                            //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                            //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                          ],

                        ),
                      )
                  )
              );
            }),


      //  this.model.body1(onMessage, _tabController, context, controller, scrollUp, _scaffoldKey, this),
			 floatingActionButton: isLoading? null :this.model.model.buttons.length == 0? null:
       model.model.buttons.length == 3?
       SpeedDial(

           childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
           animatedIcon: AnimatedIcons.menu_close,
           animatedIconTheme: IconThemeData(size: 22.0),
           // this is ignored if animatedIcon is non null
           // child: Icon(Icons.add),
          // visible: visible,
           // If true user is forced to close dial manually
           // by tapping main button and overlay is not rendered.
           closeManually: false,
           curve: Curves.bounceIn,
           overlayColor: CurrentTheme.MainAccentColor,
           overlayOpacity: 0.5,
           onOpen: () => print('OPENING DIAL'),
           onClose: () => print('DIAL CLOSED'),
           tooltip: 'Speed Dial',
           heroTag: 'speed-dial-hero-tag',
           backgroundColor: CurrentTheme.SecondaryColor,
           foregroundColor: Colors.white,
           elevation: 8.0,
           shape: CircleBorder(),
           children:[

           //  model.buttons.length == 3?
             SpeedDialChild(
                 child: Icon(Icons.person),
                 backgroundColor: Colors.green,
                 label: 'Change Payment Settings',
                 labelStyle: TextStyle(fontSize: 18.0),
                 onTap: ()async{
                   await  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                         ChangePaymentSettingsMyFinance(
                             id: model.model.model.user_id, title: '')),
                   ).then((value) async{
                     await fetchData1(my_finance, context);

                   });

                 }
             ),
             SpeedDialChild(
                 child: Icon(Icons.chat_bubble),
                 backgroundColor: Colors.green,
                 label: 'Withdraw Payment',
                 labelStyle: TextStyle(fontSize: 18.0),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                         WithdrawPaymentMyFinance(
                             id: model.model.model.user_id, title: '')),
                   ).then((value) async{
                     await fetchData1(my_finance, context);

                   });

                 }
             ),
             SpeedDialChild(
                 child: Icon(Icons.monetization_on),
                 backgroundColor: Colors.green,
                 label: 'Deposit Balance',
                 labelStyle: TextStyle(fontSize: 18.0),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                         DepositBalanceMyFinance(
                             id: model.model.model.user_id, title: '')),
                   ).then((value) async{
                     await fetchData1(my_finance, context);

                   });

                 }
             ),
           ]
       ):
       SpeedDial(
           childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
           animatedIcon: AnimatedIcons.menu_close,
           animatedIconTheme: IconThemeData(size: 22.0),
           // this is ignored if animatedIcon is non null
           // child: Icon(Icons.add),
           // visible: visible,
           // If true user is forced to close dial manually
           // by tapping main button and overlay is not rendered.
           closeManually: false,
           curve: Curves.bounceIn,
           overlayColor: CurrentTheme.MainAccentColor,
           overlayOpacity: 0.5,
           onOpen: () => print('OPENING DIAL'),
           onClose: () => print('DIAL CLOSED'),
           tooltip: 'Speed Dial',
           heroTag: 'speed-dial-hero-tag',
           backgroundColor: CurrentTheme.SecondaryColor,
           foregroundColor: Colors.white,
           elevation: 8.0,
           shape: CircleBorder(),
           children:[

             SpeedDialChild(
                 child: Icon(Icons.person),
                 backgroundColor: Colors.green,
                 label: 'Change Payment Settings',
                 labelStyle: TextStyle(fontSize: 18.0),
                 onTap: ()async{
                   await  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                         ChangePaymentSettingsMyFinance(
                             id: model.model.model.user_id, title: '')),
                   ).then((value) async{
                     await fetchData1(my_finance, context);

                   });

                 }
             ),

             SpeedDialChild(
                 child: Icon(Icons.monetization_on),
                 backgroundColor: Colors.green,
                 label: 'Deposit Balance',
                 labelStyle: TextStyle(fontSize: 18.0),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                         DepositBalanceMyFinance(
                             id: model.model.model.user_id, title: '')),
                   ).then((value) async{
                     await fetchData1(my_finance, context);

                   });

                 }
             ),
           ]
       )
          ,



      // this.model.Buttons1(_financeController,  _tabController, context, _dialVisible, formKey, controller,my_finance,  this, Env.value!.baseUrl!, '', 'MyFinance', account),
			 ),
			);
	  
  }

  List<SpeedDialChild>	 listButton1(var model, bool isLoading,BuildContext context, bool visible, var formKey, ScrollController controller, MyFinanceController my_finance,
      State state, String sendPath, String id,  String title, bool account ){



    // String test = '';
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
    // for(var i = 0; i < model.buttons.length ; i++)
    // {
    //    buttonChildren.add(ButtonViewMyFinanceWidget(model.buttons[i],context,  formKey, controller, my_finance,
    //        state, sendPath, id,  title, account ));
    //  }



      buttonChildren.add(
          SpeedDialChild(
              child: Icon(Icons.person),
              backgroundColor: Colors.green,
              label: 'Change Payment Settings',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
                await  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChangePaymentSettingsMyFinance(
                          id: model.model.model.user_id, title: '')),
                ).then((value) {

                  state.setState(() {
                    // model.model.user_id = '123';
                    fetchData(my_finance, context);
                   // isLoading = true;
                    // refresh state of Page1
                  });
                });
                // var val = await my_finance.viewMyFinance();
                //  state.setState(() {
                //    model = val;
                // //    test = '123';
                //  });
              }
          )
      );



      buttonChildren.add(
          SpeedDialChild(
              child: Icon(Icons.monetization_on),
              backgroundColor: Colors.green,
              label: 'Deposit Balance',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      DepositBalanceMyFinance(
                          id: model.user_id, title: '')),
                );
              }
          )
      );




    return(
        buttonChildren
    );
  }
  SpeedDial	 Buttons1(var model, bool isLoading, BuildContext context, bool visible, var formKey, ScrollController controller, MyFinanceController my_finance,
      State state, String sendPath, String id,  String title, bool account ){
    return(
        SpeedDial(
            childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: visible,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: CurrentTheme.MainAccentColor,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: CurrentTheme.SecondaryColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children:listButton1(model, isLoading, context, visible, formKey, controller, my_finance,
                state, sendPath, id,  title, account )
        )
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




class  UserMyFinanceSubView extends StatefulWidget {
  static const String PATH = '/user/my_finance/view/:id/:title';
  final String? id ;
  final String? title;
  var model;
  UserMyFinanceSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
  @override
   UserMyFinanceSubViewState createState() =>  UserMyFinanceSubViewState();
}

class  UserMyFinanceSubViewState extends State< UserMyFinanceSubView> with RestorationMixin{

 MyFinanceController? my_finance;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var isLoading = true;
 // var viewMyFinance;
  AccountController? accountController;
  bool account = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MyFinance';

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
			 floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,my_finance,  this, Env.value!.baseUrl!, '', 'MyFinance',account)
			);  

	  				
  }

  @override
  void dispose() {
    super.dispose();
  }
}


