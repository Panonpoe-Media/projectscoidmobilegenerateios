import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_files_list_base.dart';

class ShowFilesList extends ShowFilesListBase{
  static const String PATH = '/public/ShowFiles/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowFilesList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

