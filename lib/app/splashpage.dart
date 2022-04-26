
import 'package:flutter/material.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/app/intro.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/app/signin.dart';
import 'dart:core';
import 'dart:async';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/app/intro.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/app/splashpage.dart';
import 'package:projectscoid/views/NewUser/new_user_action.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:html/parser.dart' show parse;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:projectscoid/api/api.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:path_provider/path_provider.dart';

IntroController? introController ;

class SplashPage extends StatefulWidget {
  static const PATH = '/splash';
  final ProjectscoidApplication? application;
  SplashPage({Key? key, this.application}) : super(key: key);
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {

  IntroController? introController ;
  bool? value;
  bool isLoading = true;
  bool isError = false;
  var listAccount ;
  String  val1 = '';
  AccountController? accountController;

  String userID = '';
  bool chat = false;
  int intro = 0;
  String username = '';
  bool isBackground = false;
  var msgpusher;
  SubModelController? logout;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  InitializationSettings? initializationSettings  ;
  final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        {


          print("Inactive");
          isBackground = true;

        }
        break;
      case AppLifecycleState.paused:
        print("Paused");

        isBackground = true;





        break;
      case AppLifecycleState.resumed:
        {
          print("Resumed");

          isBackground = false;


          /*
          getApplicationDocumentsDirectory().then((value){
            APIProvider projectsAPIProvider = APIProvider(value.path);
            final future = projectsAPIProvider.getData(
                'https://api.projects.co.id/user/program/ping');
            future.then((value) {

              try {
                jsonDecode(value);

                  projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value.length > 0){
                    projectsAPIProvider.userLogin(username,forlgn  ) ;
                  // print('saya disini$value v');
                }else{
                  // print('saya disini cccc');
                }

              }


            });



          });

           */


        }
        break;
      case AppLifecycleState.detached:
        {
          isBackground = false;

          print("Suspending");

        }
        break;
      default :
        isBackground = false;
        break;
    }
  }



  Future<int?> _getCountSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('np_count')) {
      return prefs.getInt('np_count');
    } else {
      return 0;
    }
  }

  Future<void> _setCountSharedPrefs(int i)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('np_count', i);
  }



  Future<List<String>?> _getListSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('list_projects')) {
      return prefs.getStringList('list_projects');
    } else {
      return [];
    }
  }

  Future<void> _setListSharedPrefs(List<String> ls)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list_projects', ls);
  }


  @override
  void initState() {
    super.initState();
   // print('akuuuuuuuuuuuuu di splashhhhhhhhhhh 123');
    fetchData();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);


    // _chatBloc =  AppProvider.getApplication(widget.application).chat;


    widget.application?.chat!.onMessage.listen((pusher) async {


      String title = jsonDecode(pusher)['type'];
      //final SharedPreferences prefs = await _prefs;
      String msg;
      switch(title) {
        case 'activity':{

          msg = jsonDecode(pusher)['message'];

        }
        break;
        case 'login':{
          if (jsonDecode(pusher)['result'] == 'success') {

          }
        }
        break;
        case 'notify':{
          if(isBackground){

          }
          msg = jsonDecode(pusher)['message'];
          if (this.mounted) {
            // setState(() {
            //   notifunread = notifunread + 1;
            // print('ini ${notifunread.toString()} msg $msg');
            //});
          }

          /*
          var document = parse(msg);
          String temp = '';
          for( var i = 0; i < document.children[0].children.length ; i++){
            temp = temp + document.children[0].children[i].text + ' ';
            //print('${document.children[0].children[i].text} ');
          }

          // final document = parse(data);
          final recentNews = document.getElementsByTagName('a');
          String peer = recentNews[0].text;
          final hrefs = document
              .getElementsByTagName('a')
              .where((e) => e.attributes.containsKey('href'))
              .map((e) => e.attributes['href'])
              .toList();

          if(hrefs.last.contains('show_conversation')){
            if(hrefs.last.contains('my_projects')){
              //_showNotificationPush(  temp, title, hrefs.last + '*' + peer );
            }else{
              //_showNotificationPush(  temp, title, hrefs.last + '' + peer );

            }

          }else {
            if (hrefs.last.contains('show_thread')) {
              // _showNotificationPush(temp, title, hrefs.last.substring(
              //   0, hrefs.last.indexOf(hrefs.last.split('/')[7])) + peer);
            } else {
              // _showNotificationPush(temp, title, hrefs.last);
            }
          }
          */



        }
        break;
        case 'testimony':{
          // futureNotif = Future.value(3);
          msg = jsonDecode(pusher)['ptitle'] + ' feedback = ${jsonDecode(pusher)['feedback']}';



        }
        break;
        case 'kick':{

          //msg = jsonDecode(pusher)['userid']
          msg = 'kick $username with id $userID';

          _showNotificationPush(  msg, title, '', widget.application?.chat);

        }
        break;
        case 'pong':{

          if (this.mounted) {
            setState(() {});
          }

        }
        break;

        case 'project':{
          if(isBackground){
           //listData.add(snapshot.data);
            var dt = await _getCountSharedPrefs();
            var data = await _getListSharedPrefs();
            if(dt == 0){
              _setCountSharedPrefs( 1);
            }else{
              _setCountSharedPrefs(dt! + 1);
            }

            if(data!.isEmpty){
              _setListSharedPrefs(pusher);
            }else{
              data.add(pusher);
              _setListSharedPrefs(data);
            }


          }

        }
        break;
        case 'message':{
          //print('ajaib');
          if(isBackground){
          //  print('ajaib1');

            if(jsonDecode(pusher)['sender']!= userID){
             // print('ajaib2');
             // var dsp = jsonDecode(pusher)['display']??'';
              msgpusher = pusher;

              //msg = '${jsonDecode(pusher)['sendername']}' +' : '+ toPicFile(jsonDecode(pusher)['message']);

              msg = toPicFile(jsonDecode(pusher)['message']);
              _showNotificationPush(  msg, 'Message from ${jsonDecode(pusher)['sendername']}', 'chat', widget.application?.chat);


            }

          }else{
           // print('ajaib3');
            // print('ajob');
            if(jsonDecode(pusher)['sender']!= userID) {
            //  var dsp = jsonDecode(pusher)['display']??'';
              msg = '${jsonDecode(pusher)['sendername']}'   +' : '+ toPicFile(jsonDecode(pusher)['message']);
              msgpusher = pusher;
              //_showNotificationPush(  msg, title, 'chat', widget.application.chat);
              // print('ajob1');

            }


          }
          if(jsonDecode(pusher)['sender']!= userID) {
            widget.application?.chat?.getFirstIndex(1);
            //  print('halooooooocoyyyyyyyyyyy');
            if (this.mounted) {
              setState(() {});
            }
          }




        }
        break;
        case 'index':{
         // print('ajaib');
          /*
          unread = 0;

          for(var obj in jsonDecode(pusher)['list']){

            //lastmesssage
                if(obj['blocked'] != 1){
                  unread = unread + obj['unread'];
                }
            }

           */




          // if (this.mounted) {
          /*
            if (unread > 0) {
              setState(() {

              });
            }

             */
          // }


        }
        break;
        default :{

         // print('ajaib');
        }
        break;

      }

      if(title == 'kick'){
        loggedOut();
      }
      //  });



    }
    );





  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  String toPicFile(String json){
    if(json.contains('chat-file') || json.contains('chat-file') ){
      return '📎 Attachment';
    }else if(json.contains('chat-image') || json.contains('chat-image') ){
      return '📷 Image';
    }else{
      return json;
    }

  }

  Future<void>  loggedOut() async{
    // AppProvider.getApplication(widget.application).chat.dispose();
    // messaging.unsubscribeFromTopic(widget.id);
    //  _timer.cancel();

    await logout?.getData();

    //  Navigator.pop(context);

    BlocProvider.of<AuthenticationController>(context).add(LoggedOut());
    // AppProvider.getRouter(context)!.navigateTo(
    //     context,
    //      "/login/0");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
          (Route<dynamic> route) => false,
    );


    // _authenticationBloc.add(LoggedOut());
    /*  AppProvider.getRouter(context)!.navigateTo(
        context,
        "/"); */

    //  Login();
    //Navigator.pop(context); // Dismiss the drawer.
    /* _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    )); */
  }
  _setNotif(String ntf)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('notification', ntf);
  }

  Future<void> onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title!),
        content: Text(body!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              if (!title.contains('My Purchase :')){
                Navigator.of(context, rootNavigator: true).pop();
                await AppProvider.getRouter(context)?.navigateTo(context, '/Projectscoid');
              } else{

              }

            },
          )
        ],
      ),
    );
  }

  Future<void> _showNotificationPush( String msg, String title, var data, var cb) async {


    final List<String> lines = <String>[msg];
    var inboxStyleInformation = InboxStyleInformation(
        lines,
        htmlFormatLines: true,
        contentTitle: title,
        htmlFormatContentTitle: true,
        summaryText: title,
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.max, ticker: 'ticker', styleInformation: inboxStyleInformation  );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.initialize(initializationSettings!,
        onSelectNotification: (String? payload) async {

          if (payload != null && payload != '') {
            debugPrint('notification payload123: $payload');




            if (payload.contains('show_conversation')) {
              payload = '$payload***l';


              await _setNotif(payload);

              //  print('haloooooooooooo');

              /*

              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(payload));

               */

              if (payload.contains('my_projects')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ShowConversationMyProjects(
                          id: '${payload?.split('/')[6]}',
                          title: '${payload?.split('/')[7]}',
                          id1: '${payload?.split('/')[8]}',
                          cb: cb)),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ShowConversationMyBids(id: '${payload?.split('/')[6]}',
                          title: '${payload?.split('/')[7]}',
                          id1: '${payload?.split('/')[8]}',
                          cb: cb)),
                );
              }
            } else  if((payload.contains('chat'))){
              //print('chatttttttttt');

             await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: {

                        "thread":"${jsonDecode(msgpusher)['thread']}",
                        "username":"",
                        "userid":"${jsonDecode(msgpusher)['sender']}",
                        "display":"",
                        "avatar":"",
                        "lastmessage":"",
                        "lasttime":"1234567890"

                      },
                      userID : userID,
                      chatBloc : cb,
                      trans : true,
                      ctx: context,
                    ),
                  )
              ).then((value)async{
                // cb.dispose();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('chatlink', true );
              });
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: {

                        "thread":"${jsonDecode(msgpusher)['thread']}",
                        "username":"${jsonDecode(msgpusher)['display']}",
                        "userid":"${jsonDecode(msgpusher)['sender']}",
                        "display":"${jsonDecode(msgpusher)['display']}",
                        "avatar":"",
                        "lastmessage":"",
                        "lastseen":jsonDecode(msgpusher)['time'].toString(),
                        "lasttime":jsonDecode(msgpusher)['time'].toString()

                      },
                      userID : userID,
                      chatBloc :cb,
                      trans : true,
                      ctx: context,
                    ),
                  )
              );

               */
            }

            else if (payload.contains('show_thread')) {
              payload = '$payload*20**l';


              await _setNotif(payload);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    ShowThreadMyProjects(id: '${payload?.split('/')[6]}',
                        title: '${payload?.split('/')[7]}*20**l',
                        cb: cb)),
              );


              //  print('haloooooooooooo');
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(payload));

               */
            }
            else {
              await _setNotif(payload);
              await AppProvider.getRouter(context)!.navigateTo(
                  context, urlToRoute(payload));
            }
          }
          selectNotificationSubject.add(payload!);



        });
    /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
    int id;
    switch(title) {
      case 'activity':{
        id = 0;

      }
      break;
      case 'notify':{
        id= 1;

      }
      break;
      case 'testimony':{
        id = 2;

      }
      break;
      case 'kick':{
        id = 3;

      }
      break;
      case 'message':{
        id = 4;

      }
      break;
      default :{
        id = 5;
      }
      break;

    }
    await flutterLocalNotificationsPlugin.show(
        id, title, msg, platformChannelSpecifics,
        payload: data);
  }
  fetchData()async {


    getApplicationDocumentsDirectory().then((value) {
      APIProvider projectsAPIProvider = APIProvider(value.path);
      var future = projectsAPIProvider.getDataRC(
          Env.value!.baseUrl! + '/public/program/mobile_init');

      future.then((value) {
        try{

          if (!mounted) return;
          // print('hanya satu kali 1');
        //  value = 450;
          if((value > 399) && (value < 500)){
            isError = true;
            //print('nilai code ===  ${value.toString()}');
          }


          setState(() {
            isLoading = false;

          });
        }catch(e){
          if (!mounted) return;
         // if(){
         //   isError = true;
        //  }

          setState(() {

           isLoading = false;
          });
        }

      });


    });



  }

  @override
  Widget build(BuildContext context) {


    return isLoading ? Container()
      : isError? Container (
        child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('This application cannot run from this network address.', style: TextStyle(fontSize: 30)),
                  Text('Aplikasi ini tidak dapat berjalan dari jaringan ini.', style: TextStyle(fontSize: 30))
                ],
              )
            )

       )
        :SplashScreen(
      seconds: 4,
      navigateAfterSeconds:  AfterSplash(context: context),
      title: const Text('a freelancer marketplace',
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Amazon Ember',
            color: Colors.black54 ,
            fontSize: 22.0
        ),
      ),
      image: Image.asset('assets/img/logoprojects.png',
        fit: BoxFit.fitHeight,
        height: 50.0,), //  Image.network("https://cdn.projects.co.id/assets/img/projectscoid.png"),
      //gradientBackground: new LinearGradient(colors: [Colors.white, Colors.orange], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //  backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      //onClick: ()=>print("Flutter Egypt"),
      loaderColor: CurrentTheme.DarkAccentColor,
    );
  }
}

