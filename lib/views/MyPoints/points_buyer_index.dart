import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_buyer_index_base.dart';

class PointsBuyerIndex extends PointsBuyerIndexBase{
  static const String PATH = '/public/PointsBuyer/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsBuyerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

