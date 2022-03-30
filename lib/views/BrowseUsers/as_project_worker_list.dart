import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'as_project_worker_list_base.dart';

class AsProjectWorkerList extends AsProjectWorkerListBase{
  static const String PATH = '/public/AsProjectWorker/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  AsProjectWorkerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

