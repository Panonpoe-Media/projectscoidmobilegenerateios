// ignore_for_file: unused_element
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projectscoid/app/app.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
//import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/core/ProjectscoidBlocDelegate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:projectscoid/core/components/utility/firebase/firebase_config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//lib/core/components/utility/firebase/firebase_config.dart

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
  TESTING
}


_setNotif(String ntf)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('notification', ntf);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

}


class sslOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Env {
  static Env? value;
  String? appName;
  String? baseUrl;
  String? uploadUrl;
  String? imageUrl;
  Color? primarySwatch;
  EnvType environmentType = EnvType.PRODUCTION;
  // Database Config
  int dbVersion = 1;
  String? dbName;
  String? VALIDATE_SUCCESS;
  String? VALIDATE_EMPTY_VALUE;
  String? VALIDATE_INVALID_FORMAT;
  String? VALIDATE_UE;
  String? ConfigUrl;
  String? URL_getToken;
  String? URL_CHECK3dStatus;
  String? URL_prePayment;
  String? URL_doCheckStatus;

  bool debug = true;
  Env() {
    value = this;
    WidgetsFlutterBinding.ensureInitialized();
    _init();
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK

    return MobileAds.instance.initialize();

  }
  void _init() async{
   // await Firebase.initializeApp();
    if(EnvType.DEVELOPMENT == environmentType || EnvType.STAGING == environmentType){
     // Stetho.initialize();
    }
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    HttpOverrides.global = sslOverrides();
   // FlutterDownloader.initialize(ignoreSsl: true);
   // Bloc.observer = ProjectscoidBlocDelegate();
    var application = ProjectscoidApplication();
    await application.onCreate();
    await FlutterDownloader.initialize(debug: debug, ignoreSsl: true);
    await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _initGoogleMobileAds();
    BlocOverrides.runZoned(
          () {
            runApp(App(application));
      },
      blocObserver: ProjectscoidBlocDelegate(),
    );
    configLoading();
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