class AfterSplash extends StatefulWidget {
  final BuildContext? context;
  AfterSplash({Key? key, this.context}) : super(key: key);

  @override
  AfterSplashState createState() => new AfterSplashState();
}

class AfterSplashState  extends State<AfterSplash> with WidgetsBindingObserver  {
  IntroController? introController ;
  bool? value;
  bool isLoading = true;
  var listAccount ;
  String  val1 = '';
  AccountController? accountController;

  String userID = '';
  bool chat = false;
  int intro = 0;
  String username = '';
  bool isBackground = false;
  var msgpusher;
  SubModelController? logout;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  InitializationSettings? initializationSettings  ;
  final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();
  bool firstimeConnect = true ;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        {


          print("Inactive");
          isBackground = false;

        }
        break;
      case AppLifecycleState.paused:
        print("Paused");

        isBackground = true;





        break;
      case AppLifecycleState.resumed:
        {
          print("Resumed");

          isBackground = false;


          /*
          getApplicationDocumentsDirectory().then((value){
            APIProvider projectsAPIProvider = APIProvider(value.path);
            final future = projectsAPIProvider.getData(
                'https://api.projects.co.id/user/program/ping');
            future.then((value) {

              try {
                jsonDecode(value);

                  projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value.length > 0){
                    projectsAPIProvider.userLogin(username,forlgn  ) ;
                  // print('saya disini$value v');
                }else{
                  // print('saya disini cccc');
                }

              }


            });



          });

           */


        }
        break;
      case AppLifecycleState.detached:
        {
          isBackground = false;

          print("Suspending");

        }
        break;
      default :
        isBackground = false;
        break;
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }


  fetchData( AccountController accountController, BuildContext context)async {




    // hasher = md5 ;
    //  var vlll = generateMd5('12345678910');
    //  print('MD5 === $vlll');
    /*
    if(this.listAccount == null) {
      // this.listAccount = [];
      final future = accountController.getAccount();
      future.then((val){
        print('val===='+ val.toString());
        val1 = val.toString();
        //}
       // if(this.mounted)
       // {
          setState(() {
            isLoading = false;
          });
       // }

        this.listAccount.add(val);

      }).catchError((Error){

      });

      //if(this.mounted)
      // {

    } else{

      print('val====');

      setState(() {
        isLoading = false;
      });
    };

     */


    if(listAccount == null) {
      listAccount = [];
      final future = accountController.getAccount();
      future.then((val){
        // print('val===='+ val.toString());
        if(this.mounted)
        {
          setState(() {
            isLoading = false;
          });
        }


        listAccount.addAll(val);

        var ntf = 0;
        for(var map in listAccount) {
          username        = map['user_name'];

          userID      = map['user_hash'];
          ntf = int.parse(map['notif_count']);
        }
        //  notifunread = ntf;
        AppProvider.getApplication(context).chat!.setUsername(username);





      }).catchError((Error){
        /*
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });

         */

      });
    } else{

      for(var map in listAccount) {
        username        = map['user_name'];

        userID      = map['user_hash'];
        // ntf = int.parse(map['notif_count']);
      }



      if(firstimeConnect){
        if(AppProvider.getApplication(context).chat!.socket == null){

          //  AppProvider.getApplication(context).chat!.socket.connect();
          if(userID  != '' ){
            AppProvider.getApplication(context).chat!.lg(userID);
            firstimeConnect = false;

          }

        }else{
          if(userID  != '' ){
            AppProvider.getApplication(context).chat!.lg(userID );
            // print('aku ada dsini');
            firstimeConnect = false;

          }
        }
      }





      /*
      AppProvider.getApplication(context).chat!.socket.connect();
      if(AppProvider.getApplication(context).chat!.socket == null){
        AppProvider.getApplication(context).chat!.socket.connect();
        if(id != '' ){
          AppProvider.getApplication(context).chat!.lg(userID);

        }

      }else{
        if(id != '' ){
          AppProvider.getApplication(context).chat!.lg(userID);

        }
      }



       */
      setState(() {
        isLoading = false;
      });
    };

  }
  //AccountController accountController;
  @override
  Widget build(BuildContext context) {
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );

   // fetchData( accountController, context);
    introController = IntroController(AppProvider.getApplication(context),
        false,
        AppAction.listing
    );




    if(value == null) {
      final future = introController?.getIntroSetting();
      future?.then((val){
        setState(() {
          value = val;
        });
      });
      return const SizedBox(width: 0.0, height: 0.0);
    }else {
      if (value!){
         //return Login(application: context);


       /*
        accountController = new AccountController(AppProvider.getApplication(context),
            AppAction.view   );
        List listAccount = [];
        final future = accountController.getAccount();
        future.then((val){

          listAccount.addAll(val);


        });

        */
        //return isLoading? Scaffold(
          //  body: new Center(
          //  child:CircularProgressIndicator(
          //  valueColor: new AlwaysStoppedAnimation<Color>(
          //          Colors.green),
          //  )
          //  )) :
          //    val1 == '[]' ?
          //  return Navigator.pushReplacementNamed(context, "/login/0");

           return Login(application: context, isLogin: false);
          // return Login(application: context, isLogin: true);

          //  return Navigator.pushReplacementNamed(context, "/login/1");
         // : Login(application: context, isLogin: true);
        //  await accountController.getAccount();

       // return Login(application: context);
      }else{
        return IntroScreen();
      }
    }

  }
}

