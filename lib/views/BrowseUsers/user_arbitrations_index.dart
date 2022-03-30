import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'user_arbitrations_index_base.dart';

class UserArbitrationsIndex extends UserArbitrationsIndexBase{
  static const String PATH = '/public/UserArbitrations/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  UserArbitrationsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

