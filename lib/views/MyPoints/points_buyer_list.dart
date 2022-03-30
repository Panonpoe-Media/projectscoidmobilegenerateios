import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_buyer_list_base.dart';

class PointsBuyerList extends PointsBuyerListBase{
  static const String PATH = '/public/PointsBuyer/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsBuyerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

