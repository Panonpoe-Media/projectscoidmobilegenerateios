import 'package:projectscoid/app/Env.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
//void main() => Development();


/*
class Development extends Env {
  final String appName = "Projects.co.id Dev";
  //final String baseUrl = 'https://test.projects.co.id';
  final String baseUrl = 'https://projects.co.id';
  final String uploadUrl = 'https://upload.projects.co.id';
  final String imageUrl = 'https://cdn.projects.co.id';
  final Color primarySwatch = CurrentTheme.MainAccentColor;
  EnvType environmentType = EnvType.DEVELOPMENT;
  final String dbName = 'Projectscoid-Dev.db';

}

 */


  void main() => Production();

class Production extends Env {
  final String appName = "Projects.co.id";

  final String baseUrl = 'https://projects.co.id';
  final String uploadUrl = 'https://upload.projects.co.id';
  final String imageUrl = 'https://cdn.projects.co.id';
  final Color primarySwatch = CurrentTheme.MainAccentColor;
  EnvType environmentType = EnvType.PRODUCTION;

  final String dbName = 'projectscoid.db';

}



  /*

  class Staging extends Env {
  final String appName = "Projects.co.id Staging";

  final String baseUrl = 'https://test.projects.co.id';
  final String uploadUrl = 'https://upload.projects.co.id';
  final Color primarySwatch = Colors.amber;
  EnvType environmentType = EnvType.STAGING;

  final String dbName = 'Projectscoid-Stg.db';
}
   */
