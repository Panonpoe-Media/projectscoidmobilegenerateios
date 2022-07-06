import 'package:flutter/material.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/app/splashpage.dart';
import 'package:projectscoid/controllers/controllers.dart';

class Root extends StatefulWidget {
  static const PATH = '/';
  ProjectscoidApplication? application;
  Root({Key? key}): super(key: key);
  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> {
  AccountController? accountController;
  String userID = '';
  int intro = 0;

  @override
  void initState() {
    super.initState();
  //  print('akuuuuuuuuuuuuu di splashhhhhhhhhhh 1234');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.application = AppProvider.getApplication(context);
    return SplashPage(application: widget.application);

  }
}