import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_owner_index_base.dart';

class PointsOwnerIndex extends PointsOwnerIndexBase{
  static const String PATH = '/public/PointsOwner/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsOwnerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

