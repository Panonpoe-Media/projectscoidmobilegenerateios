
// ignore_for_file: unused_import, unused_element

import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/models/model.dart';
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
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';

class Login extends StatefulWidget {
  static const PATH = '/login/:login';
  BuildContext? application;
  bool? isLogin = false;
  Login({Key? key, this.application, this.isLogin}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver{
  AccountController? accountController;
  String? userID = '';
  bool chat = false;
  int intro = 0;
  String ?username = '';
 // var _chatBloc;
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
        //  print("Inactive");
          isBackground = false;
        }
        break;
      case AppLifecycleState.paused:
       // print("Paused");
        isBackground = true;
        break;
      case AppLifecycleState.resumed:
        {
         // print("Resumed");
          isBackground = false;

        }
        break;
      case AppLifecycleState.detached:
        {
          isBackground = false;
        //  print("Suspending");
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
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  String toPicFile(String json){
  if(json.contains('class=\"download\"') || json.contains('class="download"') ){
    return '📎 Attachment';
  }else if(json.contains('class=\"thumbnail\"') || json.contains('class="thumbnail"') ){
    return '📷 Image';
  }else{
    return json;
  }
}

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              if (!title.contains('My Purchase :')){
                Navigator.of(context, rootNavigator: true).pop();
                await AppProvider.getRouter(context)!.navigateTo(context, '/Projectscoid');
              } else{

              }

            },
          )
        ],
      ),
    );
  }

  // ignore: unused_element
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
           // debugPrint('notification payload123: $payload');

            if (payload.contains('show_conversation')) {
              payload = '$payload***l';
              await _setNotif(payload);
              if (payload.contains('my_projects')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ShowConversationMyProjects(
                          id: payload!.split('/')[6],
                          title: payload.split('/')[7],
                          id1: payload.split('/')[8],
                          cb: cb)),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ShowConversationMyBids(id: payload!.split('/')[6],
                          title: payload.split('/')[7],
                          id1: payload.split('/')[8],
                          cb: cb)),
                );
              }
            } else  if((payload.contains('chat'))){
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
                        "lastseen":jsonDecode(msgpusher)['time'],
                        "lasttime":jsonDecode(msgpusher)['time']

                      },
                      userID : userID,
                      chatBloc :cb,
                      trans : true,
                      ctx: context,
                    ),
                  )
              );
            }

            else if (payload.contains('show_thread')) {
              payload = '$payload*20**l';
              await _setNotif(payload);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    ShowThreadMyProjects(id: payload!.split('/')[6],
                        title: '${payload.split('/')[7]}*20**l',
                        cb: cb)),
              );
            }
            else {
              await _setNotif(payload);
              await AppProvider.getRouter(context)!.navigateTo(
                  context, urlToRoute(payload));
            }
          }
          selectNotificationSubject.add(payload!);

        });

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

  Future<void>  loggedOut() async{
    await logout?.getData();
    BlocProvider.of<AuthenticationController>(context).add(LoggedOut());
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
          (Route<dynamic> route) => false,
    );
  }

  Future<String?> _getChatSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('chat_link')){
      return prefs.getString('chat_link');
    }else{return '';}
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  _setNotif(String ntf)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('notification', ntf);
  }

  @override
  Widget build(BuildContext context) {
    accountController = AccountController(AppProvider.getApplication(context), AppAction.listing);
    logout = SubModelController(AppProvider.getApplication(context),
        Env.value!.baseUrl! +  '/public/home/logout',
        null);
    final future = accountController?.getAccount();
    future?.then((val){
      for(var map in val) {
          userID      = map['user_hash'];
          username      = map['username'];
      }});

    return
      BlocBuilder<AuthenticationController,AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            final futureIntro = accountController?.getIntro();
            futureIntro?.then((val){
              intro = val;
              if(intro == 1){
               // print('aku di intro');
                return Projectscoid(id : userID,  ctx: context);
              }else{
                return const IntroScreen();
              }
            });
            return Container(width: 0.0, height: 0.0, color:  Colors.white,);
          }
          if(state is AuthenticationWait){
            final future = accountController?.getAccount();
            future?.then((val){
              for(var map in val) {
                userID      = map['user_hash'];
                username      = map['username'];
              }
              return userID;
            });
          }
          if (state is AuthenticationAuthenticated ) {
             return  FutureBuilder<dynamic>(
                     future: accountController?.getAccount(),
                     builder: (context, snapshot) {
                       if (snapshot.hasData) {
                        if(snapshot.data.isEmpty){
                            return Container(width: 0.0, height: 0.0, color:  Colors.white);
                        }
                        return   FutureBuilder<String?>(
                            future: _getChatSharedPrefs(),
                            builder: (context, snapshot1) {
                                      if (snapshot1.hasData) {
                                        if(snapshot1.data == 'chat'){
                                         // print('chat ada');
                                          return Projectscoid(id : snapshot.data.asMap()[0]['user_hash'], isChat: true, ctx: context);
                                        }else{
                                         // print('chat tidak ada');
                                          return Projectscoid(id : snapshot.data.asMap()[0]['user_hash'], ctx: context);
                                        }
                                      }
                                   //  print('chat null');
                                    return Projectscoid(id : snapshot.data.asMap()[0]['user_hash'], ctx: context);

                            }

                        );

                       } else if (snapshot.hasError) {
                             _onWidgetDidBuild(() {
                             ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(
                             content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                             backgroundColor: Colors.red,
                             ),
                             );
                             });

                               return Text("${snapshot.error}",style: Theme.of(context).textTheme.headline1);
                       } else {
                         return Container(width: 0.0, height: 0.0, color:  Colors.white);
                       }
                     });
          }
          if (state is AuthenticationUnauthenticated) {

                return  FutureBuilder<dynamic>(
                    future: accountController?.getAccount(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        if(snapshot.data.isEmpty){
                          AppProvider.getApplication(context).chat?.socketCloseSP();
                          return  widget.isLogin! ?LoginPage(application: AppProvider.getApplication(context)) : Projectscoid(id : '',  ctx: context);
                         // return LoginPage();
                        }
                       // AppProvider.getApplication(context).chat.socket.connect();
                      //  AppProvider.getApplication(context).chat.lg(snapshot.data.asMap()[0]['user_hash']);
                      //  AppProvider.getApplication(context).chat.getFirstIndex(1);
                          print('data      ===     ${snapshot.data.asMap()[0]['user_hash']}');
                        return widget.isLogin! ? LoginPage(application: AppProvider.getApplication(context)) : Projectscoid(id : snapshot.data.asMap()[0]['user_hash'],  ctx: context);


                      } else if (snapshot.hasError) {

                        _onWidgetDidBuild(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });

                        return Text("${snapshot.error}",style: Theme.of(context).textTheme.headline1);
                      } else {
                        return Container(width: 0.0, height: 0.0, color:  Colors.white);
                      }
                    });

          }
          if (state is AuthenticationLoading) {
            final future = accountController!.getAccount();
            future.then((val){
              for(var map in val) {
                userID      = map['user_hash'];
                username      = map['username'];
              }
            });

            return Scaffold(
                body: Center(
                    child: Container(width: 0.0, height: 0.0, color:  Colors.white)
                ));
          }
         // return Projectscoid(id : userID);
          return Container(width: 0.0, height: 0.0, color:  Colors.white);
        },
      );
  }

}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class LoginPage extends StatefulWidget {
  final ProjectscoidApplication? application;
  LoginPage({Key? key, @required this.application}):
        super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController? _loginBloc;
  AuthenticationController? _authenticationBloc;

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationController>(context);
    _loginBloc = LoginController(
      application : widget.application!,
      authenticationBloc: _authenticationBloc!..initialState,
      initialState: const LoginInitial(username: '',password: ''),
    );

    return Scaffold(
      appBar: null ,

       body: BlocProvider(

         create: (context) => LoginController(
            authenticationBloc: _authenticationBloc!..initialState,
             application : widget.application!,
           initialState: const LoginInitial(username: '',password: ''),
           ),
         child: LoginForm(
            loginBloc: _loginBloc!,
         ),
       ),
    );
  }

  @override
  void dispose() {
   super.dispose();
  }

}

