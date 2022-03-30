
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class RegisterController {

  ProjectscoidApplication application;
  String url;
  AppAction action;
  var formData;
  RegisterController(this.application, this.url, this.action,  this.formData);





  Future Register() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var register;
    register = await apiRepProvider?.sendRegister(url,formData);
    return register;
  }

}



