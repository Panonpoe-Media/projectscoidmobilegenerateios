import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_thread_index_base.dart';

class ShowThreadIndex extends ShowThreadIndexBase{
  static const String PATH = '/public/ShowThread/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowThreadIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

