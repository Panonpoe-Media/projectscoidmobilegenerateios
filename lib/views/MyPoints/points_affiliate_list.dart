import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'points_affiliate_list_base.dart';

class PointsAffiliateList extends PointsAffiliateListBase{
  static const String PATH = '/public/PointsAffiliate/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PointsAffiliateList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

