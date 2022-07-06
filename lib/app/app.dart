import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/app/Env.dart';
//import 'package:projectscoid/generated/i18n.dart';
import 'package:projectscoid/core/components/utility/log/Log.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
//import 'package:load_toast/load_toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

//void main() => runApp(MyApp());

class App extends StatefulWidget {
  final ProjectscoidApplication _application;
  App(this._application);
  @override
  State createState() {
    return AppState(_application);
  }
}

class AppState extends State<App> {
  final ProjectscoidApplication _application;
  AppState(this._application);
  var platform = const MethodChannel('crossingthestreams.io/resourceResolver');
 // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void dispose()async{
    Log.info('dispose');
    await _application.onTerminate();
    super.dispose();
  }


  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }

  }




  @override
  Widget build(BuildContext context) {
   // final themeManager =  Provider.of<ThemeManager>(context);
    final app = MaterialAppWithTheme(
                  application: _application,
                   );

    final appProvider = AppProvider(child:

                                        ChangeNotifierProvider<ThemeManager>(

                                            create: (context){ return ThemeManager();},
                                             child:
                                                       BlocProvider(
                                                         create: (context) {
                                                           return AuthenticationController(application: _application,initialState: AuthenticationInitial() )
                                                             ..add(AppStarted());
                                                         },
                                                         child: app,
                                                       ),
                                         ),


                                   application: _application);
    return appProvider;

  }

}

class MaterialAppWithTheme extends StatelessWidget {
  final ProjectscoidApplication? application;
  const MaterialAppWithTheme({Key? key, this.application}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    return
     // LoadToast(
       // child:
        RootRestorationScope(
          restorationId: 'root',
          child: MaterialApp(
            title: Env.value!.appName!,
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              ProjectscoidLocalizationsDelegate(),
             // GlobalMaterialLocalizations.delegate,
             // GlobalWidgetsLocalizations.delegate,
            ],
           // supportedLocales: const <Locale>[
           //   Locale('en', 'EN'),
           //   Locale('id', 'ID'),

          //  ],
            // supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                   primarySwatch: Colors.orange,
                 ).copyWith(
                   secondary: Colors.orangeAccent,
                 ),
              fontFamily: 'Amazon Ember',
              primaryColor: CurrentTheme.MainAccentColor,
              primaryColorLight:CurrentTheme.MainAccentColor,
              primaryColorDark:CurrentTheme.MainAccentColor,
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor : CurrentTheme.SecondaryColor,
              ),
            ),

            darkTheme: ThemeData.dark(),
            themeMode: themeManager.themeMode,
            onGenerateRoute: application?.router?.generator,
            builder: EasyLoading.init(),

          )
        );

     // );
  }
}