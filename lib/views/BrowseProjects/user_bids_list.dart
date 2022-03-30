import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'user_bids_list_base.dart';

class UserBidsList extends UserBidsListBase{
  static const String PATH = '/public/UserBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  UserBidsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

