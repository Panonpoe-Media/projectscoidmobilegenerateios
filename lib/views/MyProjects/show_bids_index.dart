import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_bids_index_base.dart';

class ShowBidsIndex extends ShowBidsIndexBase{
  static const String PATH = '/public/ShowBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowBidsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

