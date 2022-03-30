import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'shortlisted_bids_index_base.dart';

class ShortlistedBidsIndex extends ShortlistedBidsIndexBase{
  static const String PATH = '/public/ShortlistedBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShortlistedBidsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

