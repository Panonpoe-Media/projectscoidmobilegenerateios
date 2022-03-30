import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'credit_history_index_base.dart';

class CreditHistoryIndex extends CreditHistoryIndexBase{
  static const String PATH = '/public/CreditHistory/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CreditHistoryIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

