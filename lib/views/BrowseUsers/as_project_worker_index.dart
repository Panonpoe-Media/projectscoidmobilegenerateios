import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'as_project_worker_index_base.dart';

class AsProjectWorkerIndex extends AsProjectWorkerIndexBase{
  static const String PATH = '/public/AsProjectWorker/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  AsProjectWorkerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

