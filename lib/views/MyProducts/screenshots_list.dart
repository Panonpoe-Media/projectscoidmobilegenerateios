import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'screenshots_list_base.dart';

class ScreenshotsList extends ScreenshotsListBase{
  static const String PATH = '/public/Screenshots/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ScreenshotsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

