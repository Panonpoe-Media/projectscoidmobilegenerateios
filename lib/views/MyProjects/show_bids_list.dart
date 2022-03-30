import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_bids_list_base.dart';

class ShowBidsList extends ShowBidsListBase{
  static const String PATH = '/public/ShowBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowBidsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

