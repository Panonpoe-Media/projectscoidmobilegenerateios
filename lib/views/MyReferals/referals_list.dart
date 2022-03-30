import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'referals_list_base.dart';

class ReferalsList extends ReferalsListBase{
  static const String PATH = '/public/Referals/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ReferalsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

