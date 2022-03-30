import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_affiliate_index_base.dart';

class PointsAffiliateIndex extends PointsAffiliateIndexBase{
  static const String PATH = '/public/PointsAffiliate/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsAffiliateIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

