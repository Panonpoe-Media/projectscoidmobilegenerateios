

import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/models/model.dart';
import 'dart:async';

class SubModelController {

  ProjectscoidApplication? application;
  
  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  SubModelController(this.application, this.url, this.formData){

  }

    Future getData()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var data;
    data = await apiRepProvider?.getData(url!);
    return data;
  }
  
    Future getPurchaseDownload()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var data;
    data = await apiRepProvider?.getPurchaseDownload(url!);
    return data;
  }
 Future getData1()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var data;
    data = await apiRepProvider?.getData1(url!);
    return data;

  }
  Future getDataHome()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var data;
    PublicHomeModel? datahome;
    datahome = await apiRepProvider?.getDataHome(url!);
    return datahome;
  }

  Future sendData() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var data;
    data = await apiRepProvider?.sendData(url!,formData);
    return data;
  }

  Future <String?> getHash()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var hash;
    hash = await  apiRepProvider?.getUserHash();
    return hash;
  }

  Future<String?> downloadFile1( ProgressDlCallback showProgress, String title1) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.downloadFile1(url!, title1, showProgress);
  }

}





