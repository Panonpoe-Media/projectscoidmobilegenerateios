
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class PageController {

  ProjectscoidApplication? application;
  String? url;
  AppAction? action;
  String? id;
  String? title;
  PageController(this.application, this.url, this.action, this.id, this.title );

  Future Page() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var register;
    register = await apiRepProvider?.getPageView(url!,id!, title!);
    return register;
  }

}



