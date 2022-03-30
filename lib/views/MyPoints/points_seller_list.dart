import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_seller_list_base.dart';

class PointsSellerList extends PointsSellerListBase{
  static const String PATH = '/public/PointsSeller/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsSellerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

