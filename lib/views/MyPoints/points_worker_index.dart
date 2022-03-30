import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_worker_index_base.dart';

class PointsWorkerIndex extends PointsWorkerIndexBase{
  static const String PATH = '/public/PointsWorker/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsWorkerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