class LoginForm extends StatefulWidget {
  final LoginController? loginBloc;
  LoginForm({
    Key? key,
    @required this.loginBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username = '';
  String _password = '';
  final formKey = GlobalKey<FormState>();
 // bool next = false ;
  @override
  void initState() {
    // TODO: implement initState
   // next = false;
   // _loginBloc.initialState;
    _loginBloc?.add(NextButtonPressed());
    _username = '';
    _password = '';
    super.initState();
  }

  Widget _buildCoverImage(Size screenSize) {
    List<String> image = [
      'assets/img/aki.jpg',
      'assets/img/ibu.jpg',
      'assets/img/bapak.png',
    ];
    var rng = Random();
    return Container(
      height: screenSize.height / 3.351,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        image: DecorationImage(
          image: AssetImage(image[rng.nextInt(3)]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLogoImage(BuildContext context, Size screenSize) {
    return
        Padding(
          padding: const EdgeInsets.only(left: 0.2 ),
          child:SizedBox(
            width: 3/6 *screenSize.width,
            height: 80.0,
            child: Image.asset(
              'assets/img/logoprojects.png',
              fit: BoxFit.contain,
            ),
          )
        ) ;
  }

  Widget listBeauty(BuildContext context, Size screenSize) {
    return
      Container(
        width: screenSize.width,
        height: 50.0,
        decoration : BoxDecoration(
          color: Colors.white,
          border: Border.all(  color: Colors.white,
            width: 0.5,),
          borderRadius: BorderRadius.circular(50),
        ),
      );
  }

  Widget loginButton (BuildContext context,LoginState state){
    final size =MediaQuery.of(context).size;
    final width =size.width;
    return  ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.93 * width,
      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.93 * width,
          buttonHeight: 45.0,
          children: <Widget>[
            ElevatedButton(
                child: const Text('Masuk ', style: TextStyle(color: Colors.white70),),
                style: ButtonStyle(
                  textStyle:
                  MaterialStateProperty.all<TextStyle>(
                      const TextStyle(color: Colors.white70)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      const Color(0xFF404A5C)),
                ),
                //backgroundColor : Color(0xFF037f51),),

                onPressed: (state is ! LoginLoading)  ? _onLoginButtonPressed : null,
            ),
          ]
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    TextStyle readTextStyle = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      color: Color(0xFF404A5C),
      fontSize: 18.0,
    );
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(8.0),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap:()async{
                await AppProvider.getRouter(context)!.navigateTo(context, '/public/existing_user/forgot_password/123/Register');
              } ,
              child: Text('Lupa Password?',
                  textAlign: TextAlign.start,
                  style:readTextStyle ),
            )

          ]
      ),
    );
  }


  Widget orLogo(BuildContext context, Size screenSize){
    TextStyle readTextStyle = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w300,//try changing weight to w500 if not thin
      color: Color(0xFF404A5C),
      fontSize: 14.0,
    );
    return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(8.0),
            child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Container(
                      width: screenSize.width/3.0,
                      height: 2.0,
                      padding: const EdgeInsets.only(right: 5.0),
                      decoration : const BoxDecoration(
                        color: CurrentTheme.ShadeColor,
                      ),
                    ),
                    Text(
                      'atau',
                      style: readTextStyle,
                    ),
                    Container(
                      width: screenSize.width/3.0,
                      height: 2.0,
                       padding: const EdgeInsets.only(left: 5.0),
                      decoration : const BoxDecoration(
                        color: CurrentTheme.ShadeColor,
                      ),

                    ),
                  ],
                )
    );
  }

  Widget registerButton (BuildContext context,LoginState state){
    final size =MediaQuery.of(context).size;
    final width =size.width;

    return  ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.73 * width,

      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.73 * width,
          buttonHeight: 40.0,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Buat Akun '),
              style: ButtonStyle(
                textStyle:
                MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Colors.white)),
                backgroundColor:
                MaterialStateProperty.all<Color>(
                    Colors.green),
              ),
                onPressed: ()async{
                  await AppProvider.getRouter(context)!.navigateTo(context, '/public/new_user/register/123/Register');
                }
            ),

          ]
      ),
    );
  }


  LoginController? get _loginBloc => widget.loginBloc!;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    String ErrorText = 'Masih ada perbaikan di server kami, Silakan coba beberapa saat lagi.';

      return BlocBuilder<LoginController, LoginState>(
        bloc: _loginBloc,
        builder: (
            BuildContext context,
            LoginState state,
            ) {
          if (state is LoginFailure) {
            _onWidgetDidBuild(() {
              print('Ini state error ${state.error}');
              if(state.error!.contains('timed')){
                ErrorText = 'Koneksi internet Anda tidak ada. Silakan coba beberapa saat lagi.';
              }
              if(state.error!.contains('429')){
                ErrorText = 'Request anda kena pembatasan limit. Silakan coba beberapa saat lagi.';
              }
              if(state.error!.contains('ERR')){
                ErrorText = 'Wrong username and password combination.';
              }
              if(state.error!.contains('lookup')){
                ErrorText = 'Koneksi internet Anda tidak ada. Silakan coba beberapa saat lagi.';
              }
            //  Failed host lookup
            //  I/flutter ( 4401): ada disini boss DioError [DioErrorType.other]: SocketException: Failed host lookup: 'projects.co.id' (OS Error: No address associated with hostname, errno = 7)

             // 'Connecting timed out'
              //Wrong username or password
              // Server
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(ErrorText),
                  //state.error!.contains('429') ? const Text('Request anda kena pembatasan limit. Silakan coba beberapa saat lagi.')
                  //    : const Text('Wrong username and password combination.'),
                  backgroundColor: Colors.red,
                ),
              );
            });
            _loginBloc?.add(ResetError(
              username: _username,
              password: _password,
            ));



          }
          if(state is LoginInitial){

            return Form(
                key: formKey,
                child:

                SingleChildScrollView(
                    child:
                    Stack(
                        children: <Widget>[

                          _buildCoverImage(mediaQueryData.size),
                          SafeArea(
                              child:
                              SingleChildScrollView(
                                  physics : const NeverScrollableScrollPhysics(),
                                  child:
                                  Padding(
                                    padding: EdgeInsets.only(top: mediaQueryData.size.height / 4.6, right : mediaQueryData.size.width / 3.5),
                                    child:listBeauty(context, mediaQueryData.size),
                                  )
                              )
                          ),
                          SafeArea(
                              child:
                              SingleChildScrollView(
                                  physics : const NeverScrollableScrollPhysics(),
                                  child:
                                  Padding(
                                    padding: EdgeInsets.only(left : 30.0, top: mediaQueryData.size.height / 5.4),
                                    child: _buildLogoImage(context, mediaQueryData.size),
                                  )
                              )
                          ),
                          SafeArea(
                            child:
                            SingleChildScrollView(
                                physics : const NeverScrollableScrollPhysics(),
                                child:
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 22.0, right: 22.0 ),
                                  child:
                                  Column(

                                    children: [
                                      SizedBox(height: mediaQueryData.size.height / 3.2),

                                      UsernameLoginWidget(
                                          value: state.username,
                                          caption: 'Username atau alamat email:',
                                          hint: '',
                                          required: false,
                                          getValue: (String? val) {
                                            setState(() {
                                              _username = val!;
                                            });
                                          }
                                      ),
                                      LoginPasswordWidget(
                                          value: state.password,
                                          caption: 'Password:',
                                          hint: '',
                                          required: false,
                                          getValue: (String? val) {
                                            setState(() {
                                              _password = val!;
                                            });
                                          }
                                      ),
                                      SizedBox(height: mediaQueryData.size.height  / 35),

                                      loginButton (context, state),
                                      forgetPassword(context),
                                      SizedBox(height: mediaQueryData.size.height  / 35),
                                      orLogo(context, mediaQueryData.size),
                                      SizedBox(height: mediaQueryData.size.height  / 35),
                                      registerButton (context, state),
                                      Container(

                                        child:
                                        state is LoginLoading ? CircularProgressIndicator() : Container(width: 0, height: 0,),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),

                        ]
                    )
                )


            );

          }

         // if (next) {
            return Form(
              key: formKey,
              child:

                    SingleChildScrollView(
                      child:
                          Stack(
                          children: <Widget>[

                          _buildCoverImage(mediaQueryData.size),
                            SafeArea(
                                child:
                                      SingleChildScrollView(
                                      physics : const NeverScrollableScrollPhysics(),
                                      child:
                                            Padding(
                                            padding: EdgeInsets.only(top: mediaQueryData.size.height / 4.6, right : mediaQueryData.size.width / 3.5),
                                             child:listBeauty(context, mediaQueryData.size),
                                               )
                                      )
                            ),
                            SafeArea(
                                child:
                                SingleChildScrollView(
                                    physics : const NeverScrollableScrollPhysics(),
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(left : 30.0, top: mediaQueryData.size.height / 5.4),
                                      child: _buildLogoImage(context, mediaQueryData.size),
                                    )
                                )
                            ),
                            SafeArea(
                              child:
                              SingleChildScrollView(
                                  physics : const NeverScrollableScrollPhysics(),
                                  child:
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 22.0, right: 22.0 ),
                                    child:
                                    Column(

                                      children: [
                                        SizedBox(height: mediaQueryData.size.height / 3.2),

                                        UsernameLoginWidget(
                                            value: _username,
                                            caption: 'Username atau alamat email:',
                                            hint: '',
                                            required: false,
                                            getValue: (String? val) {
                                              setState(() {
                                                _username = val!;
                                              });
                                            }
                                        ),
                                        LoginPasswordWidget(
                                            value: _password,
                                            caption: 'Password:',
                                            hint: '',
                                            required: false,
                                            getValue: (String? val) {
                                              setState(() {
                                                _password = val!;
                                              });
                                            }
                                        ),
                                        SizedBox(height: mediaQueryData.size.height  / 35),

                                        loginButton (context, state),
                                        forgetPassword(context),
                                        SizedBox(height: mediaQueryData.size.height  / 35),
                                        orLogo(context, mediaQueryData.size),
                                        SizedBox(height: mediaQueryData.size.height  / 35),
                                        registerButton (context, state),
                                        Container(

                                          child:
                                          state is LoginLoading ? const CircularProgressIndicator() : const SizedBox(width: 0, height: 0,),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                             ),
                            ]
                          )
              )
            );
          }
        );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
   // next = false;
  }

  // ignore: unused_element
  _onNextButtonPressed() {
    if (formKey.currentState!.validate()) {
    //  BlocProvider.of<LoginController>(context).add(NextButtonPressed());
      _loginBloc!.add(NextButtonPressed());

    }
  }

  _onSignUpButtonPressed() {
     // next = false;
      AppProvider.getRouter(context)!.navigateTo(context, '/register');
  }

  _onSearchButtonPressed() {
   // next = false;
    AppProvider.getRouter(context)!.navigateTo(context, '/search');

  }

  _onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      _loginBloc!.add(LoginButtonPressed(
        username: _username,
        password: _password,
      ));
    }
  }

}

