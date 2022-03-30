import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'screenshots_index_base.dart';

class ScreenshotsIndex extends ScreenshotsIndexBase{
  static const String PATH = '/public/Screenshots/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ScreenshotsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

