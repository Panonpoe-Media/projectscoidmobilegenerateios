import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_files_index_base.dart';

class ShowFilesIndex extends ShowFilesIndexBase{
  static const String PATH = '/public/ShowFiles/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowFilesIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

