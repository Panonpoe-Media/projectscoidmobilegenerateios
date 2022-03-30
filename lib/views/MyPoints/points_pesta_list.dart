import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_pesta_list_base.dart';

class PointsPestaList extends PointsPestaListBase{
  static const String PATH = '/public/PointsPesta/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsPestaList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

