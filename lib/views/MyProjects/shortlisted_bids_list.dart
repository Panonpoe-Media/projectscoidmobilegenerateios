import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'shortlisted_bids_list_base.dart';

class ShortlistedBidsList extends ShortlistedBidsListBase{
  static const String PATH = '/public/ShortlistedBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShortlistedBidsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

