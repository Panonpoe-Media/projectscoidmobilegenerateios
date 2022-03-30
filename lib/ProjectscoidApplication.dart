import 'package:fluro/fluro.dart';
import 'package:projectscoid/core/components/utility/framework/Application.dart';
import 'package:projectscoid/core/components/utility/db/DatabaseHelper.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/core/components/utility/log/Log.dart';
import 'package:logging/logging.dart';
import 'package:projectscoid/router/routes.dart';
import 'package:projectscoid/api/api.dart';
import 'package:projectscoid/db/db.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';

class ProjectscoidApplication implements Application {
  FluroRouter? router;
  DatabaseHelper? _db;
  MethodChannel? platform;


  DBRepository? projectsDBRepository;
  ChatBloc? chat;
  APIRepository? projectsAPIRepository;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  Future<void> onCreate() async {
    _initLog();
	 _initNotif();
    _initRouter();
    await _initDB();
    _initProjectscoidDBRepository();
    _initProjectscoidAPIRepository();
    _initChat();
  }

  @override
  Future<void> onTerminate() async {
    await _db?.close();
  }

  Future<void> _initDB() async {
    DBMigrationListener migrationListener = DBMigrationListener();
    DatabaseConfig databaseConfig = DatabaseConfig(Env.value!.dbVersion, Env.value!.dbName, migrationListener);
    _db = DatabaseHelper(databaseConfig);
    Log.info('DB name : ' + Env.value!.dbName!);
//    await _db.deleteDB();
    await _db?.open();
  }


   void _initChat(){
     chat = ChatBloc();
     Log.info('Chat init');
   }



   void _initProjectscoidDBRepository(){

     projectsDBRepository = DBRepository(_db?.database);
   }

  void _initNotif(){
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    platform = const MethodChannel('crossingthestreams.io/resourceResolver');
  }



  void _initProjectscoidAPIRepository()async{
     Directory appDocDir = await getApplicationDocumentsDirectory();
     String appDocPath = appDocDir.path;
     APIProvider projectsAPIProvider = APIProvider(appDocPath);
	// await projectsAPIProvider.redirect();
     projectsAPIRepository = APIRepository(projectsAPIProvider, projectsDBRepository!);
   }


  void _initLog(){
    Log.init();

    switch(Env.value!.environmentType){
      case EnvType.TESTING:
      case EnvType.DEVELOPMENT:
      case EnvType.STAGING:{
        Log.setLevel(Level.ALL);
        break;
      }
      case EnvType.PRODUCTION:{
        Log.setLevel(Level.INFO);
        break;
      }
    }
  }

  void _initRouter(){
    router = FluroRouter();
    Routes.configureRoutes(router!);
  }

}