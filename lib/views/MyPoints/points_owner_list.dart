import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_owner_list_base.dart';

class PointsOwnerList extends PointsOwnerListBase{
  static const String PATH = '/public/PointsOwner/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsOwnerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

