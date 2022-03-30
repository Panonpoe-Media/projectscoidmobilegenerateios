
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class PagesController {

  ProjectscoidApplication application;
  String url;
  AppAction action;
  String id;
  String title;
  PagesController(this.application, this.url, this.action, this.id, this.title );

  Future viewPage() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var register;
    register = await apiRepProvider?.getPageView(url,id, title);
    return register;
  }

}



