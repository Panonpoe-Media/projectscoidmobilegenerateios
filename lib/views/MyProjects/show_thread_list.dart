import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_thread_list_base.dart';

class ShowThreadList extends ShowThreadListBase{
  static const String PATH = '/public/ShowThread/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowThreadList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

