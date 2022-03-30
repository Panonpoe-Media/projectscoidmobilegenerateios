import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_worker_list_base.dart';

class PointsWorkerList extends PointsWorkerListBase{
  static const String PATH = '/public/PointsWorker/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsWorkerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

