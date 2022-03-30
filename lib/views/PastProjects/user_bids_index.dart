import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'user_bids_index_base.dart';

class UserBidsIndex extends UserBidsIndexBase{
  static const String PATH = '/public/UserBids/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  UserBidsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

