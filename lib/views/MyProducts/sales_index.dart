import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'sales_index_base.dart';

class SalesIndex extends SalesIndexBase{
  static const String PATH = '/public/Sales/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  SalesIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