class UsernameLoginWidget extends StatefulWidget {
  UsernameLoginWidget({
    Key? key,
    this.value,
    this.caption,
    this.hint,
    this.required,
    this.getValue,
  })
  {
    contr?.text = value!;
    if(required!){
     // this.caption = this.caption + '*';
    }
  }
  TextEditingController? contr = TextEditingController();
  String? value;
  String? hint;
  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;

  @override
  State<StatefulWidget> createState() {
    return _UsernameLoginWidget();
  }
}

class _UsernameLoginWidget extends State<UsernameLoginWidget> {
  bool validation = true;
  bool isvalid = true;
  String  errormessage = '';
  @override
  initState(){
    super.initState();
  }

  String validateUserName(_value, _require) {
    String value = _value;
    bool   require = _require;
    String result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'This field is required';
        isvalid= false;
      }
      final RegExp nameExp = RegExp(r'^[a-zA-Z0-9-_.]+$');
      if (!nameExp.hasMatch(value)){
        result = 'This field can only have a-z, 0-9, _ and .';
        isvalid = false;
      }
      if (value.length < 6){
        result = 'This field must have at least 6 characters.';
        isvalid = false;
      }
      if (value.length > 32){
        result = 'This field must have less than 32 characters.';
        isvalid = false;
      }

    } else{
      // if (value.isEmpty){
      result = '';
      isvalid = true;
      //}
    }
    return result;
  }

  void  _getvalue(String? val){
    widget.getValue!(val!);
  }

  @override
  Widget build (BuildContext context){
    // InputComponent username;
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          widget.caption,
          lines1:
          errormessage,
          isdivided: false,
          wgt:
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
              child:// <Widget>[

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 45.0,

                child: TextFormField(
                   autofocus: true,
                  style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),

                  decoration: InputDecoration(
                    hintText: widget.hint,
                    // hintStyle: TextStyle(color: Colors.grey[500]),
                    hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                    //  errorStyle:
                    errorBorder: const UnderlineInputBorder(),
                    filled: true,
                    fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                    // focusedErrorBorder: errorBorder,
                    border: const OutlineInputBorder(),
                  ),

                  controller: widget.contr,
                  validator: (value) {
                    // widget.value = value;
                    errormessage = validateUserName(value, widget.required);
                    if (isvalid) {
                      setState(() {
                        validation = true;
                        // widget.value = value;
                        _getvalue(value);
                      });
                      return null;
                    } else {
                      setState(() {
                        validation = false;
                        // widget.value = value;
                        _getvalue(value);
                      });
                      return null;
                    }
                  },
                ),
              )
          )
      );
  }

}