class SplashScreen extends StatefulWidget {
  final int? seconds;
  final Text? title;
  final Color?backgroundColor;
  final TextStyle? styleTextUnderTheLoader;
  final dynamic navigateAfterSeconds;
  final double? photoSize;
  final dynamic onClick;
  final Color? loaderColor;
  final Image? image;
  final Text? loadingText;
  final ImageProvider? imageBackground;
  final Gradient? gradientBackground;
  SplashScreen(
      {
        this.loaderColor,
        @required this.seconds,
        this.photoSize,
        this.onClick,
        this.navigateAfterSeconds,
        this.title = const Text(''),
        this.backgroundColor = Colors.white,
        this.styleTextUnderTheLoader = const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        this.image,
        this.loadingText  = const Text(""),
        this.imageBackground,
        this.gradientBackground
      }
      );


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  //  print('akuuuuuuuuuuuuu di splashhhhhhhhhhh');
    Timer(
        Duration(seconds: widget.seconds!),
            () {
          if (widget.navigateAfterSeconds is String) {
            // It's fairly safe to assume this is using the in-built material
            // named route component
            Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
          } else if (widget.navigateAfterSeconds is Widget) {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => widget.navigateAfterSeconds));
          } else {
            throw new ArgumentError(
                'widget.navigateAfterSeconds must either be a String or Widget'
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onClick,
        child:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.imageBackground!,
                ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     /* new CircleAvatar(

                        backgroundColor: Colors.transparent,
                        child: new Container(
                            child: widget.image
                        ),
                        radius: widget.photoSize,
                      ), */
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),

                        child:  this.widget.image
                      ),
                    /*  new Container(
                          height: 40.0 ,

                          child: widget.image,
                      ), */
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      widget.title!
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child :    CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(widget.loaderColor!),
                      ),
                ),
               /* Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(widget.loaderColor),
                      ),
                    /*  Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      widget.loadingText

                     */
                    ],
                  ),
                ),

                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}