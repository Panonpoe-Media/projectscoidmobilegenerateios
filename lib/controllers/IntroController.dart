
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class IntroController {

  ProjectscoidApplication application;
  bool intro;
  AppAction action;
  IntroController(this.application, this.intro, this.action);


  Future <bool> getIntroSetting() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var intro;
     intro = await apiRepProvider?.loadIntro();
     if (intro == 1) return true;
        else return false;
  }

  Future <void> setIntroSetting() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int intr;
	if (this.intro) intr = 1 ;
	  else intr = 0;
    await apiRepProvider?.loadAndSaveIntro(intr);
  }



  Future <void> deleteAll() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

    await apiRepProvider?.deleteAll();
  }

}



