import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'referals_index_base.dart';

class ReferalsIndex extends ReferalsIndexBase{
  static const String PATH = '/public/Referals/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ReferalsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

