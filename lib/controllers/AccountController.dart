
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class AccountController {

  ProjectscoidApplication application;
  AppAction action;
  AccountController(this.application,  this.action);


  Future  getAccount() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var account;
     account = await apiRepProvider?.loadAccount();
    return account;
  }
  
  Future  getIntro() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var intro;
     intro = await apiRepProvider?.loadIntro();
    return intro;
  }


}



