import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_pesta_index_base.dart';

class PointsPestaIndex extends PointsPestaIndexBase{
  static const String PATH = '/public/PointsPesta/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsPestaIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

