import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'user_arbitrations_list_base.dart';

class UserArbitrationsList extends UserArbitrationsListBase{
  static const String PATH = '/public/UserArbitrations/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  UserArbitrationsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

