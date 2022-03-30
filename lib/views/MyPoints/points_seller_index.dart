import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_seller_index_base.dart';

class PointsSellerIndex extends PointsSellerIndexBase{
  static const String PATH = '/public/PointsSeller/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsSellerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

