import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';


class AppProvider extends InheritedWidget {

  final ProjectscoidApplication? application;

  const AppProvider({Key? key, required Widget child, this.application})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>());
  }

  static FluroRouter? getRouter(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()!.application!.router);
  }

  static ProjectscoidApplication getApplication(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()!.application!);
  }

}
